.class public final Lkotlin/collections/builders/MapBuilderValues;
.super Lkotlin/collections/AbstractMutableCollection;
.source "MapBuilder.kt"

# interfaces
.implements Ljava/util/Collection;
.implements Lkotlin/jvm/internal/markers/KMutableCollection;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<V:",
        "Ljava/lang/Object;",
        ">",
        "Lkotlin/collections/AbstractMutableCollection<",
        "TV;>;",
        "Ljava/util/Collection<",
        "TV;>;",
        "Lkotlin/jvm/internal/markers/KMutableCollection;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000<\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u001f\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u0008\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0008\u0006\n\u0002\u0010\u001e\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010)\n\u0002\u0008\u0004\u0008\u0000\u0018\u0000*\u0004\u0008\u0000\u0010\u00012\u0008\u0012\u0004\u0012\u0002H\u00010\u00022\u0008\u0012\u0004\u0012\u0002H\u00010\u0003B\u001b\u0008@\u0012\u0010\u0010\u0004\u001a\u000c\u0012\u0002\u0008\u0003\u0012\u0004\u0012\u00028\u00000\u0005\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\n\u0010\u000e\u001a\u00020\u000fH\u0096\u0080\u0004J\u0017\u0010\u0010\u001a\u00020\u000f2\u0006\u0010\u0011\u001a\u00028\u0000H\u0096\u0082\u0004\u00a2\u0006\u0002\u0010\u0012J\u0017\u0010\u0013\u001a\u00020\u000f2\u0006\u0010\u0011\u001a\u00028\u0000H\u0096\u0080\u0008\u00a2\u0006\u0002\u0010\u0012J\u0018\u0010\u0014\u001a\u00020\u000f2\u000c\u0010\u0015\u001a\u0008\u0012\u0004\u0012\u00028\u00000\u0016H\u0096\u0080\u0008J\n\u0010\u0017\u001a\u00020\u0018H\u0096\u0080\u0004J\u0010\u0010\u0019\u001a\u0008\u0012\u0004\u0012\u00028\u00000\u001aH\u0096\u0082\u0004J\u0017\u0010\u001b\u001a\u00020\u000f2\u0006\u0010\u0011\u001a\u00028\u0000H\u0096\u0080\u0008\u00a2\u0006\u0002\u0010\u0012J\u0018\u0010\u001c\u001a\u00020\u000f2\u000c\u0010\u0015\u001a\u0008\u0012\u0004\u0012\u00028\u00000\u0016H\u0096\u0080\u0008J\u0018\u0010\u001d\u001a\u00020\u000f2\u000c\u0010\u0015\u001a\u0008\u0012\u0004\u0012\u00028\u00000\u0016H\u0096\u0080\u0008R\u001f\u0010\u0004\u001a\u000c\u0012\u0002\u0008\u0003\u0012\u0004\u0012\u00028\u00000\u0005X\u0086\u0084\u0008\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0008\u0010\tR\u0015\u0010\n\u001a\u00020\u000b8VX\u0096\u0084\u0008\u00a2\u0006\u0006\u001a\u0004\u0008\u000c\u0010\r\u00a8\u0006\u001e"
    }
    d2 = {
        "Lkotlin/collections/builders/MapBuilderValues;",
        "V",
        "",
        "Lkotlin/collections/AbstractMutableCollection;",
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
        "contains",
        "element",
        "(Ljava/lang/Object;)Z",
        "add",
        "addAll",
        "elements",
        "",
        "clear",
        "",
        "iterator",
        "",
        "remove",
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
            "*TV;>;"
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
            "*TV;>;)V"
        }
    .end annotation

    const-string v0, "backing"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 642
    invoke-direct {p0}, Lkotlin/collections/AbstractMutableCollection;-><init>()V

    .line 643
    iput-object p1, p0, Lkotlin/collections/builders/MapBuilderValues;->backing:Lkotlin/collections/builders/MapBuilder;

    return-void
.end method


# virtual methods
.method public add(Ljava/lang/Object;)Z
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TV;)Z"
        }
    .end annotation

    .line 649
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
            "+TV;>;)Z"
        }
    .end annotation

    const-string p0, "elements"

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 650
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p0
.end method

.method public clear()V
    .registers 1

    .line 651
    iget-object p0, p0, Lkotlin/collections/builders/MapBuilderValues;->backing:Lkotlin/collections/builders/MapBuilder;

    invoke-virtual {p0}, Lkotlin/collections/builders/MapBuilder;->clear()V

    return-void
.end method

.method public contains(Ljava/lang/Object;)Z
    .registers 2

    .line 648
    iget-object p0, p0, Lkotlin/collections/builders/MapBuilderValues;->backing:Lkotlin/collections/builders/MapBuilder;

    invoke-virtual {p0, p1}, Lkotlin/collections/builders/MapBuilder;->containsValue(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public final getBacking()Lkotlin/collections/builders/MapBuilder;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lkotlin/collections/builders/MapBuilder<",
            "*TV;>;"
        }
    .end annotation

    .line 643
    iget-object p0, p0, Lkotlin/collections/builders/MapBuilderValues;->backing:Lkotlin/collections/builders/MapBuilder;

    return-object p0
.end method

.method public getSize()I
    .registers 1

    .line 646
    iget-object p0, p0, Lkotlin/collections/builders/MapBuilderValues;->backing:Lkotlin/collections/builders/MapBuilder;

    invoke-virtual {p0}, Lkotlin/collections/builders/MapBuilder;->size()I

    move-result p0

    return p0
.end method

.method public isEmpty()Z
    .registers 1

    .line 647
    iget-object p0, p0, Lkotlin/collections/builders/MapBuilderValues;->backing:Lkotlin/collections/builders/MapBuilder;

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
            "TV;>;"
        }
    .end annotation

    .line 652
    iget-object p0, p0, Lkotlin/collections/builders/MapBuilderValues;->backing:Lkotlin/collections/builders/MapBuilder;

    invoke-virtual {p0}, Lkotlin/collections/builders/MapBuilder;->valuesIterator$kotlin_stdlib()Lkotlin/collections/builders/MapBuilder$ValuesItr;

    move-result-object p0

    check-cast p0, Ljava/util/Iterator;

    return-object p0
.end method

.method public remove(Ljava/lang/Object;)Z
    .registers 2

    .line 653
    iget-object p0, p0, Lkotlin/collections/builders/MapBuilderValues;->backing:Lkotlin/collections/builders/MapBuilder;

    invoke-virtual {p0, p1}, Lkotlin/collections/builders/MapBuilder;->removeValue$kotlin_stdlib(Ljava/lang/Object;)Z

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

    .line 656
    iget-object v0, p0, Lkotlin/collections/builders/MapBuilderValues;->backing:Lkotlin/collections/builders/MapBuilder;

    invoke-virtual {v0}, Lkotlin/collections/builders/MapBuilder;->checkIsMutable$kotlin_stdlib()V

    .line 657
    invoke-super {p0, p1}, Lkotlin/collections/AbstractMutableCollection;->removeAll(Ljava/util/Collection;)Z

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

    .line 661
    iget-object v0, p0, Lkotlin/collections/builders/MapBuilderValues;->backing:Lkotlin/collections/builders/MapBuilder;

    invoke-virtual {v0}, Lkotlin/collections/builders/MapBuilder;->checkIsMutable$kotlin_stdlib()V

    .line 662
    invoke-super {p0, p1}, Lkotlin/collections/AbstractMutableCollection;->retainAll(Ljava/util/Collection;)Z

    move-result p0

    return p0
.end method
