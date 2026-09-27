.class public final Lkotlin/collections/builders/ListBuilderKt;
.super Ljava/lang/Object;
.source "ListBuilder.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nListBuilder.kt\nKotlin\n*S Kotlin\n*F\n+ 1 ListBuilder.kt\nkotlin/collections/builders/ListBuilderKt\n+ 2 fake.kt\nkotlin/jvm/internal/FakeKt\n*L\n1#1,724:1\n1#2:725\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00008\n\u0000\n\u0002\u0010\u0011\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0002\u0008\u0004\n\u0002\u0010\u001e\n\u0002\u0008\u0004\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010 \n\u0002\u0008\u0005\n\u0002\u0010\u0002\n\u0002\u0008\u0007\u001a#\u0010\u0000\u001a\u0008\u0012\u0004\u0012\u0002H\u00020\u0001\"\u0004\u0008\u0000\u0010\u00022\u0006\u0010\u0003\u001a\u00020\u0004H\u0080\u0080\u0004\u00a2\u0006\u0002\u0010\u0005\u001a?\u0010\u0006\u001a\u00020\u0007\"\u0004\u0008\u0000\u0010\u0008*\n\u0012\u0006\u0008\u0001\u0012\u0002H\u00080\u00012\u0006\u0010\t\u001a\u00020\u00042\u0006\u0010\n\u001a\u00020\u00042\u000c\u0010\u000b\u001a\u0008\u0012\u0004\u0012\u0002H\u00080\u000cH\u0082\u0080\u0004\u00a2\u0006\u0002\u0010\r\u001a/\u0010\u000e\u001a\u00020\u0004\"\u0004\u0008\u0000\u0010\u0008*\u0008\u0012\u0004\u0012\u0002H\u00080\u00012\u0006\u0010\t\u001a\u00020\u00042\u0006\u0010\n\u001a\u00020\u0004H\u0082\u0080\u0004\u00a2\u0006\u0002\u0010\u000f\u001a;\u0010\u0010\u001a\u00020\u0011\"\u0004\u0008\u0000\u0010\u0008*\u0008\u0012\u0004\u0012\u0002H\u00080\u00012\u0006\u0010\t\u001a\u00020\u00042\u0006\u0010\n\u001a\u00020\u00042\n\u0010\u0012\u001a\u0006\u0012\u0002\u0008\u00030\u0013H\u0082\u0080\u0004\u00a2\u0006\u0002\u0010\u0014\u001a-\u0010\u0015\u001a\u0008\u0012\u0004\u0012\u0002H\u00080\u0001\"\u0004\u0008\u0000\u0010\u0008*\u0008\u0012\u0004\u0012\u0002H\u00080\u00012\u0006\u0010\u0016\u001a\u00020\u0004H\u0080\u0080\u0004\u00a2\u0006\u0002\u0010\u0017\u001a\'\u0010\u0018\u001a\u00020\u0019\"\u0004\u0008\u0000\u0010\u0002*\u0008\u0012\u0004\u0012\u0002H\u00020\u00012\u0006\u0010\u001a\u001a\u00020\u0004H\u0080\u0080\u0004\u00a2\u0006\u0002\u0010\u001b\u001a/\u0010\u001c\u001a\u00020\u0019\"\u0004\u0008\u0000\u0010\u0002*\u0008\u0012\u0004\u0012\u0002H\u00020\u00012\u0006\u0010\u001d\u001a\u00020\u00042\u0006\u0010\u001e\u001a\u00020\u0004H\u0080\u0080\u0004\u00a2\u0006\u0002\u0010\u001f\u00a8\u0006 "
    }
    d2 = {
        "arrayOfUninitializedElements",
        "",
        "E",
        "size",
        "",
        "(I)[Ljava/lang/Object;",
        "subarrayContentToString",
        "",
        "T",
        "offset",
        "length",
        "thisCollection",
        "",
        "([Ljava/lang/Object;IILjava/util/Collection;)Ljava/lang/String;",
        "subarrayContentHashCode",
        "([Ljava/lang/Object;II)I",
        "subarrayContentEquals",
        "",
        "other",
        "",
        "([Ljava/lang/Object;IILjava/util/List;)Z",
        "copyOfUninitializedElements",
        "newSize",
        "([Ljava/lang/Object;I)[Ljava/lang/Object;",
        "resetAt",
        "",
        "index",
        "([Ljava/lang/Object;I)V",
        "resetRange",
        "fromIndex",
        "toIndex",
        "([Ljava/lang/Object;II)V",
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
.method public static final synthetic access$subarrayContentEquals([Ljava/lang/Object;IILjava/util/List;)Z
    .registers 4

    .line 1
    invoke-static {p0, p1, p2, p3}, Lkotlin/collections/builders/ListBuilderKt;->subarrayContentEquals([Ljava/lang/Object;IILjava/util/List;)Z

    move-result p0

    return p0
.end method

.method public static final synthetic access$subarrayContentHashCode([Ljava/lang/Object;II)I
    .registers 3

    .line 1
    invoke-static {p0, p1, p2}, Lkotlin/collections/builders/ListBuilderKt;->subarrayContentHashCode([Ljava/lang/Object;II)I

    move-result p0

    return p0
.end method

.method public static final synthetic access$subarrayContentToString([Ljava/lang/Object;IILjava/util/Collection;)Ljava/lang/String;
    .registers 4

    .line 1
    invoke-static {p0, p1, p2, p3}, Lkotlin/collections/builders/ListBuilderKt;->subarrayContentToString([Ljava/lang/Object;IILjava/util/Collection;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static final arrayOfUninitializedElements(I)[Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">(I)[TE;"
        }
    .end annotation

    if-ltz p0, :cond_5

    .line 624
    new-array p0, p0, [Ljava/lang/Object;

    return-object p0

    .line 622
    :cond_5
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "capacity must be non-negative."

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static final copyOfUninitializedElements([Ljava/lang/Object;I)[Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([TT;I)[TT;"
        }
    .end annotation

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 668
    invoke-static {p0, p1}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object p0

    const-string p1, "copyOf(...)"

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    return-object p0
.end method

.method public static final resetAt([Ljava/lang/Object;I)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">([TE;I)V"
        }
    .end annotation

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 673
    aput-object v0, p0, p1

    return-void
.end method

.method public static final resetRange([Ljava/lang/Object;II)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">([TE;II)V"
        }
    .end annotation

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    :goto_5
    if-ge p1, p2, :cond_d

    .line 677
    invoke-static {p0, p1}, Lkotlin/collections/builders/ListBuilderKt;->resetAt([Ljava/lang/Object;I)V

    add-int/lit8 p1, p1, 0x1

    goto :goto_5

    :cond_d
    return-void
.end method

.method private static final subarrayContentEquals([Ljava/lang/Object;IILjava/util/List;)Z
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([TT;II",
            "Ljava/util/List<",
            "*>;)Z"
        }
    .end annotation

    .line 657
    invoke-interface {p3}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x0

    if-eq p2, v0, :cond_8

    return v1

    :cond_8
    move v0, v1

    :goto_9
    if-ge v0, p2, :cond_1d

    add-int v2, p1, v0

    .line 660
    aget-object v2, p0, v2

    invoke-interface {p3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    invoke-static {v2, v3}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1a

    return v1

    :cond_1a
    add-int/lit8 v0, v0, 0x1

    goto :goto_9

    :cond_1d
    const/4 p0, 0x1

    return p0
.end method

.method private static final subarrayContentHashCode([Ljava/lang/Object;II)I
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([TT;II)I"
        }
    .end annotation

    const/4 v0, 0x1

    const/4 v1, 0x0

    move v2, v1

    :goto_3
    if-ge v2, p2, :cond_17

    add-int v3, p1, v2

    .line 649
    aget-object v3, p0, v3

    mul-int/lit8 v0, v0, 0x1f

    if-eqz v3, :cond_12

    .line 650
    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    move-result v3

    goto :goto_13

    :cond_12
    move v3, v1

    :goto_13
    add-int/2addr v0, v3

    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    :cond_17
    return v0
.end method

.method private static final subarrayContentToString([Ljava/lang/Object;IILjava/util/Collection;)Ljava/lang/String;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([TT;II",
            "Ljava/util/Collection<",
            "+TT;>;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 628
    new-instance v0, Ljava/lang/StringBuilder;

    mul-int/lit8 v1, p2, 0x3

    add-int/lit8 v1, v1, 0x2

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 629
    const-string v1, "["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v1, 0x0

    :goto_f
    if-ge v1, p2, :cond_2a

    if-lez v1, :cond_18

    .line 632
    const-string v2, ", "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_18
    add-int v2, p1, v1

    .line 633
    aget-object v2, p0, v2

    if-ne v2, p3, :cond_24

    .line 635
    const-string v2, "(this Collection)"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_27

    .line 637
    :cond_24
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    :goto_27
    add-int/lit8 v1, v1, 0x1

    goto :goto_f

    .line 641
    :cond_2a
    const-string p0, "]"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 642
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "toString(...)"

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    return-object p0
.end method
