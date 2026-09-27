.class public final Lkotlin/collections/builders/MapBuilderEntries;
.super Lkotlin/collections/builders/AbstractMapBuilderEntrySet;
.source "MapBuilder.kt"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Lkotlin/collections/builders/AbstractMapBuilderEntrySet<",
        "Ljava/util/Map$Entry<",
        "TK;TV;>;TK;TV;>;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000H\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0010\'\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u0008\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0010&\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u001e\n\u0002\u0008\u0002\n\u0002\u0010)\n\u0002\u0008\u0004\u0008\u0000\u0018\u0000*\u0004\u0008\u0000\u0010\u0001*\u0004\u0008\u0001\u0010\u00022 \u0012\u0010\u0012\u000e\u0012\u0004\u0012\u0002H\u0001\u0012\u0004\u0012\u0002H\u00020\u0004\u0012\u0004\u0012\u0002H\u0001\u0012\u0004\u0012\u0002H\u00020\u0003B\u001d\u0008@\u0012\u0012\u0010\u0005\u001a\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u00010\u0006\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J\n\u0010\u000f\u001a\u00020\u0010H\u0096\u0080\u0004J\u001e\u0010\u0011\u001a\u00020\u00102\u0012\u0010\u0012\u001a\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u00010\u0013H\u0096\u0080\u0004J\n\u0010\u0014\u001a\u00020\u0015H\u0096\u0080\u0004J\u001e\u0010\u0016\u001a\u00020\u00102\u0012\u0010\u0012\u001a\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u00010\u0004H\u0096\u0080\u0008J$\u0010\u0017\u001a\u00020\u00102\u0018\u0010\u0018\u001a\u0014\u0012\u0010\u0012\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u00010\u00040\u0019H\u0096\u0080\u0008J\u001e\u0010\u001a\u001a\u00020\u00102\u0012\u0010\u0012\u001a\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u00010\u0004H\u0096\u0080\u0008J\u001c\u0010\u001b\u001a\u0014\u0012\u0010\u0012\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u00010\u00040\u001cH\u0096\u0082\u0004J$\u0010\u001d\u001a\u00020\u00102\u0018\u0010\u0018\u001a\u0014\u0012\u0010\u0012\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u00010\u00040\u0019H\u0096\u0080\u0004J$\u0010\u001e\u001a\u00020\u00102\u0018\u0010\u0018\u001a\u0014\u0012\u0010\u0012\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u00010\u00040\u0019H\u0096\u0080\u0008J$\u0010\u001f\u001a\u00020\u00102\u0018\u0010\u0018\u001a\u0014\u0012\u0010\u0012\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u00010\u00040\u0019H\u0096\u0080\u0008R!\u0010\u0005\u001a\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u00010\u0006X\u0086\u0084\u0008\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\t\u0010\nR\u0015\u0010\u000b\u001a\u00020\u000c8VX\u0096\u0084\u0008\u00a2\u0006\u0006\u001a\u0004\u0008\r\u0010\u000e\u00a8\u0006 "
    }
    d2 = {
        "Lkotlin/collections/builders/MapBuilderEntries;",
        "K",
        "V",
        "Lkotlin/collections/builders/AbstractMapBuilderEntrySet;",
        "",
        "backing",
        "Lkotlin/collections/builders/MapBuilder;",
        "<init>",
        "(Lkotlin/collections/builders/MapBuilder;)V",
        "getBacking",
        "()Lkotlin/collections/builders/MapBuilder;",
        "size",
        "",
        "getSize",
        "()I",
        "isEmpty",
        "",
        "containsEntry",
        "element",
        "",
        "clear",
        "",
        "add",
        "addAll",
        "elements",
        "",
        "remove",
        "iterator",
        "",
        "containsAll",
        "removeAll",
        "retainAll",
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


# instance fields
.field private final backing:Lkotlin/collections/builders/MapBuilder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/collections/builders/MapBuilder<",
            "TK;TV;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lkotlin/collections/builders/MapBuilder;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/collections/builders/MapBuilder<",
            "TK;TV;>;)V"
        }
    .end annotation

    const-string v0, "backing"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 672
    invoke-direct {p0}, Lkotlin/collections/builders/AbstractMapBuilderEntrySet;-><init>()V

    .line 673
    iput-object p1, p0, Lkotlin/collections/builders/MapBuilderEntries;->backing:Lkotlin/collections/builders/MapBuilder;

    return-void
.end method


# virtual methods
.method public bridge synthetic add(Ljava/lang/Object;)Z
    .registers 2

    .line 672
    check-cast p1, Ljava/util/Map$Entry;

    invoke-virtual {p0, p1}, Lkotlin/collections/builders/MapBuilderEntries;->add(Ljava/util/Map$Entry;)Z

    move-result p0

    return p0
.end method

.method public add(Ljava/util/Map$Entry;)Z
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map$Entry<",
            "TK;TV;>;)Z"
        }
    .end annotation

    const-string p0, "element"

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 680
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p0
.end method

