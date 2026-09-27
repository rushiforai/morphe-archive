.class public final Lkotlin/collections/EmptyList;
.super Ljava/lang/Object;
.source "Collections.kt"

# interfaces
.implements Ljava/util/List;
.implements Ljava/io/Serializable;
.implements Ljava/util/RandomAccess;
.implements Lkotlin/jvm/internal/markers/KMappedMarker;


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000V\n\u0002\u0018\u0002\n\u0002\u0010 \n\u0002\u0010\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\t\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0008\n\u0002\u0010\u001e\n\u0002\u0008\u0005\n\u0002\u0010(\n\u0000\n\u0002\u0010*\n\u0002\u0008\u0005\u0008\u00c0\u0002\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u00012\u00060\u0003j\u0002`\u00042\u00060\u0005j\u0002`\u0006B\t\u0008B\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J\u0014\u0010\u000b\u001a\u00020\u000c2\u0008\u0010\r\u001a\u0004\u0018\u00010\u000eH\u0096\u0082\u0004J\n\u0010\u000f\u001a\u00020\u0010H\u0096\u0080\u0004J\n\u0010\u0011\u001a\u00020\u0012H\u0096\u0080\u0004J\n\u0010\u0016\u001a\u00020\u000cH\u0096\u0080\u0004J\u0012\u0010\u0017\u001a\u00020\u000c2\u0006\u0010\u0018\u001a\u00020\u0002H\u0096\u0082\u0004J\u0018\u0010\u0019\u001a\u00020\u000c2\u000c\u0010\u001a\u001a\u0008\u0012\u0004\u0012\u00020\u00020\u001bH\u0096\u0080\u0004J\u0012\u0010\u001c\u001a\u00020\u00022\u0006\u0010\u001d\u001a\u00020\u0010H\u0096\u0082\u0004J\u0012\u0010\u001e\u001a\u00020\u00102\u0006\u0010\u0018\u001a\u00020\u0002H\u0096\u0080\u0004J\u0012\u0010\u001f\u001a\u00020\u00102\u0006\u0010\u0018\u001a\u00020\u0002H\u0096\u0080\u0004J\u0010\u0010 \u001a\u0008\u0012\u0004\u0012\u00020\u00020!H\u0096\u0082\u0004J\u0010\u0010\"\u001a\u0008\u0012\u0004\u0012\u00020\u00020#H\u0096\u0080\u0004J\u0018\u0010\"\u001a\u0008\u0012\u0004\u0012\u00020\u00020#2\u0006\u0010\u001d\u001a\u00020\u0010H\u0096\u0080\u0004J \u0010$\u001a\u0008\u0012\u0004\u0012\u00020\u00020\u00012\u0006\u0010%\u001a\u00020\u00102\u0006\u0010&\u001a\u00020\u0010H\u0096\u0080\u0004J\n\u0010\'\u001a\u00020\u000eH\u0082\u0080\u0004R\u000f\u0010\t\u001a\u00020\nX\u0082\u00d4\u0008\u00a2\u0006\u0002\n\u0000R\u0015\u0010\u0013\u001a\u00020\u00108VX\u0096\u0084\u0008\u00a2\u0006\u0006\u001a\u0004\u0008\u0014\u0010\u0015\u00a8\u0006("
    }
    d2 = {
        "Lkotlin/collections/EmptyList;",
        "",
        "",
        "Ljava/io/Serializable;",
        "Lkotlin/io/Serializable;",
        "Ljava/util/RandomAccess;",
        "Lkotlin/collections/RandomAccess;",
        "<init>",
        "()V",
        "serialVersionUID",
        "",
        "equals",
        "",
        "other",
        "",
        "hashCode",
        "",
        "toString",
        "",
        "size",
        "getSize",
        "()I",
        "isEmpty",
        "contains",
        "element",
        "containsAll",
        "elements",
        "",
        "get",
        "index",
        "indexOf",
        "lastIndexOf",
        "iterator",
        "",
        "listIterator",
        "",
        "subList",
        "fromIndex",
        "toIndex",
        "readResolve",
        "kotlin-stdlib"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final INSTANCE:Lkotlin/collections/EmptyList;

.field private static final serialVersionUID:J = -0x6690382f581f9fceL


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lkotlin/collections/EmptyList;

    invoke-direct {v0}, Lkotlin/collections/EmptyList;-><init>()V

    sput-object v0, Lkotlin/collections/EmptyList;->INSTANCE:Lkotlin/collections/EmptyList;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private final readResolve()Ljava/lang/Object;
    .registers 1

    .line 53
    sget-object p0, Lkotlin/collections/EmptyList;->INSTANCE:Lkotlin/collections/EmptyList;

    return-object p0
.end method


# virtual methods
.method public bridge synthetic add(ILjava/lang/Object;)V
    .registers 3

    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string p1, "Operation is not supported for read-only collection"

    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public add(ILjava/lang/Void;)V
    .registers 3

    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string p1, "Operation is not supported for read-only collection"

    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public bridge synthetic add(Ljava/lang/Object;)Z
    .registers 2

    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string p1, "Operation is not supported for read-only collection"

    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public add(Ljava/lang/Void;)Z
    .registers 2

    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string p1, "Operation is not supported for read-only collection"

    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public addAll(ILjava/util/Collection;)Z
    .registers 3

    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string p1, "Operation is not supported for read-only collection"

    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public addAll(Ljava/util/Collection;)Z
    .registers 2

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
    .registers 3

    .line 25
    instance-of v0, p1, Ljava/lang/Void;

    if-nez v0, :cond_6

    const/4 p0, 0x0

    return p0

    :cond_6
    check-cast p1, Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lkotlin/collections/EmptyList;->contains(Ljava/lang/Void;)Z

    move-result p0

    return p0
.end method

.method public contains(Ljava/lang/Void;)Z
    .registers 2

    const-string p0, "element"

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 p0, 0x0

    return p0
.end method

.method public containsAll(Ljava/util/Collection;)Z
    .registers 2

    const-string p0, "elements"

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 35
    invoke-interface {p1}, Ljava/util/Collection;->isEmpty()Z

    move-result p0

    return p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 2

    .line 28
    instance-of p0, p1, Ljava/util/List;

    if-eqz p0, :cond_e

    check-cast p1, Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result p0

    if-eqz p0, :cond_e

    const/4 p0, 0x1

    return p0

    :cond_e
    const/4 p0, 0x0

    return p0
.end method

.method public bridge synthetic get(I)Ljava/lang/Object;
    .registers 2

    .line 25
    invoke-virtual {p0, p1}, Lkotlin/collections/EmptyList;->get(I)Ljava/lang/Void;

    move-result-object p0

    return-object p0
.end method

.method public get(I)Ljava/lang/Void;
    .registers 4

    .line 37
    new-instance p0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Empty list doesn\'t contain element at index "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const/16 p1, 0x2e

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public getSize()I
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public hashCode()I
    .registers 1

    const/4 p0, 0x1

    return p0
.end method

.method public final bridge indexOf(Ljava/lang/Object;)I
    .registers 3

    .line 25
    instance-of v0, p1, Ljava/lang/Void;

    if-nez v0, :cond_6

    const/4 p0, -0x1

    return p0

    :cond_6
    check-cast p1, Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lkotlin/collections/EmptyList;->indexOf(Ljava/lang/Void;)I

    move-result p0

    return p0
.end method

.method public indexOf(Ljava/lang/Void;)I
    .registers 2

    const-string p0, "element"

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 p0, -0x1

    return p0
.end method

.method public isEmpty()Z
    .registers 1

    const/4 p0, 0x1

    return p0
.end method

.method public iterator()Ljava/util/Iterator;
    .registers 1

    .line 41
    sget-object p0, Lkotlin/collections/EmptyIterator;->INSTANCE:Lkotlin/collections/EmptyIterator;

    check-cast p0, Ljava/util/Iterator;

    return-object p0
.end method

.method public final bridge lastIndexOf(Ljava/lang/Object;)I
    .registers 3

    .line 25
    instance-of v0, p1, Ljava/lang/Void;

    if-nez v0, :cond_6

    const/4 p0, -0x1

    return p0

    :cond_6
    check-cast p1, Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lkotlin/collections/EmptyList;->lastIndexOf(Ljava/lang/Void;)I

    move-result p0

    return p0
.end method

.method public lastIndexOf(Ljava/lang/Void;)I
    .registers 2

    const-string p0, "element"

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 p0, -0x1

    return p0
.end method

.method public listIterator()Ljava/util/ListIterator;
    .registers 1

    .line 42
    sget-object p0, Lkotlin/collections/EmptyIterator;->INSTANCE:Lkotlin/collections/EmptyIterator;

    check-cast p0, Ljava/util/ListIterator;

    return-object p0
.end method

.method public listIterator(I)Ljava/util/ListIterator;
    .registers 4

    if-nez p1, :cond_7

    .line 45
    sget-object p0, Lkotlin/collections/EmptyIterator;->INSTANCE:Lkotlin/collections/EmptyIterator;

    check-cast p0, Ljava/util/ListIterator;

    return-object p0

    .line 44
    :cond_7
    new-instance p0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Index: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public bridge synthetic remove(I)Ljava/lang/Object;
    .registers 2

    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string p1, "Operation is not supported for read-only collection"

    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public remove(I)Ljava/lang/Void;
    .registers 2

    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string p1, "Operation is not supported for read-only collection"

    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
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

    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string p1, "Operation is not supported for read-only collection"

    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public retainAll(Ljava/util/Collection;)Z
    .registers 2

    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string p1, "Operation is not supported for read-only collection"

    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public bridge synthetic set(ILjava/lang/Object;)Ljava/lang/Object;
    .registers 3

    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string p1, "Operation is not supported for read-only collection"

    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public set(ILjava/lang/Void;)Ljava/lang/Void;
    .registers 3

    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string p1, "Operation is not supported for read-only collection"

    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public final bridge size()I
    .registers 1

    .line 25
    invoke-virtual {p0}, Lkotlin/collections/EmptyList;->getSize()I

    move-result p0

    return p0
.end method

.method public subList(II)Ljava/util/List;
    .registers 5

    if-nez p1, :cond_7

    if-nez p2, :cond_7

    .line 49
    check-cast p0, Ljava/util/List;

    return-object p0

    .line 50
    :cond_7
    new-instance p0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "fromIndex: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, ", toIndex: "

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw p0
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

    .line 30
    const-string p0, "[]"

    return-object p0
.end method
