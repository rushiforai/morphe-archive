.class public final Lkotlin/collections/builders/MapBuilder$EntriesItr;
.super Lkotlin/collections/builders/MapBuilder$Itr;
.source "MapBuilder.kt"

# interfaces
.implements Ljava/util/Iterator;
.implements Lkotlin/jvm/internal/markers/KMutableIterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lkotlin/collections/builders/MapBuilder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "EntriesItr"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Lkotlin/collections/builders/MapBuilder$Itr<",
        "TK;TV;>;",
        "Ljava/util/Iterator<",
        "Ljava/util/Map$Entry<",
        "TK;TV;>;>;",
        "Lkotlin/jvm/internal/markers/KMutableIterator;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000<\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0010)\n\u0002\u0010\'\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\u0008\u0000\u0018\u0000*\u0004\u0008\u0002\u0010\u0001*\u0004\u0008\u0003\u0010\u00022\u000e\u0012\u0004\u0012\u0002H\u0001\u0012\u0004\u0012\u0002H\u00020\u00032\u0014\u0012\u0010\u0012\u000e\u0012\u0004\u0012\u0002H\u0001\u0012\u0004\u0012\u0002H\u00020\u00050\u0004B\u001d\u0008F\u0012\u0012\u0010\u0006\u001a\u000e\u0012\u0004\u0012\u00028\u0002\u0012\u0004\u0012\u00028\u00030\u0007\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\u0016\u0010\n\u001a\u000e\u0012\u0004\u0012\u00028\u0002\u0012\u0004\u0012\u00028\u00030\u000bH\u0096\u0082\u0004J\u000f\u0010\u000c\u001a\u00020\rH\u0080\u0080\u0004\u00a2\u0006\u0002\u0008\u000eJ\u0016\u0010\u000f\u001a\u00020\u00102\n\u0010\u0011\u001a\u00060\u0012j\u0002`\u0013H\u0086\u0080\u0004\u00a8\u0006\u0014"
    }
    d2 = {
        "Lkotlin/collections/builders/MapBuilder$EntriesItr;",
        "K",
        "V",
        "Lkotlin/collections/builders/MapBuilder$Itr;",
        "",
        "",
        "map",
        "Lkotlin/collections/builders/MapBuilder;",
        "<init>",
        "(Lkotlin/collections/builders/MapBuilder;)V",
        "next",
        "Lkotlin/collections/builders/MapBuilder$EntryRef;",
        "nextHashCode",
        "",
        "nextHashCode$kotlin_stdlib",
        "nextAppendString",
        "",
        "sb",
        "Ljava/lang/StringBuilder;",
        "Lkotlin/text/StringBuilder;",
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

    const-string v0, "map"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 544
    invoke-direct {p0, p1}, Lkotlin/collections/builders/MapBuilder$Itr;-><init>(Lkotlin/collections/builders/MapBuilder;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic next()Ljava/lang/Object;
    .registers 1

    .line 544
    invoke-virtual {p0}, Lkotlin/collections/builders/MapBuilder$EntriesItr;->next()Lkotlin/collections/builders/MapBuilder$EntryRef;

    move-result-object p0

    return-object p0
.end method

.method public next()Lkotlin/collections/builders/MapBuilder$EntryRef;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lkotlin/collections/builders/MapBuilder$EntryRef<",
            "TK;TV;>;"
        }
    .end annotation

    .line 547
    invoke-virtual {p0}, Lkotlin/collections/builders/MapBuilder$EntriesItr;->checkForComodification$kotlin_stdlib()V

    .line 548
    invoke-virtual {p0}, Lkotlin/collections/builders/MapBuilder$EntriesItr;->getIndex$kotlin_stdlib()I

    move-result v0

    invoke-virtual {p0}, Lkotlin/collections/builders/MapBuilder$EntriesItr;->getMap$kotlin_stdlib()Lkotlin/collections/builders/MapBuilder;

    move-result-object v1

    # getter for: Lkotlin/collections/builders/MapBuilder;->length:I
    invoke-static {v1}, Lkotlin/collections/builders/MapBuilder;->access$getLength$p(Lkotlin/collections/builders/MapBuilder;)I

    move-result v1

    if-ge v0, v1, :cond_2e

    .line 549
    invoke-virtual {p0}, Lkotlin/collections/builders/MapBuilder$EntriesItr;->getIndex$kotlin_stdlib()I

    move-result v0

    add-int/lit8 v1, v0, 0x1

    invoke-virtual {p0, v1}, Lkotlin/collections/builders/MapBuilder$EntriesItr;->setIndex$kotlin_stdlib(I)V

    invoke-virtual {p0, v0}, Lkotlin/collections/builders/MapBuilder$EntriesItr;->setLastIndex$kotlin_stdlib(I)V

    .line 550
    new-instance v0, Lkotlin/collections/builders/MapBuilder$EntryRef;

    invoke-virtual {p0}, Lkotlin/collections/builders/MapBuilder$EntriesItr;->getMap$kotlin_stdlib()Lkotlin/collections/builders/MapBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lkotlin/collections/builders/MapBuilder$EntriesItr;->getLastIndex$kotlin_stdlib()I

    move-result v2

    invoke-direct {v0, v1, v2}, Lkotlin/collections/builders/MapBuilder$EntryRef;-><init>(Lkotlin/collections/builders/MapBuilder;I)V

    .line 551
    invoke-virtual {p0}, Lkotlin/collections/builders/MapBuilder$EntriesItr;->initNext$kotlin_stdlib()V

    return-object v0

    .line 548
    :cond_2e
    new-instance p0, Ljava/util/NoSuchElementException;

    invoke-direct {p0}, Ljava/util/NoSuchElementException;-><init>()V

    throw p0
.end method

.method public final nextAppendString(Ljava/lang/StringBuilder;)V
    .registers 5

    const-string v0, "sb"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 564
    invoke-virtual {p0}, Lkotlin/collections/builders/MapBuilder$EntriesItr;->getIndex$kotlin_stdlib()I

    move-result v0

    invoke-virtual {p0}, Lkotlin/collections/builders/MapBuilder$EntriesItr;->getMap$kotlin_stdlib()Lkotlin/collections/builders/MapBuilder;

    move-result-object v1

    # getter for: Lkotlin/collections/builders/MapBuilder;->length:I
    invoke-static {v1}, Lkotlin/collections/builders/MapBuilder;->access$getLength$p(Lkotlin/collections/builders/MapBuilder;)I

    move-result v1

    if-ge v0, v1, :cond_63

    .line 565
    invoke-virtual {p0}, Lkotlin/collections/builders/MapBuilder$EntriesItr;->getIndex$kotlin_stdlib()I

    move-result v0

    add-int/lit8 v1, v0, 0x1

    invoke-virtual {p0, v1}, Lkotlin/collections/builders/MapBuilder$EntriesItr;->setIndex$kotlin_stdlib(I)V

    invoke-virtual {p0, v0}, Lkotlin/collections/builders/MapBuilder$EntriesItr;->setLastIndex$kotlin_stdlib(I)V

    .line 566
    invoke-virtual {p0}, Lkotlin/collections/builders/MapBuilder$EntriesItr;->getMap$kotlin_stdlib()Lkotlin/collections/builders/MapBuilder;

    move-result-object v0

    # getter for: Lkotlin/collections/builders/MapBuilder;->keysArray:[Ljava/lang/Object;
    invoke-static {v0}, Lkotlin/collections/builders/MapBuilder;->access$getKeysArray$p(Lkotlin/collections/builders/MapBuilder;)[Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p0}, Lkotlin/collections/builders/MapBuilder$EntriesItr;->getLastIndex$kotlin_stdlib()I

    move-result v1

    aget-object v0, v0, v1

    .line 567
    invoke-virtual {p0}, Lkotlin/collections/builders/MapBuilder$EntriesItr;->getMap$kotlin_stdlib()Lkotlin/collections/builders/MapBuilder;

    move-result-object v1

    const-string v2, "(this Map)"

    if-ne v0, v1, :cond_39

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_3c

    :cond_39
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    :goto_3c
    const/16 v0, 0x3d

    .line 568
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 569
    invoke-virtual {p0}, Lkotlin/collections/builders/MapBuilder$EntriesItr;->getMap$kotlin_stdlib()Lkotlin/collections/builders/MapBuilder;

    move-result-object v0

    # getter for: Lkotlin/collections/builders/MapBuilder;->valuesArray:[Ljava/lang/Object;
    invoke-static {v0}, Lkotlin/collections/builders/MapBuilder;->access$getValuesArray$p(Lkotlin/collections/builders/MapBuilder;)[Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {p0}, Lkotlin/collections/builders/MapBuilder$EntriesItr;->getLastIndex$kotlin_stdlib()I

    move-result v1

    aget-object v0, v0, v1

    .line 570
    invoke-virtual {p0}, Lkotlin/collections/builders/MapBuilder$EntriesItr;->getMap$kotlin_stdlib()Lkotlin/collections/builders/MapBuilder;

    move-result-object v1

    if-ne v0, v1, :cond_5c

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_5f

    :cond_5c
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 571
    :goto_5f
    invoke-virtual {p0}, Lkotlin/collections/builders/MapBuilder$EntriesItr;->initNext$kotlin_stdlib()V

    return-void

    .line 564
    :cond_63
    new-instance p0, Ljava/util/NoSuchElementException;

    invoke-direct {p0}, Ljava/util/NoSuchElementException;-><init>()V

    throw p0
.end method

.method public final nextHashCode$kotlin_stdlib()I
    .registers 5

    .line 556
    invoke-virtual {p0}, Lkotlin/collections/builders/MapBuilder$EntriesItr;->getIndex$kotlin_stdlib()I

    move-result v0

    invoke-virtual {p0}, Lkotlin/collections/builders/MapBuilder$EntriesItr;->getMap$kotlin_stdlib()Lkotlin/collections/builders/MapBuilder;

    move-result-object v1

    # getter for: Lkotlin/collections/builders/MapBuilder;->length:I
    invoke-static {v1}, Lkotlin/collections/builders/MapBuilder;->access$getLength$p(Lkotlin/collections/builders/MapBuilder;)I

    move-result v1

    if-ge v0, v1, :cond_4d

    .line 557
    invoke-virtual {p0}, Lkotlin/collections/builders/MapBuilder$EntriesItr;->getIndex$kotlin_stdlib()I

    move-result v0

    add-int/lit8 v1, v0, 0x1

    invoke-virtual {p0, v1}, Lkotlin/collections/builders/MapBuilder$EntriesItr;->setIndex$kotlin_stdlib(I)V

    invoke-virtual {p0, v0}, Lkotlin/collections/builders/MapBuilder$EntriesItr;->setLastIndex$kotlin_stdlib(I)V

    .line 558
    invoke-virtual {p0}, Lkotlin/collections/builders/MapBuilder$EntriesItr;->getMap$kotlin_stdlib()Lkotlin/collections/builders/MapBuilder;

    move-result-object v0

    # getter for: Lkotlin/collections/builders/MapBuilder;->keysArray:[Ljava/lang/Object;
    invoke-static {v0}, Lkotlin/collections/builders/MapBuilder;->access$getKeysArray$p(Lkotlin/collections/builders/MapBuilder;)[Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p0}, Lkotlin/collections/builders/MapBuilder$EntriesItr;->getLastIndex$kotlin_stdlib()I

    move-result v1

    aget-object v0, v0, v1

    const/4 v1, 0x0

    if-eqz v0, :cond_30

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    goto :goto_31

    :cond_30
    move v0, v1

    :goto_31
    invoke-virtual {p0}, Lkotlin/collections/builders/MapBuilder$EntriesItr;->getMap$kotlin_stdlib()Lkotlin/collections/builders/MapBuilder;

    move-result-object v2

    # getter for: Lkotlin/collections/builders/MapBuilder;->valuesArray:[Ljava/lang/Object;
    invoke-static {v2}, Lkotlin/collections/builders/MapBuilder;->access$getValuesArray$p(Lkotlin/collections/builders/MapBuilder;)[Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {p0}, Lkotlin/collections/builders/MapBuilder$EntriesItr;->getLastIndex$kotlin_stdlib()I

    move-result v3

    aget-object v2, v2, v3

    if-eqz v2, :cond_48

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v1

    :cond_48
    xor-int/2addr v0, v1

    .line 559
    invoke-virtual {p0}, Lkotlin/collections/builders/MapBuilder$EntriesItr;->initNext$kotlin_stdlib()V

    return v0

    .line 556
    :cond_4d
    new-instance p0, Ljava/util/NoSuchElementException;

    invoke-direct {p0}, Ljava/util/NoSuchElementException;-><init>()V

    throw p0
.end method