.method public addAll(Ljava/util/Collection;)Z
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "+",
            "Ljava/util/Map$Entry<",
            "TK;TV;>;>;)Z"
        }
    .end annotation

    const-string p0, "elements"

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 681
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p0
.end method

.method public clear()V
    .registers 1

    .line 679
    iget-object p0, p0, Lkotlin/collections/builders/MapBuilderEntries;->backing:Lkotlin/collections/builders/MapBuilder;

    invoke-virtual {p0}, Lkotlin/collections/builders/MapBuilder;->clear()V

    return-void
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

    .line 684
    iget-object p0, p0, Lkotlin/collections/builders/MapBuilderEntries;->backing:Lkotlin/collections/builders/MapBuilder;

    invoke-virtual {p0, p1}, Lkotlin/collections/builders/MapBuilder;->containsAllEntries$kotlin_stdlib(Ljava/util/Collection;)Z

    move-result p0

    return p0
.end method

.method public containsEntry(Ljava/util/Map$Entry;)Z
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map$Entry<",
            "+TK;+TV;>;)Z"
        }
    .end annotation

    const-string v0, "element"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 678
    iget-object p0, p0, Lkotlin/collections/builders/MapBuilderEntries;->backing:Lkotlin/collections/builders/MapBuilder;

    invoke-virtual {p0, p1}, Lkotlin/collections/builders/MapBuilder;->containsEntry$kotlin_stdlib(Ljava/util/Map$Entry;)Z

    move-result p0

    return p0
.end method

.method public final getBacking()Lkotlin/collections/builders/MapBuilder;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lkotlin/collections/builders/MapBuilder<",
            "TK;TV;>;"
        }
    .end annotation

    .line 673
    iget-object p0, p0, Lkotlin/collections/builders/MapBuilderEntries;->backing:Lkotlin/collections/builders/MapBuilder;

    return-object p0
.end method

.method public getSize()I
    .registers 1

    .line 676
    iget-object p0, p0, Lkotlin/collections/builders/MapBuilderEntries;->backing:Lkotlin/collections/builders/MapBuilder;

    invoke-virtual {p0}, Lkotlin/collections/builders/MapBuilder;->size()I

    move-result p0

    return p0
.end method

.method public isEmpty()Z
    .registers 1

    .line 677
    iget-object p0, p0, Lkotlin/collections/builders/MapBuilderEntries;->backing:Lkotlin/collections/builders/MapBuilder;

    invoke-virtual {p0}, Lkotlin/collections/builders/MapBuilder;->isEmpty()Z

    move-result p0

    return p0
.end method

.method public iterator()Ljava/util/Iterator;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "Ljava/util/Map$Entry<",
            "TK;TV;>;>;"
        }
    .end annotation

    .line 683
    iget-object p0, p0, Lkotlin/collections/builders/MapBuilderEntries;->backing:Lkotlin/collections/builders/MapBuilder;

    invoke-virtual {p0}, Lkotlin/collections/builders/MapBuilder;->entriesIterator$kotlin_stdlib()Lkotlin/collections/builders/MapBuilder$EntriesItr;

    move-result-object p0

    check-cast p0, Ljava/util/Iterator;

    return-object p0
.end method

.method public remove(Ljava/util/Map$Entry;)Z
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map$Entry<",
            "TK;TV;>;)Z"
        }
    .end annotation

    const-string v0, "element"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 682
    iget-object p0, p0, Lkotlin/collections/builders/MapBuilderEntries;->backing:Lkotlin/collections/builders/MapBuilder;

    invoke-virtual {p0, p1}, Lkotlin/collections/builders/MapBuilder;->removeEntry$kotlin_stdlib(Ljava/util/Map$Entry;)Z

    move-result p0

    return p0
.end method

.method public removeAll(Ljava/util/Collection;)Z
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

    .line 687
    iget-object v0, p0, Lkotlin/collections/builders/MapBuilderEntries;->backing:Lkotlin/collections/builders/MapBuilder;

    invoke-virtual {v0}, Lkotlin/collections/builders/MapBuilder;->checkIsMutable$kotlin_stdlib()V

    .line 688
    invoke-super {p0, p1}, Lkotlin/collections/builders/AbstractMapBuilderEntrySet;->removeAll(Ljava/util/Collection;)Z

    move-result p0

    return p0
.end method

.method public retainAll(Ljava/util/Collection;)Z
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

    .line 692
    iget-object v0, p0, Lkotlin/collections/builders/MapBuilderEntries;->backing:Lkotlin/collections/builders/MapBuilder;

    invoke-virtual {v0}, Lkotlin/collections/builders/MapBuilder;->checkIsMutable$kotlin_stdlib()V

    .line 693
    invoke-super {p0, p1}, Lkotlin/collections/builders/AbstractMapBuilderEntrySet;->retainAll(Ljava/util/Collection;)Z

    move-result p0

    return p0
.end method
