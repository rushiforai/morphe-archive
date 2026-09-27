.class public final Lkotlin/ULongArray;
.super Ljava/lang/Object;
.source "ULongArray.kt"

# interfaces
.implements Ljava/util/Collection;
.implements Lkotlin/jvm/internal/markers/KMappedMarker;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lkotlin/ULongArray$Iterator;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Collection<",
        "Lkotlin/ULong;",
        ">;",
        "Lkotlin/jvm/internal/markers/KMappedMarker;"
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nULongArray.kt\nKotlin\n*S Kotlin\n*F\n+ 1 ULongArray.kt\nkotlin/ULongArray\n+ 2 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n*L\n1#1,82:1\n1939#2,3:83\n*S KotlinDebug\n*F\n+ 1 ULongArray.kt\nkotlin/ULongArray\n*L\n58#1:83,3\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\\\n\u0002\u0018\u0002\n\u0002\u0010\u001e\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0016\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0008\n\u0002\u0010\u0002\n\u0002\u0008\u0006\n\u0002\u0010(\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0008\u000c\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\u0008\u0087@\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u0001:\u0001.B\u0015\u0008A\u0012\u0006\u0010\u0003\u001a\u00020\u0004\u001a\u0002\u0008\u0007\u00a2\u0006\u0004\u0008\u0005\u0010\u0006B\u0011\u0008V\u0012\u0006\u0010\u0008\u001a\u00020\t\u00a2\u0006\u0004\u0008\u0005\u0010\nJ\u0019\u0010\r\u001a\u00020\u00022\u0006\u0010\u000e\u001a\u00020\tH\u0086\u0082\u0004\u00a2\u0006\u0004\u0008\u000f\u0010\u0010J!\u0010\u0011\u001a\u00020\u00122\u0006\u0010\u000e\u001a\u00020\t2\u0006\u0010\u0013\u001a\u00020\u0002H\u0086\u0082\u0004\u00a2\u0006\u0004\u0008\u0014\u0010\u0015J\u0017\u0010\u0018\u001a\u0008\u0012\u0004\u0012\u00020\u00020\u0019H\u0096\u0082\u0004\u00a2\u0006\u0004\u0008\u001a\u0010\u001bJ\u0019\u0010\u001c\u001a\u00020\u001d2\u0006\u0010\u001e\u001a\u00020\u0002H\u0096\u0082\u0004\u00a2\u0006\u0004\u0008\u001f\u0010 J\u001f\u0010!\u001a\u00020\u001d2\u000c\u0010\"\u001a\u0008\u0012\u0004\u0012\u00020\u00020\u0001H\u0096\u0080\u0004\u00a2\u0006\u0004\u0008#\u0010$J\u0011\u0010%\u001a\u00020\u001dH\u0096\u0080\u0004\u00a2\u0006\u0004\u0008&\u0010\'J\u0014\u0010(\u001a\u00020\u001d2\u0008\u0010)\u001a\u0004\u0018\u00010*H\u00d6\u0083\u0004J\n\u0010+\u001a\u00020\tH\u00d6\u0081\u0004J\n\u0010,\u001a\u00020-H\u00d6\u0081\u0004R\u001b\u0010\u0003\u001a\u00020\u00048\u0000X\u0081\u0084\u0008r\u0002\u0008\u0007\u00a2\u0006\u0008\n\u0000\u0012\u0004\u0008\u000b\u0010\u000cR\u0015\u0010\u0008\u001a\u00020\t8VX\u0096\u0084\u0008\u00a2\u0006\u0006\u001a\u0004\u0008\u0016\u0010\u0017\u0088\u0001\u0003\u0092\u0001\u00020\u0004\u00ca\u0001\u000c\u00080\u0012\u0008\u00081\u0012\u0004\u0008\u0008(2\u00ca\u0001\u0002\u00083\u00ca\u0001\u0002\u00084\u00a8\u0006/"
    }
    d2 = {
        "Lkotlin/ULongArray;",
        "",
        "Lkotlin/ULong;",
        "storage",
        "",
        "constructor-impl",
        "([J)[J",
        "Lkotlin/PublishedApi;",
        "size",
        "",
        "(I)[J",
        "getStorage$annotations",
        "()V",
        "get",
        "index",
        "get-s-VKNKU",
        "([JI)J",
        "set",
        "",
        "value",
        "set-k8EXiF4",
        "([JIJ)V",
        "getSize-impl",
        "([J)I",
        "iterator",
        "",
        "iterator-impl",
        "([J)Ljava/util/Iterator;",
        "contains",
        "",
        "element",
        "contains-VKZWuLQ",
        "([JJ)Z",
        "containsAll",
        "elements",
        "containsAll-impl",
        "([JLjava/util/Collection;)Z",
        "isEmpty",
        "isEmpty-impl",
        "([J)Z",
        "equals",
        "other",
        "",
        "hashCode",
        "toString",
        "",
        "Iterator",
        "kotlin-stdlib",
        "Lkotlin/SinceKotlin;",
        "version",
        "1.3",
        "Lkotlin/ExperimentalUnsignedTypes;",
        "Lkotlin/jvm/JvmInline;"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation

.annotation runtime Lkotlin/jvm/JvmInline;
.end annotation


# instance fields
.field private final storage:[J


# direct methods
.method private synthetic constructor <init>([J)V
    .registers 2

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lkotlin/ULongArray;->storage:[J

    return-void
.end method

.method public static final synthetic box-impl([J)Lkotlin/ULongArray;
    .registers 2

    new-instance v0, Lkotlin/ULongArray;

    invoke-direct {v0, p0}, Lkotlin/ULongArray;-><init>([J)V

    return-object v0
.end method

.method public static constructor-impl(I)[J
    .registers 1

    .line 21
    new-array p0, p0, [J

    invoke-static {p0}, Lkotlin/ULongArray;->constructor-impl([J)[J

    move-result-object p0

    return-object p0
.end method

.method public static constructor-impl([J)[J
    .registers 2

    const-string v0, "storage"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    return-object p0
.end method

.method public static contains-VKZWuLQ([JJ)Z
    .registers 3

    .line 54
    invoke-static {p0, p1, p2}, Lkotlin/collections/ArraysKt;->contains([JJ)Z

    move-result p0

    return p0
.end method

.method public static containsAll-impl([JLjava/util/Collection;)Z
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([J",
            "Ljava/util/Collection<",
            "Lkotlin/ULong;",
            ">;)Z"
        }
    .end annotation

    const-string v0, "elements"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 58
    check-cast p1, Ljava/lang/Iterable;

    .line 83
    move-object v0, p1

    check-cast v0, Ljava/util/Collection;

    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_12

    return v1

    .line 84
    :cond_12
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_16
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_33

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    .line 58
    instance-of v2, v0, Lkotlin/ULong;

    if-eqz v2, :cond_31

    check-cast v0, Lkotlin/ULong;

    invoke-virtual {v0}, Lkotlin/ULong;->unbox-impl()J

    move-result-wide v2

    invoke-static {p0, v2, v3}, Lkotlin/collections/ArraysKt;->contains([JJ)Z

    move-result v0

    if-eqz v0, :cond_31

    goto :goto_16

    :cond_31
    const/4 p0, 0x0

    return p0

    :cond_33
    return v1
.end method

.method public static equals-impl([JLjava/lang/Object;)Z
    .registers 4

    instance-of v0, p1, Lkotlin/ULongArray;

    const/4 v1, 0x0

    if-nez v0, :cond_6

    return v1

    :cond_6
    check-cast p1, Lkotlin/ULongArray;

    invoke-virtual {p1}, Lkotlin/ULongArray;->unbox-impl()[J

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_13

    return v1

    :cond_13
    const/4 p0, 0x1

    return p0
.end method

.method public static final equals-impl0([J[J)Z
    .registers 2

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public static final get-s-VKNKU([JI)J
    .registers 4

    .line 29
    aget-wide v0, p0, p1

    invoke-static {v0, v1}, Lkotlin/ULong;->constructor-impl(J)J

    move-result-wide p0

    return-wide p0
.end method

.method public static getSize-impl([J)I
    .registers 1

    .line 42
    array-length p0, p0

    return p0
.end method

.method public static synthetic getStorage$annotations()V
    .registers 0

    return-void
.end method

.method public static hashCode-impl([J)I
    .registers 1

    invoke-static {p0}, Ljava/util/Arrays;->hashCode([J)I

    move-result p0

    return p0
.end method

.method public static isEmpty-impl([J)Z
    .registers 1

    .line 61
    array-length p0, p0

    if-nez p0, :cond_5

    const/4 p0, 0x1

    return p0

    :cond_5
    const/4 p0, 0x0

    return p0
.end method

.method public static iterator-impl([J)Ljava/util/Iterator;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([J)",
            "Ljava/util/Iterator<",
            "Lkotlin/ULong;",
            ">;"
        }
    .end annotation

    .line 45
    new-instance v0, Lkotlin/ULongArray$Iterator;

    invoke-direct {v0, p0}, Lkotlin/ULongArray$Iterator;-><init>([J)V

    check-cast v0, Ljava/util/Iterator;

    return-object v0
.end method

.method public static final set-k8EXiF4([JIJ)V
    .registers 4

    .line 38
    aput-wide p2, p0, p1

    return-void
.end method

.method public static toString-impl([J)Ljava/lang/String;
    .registers 3

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "ULongArray(storage="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {p0}, Ljava/util/Arrays;->toString([J)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 p0, 0x29

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public bridge synthetic add(Ljava/lang/Object;)Z
    .registers 2

    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string p1, "Operation is not supported for read-only collection"

    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public add-VKZWuLQ(J)Z
    .registers 3

    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string p1, "Operation is not supported for read-only collection"

    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public addAll(Ljava/util/Collection;)Z
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "+",
            "Lkotlin/ULong;",
            ">;)Z"
        }
    .end annotation

    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string p1, "Operation is not supported for read-only collection"

    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public clear()V
    .registers 2

    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string v0, "Operation is not supported for read-only collection"

    invoke-direct {p0, v0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public final bridge contains(Ljava/lang/Object;)Z
    .registers 4

    .line 13
    instance-of v0, p1, Lkotlin/ULong;

    if-nez v0, :cond_6

    const/4 p0, 0x0

    return p0

    :cond_6
    check-cast p1, Lkotlin/ULong;

    invoke-virtual {p1}, Lkotlin/ULong;->unbox-impl()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lkotlin/ULongArray;->contains-VKZWuLQ(J)Z

    move-result p0

    return p0
.end method

.method public contains-VKZWuLQ(J)Z
    .registers 3

    .line 53
    iget-object p0, p0, Lkotlin/ULongArray;->storage:[J

    invoke-static {p0, p1, p2}, Lkotlin/ULongArray;->contains-VKZWuLQ([JJ)Z

    move-result p0

    return p0
.end method

.method public containsAll(Ljava/util/Collection;)Z
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "*>;)Z"
        }
    .end annotation

    const-string v0, "elements"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 57
    iget-object p0, p0, Lkotlin/ULongArray;->storage:[J

    invoke-static {p0, p1}, Lkotlin/ULongArray;->containsAll-impl([JLjava/util/Collection;)Z

    move-result p0

    return p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 2

    iget-object p0, p0, Lkotlin/ULongArray;->storage:[J

    invoke-static {p0, p1}, Lkotlin/ULongArray;->equals-impl([JLjava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public getSize()I
    .registers 1

    .line 42
    iget-object p0, p0, Lkotlin/ULongArray;->storage:[J

    invoke-static {p0}, Lkotlin/ULongArray;->getSize-impl([J)I

    move-result p0

    return p0
.end method

.method public hashCode()I
    .registers 1

    iget-object p0, p0, Lkotlin/ULongArray;->storage:[J

    invoke-static {p0}, Lkotlin/ULongArray;->hashCode-impl([J)I

    move-result p0

    return p0
.end method

.method public isEmpty()Z
    .registers 1

    .line 61
    iget-object p0, p0, Lkotlin/ULongArray;->storage:[J

    invoke-static {p0}, Lkotlin/ULongArray;->isEmpty-impl([J)Z

    move-result p0

    return p0
.end method

.method public iterator()Ljava/util/Iterator;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "Lkotlin/ULong;",
            ">;"
        }
    .end annotation

    .line 45
    iget-object p0, p0, Lkotlin/ULongArray;->storage:[J

    invoke-static {p0}, Lkotlin/ULongArray;->iterator-impl([J)Ljava/util/Iterator;

    move-result-object p0

    return-object p0
.end method

.method public remove(Ljava/lang/Object;)Z
    .registers 2

    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string p1, "Operation is not supported for read-only collection"

    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public removeAll(Ljava/util/Collection;)Z
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "*>;)Z"
        }
    .end annotation

    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string p1, "Operation is not supported for read-only collection"

    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public retainAll(Ljava/util/Collection;)Z
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "*>;)Z"
        }
    .end annotation

    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string p1, "Operation is not supported for read-only collection"

    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public bridge synthetic size()I
    .registers 1

    .line 13
    invoke-virtual {p0}, Lkotlin/ULongArray;->getSize()I

    move-result p0

    return p0
.end method

.method public toArray()[Ljava/lang/Object;
    .registers 1

    check-cast p0, Ljava/util/Collection;

    invoke-static {p0}, Lkotlin/jvm/internal/CollectionToArray;->toArray(Ljava/util/Collection;)[Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public toArray([Ljava/lang/Object;)[Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([TT;)[TT;"
        }
    .end annotation

    const-string v0, "array"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p0, Ljava/util/Collection;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/CollectionToArray;->toArray(Ljava/util/Collection;[Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lkotlin/ULongArray;->storage:[J

    invoke-static {p0}, Lkotlin/ULongArray;->toString-impl([J)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final synthetic unbox-impl()[J
    .registers 1

    iget-object p0, p0, Lkotlin/ULongArray;->storage:[J

    return-object p0
.end method
