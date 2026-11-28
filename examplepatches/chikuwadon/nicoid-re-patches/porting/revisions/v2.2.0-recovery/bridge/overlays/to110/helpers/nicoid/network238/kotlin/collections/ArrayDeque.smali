.class public final Lnicoid/network238/kotlin/collections/ArrayDeque;
.super Lnicoid/network238/kotlin/collections/AbstractMutableList;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/kotlin/collections/ArrayDeque$Companion;
    }
.end annotation


# static fields
.field public static final Companion:Lnicoid/network238/kotlin/collections/ArrayDeque$Companion;

.field private static final emptyElementData:[Ljava/lang/Object;


# instance fields
.field private elementData:[Ljava/lang/Object;

.field private head:I

.field private size:I


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lnicoid/network238/kotlin/collections/ArrayDeque$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lnicoid/network238/kotlin/collections/ArrayDeque$Companion;-><init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lnicoid/network238/kotlin/collections/ArrayDeque;->Companion:Lnicoid/network238/kotlin/collections/ArrayDeque$Companion;

    .line 650
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    sput-object v0, Lnicoid/network238/kotlin/collections/ArrayDeque;->emptyElementData:[Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .line 38
    invoke-direct {p0}, Lnicoid/network238/kotlin/collections/AbstractMutableList;-><init>()V

    .line 39
    sget-object v0, Lnicoid/network238/kotlin/collections/ArrayDeque;->emptyElementData:[Ljava/lang/Object;

    iput-object v0, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->elementData:[Ljava/lang/Object;

    return-void
.end method

.method private final copyCollectionElements(ILjava/util/Collection;)V
    .registers 7

    .line 261
    invoke-interface {p2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 263
    iget-object v1, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->elementData:[Ljava/lang/Object;

    array-length v1, v1

    :goto_0
    if-ge p1, v1, :cond_0

    .line 264
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 265
    iget-object v2, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->elementData:[Ljava/lang/Object;

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    aput-object v3, v2, p1

    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    :cond_0
    nop

    .line 267
    iget p1, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->head:I

    const/4 v1, 0x0

    :goto_1
    if-ge v1, p1, :cond_1

    .line 268
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 269
    iget-object v2, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->elementData:[Ljava/lang/Object;

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    aput-object v3, v2, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 272
    :cond_1
    invoke-virtual {p0}, Lnicoid/network238/kotlin/collections/AbstractMutableList;->size()I

    move-result p1

    invoke-interface {p2}, Ljava/util/Collection;->size()I

    move-result p2

    add-int/2addr p1, p2

    iput p1, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->size:I

    return-void
.end method

.method private final copyElements(I)V
    .registers 6

    .line 73
    new-array p1, p1, [Ljava/lang/Object;

    .line 74
    iget-object v0, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->elementData:[Ljava/lang/Object;

    iget v1, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->head:I

    array-length v2, v0

    const/4 v3, 0x0

    invoke-static {v0, p1, v3, v1, v2}, Lnicoid/network238/kotlin/collections/ArraysKt___ArraysJvmKt;->copyInto([Ljava/lang/Object;[Ljava/lang/Object;III)[Ljava/lang/Object;

    .line 75
    iget-object v0, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->elementData:[Ljava/lang/Object;

    array-length v1, v0

    iget v2, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->head:I

    sub-int/2addr v1, v2

    invoke-static {v0, p1, v1, v3, v2}, Lnicoid/network238/kotlin/collections/ArraysKt___ArraysJvmKt;->copyInto([Ljava/lang/Object;[Ljava/lang/Object;III)[Ljava/lang/Object;

    .line 76
    iput v3, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->head:I

    .line 77
    iput-object p1, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->elementData:[Ljava/lang/Object;

    return-void
.end method

.method private final decremented(I)I
    .registers 2

    if-nez p1, :cond_0

    .line 95
    iget-object p1, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->elementData:[Ljava/lang/Object;

    invoke-static {p1}, Lnicoid/network238/kotlin/collections/ArraysKt___ArraysKt;->getLastIndex([Ljava/lang/Object;)I

    move-result p1

    return p1

    :cond_0
    add-int/lit8 p1, p1, -0x1

    return p1
.end method

.method private final ensureCapacity(I)V
    .registers 4

    if-ltz p1, :cond_2

    .line 59
    iget-object v0, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->elementData:[Ljava/lang/Object;

    array-length v1, v0

    if-gt p1, v1, :cond_0

    return-void

    .line 60
    :cond_0
    sget-object v1, Lnicoid/network238/kotlin/collections/ArrayDeque;->emptyElementData:[Ljava/lang/Object;

    if-ne v0, v1, :cond_1

    .line 61
    const/16 v0, 0xa

    invoke-static {p1, v0}, Lnicoid/network238/kotlin/ranges/RangesKt;->coerceAtLeast(II)I

    move-result p1

    new-array p1, p1, [Ljava/lang/Object;

    iput-object p1, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->elementData:[Ljava/lang/Object;

    return-void

    .line 65
    :cond_1
    sget-object v1, Lnicoid/network238/kotlin/collections/AbstractList;->Companion:Lnicoid/network238/kotlin/collections/AbstractList$Companion;

    array-length v0, v0

    invoke-virtual {v1, v0, p1}, Lnicoid/network238/kotlin/collections/AbstractList$Companion;->newCapacity$kotlin_stdlib(II)I

    move-result p1

    .line 66
    invoke-direct {p0, p1}, Lnicoid/network238/kotlin/collections/ArrayDeque;->copyElements(I)V

    return-void

    .line 58
    :cond_2
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Deque is too big."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private final incremented(I)I
    .registers 3

    .line 93
    iget-object v0, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->elementData:[Ljava/lang/Object;

    invoke-static {v0}, Lnicoid/network238/kotlin/collections/ArraysKt___ArraysKt;->getLastIndex([Ljava/lang/Object;)I

    move-result v0

    if-ne p1, v0, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    add-int/lit8 p1, p1, 0x1

    return p1
.end method

.method private final negativeMod(I)I
    .registers 3

    if-gez p1, :cond_0

    .line 88
    iget-object v0, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->elementData:[Ljava/lang/Object;

    array-length v0, v0

    add-int/2addr p1, v0

    :cond_0
    return p1
.end method

.method private final nullifyNonEmpty(II)V
    .registers 6

    .line 635
    iget-object v0, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->elementData:[Ljava/lang/Object;

    const/4 v1, 0x0

    if-ge p1, p2, :cond_0

    .line 633
    invoke-static {v0, v1, p1, p2}, Lnicoid/network238/kotlin/collections/ArraysKt___ArraysJvmKt;->fill([Ljava/lang/Object;Ljava/lang/Object;II)V

    return-void

    .line 635
    :cond_0
    array-length v2, v0

    invoke-static {v0, v1, p1, v2}, Lnicoid/network238/kotlin/collections/ArraysKt___ArraysJvmKt;->fill([Ljava/lang/Object;Ljava/lang/Object;II)V

    .line 636
    iget-object p1, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->elementData:[Ljava/lang/Object;

    const/4 v0, 0x0

    invoke-static {p1, v1, v0, p2}, Lnicoid/network238/kotlin/collections/ArraysKt___ArraysJvmKt;->fill([Ljava/lang/Object;Ljava/lang/Object;II)V

    return-void
.end method

.method private final positiveMod(I)I
    .registers 4

    .line 86
    iget-object v0, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->elementData:[Ljava/lang/Object;

    array-length v1, v0

    if-lt p1, v1, :cond_0

    array-length v0, v0

    sub-int/2addr p1, v0

    :cond_0
    return p1
.end method

.method private final registerModification()V
    .registers 2

    .line 641
    iget v0, p0, Ljava/util/AbstractList;->modCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Ljava/util/AbstractList;->modCount:I

    return-void
.end method

.method private final removeRangeShiftPreceding(II)V
    .registers 9

    .line 601
    iget v0, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->head:I

    add-int/lit8 v1, p1, -0x1

    add-int/2addr v0, v1

    invoke-direct {p0, v0}, Lnicoid/network238/kotlin/collections/ArrayDeque;->positiveMod(I)I

    move-result v0

    .line 602
    iget v1, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->head:I

    add-int/lit8 p2, p2, -0x1

    add-int/2addr v1, p2

    invoke-direct {p0, v1}, Lnicoid/network238/kotlin/collections/ArrayDeque;->positiveMod(I)I

    move-result p2

    :goto_0
    if-lez p1, :cond_0

    add-int/lit8 v1, v0, 0x1

    add-int/lit8 v2, p2, 0x1

    .line 606
    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v2

    invoke-static {p1, v2}, Ljava/lang/Math;->min(II)I

    move-result v2

    .line 607
    iget-object v3, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->elementData:[Ljava/lang/Object;

    sub-int/2addr p2, v2

    add-int/lit8 v4, p2, 0x1

    sub-int/2addr v0, v2

    add-int/lit8 v5, v0, 0x1

    invoke-static {v3, v3, v4, v5, v1}, Lnicoid/network238/kotlin/collections/ArraysKt___ArraysJvmKt;->copyInto([Ljava/lang/Object;[Ljava/lang/Object;III)[Ljava/lang/Object;

    .line 609
    invoke-direct {p0, v0}, Lnicoid/network238/kotlin/collections/ArrayDeque;->negativeMod(I)I

    move-result v0

    .line 610
    invoke-direct {p0, p2}, Lnicoid/network238/kotlin/collections/ArrayDeque;->negativeMod(I)I

    move-result p2

    sub-int/2addr p1, v2

    goto :goto_0

    :cond_0
    return-void
.end method

.method private final removeRangeShiftSucceeding(II)V
    .registers 7

    .line 616
    iget v0, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->head:I

    add-int/2addr v0, p2

    invoke-direct {p0, v0}, Lnicoid/network238/kotlin/collections/ArrayDeque;->positiveMod(I)I

    move-result v0

    .line 617
    iget v1, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->head:I

    add-int/2addr v1, p1

    invoke-direct {p0, v1}, Lnicoid/network238/kotlin/collections/ArrayDeque;->positiveMod(I)I

    move-result p1

    .line 618
    invoke-virtual {p0}, Lnicoid/network238/kotlin/collections/AbstractMutableList;->size()I

    move-result v1

    sub-int/2addr v1, p2

    :goto_0
    if-lez v1, :cond_0

    .line 621
    iget-object p2, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->elementData:[Ljava/lang/Object;

    array-length v2, p2

    sub-int/2addr v2, v0

    array-length p2, p2

    sub-int/2addr p2, p1

    invoke-static {v2, p2}, Ljava/lang/Math;->min(II)I

    move-result p2

    invoke-static {v1, p2}, Ljava/lang/Math;->min(II)I

    move-result p2

    .line 622
    iget-object v2, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->elementData:[Ljava/lang/Object;

    add-int v3, v0, p2

    invoke-static {v2, v2, p1, v0, v3}, Lnicoid/network238/kotlin/collections/ArraysKt___ArraysJvmKt;->copyInto([Ljava/lang/Object;[Ljava/lang/Object;III)[Ljava/lang/Object;

    .line 624
    invoke-direct {p0, v3}, Lnicoid/network238/kotlin/collections/ArrayDeque;->positiveMod(I)I

    move-result v0

    add-int/2addr p1, p2

    .line 625
    invoke-direct {p0, p1}, Lnicoid/network238/kotlin/collections/ArrayDeque;->positiveMod(I)I

    move-result p1

    sub-int/2addr v1, p2

    goto :goto_0

    :cond_0
    return-void
.end method


# virtual methods
.method public add(ILjava/lang/Object;)V
    .registers 10

    .line 187
    sget-object v0, Lnicoid/network238/kotlin/collections/AbstractList;->Companion:Lnicoid/network238/kotlin/collections/AbstractList$Companion;

    invoke-virtual {p0}, Lnicoid/network238/kotlin/collections/AbstractMutableList;->size()I

    move-result v1

    invoke-virtual {v0, p1, v1}, Lnicoid/network238/kotlin/collections/AbstractList$Companion;->checkPositionIndex$kotlin_stdlib(II)V

    .line 189
    invoke-virtual {p0}, Lnicoid/network238/kotlin/collections/AbstractMutableList;->size()I

    move-result v0

    if-ne p1, v0, :cond_0

    .line 190
    invoke-virtual {p0, p2}, Lnicoid/network238/kotlin/collections/ArrayDeque;->addLast(Ljava/lang/Object;)V

    return-void

    :cond_0
    if-nez p1, :cond_1

    .line 193
    invoke-virtual {p0, p2}, Lnicoid/network238/kotlin/collections/ArrayDeque;->addFirst(Ljava/lang/Object;)V

    return-void

    .line 197
    :cond_1
    invoke-direct {p0}, Lnicoid/network238/kotlin/collections/ArrayDeque;->registerModification()V

    .line 198
    invoke-virtual {p0}, Lnicoid/network238/kotlin/collections/AbstractMutableList;->size()I

    move-result v0

    const/4 v1, 0x1

    add-int/2addr v0, v1

    invoke-direct {p0, v0}, Lnicoid/network238/kotlin/collections/ArrayDeque;->ensureCapacity(I)V

    .line 225
    iget v0, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->head:I

    add-int/2addr v0, p1

    invoke-direct {p0, v0}, Lnicoid/network238/kotlin/collections/ArrayDeque;->positiveMod(I)I

    move-result v0

    .line 227
    invoke-virtual {p0}, Lnicoid/network238/kotlin/collections/AbstractMutableList;->size()I

    move-result v2

    add-int/2addr v2, v1

    shr-int/2addr v2, v1

    const/4 v3, 0x0

    if-ge p1, v2, :cond_3

    .line 229
    invoke-direct {p0, v0}, Lnicoid/network238/kotlin/collections/ArrayDeque;->decremented(I)I

    move-result p1

    .line 230
    iget v0, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->head:I

    invoke-direct {p0, v0}, Lnicoid/network238/kotlin/collections/ArrayDeque;->decremented(I)I

    move-result v0

    .line 232
    iget v2, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->head:I

    .line 236
    iget-object v4, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->elementData:[Ljava/lang/Object;

    if-lt p1, v2, :cond_2

    .line 233
    aget-object v3, v4, v2

    aput-object v3, v4, v0

    add-int/lit8 v3, v2, 0x1

    add-int/lit8 v5, p1, 0x1

    .line 234
    invoke-static {v4, v4, v2, v3, v5}, Lnicoid/network238/kotlin/collections/ArraysKt___ArraysJvmKt;->copyInto([Ljava/lang/Object;[Ljava/lang/Object;III)[Ljava/lang/Object;

    goto :goto_0

    :cond_2
    add-int/lit8 v5, v2, -0x1

    .line 236
    array-length v6, v4

    invoke-static {v4, v4, v5, v2, v6}, Lnicoid/network238/kotlin/collections/ArraysKt___ArraysJvmKt;->copyInto([Ljava/lang/Object;[Ljava/lang/Object;III)[Ljava/lang/Object;

    .line 237
    iget-object v2, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->elementData:[Ljava/lang/Object;

    array-length v4, v2

    sub-int/2addr v4, v1

    aget-object v5, v2, v3

    aput-object v5, v2, v4

    add-int/lit8 v4, p1, 0x1

    .line 238
    invoke-static {v2, v2, v3, v1, v4}, Lnicoid/network238/kotlin/collections/ArraysKt___ArraysJvmKt;->copyInto([Ljava/lang/Object;[Ljava/lang/Object;III)[Ljava/lang/Object;

    .line 241
    :goto_0
    iget-object v2, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->elementData:[Ljava/lang/Object;

    aput-object p2, v2, p1

    .line 242
    iput v0, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->head:I

    goto :goto_2

    .line 245
    :cond_3
    iget p1, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->head:I

    invoke-virtual {p0}, Lnicoid/network238/kotlin/collections/AbstractMutableList;->size()I

    move-result v2

    add-int/2addr p1, v2

    invoke-direct {p0, p1}, Lnicoid/network238/kotlin/collections/ArrayDeque;->positiveMod(I)I

    move-result p1

    .line 250
    iget-object v2, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->elementData:[Ljava/lang/Object;

    if-ge v0, p1, :cond_4

    add-int/lit8 v3, v0, 0x1

    .line 248
    invoke-static {v2, v2, v3, v0, p1}, Lnicoid/network238/kotlin/collections/ArraysKt___ArraysJvmKt;->copyInto([Ljava/lang/Object;[Ljava/lang/Object;III)[Ljava/lang/Object;

    goto :goto_1

    :cond_4
    nop

    .line 250
    invoke-static {v2, v2, v1, v3, p1}, Lnicoid/network238/kotlin/collections/ArraysKt___ArraysJvmKt;->copyInto([Ljava/lang/Object;[Ljava/lang/Object;III)[Ljava/lang/Object;

    .line 251
    iget-object p1, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->elementData:[Ljava/lang/Object;

    array-length v2, p1

    sub-int/2addr v2, v1

    aget-object v2, p1, v2

    aput-object v2, p1, v3

    add-int/lit8 v2, v0, 0x1

    .line 252
    array-length v3, p1

    sub-int/2addr v3, v1

    invoke-static {p1, p1, v2, v0, v3}, Lnicoid/network238/kotlin/collections/ArraysKt___ArraysJvmKt;->copyInto([Ljava/lang/Object;[Ljava/lang/Object;III)[Ljava/lang/Object;

    .line 255
    :goto_1
    iget-object p1, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->elementData:[Ljava/lang/Object;

    aput-object p2, p1, v0

    .line 257
    :goto_2
    invoke-virtual {p0}, Lnicoid/network238/kotlin/collections/AbstractMutableList;->size()I

    move-result p1

    add-int/2addr p1, v1

    iput p1, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->size:I

    return-void
.end method

.method public add(Ljava/lang/Object;)Z
    .registers 2

    .line 182
    invoke-virtual {p0, p1}, Lnicoid/network238/kotlin/collections/ArrayDeque;->addLast(Ljava/lang/Object;)V

    const/4 p1, 0x1

    return p1
.end method

.method public addAll(ILjava/util/Collection;)Z
    .registers 11

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 285
    sget-object v0, Lnicoid/network238/kotlin/collections/AbstractList;->Companion:Lnicoid/network238/kotlin/collections/AbstractList$Companion;

    invoke-virtual {p0}, Lnicoid/network238/kotlin/collections/AbstractMutableList;->size()I

    move-result v1

    invoke-virtual {v0, p1, v1}, Lnicoid/network238/kotlin/collections/AbstractList$Companion;->checkPositionIndex$kotlin_stdlib(II)V

    .line 287
    invoke-interface {p2}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    .line 289
    :cond_0
    invoke-virtual {p0}, Lnicoid/network238/kotlin/collections/AbstractMutableList;->size()I

    move-result v0

    if-ne p1, v0, :cond_1

    .line 290
    invoke-virtual {p0, p2}, Lnicoid/network238/kotlin/collections/ArrayDeque;->addAll(Ljava/util/Collection;)Z

    move-result p1

    return p1

    .line 293
    :cond_1
    invoke-direct {p0}, Lnicoid/network238/kotlin/collections/ArrayDeque;->registerModification()V

    .line 294
    invoke-virtual {p0}, Lnicoid/network238/kotlin/collections/AbstractMutableList;->size()I

    move-result v0

    invoke-interface {p2}, Ljava/util/Collection;->size()I

    move-result v2

    add-int/2addr v0, v2

    invoke-direct {p0, v0}, Lnicoid/network238/kotlin/collections/ArrayDeque;->ensureCapacity(I)V

    .line 296
    iget v0, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->head:I

    invoke-virtual {p0}, Lnicoid/network238/kotlin/collections/AbstractMutableList;->size()I

    move-result v2

    add-int/2addr v0, v2

    invoke-direct {p0, v0}, Lnicoid/network238/kotlin/collections/ArrayDeque;->positiveMod(I)I

    move-result v0

    .line 297
    iget v2, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->head:I

    add-int/2addr v2, p1

    invoke-direct {p0, v2}, Lnicoid/network238/kotlin/collections/ArrayDeque;->positiveMod(I)I

    move-result v2

    .line 298
    invoke-interface {p2}, Ljava/util/Collection;->size()I

    move-result v3

    .line 300
    invoke-virtual {p0}, Lnicoid/network238/kotlin/collections/AbstractMutableList;->size()I

    move-result v4

    const/4 v5, 0x1

    add-int/2addr v4, v5

    shr-int/2addr v4, v5

    if-ge p1, v4, :cond_6

    .line 303
    iget p1, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->head:I

    sub-int v0, p1, v3

    if-lt v2, p1, :cond_4

    .line 309
    iget-object v4, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->elementData:[Ljava/lang/Object;

    if-ltz v0, :cond_2

    .line 307
    invoke-static {v4, v4, v0, p1, v2}, Lnicoid/network238/kotlin/collections/ArraysKt___ArraysJvmKt;->copyInto([Ljava/lang/Object;[Ljava/lang/Object;III)[Ljava/lang/Object;

    goto :goto_0

    .line 309
    :cond_2
    array-length v6, v4

    add-int/2addr v0, v6

    sub-int v6, v2, p1

    .line 311
    array-length v7, v4

    sub-int/2addr v7, v0

    if-lt v7, v6, :cond_3

    .line 314
    invoke-static {v4, v4, v0, p1, v2}, Lnicoid/network238/kotlin/collections/ArraysKt___ArraysJvmKt;->copyInto([Ljava/lang/Object;[Ljava/lang/Object;III)[Ljava/lang/Object;

    goto :goto_0

    :cond_3
    add-int v6, p1, v7

    .line 316
    invoke-static {v4, v4, v0, p1, v6}, Lnicoid/network238/kotlin/collections/ArraysKt___ArraysJvmKt;->copyInto([Ljava/lang/Object;[Ljava/lang/Object;III)[Ljava/lang/Object;

    .line 317
    iget-object p1, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->elementData:[Ljava/lang/Object;

    iget v4, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->head:I

    add-int/2addr v4, v7

    invoke-static {p1, p1, v1, v4, v2}, Lnicoid/network238/kotlin/collections/ArraysKt___ArraysJvmKt;->copyInto([Ljava/lang/Object;[Ljava/lang/Object;III)[Ljava/lang/Object;

    goto :goto_0

    .line 321
    :cond_4
    iget-object v4, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->elementData:[Ljava/lang/Object;

    array-length v6, v4

    invoke-static {v4, v4, v0, p1, v6}, Lnicoid/network238/kotlin/collections/ArraysKt___ArraysJvmKt;->copyInto([Ljava/lang/Object;[Ljava/lang/Object;III)[Ljava/lang/Object;

    .line 325
    iget-object p1, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->elementData:[Ljava/lang/Object;

    if-lt v3, v2, :cond_5

    .line 323
    array-length v4, p1

    sub-int/2addr v4, v3

    invoke-static {p1, p1, v4, v1, v2}, Lnicoid/network238/kotlin/collections/ArraysKt___ArraysJvmKt;->copyInto([Ljava/lang/Object;[Ljava/lang/Object;III)[Ljava/lang/Object;

    goto :goto_0

    .line 325
    :cond_5
    array-length v4, p1

    sub-int/2addr v4, v3

    invoke-static {p1, p1, v4, v1, v3}, Lnicoid/network238/kotlin/collections/ArraysKt___ArraysJvmKt;->copyInto([Ljava/lang/Object;[Ljava/lang/Object;III)[Ljava/lang/Object;

    .line 326
    iget-object p1, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->elementData:[Ljava/lang/Object;

    invoke-static {p1, p1, v1, v3, v2}, Lnicoid/network238/kotlin/collections/ArraysKt___ArraysJvmKt;->copyInto([Ljava/lang/Object;[Ljava/lang/Object;III)[Ljava/lang/Object;

    .line 329
    :goto_0
    iput v0, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->head:I

    sub-int/2addr v2, v3

    .line 330
    invoke-direct {p0, v2}, Lnicoid/network238/kotlin/collections/ArrayDeque;->negativeMod(I)I

    move-result p1

    invoke-direct {p0, p1, p2}, Lnicoid/network238/kotlin/collections/ArrayDeque;->copyCollectionElements(ILjava/util/Collection;)V

    goto :goto_2

    :cond_6
    add-int p1, v2, v3

    .line 349
    iget-object v4, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->elementData:[Ljava/lang/Object;

    if-ge v2, v0, :cond_9

    add-int/2addr v3, v0

    .line 337
    array-length v6, v4

    if-gt v3, v6, :cond_7

    .line 338
    invoke-static {v4, v4, p1, v2, v0}, Lnicoid/network238/kotlin/collections/ArraysKt___ArraysJvmKt;->copyInto([Ljava/lang/Object;[Ljava/lang/Object;III)[Ljava/lang/Object;

    goto :goto_1

    .line 340
    :cond_7
    array-length v6, v4

    if-lt p1, v6, :cond_8

    .line 341
    array-length v1, v4

    sub-int/2addr p1, v1

    invoke-static {v4, v4, p1, v2, v0}, Lnicoid/network238/kotlin/collections/ArraysKt___ArraysJvmKt;->copyInto([Ljava/lang/Object;[Ljava/lang/Object;III)[Ljava/lang/Object;

    goto :goto_1

    .line 343
    :cond_8
    array-length v6, v4

    sub-int/2addr v3, v6

    sub-int v3, v0, v3

    .line 344
    invoke-static {v4, v4, v1, v3, v0}, Lnicoid/network238/kotlin/collections/ArraysKt___ArraysJvmKt;->copyInto([Ljava/lang/Object;[Ljava/lang/Object;III)[Ljava/lang/Object;

    .line 345
    iget-object v0, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->elementData:[Ljava/lang/Object;

    invoke-static {v0, v0, p1, v2, v3}, Lnicoid/network238/kotlin/collections/ArraysKt___ArraysJvmKt;->copyInto([Ljava/lang/Object;[Ljava/lang/Object;III)[Ljava/lang/Object;

    goto :goto_1

    :cond_9
    nop

    .line 349
    invoke-static {v4, v4, v3, v1, v0}, Lnicoid/network238/kotlin/collections/ArraysKt___ArraysJvmKt;->copyInto([Ljava/lang/Object;[Ljava/lang/Object;III)[Ljava/lang/Object;

    .line 350
    iget-object v0, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->elementData:[Ljava/lang/Object;

    array-length v4, v0

    if-lt p1, v4, :cond_a

    .line 351
    array-length v1, v0

    sub-int/2addr p1, v1

    array-length v1, v0

    invoke-static {v0, v0, p1, v2, v1}, Lnicoid/network238/kotlin/collections/ArraysKt___ArraysJvmKt;->copyInto([Ljava/lang/Object;[Ljava/lang/Object;III)[Ljava/lang/Object;

    goto :goto_1

    .line 353
    :cond_a
    array-length v4, v0

    sub-int/2addr v4, v3

    array-length v6, v0

    invoke-static {v0, v0, v1, v4, v6}, Lnicoid/network238/kotlin/collections/ArraysKt___ArraysJvmKt;->copyInto([Ljava/lang/Object;[Ljava/lang/Object;III)[Ljava/lang/Object;

    .line 354
    iget-object v0, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->elementData:[Ljava/lang/Object;

    array-length v1, v0

    sub-int/2addr v1, v3

    invoke-static {v0, v0, p1, v2, v1}, Lnicoid/network238/kotlin/collections/ArraysKt___ArraysJvmKt;->copyInto([Ljava/lang/Object;[Ljava/lang/Object;III)[Ljava/lang/Object;

    .line 357
    :goto_1
    invoke-direct {p0, v2, p2}, Lnicoid/network238/kotlin/collections/ArrayDeque;->copyCollectionElements(ILjava/util/Collection;)V

    :goto_2
    return v5
.end method

.method public addAll(Ljava/util/Collection;)Z
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 276
    invoke-interface {p1}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p1, 0x0

    return p1

    .line 278
    :cond_0
    invoke-direct {p0}, Lnicoid/network238/kotlin/collections/ArrayDeque;->registerModification()V

    .line 279
    invoke-virtual {p0}, Lnicoid/network238/kotlin/collections/AbstractMutableList;->size()I

    move-result v0

    invoke-interface {p1}, Ljava/util/Collection;->size()I

    move-result v1

    add-int/2addr v0, v1

    invoke-direct {p0, v0}, Lnicoid/network238/kotlin/collections/ArrayDeque;->ensureCapacity(I)V

    .line 280
    iget v0, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->head:I

    invoke-virtual {p0}, Lnicoid/network238/kotlin/collections/AbstractMutableList;->size()I

    move-result v1

    add-int/2addr v0, v1

    invoke-direct {p0, v0}, Lnicoid/network238/kotlin/collections/ArrayDeque;->positiveMod(I)I

    move-result v0

    invoke-direct {p0, v0, p1}, Lnicoid/network238/kotlin/collections/ArrayDeque;->copyCollectionElements(ILjava/util/Collection;)V

    const/4 p1, 0x1

    return p1
.end method

.method public final addFirst(Ljava/lang/Object;)V
    .registers 4

    .line 123
    invoke-direct {p0}, Lnicoid/network238/kotlin/collections/ArrayDeque;->registerModification()V

    .line 124
    invoke-virtual {p0}, Lnicoid/network238/kotlin/collections/AbstractMutableList;->size()I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    invoke-direct {p0, v0}, Lnicoid/network238/kotlin/collections/ArrayDeque;->ensureCapacity(I)V

    .line 126
    iget v0, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->head:I

    invoke-direct {p0, v0}, Lnicoid/network238/kotlin/collections/ArrayDeque;->decremented(I)I

    move-result v0

    iput v0, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->head:I

    .line 127
    iget-object v1, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->elementData:[Ljava/lang/Object;

    aput-object p1, v1, v0

    .line 128
    invoke-virtual {p0}, Lnicoid/network238/kotlin/collections/AbstractMutableList;->size()I

    move-result p1

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->size:I

    return-void
.end method

.method public final addLast(Ljava/lang/Object;)V
    .registers 5

    .line 135
    invoke-direct {p0}, Lnicoid/network238/kotlin/collections/ArrayDeque;->registerModification()V

    .line 136
    invoke-virtual {p0}, Lnicoid/network238/kotlin/collections/AbstractMutableList;->size()I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    invoke-direct {p0, v0}, Lnicoid/network238/kotlin/collections/ArrayDeque;->ensureCapacity(I)V

    .line 138
    iget-object v0, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->elementData:[Ljava/lang/Object;

    iget v1, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->head:I

    invoke-virtual {p0}, Lnicoid/network238/kotlin/collections/AbstractMutableList;->size()I

    move-result v2

    add-int/2addr v1, v2

    invoke-direct {p0, v1}, Lnicoid/network238/kotlin/collections/ArrayDeque;->positiveMod(I)I

    move-result v1

    aput-object p1, v0, v1

    .line 139
    invoke-virtual {p0}, Lnicoid/network238/kotlin/collections/AbstractMutableList;->size()I

    move-result p1

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->size:I

    return-void
.end method

.method public clear()V
    .registers 3

    .line 532
    invoke-interface {p0}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 533
    invoke-direct {p0}, Lnicoid/network238/kotlin/collections/ArrayDeque;->registerModification()V

    .line 535
    iget v0, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->head:I

    invoke-virtual {p0}, Lnicoid/network238/kotlin/collections/AbstractMutableList;->size()I

    move-result v1

    add-int/2addr v0, v1

    invoke-direct {p0, v0}, Lnicoid/network238/kotlin/collections/ArrayDeque;->positiveMod(I)I

    move-result v0

    .line 536
    iget v1, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->head:I

    invoke-direct {p0, v1, v0}, Lnicoid/network238/kotlin/collections/ArrayDeque;->nullifyNonEmpty(II)V

    :cond_0
    nop

    .line 538
    const/4 v0, 0x0

    iput v0, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->head:I

    .line 539
    iput v0, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->size:I

    return-void
.end method

.method public contains(Ljava/lang/Object;)Z
    .registers 3

    .line 379
    invoke-virtual {p0, p1}, Lnicoid/network238/kotlin/collections/ArrayDeque;->indexOf(Ljava/lang/Object;)I

    move-result p1

    const/4 v0, -0x1

    if-eq p1, v0, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public get(I)Ljava/lang/Object;
    .registers 4

    .line 364
    sget-object v0, Lnicoid/network238/kotlin/collections/AbstractList;->Companion:Lnicoid/network238/kotlin/collections/AbstractList$Companion;

    invoke-virtual {p0}, Lnicoid/network238/kotlin/collections/AbstractMutableList;->size()I

    move-result v1

    invoke-virtual {v0, p1, v1}, Lnicoid/network238/kotlin/collections/AbstractList$Companion;->checkElementIndex$kotlin_stdlib(II)V

    .line 366
    iget-object v0, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->elementData:[Ljava/lang/Object;

    iget v1, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->head:I

    add-int/2addr v1, p1

    invoke-direct {p0, v1}, Lnicoid/network238/kotlin/collections/ArrayDeque;->positiveMod(I)I

    move-result p1

    aget-object p1, v0, p1

    return-object p1
.end method

.method public getSize()I
    .registers 2

    .line 21
    iget v0, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->size:I

    return v0
.end method

.method public indexOf(Ljava/lang/Object;)I
    .registers 6

    .line 382
    iget v0, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->head:I

    invoke-virtual {p0}, Lnicoid/network238/kotlin/collections/AbstractMutableList;->size()I

    move-result v1

    add-int/2addr v0, v1

    invoke-direct {p0, v0}, Lnicoid/network238/kotlin/collections/ArrayDeque;->positiveMod(I)I

    move-result v0

    .line 384
    iget v1, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->head:I

    if-ge v1, v0, :cond_1

    :goto_0
    if-ge v1, v0, :cond_5

    .line 386
    iget-object v2, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->elementData:[Ljava/lang/Object;

    aget-object v2, v2, v1

    invoke-static {p1, v2}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    iget p1, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->head:I

    sub-int/2addr v1, p1

    return v1

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    if-lt v1, v0, :cond_5

    .line 389
    iget-object v2, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->elementData:[Ljava/lang/Object;

    array-length v2, v2

    :goto_1
    if-ge v1, v2, :cond_3

    .line 390
    iget-object v3, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->elementData:[Ljava/lang/Object;

    aget-object v3, v3, v1

    invoke-static {p1, v3}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    iget p1, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->head:I

    sub-int/2addr v1, p1

    return v1

    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_3
    const/4 v1, 0x0

    :goto_2
    if-ge v1, v0, :cond_5

    .line 393
    iget-object v2, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->elementData:[Ljava/lang/Object;

    aget-object v2, v2, v1

    invoke-static {p1, v2}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    iget-object p1, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->elementData:[Ljava/lang/Object;

    array-length p1, p1

    add-int/2addr v1, p1

    iget p1, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->head:I

    sub-int/2addr v1, p1

    return v1

    :cond_4
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    :cond_5
    const/4 p1, -0x1

    return p1
.end method

.method public isEmpty()Z
    .registers 2

    .line 97
    invoke-virtual {p0}, Lnicoid/network238/kotlin/collections/AbstractMutableList;->size()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public lastIndexOf(Ljava/lang/Object;)I
    .registers 6

    .line 401
    iget v0, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->head:I

    invoke-virtual {p0}, Lnicoid/network238/kotlin/collections/AbstractMutableList;->size()I

    move-result v1

    add-int/2addr v0, v1

    invoke-direct {p0, v0}, Lnicoid/network238/kotlin/collections/ArrayDeque;->positiveMod(I)I

    move-result v0

    .line 403
    iget v1, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->head:I

    const/4 v2, -0x1

    if-ge v1, v0, :cond_1

    add-int/lit8 v0, v0, -0x1

    if-gt v1, v0, :cond_5

    .line 405
    :goto_0
    iget-object v3, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->elementData:[Ljava/lang/Object;

    aget-object v3, v3, v0

    invoke-static {p1, v3}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    iget p1, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->head:I

    sub-int/2addr v0, p1

    return v0

    :cond_0
    if-eq v0, v1, :cond_5

    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    :cond_1
    if-le v1, v0, :cond_5

    add-int/lit8 v0, v0, -0x1

    .line 411
    :goto_1
    iget-object v1, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->elementData:[Ljava/lang/Object;

    if-ge v2, v0, :cond_3

    .line 409
    aget-object v1, v1, v0

    invoke-static {p1, v1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object p1, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->elementData:[Ljava/lang/Object;

    array-length p1, p1

    add-int/2addr v0, p1

    iget p1, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->head:I

    sub-int/2addr v0, p1

    return v0

    :cond_2
    add-int/lit8 v0, v0, -0x1

    goto :goto_1

    .line 411
    :cond_3
    invoke-static {v1}, Lnicoid/network238/kotlin/collections/ArraysKt___ArraysKt;->getLastIndex([Ljava/lang/Object;)I

    move-result v0

    iget v1, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->head:I

    if-gt v1, v0, :cond_5

    .line 412
    :goto_2
    iget-object v3, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->elementData:[Ljava/lang/Object;

    aget-object v3, v3, v0

    invoke-static {p1, v3}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    iget p1, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->head:I

    sub-int/2addr v0, p1

    return v0

    :cond_4
    if-eq v0, v1, :cond_5

    add-int/lit8 v0, v0, -0x1

    goto :goto_2

    :cond_5
    return v2
.end method

.method public remove(Ljava/lang/Object;)Z
    .registers 3

    .line 420
    invoke-virtual {p0, p1}, Lnicoid/network238/kotlin/collections/ArrayDeque;->indexOf(Ljava/lang/Object;)I

    move-result p1

    const/4 v0, -0x1

    if-ne p1, v0, :cond_0

    const/4 p1, 0x0

    return p1

    .line 422
    :cond_0
    invoke-virtual {p0, p1}, Lnicoid/network238/kotlin/collections/AbstractMutableList;->remove(I)Ljava/lang/Object;

    const/4 p1, 0x1

    return p1
.end method

.method public removeAll(Ljava/util/Collection;)Z
    .registers 13

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 665
    invoke-virtual {p0}, Lnicoid/network238/kotlin/collections/ArrayDeque;->isEmpty()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_7

    iget-object v0, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->elementData:[Ljava/lang/Object;

    array-length v0, v0

    if-eqz v0, :cond_7

    .line 668
    iget v0, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->head:I

    invoke-virtual {p0}, Lnicoid/network238/kotlin/collections/AbstractMutableList;->size()I

    move-result v2

    add-int/2addr v0, v2

    invoke-direct {p0, v0}, Lnicoid/network238/kotlin/collections/ArrayDeque;->positiveMod(I)I

    move-result v0

    .line 669
    iget v2, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->head:I

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-ge v2, v0, :cond_2

    move v5, v2

    .line 683
    :goto_0
    iget-object v6, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->elementData:[Ljava/lang/Object;

    if-ge v2, v0, :cond_1

    .line 674
    aget-object v6, v6, v2

    .line 471
    invoke-interface {p1, v6}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_0

    .line 678
    iget-object v7, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->elementData:[Ljava/lang/Object;

    add-int/lit8 v8, v5, 0x1

    aput-object v6, v7, v5

    move v5, v8

    goto :goto_1

    :cond_0
    move v1, v4

    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    nop

    .line 683
    invoke-static {v6, v3, v5, v0}, Lnicoid/network238/kotlin/collections/ArraysKt___ArraysJvmKt;->fill([Ljava/lang/Object;Ljava/lang/Object;II)V

    goto :goto_6

    .line 686
    :cond_2
    iget-object v5, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->elementData:[Ljava/lang/Object;

    array-length v5, v5

    move v7, v1

    move v6, v2

    :goto_2
    if-ge v2, v5, :cond_4

    .line 687
    iget-object v8, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->elementData:[Ljava/lang/Object;

    aget-object v9, v8, v2

    .line 688
    aput-object v3, v8, v2

    .line 471
    invoke-interface {p1, v9}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_3

    .line 692
    iget-object v8, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->elementData:[Ljava/lang/Object;

    add-int/lit8 v10, v6, 0x1

    aput-object v9, v8, v6

    move v6, v10

    goto :goto_3

    :cond_3
    move v7, v4

    :goto_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 697
    :cond_4
    invoke-direct {p0, v6}, Lnicoid/network238/kotlin/collections/ArrayDeque;->positiveMod(I)I

    move-result v2

    move v5, v2

    :goto_4
    if-ge v1, v0, :cond_6

    .line 700
    iget-object v2, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->elementData:[Ljava/lang/Object;

    aget-object v6, v2, v1

    .line 701
    aput-object v3, v2, v1

    .line 471
    invoke-interface {p1, v6}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_5

    .line 705
    iget-object v2, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->elementData:[Ljava/lang/Object;

    aput-object v6, v2, v5

    .line 706
    invoke-direct {p0, v5}, Lnicoid/network238/kotlin/collections/ArrayDeque;->incremented(I)I

    move-result v5

    goto :goto_5

    :cond_5
    move v7, v4

    :goto_5
    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    :cond_6
    move v1, v7

    :goto_6
    if-eqz v1, :cond_7

    .line 713
    invoke-direct {p0}, Lnicoid/network238/kotlin/collections/ArrayDeque;->registerModification()V

    .line 714
    iget p1, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->head:I

    sub-int/2addr v5, p1

    invoke-direct {p0, v5}, Lnicoid/network238/kotlin/collections/ArrayDeque;->negativeMod(I)I

    move-result p1

    iput p1, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->size:I

    :cond_7
    return v1
.end method

.method public removeAt(I)Ljava/lang/Object;
    .registers 10

    .line 427
    sget-object v0, Lnicoid/network238/kotlin/collections/AbstractList;->Companion:Lnicoid/network238/kotlin/collections/AbstractList$Companion;

    invoke-virtual {p0}, Lnicoid/network238/kotlin/collections/AbstractMutableList;->size()I

    move-result v1

    invoke-virtual {v0, p1, v1}, Lnicoid/network238/kotlin/collections/AbstractList$Companion;->checkElementIndex$kotlin_stdlib(II)V

    .line 429
    invoke-static {p0}, Lnicoid/network238/kotlin/collections/CollectionsKt__CollectionsKt;->getLastIndex(Ljava/util/List;)I

    move-result v0

    if-ne p1, v0, :cond_0

    .line 430
    invoke-virtual {p0}, Lnicoid/network238/kotlin/collections/ArrayDeque;->removeLast()Ljava/lang/Object;

    move-result-object p1

    return-object p1

    :cond_0
    if-nez p1, :cond_1

    .line 432
    invoke-virtual {p0}, Lnicoid/network238/kotlin/collections/ArrayDeque;->removeFirst()Ljava/lang/Object;

    move-result-object p1

    return-object p1

    .line 435
    :cond_1
    invoke-direct {p0}, Lnicoid/network238/kotlin/collections/ArrayDeque;->registerModification()V

    .line 437
    iget v0, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->head:I

    add-int/2addr v0, p1

    invoke-direct {p0, v0}, Lnicoid/network238/kotlin/collections/ArrayDeque;->positiveMod(I)I

    move-result v0

    .line 438
    iget-object v1, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->elementData:[Ljava/lang/Object;

    aget-object v1, v1, v0

    .line 440
    invoke-virtual {p0}, Lnicoid/network238/kotlin/collections/AbstractMutableList;->size()I

    move-result v2

    const/4 v3, 0x1

    shr-int/2addr v2, v3

    .line 454
    iget v4, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->head:I

    const/4 v5, 0x0

    const/4 v6, 0x0

    if-ge p1, v2, :cond_3

    .line 445
    iget-object p1, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->elementData:[Ljava/lang/Object;

    if-lt v0, v4, :cond_2

    add-int/lit8 v2, v4, 0x1

    .line 443
    invoke-static {p1, p1, v2, v4, v0}, Lnicoid/network238/kotlin/collections/ArraysKt___ArraysJvmKt;->copyInto([Ljava/lang/Object;[Ljava/lang/Object;III)[Ljava/lang/Object;

    goto :goto_0

    :cond_2
    nop

    .line 445
    invoke-static {p1, p1, v3, v6, v0}, Lnicoid/network238/kotlin/collections/ArraysKt___ArraysJvmKt;->copyInto([Ljava/lang/Object;[Ljava/lang/Object;III)[Ljava/lang/Object;

    .line 446
    iget-object p1, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->elementData:[Ljava/lang/Object;

    array-length v0, p1

    sub-int/2addr v0, v3

    aget-object v0, p1, v0

    aput-object v0, p1, v6

    .line 447
    iget v0, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->head:I

    add-int/lit8 v2, v0, 0x1

    array-length v4, p1

    sub-int/2addr v4, v3

    invoke-static {p1, p1, v2, v0, v4}, Lnicoid/network238/kotlin/collections/ArraysKt___ArraysJvmKt;->copyInto([Ljava/lang/Object;[Ljava/lang/Object;III)[Ljava/lang/Object;

    .line 450
    :goto_0
    iget-object p1, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->elementData:[Ljava/lang/Object;

    iget v0, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->head:I

    aput-object v5, p1, v0

    .line 451
    invoke-direct {p0, v0}, Lnicoid/network238/kotlin/collections/ArrayDeque;->incremented(I)I

    move-result p1

    iput p1, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->head:I

    goto :goto_2

    .line 454
    :cond_3
    invoke-static {p0}, Lnicoid/network238/kotlin/collections/CollectionsKt__CollectionsKt;->getLastIndex(Ljava/util/List;)I

    move-result p1

    add-int/2addr v4, p1

    invoke-direct {p0, v4}, Lnicoid/network238/kotlin/collections/ArrayDeque;->positiveMod(I)I

    move-result p1

    .line 459
    iget-object v2, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->elementData:[Ljava/lang/Object;

    if-gt v0, p1, :cond_4

    add-int/lit8 v4, v0, 0x1

    add-int/lit8 v6, p1, 0x1

    .line 457
    invoke-static {v2, v2, v0, v4, v6}, Lnicoid/network238/kotlin/collections/ArraysKt___ArraysJvmKt;->copyInto([Ljava/lang/Object;[Ljava/lang/Object;III)[Ljava/lang/Object;

    goto :goto_1

    :cond_4
    add-int/lit8 v4, v0, 0x1

    .line 459
    array-length v7, v2

    invoke-static {v2, v2, v0, v4, v7}, Lnicoid/network238/kotlin/collections/ArraysKt___ArraysJvmKt;->copyInto([Ljava/lang/Object;[Ljava/lang/Object;III)[Ljava/lang/Object;

    .line 460
    iget-object v0, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->elementData:[Ljava/lang/Object;

    array-length v2, v0

    sub-int/2addr v2, v3

    aget-object v4, v0, v6

    aput-object v4, v0, v2

    add-int/lit8 v2, p1, 0x1

    .line 461
    invoke-static {v0, v0, v6, v3, v2}, Lnicoid/network238/kotlin/collections/ArraysKt___ArraysJvmKt;->copyInto([Ljava/lang/Object;[Ljava/lang/Object;III)[Ljava/lang/Object;

    .line 464
    :goto_1
    iget-object v0, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->elementData:[Ljava/lang/Object;

    aput-object v5, v0, p1

    .line 466
    :goto_2
    invoke-virtual {p0}, Lnicoid/network238/kotlin/collections/AbstractMutableList;->size()I

    move-result p1

    sub-int/2addr p1, v3

    iput p1, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->size:I

    return-object v1
.end method

.method public final removeFirst()Ljava/lang/Object;
    .registers 5

    .line 146
    invoke-virtual {p0}, Lnicoid/network238/kotlin/collections/ArrayDeque;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 147
    invoke-direct {p0}, Lnicoid/network238/kotlin/collections/ArrayDeque;->registerModification()V

    .line 149
    iget-object v0, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->elementData:[Ljava/lang/Object;

    iget v1, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->head:I

    aget-object v2, v0, v1

    .line 150
    const/4 v3, 0x0

    aput-object v3, v0, v1

    .line 151
    invoke-direct {p0, v1}, Lnicoid/network238/kotlin/collections/ArrayDeque;->incremented(I)I

    move-result v0

    iput v0, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->head:I

    .line 152
    invoke-virtual {p0}, Lnicoid/network238/kotlin/collections/AbstractMutableList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->size:I

    return-object v2

    .line 146
    :cond_0
    new-instance v0, Ljava/util/NoSuchElementException;

    const-string v1, "ArrayDeque is empty."

    invoke-direct {v0, v1}, Ljava/util/NoSuchElementException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final removeLast()Ljava/lang/Object;
    .registers 5

    .line 165
    invoke-virtual {p0}, Lnicoid/network238/kotlin/collections/ArrayDeque;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 166
    invoke-direct {p0}, Lnicoid/network238/kotlin/collections/ArrayDeque;->registerModification()V

    .line 168
    iget v0, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->head:I

    invoke-static {p0}, Lnicoid/network238/kotlin/collections/CollectionsKt__CollectionsKt;->getLastIndex(Ljava/util/List;)I

    move-result v1

    add-int/2addr v0, v1

    invoke-direct {p0, v0}, Lnicoid/network238/kotlin/collections/ArrayDeque;->positiveMod(I)I

    move-result v0

    .line 169
    iget-object v1, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->elementData:[Ljava/lang/Object;

    aget-object v2, v1, v0

    .line 170
    const/4 v3, 0x0

    aput-object v3, v1, v0

    .line 171
    invoke-virtual {p0}, Lnicoid/network238/kotlin/collections/AbstractMutableList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->size:I

    return-object v2

    .line 165
    :cond_0
    new-instance v0, Ljava/util/NoSuchElementException;

    const-string v1, "ArrayDeque is empty."

    invoke-direct {v0, v1}, Ljava/util/NoSuchElementException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected removeRange(II)V
    .registers 5

    .line 565
    sget-object v0, Lnicoid/network238/kotlin/collections/AbstractList;->Companion:Lnicoid/network238/kotlin/collections/AbstractList$Companion;

    invoke-virtual {p0}, Lnicoid/network238/kotlin/collections/AbstractMutableList;->size()I

    move-result v1

    invoke-virtual {v0, p1, p2, v1}, Lnicoid/network238/kotlin/collections/AbstractList$Companion;->checkRangeIndexes$kotlin_stdlib(III)V

    sub-int v0, p2, p1

    if-nez v0, :cond_0

    return-void

    .line 570
    :cond_0
    invoke-virtual {p0}, Lnicoid/network238/kotlin/collections/AbstractMutableList;->size()I

    move-result v1

    if-ne v0, v1, :cond_1

    .line 571
    invoke-virtual {p0}, Lnicoid/network238/kotlin/collections/ArrayDeque;->clear()V

    return-void

    :cond_1
    const/4 v1, 0x1

    if-ne v0, v1, :cond_2

    .line 575
    invoke-virtual {p0, p1}, Lnicoid/network238/kotlin/collections/AbstractMutableList;->remove(I)Ljava/lang/Object;

    return-void

    .line 580
    :cond_2
    invoke-direct {p0}, Lnicoid/network238/kotlin/collections/ArrayDeque;->registerModification()V

    .line 582
    invoke-virtual {p0}, Lnicoid/network238/kotlin/collections/AbstractMutableList;->size()I

    move-result v1

    sub-int/2addr v1, p2

    if-ge p1, v1, :cond_3

    .line 584
    invoke-direct {p0, p1, p2}, Lnicoid/network238/kotlin/collections/ArrayDeque;->removeRangeShiftPreceding(II)V

    .line 586
    iget p1, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->head:I

    add-int/2addr p1, v0

    invoke-direct {p0, p1}, Lnicoid/network238/kotlin/collections/ArrayDeque;->positiveMod(I)I

    move-result p1

    .line 587
    iget p2, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->head:I

    invoke-direct {p0, p2, p1}, Lnicoid/network238/kotlin/collections/ArrayDeque;->nullifyNonEmpty(II)V

    .line 588
    iput p1, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->head:I

    goto :goto_0

    .line 591
    :cond_3
    invoke-direct {p0, p1, p2}, Lnicoid/network238/kotlin/collections/ArrayDeque;->removeRangeShiftSucceeding(II)V

    .line 593
    iget p1, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->head:I

    invoke-virtual {p0}, Lnicoid/network238/kotlin/collections/AbstractMutableList;->size()I

    move-result p2

    add-int/2addr p1, p2

    invoke-direct {p0, p1}, Lnicoid/network238/kotlin/collections/ArrayDeque;->positiveMod(I)I

    move-result p1

    sub-int p2, p1, v0

    .line 594
    invoke-direct {p0, p2}, Lnicoid/network238/kotlin/collections/ArrayDeque;->negativeMod(I)I

    move-result p2

    invoke-direct {p0, p2, p1}, Lnicoid/network238/kotlin/collections/ArrayDeque;->nullifyNonEmpty(II)V

    .line 597
    :goto_0
    invoke-virtual {p0}, Lnicoid/network238/kotlin/collections/AbstractMutableList;->size()I

    move-result p1

    sub-int/2addr p1, v0

    iput p1, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->size:I

    return-void
.end method

.method public retainAll(Ljava/util/Collection;)Z
    .registers 13

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 718
    invoke-virtual {p0}, Lnicoid/network238/kotlin/collections/ArrayDeque;->isEmpty()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_7

    iget-object v0, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->elementData:[Ljava/lang/Object;

    array-length v0, v0

    if-eqz v0, :cond_7

    .line 721
    iget v0, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->head:I

    invoke-virtual {p0}, Lnicoid/network238/kotlin/collections/AbstractMutableList;->size()I

    move-result v2

    add-int/2addr v0, v2

    invoke-direct {p0, v0}, Lnicoid/network238/kotlin/collections/ArrayDeque;->positiveMod(I)I

    move-result v0

    .line 722
    iget v2, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->head:I

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-ge v2, v0, :cond_2

    move v5, v2

    .line 736
    :goto_0
    iget-object v6, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->elementData:[Ljava/lang/Object;

    if-ge v2, v0, :cond_1

    .line 727
    aget-object v6, v6, v2

    .line 473
    invoke-interface {p1, v6}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 731
    iget-object v7, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->elementData:[Ljava/lang/Object;

    add-int/lit8 v8, v5, 0x1

    aput-object v6, v7, v5

    move v5, v8

    goto :goto_1

    :cond_0
    move v1, v4

    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    nop

    .line 736
    invoke-static {v6, v3, v5, v0}, Lnicoid/network238/kotlin/collections/ArraysKt___ArraysJvmKt;->fill([Ljava/lang/Object;Ljava/lang/Object;II)V

    goto :goto_6

    .line 739
    :cond_2
    iget-object v5, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->elementData:[Ljava/lang/Object;

    array-length v5, v5

    move v7, v1

    move v6, v2

    :goto_2
    if-ge v2, v5, :cond_4

    .line 740
    iget-object v8, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->elementData:[Ljava/lang/Object;

    aget-object v9, v8, v2

    .line 741
    aput-object v3, v8, v2

    .line 473
    invoke-interface {p1, v9}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 745
    iget-object v8, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->elementData:[Ljava/lang/Object;

    add-int/lit8 v10, v6, 0x1

    aput-object v9, v8, v6

    move v6, v10

    goto :goto_3

    :cond_3
    move v7, v4

    :goto_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 750
    :cond_4
    invoke-direct {p0, v6}, Lnicoid/network238/kotlin/collections/ArrayDeque;->positiveMod(I)I

    move-result v2

    move v5, v2

    :goto_4
    if-ge v1, v0, :cond_6

    .line 753
    iget-object v2, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->elementData:[Ljava/lang/Object;

    aget-object v6, v2, v1

    .line 754
    aput-object v3, v2, v1

    .line 473
    invoke-interface {p1, v6}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 758
    iget-object v2, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->elementData:[Ljava/lang/Object;

    aput-object v6, v2, v5

    .line 759
    invoke-direct {p0, v5}, Lnicoid/network238/kotlin/collections/ArrayDeque;->incremented(I)I

    move-result v5

    goto :goto_5

    :cond_5
    move v7, v4

    :goto_5
    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    :cond_6
    move v1, v7

    :goto_6
    if-eqz v1, :cond_7

    .line 766
    invoke-direct {p0}, Lnicoid/network238/kotlin/collections/ArrayDeque;->registerModification()V

    .line 767
    iget p1, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->head:I

    sub-int/2addr v5, p1

    invoke-direct {p0, v5}, Lnicoid/network238/kotlin/collections/ArrayDeque;->negativeMod(I)I

    move-result p1

    iput p1, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->size:I

    :cond_7
    return v1
.end method

.method public set(ILjava/lang/Object;)Ljava/lang/Object;
    .registers 5

    .line 370
    sget-object v0, Lnicoid/network238/kotlin/collections/AbstractList;->Companion:Lnicoid/network238/kotlin/collections/AbstractList$Companion;

    invoke-virtual {p0}, Lnicoid/network238/kotlin/collections/AbstractMutableList;->size()I

    move-result v1

    invoke-virtual {v0, p1, v1}, Lnicoid/network238/kotlin/collections/AbstractList$Companion;->checkElementIndex$kotlin_stdlib(II)V

    .line 372
    iget v0, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->head:I

    add-int/2addr v0, p1

    invoke-direct {p0, v0}, Lnicoid/network238/kotlin/collections/ArrayDeque;->positiveMod(I)I

    move-result p1

    .line 373
    iget-object v0, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->elementData:[Ljava/lang/Object;

    aget-object v1, v0, p1

    .line 374
    aput-object p2, v0, p1

    return-object v1
.end method

.method public toArray()[Ljava/lang/Object;
    .registers 2

    .line 561
    invoke-virtual {p0}, Lnicoid/network238/kotlin/collections/AbstractMutableList;->size()I

    move-result v0

    new-array v0, v0, [Ljava/lang/Object;

    invoke-virtual {p0, v0}, Lnicoid/network238/kotlin/collections/ArrayDeque;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public toArray([Ljava/lang/Object;)[Ljava/lang/Object;
    .registers 9

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 545
    array-length v0, p1

    invoke-virtual {p0}, Lnicoid/network238/kotlin/collections/AbstractMutableList;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    invoke-virtual {p0}, Lnicoid/network238/kotlin/collections/AbstractMutableList;->size()I

    move-result v0

    invoke-static {p1, v0}, Lnicoid/network238/kotlin/collections/ArraysKt__ArraysJVMKt;->arrayOfNulls([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object p1

    :cond_0
    move-object v1, p1

    .line 547
    iget p1, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->head:I

    invoke-virtual {p0}, Lnicoid/network238/kotlin/collections/AbstractMutableList;->size()I

    move-result v0

    add-int/2addr p1, v0

    invoke-direct {p0, p1}, Lnicoid/network238/kotlin/collections/ArrayDeque;->positiveMod(I)I

    move-result v4

    .line 548
    iget v3, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->head:I

    if-ge v3, v4, :cond_1

    .line 549
    iget-object v0, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->elementData:[Ljava/lang/Object;

    const/4 v5, 0x2

    const/4 v6, 0x0

    const/4 v2, 0x0

    invoke-static/range {v0 .. v6}, Lnicoid/network238/kotlin/collections/ArraysKt___ArraysJvmKt;->copyInto$default([Ljava/lang/Object;[Ljava/lang/Object;IIIILjava/lang/Object;)[Ljava/lang/Object;

    goto :goto_0

    .line 550
    :cond_1
    invoke-interface {p0}, Ljava/util/Collection;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_2

    .line 551
    iget-object p1, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->elementData:[Ljava/lang/Object;

    iget v0, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->head:I

    array-length v2, p1

    const/4 v3, 0x0

    invoke-static {p1, v1, v3, v0, v2}, Lnicoid/network238/kotlin/collections/ArraysKt___ArraysJvmKt;->copyInto([Ljava/lang/Object;[Ljava/lang/Object;III)[Ljava/lang/Object;

    .line 552
    iget-object p1, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->elementData:[Ljava/lang/Object;

    array-length v0, p1

    iget v2, p0, Lnicoid/network238/kotlin/collections/ArrayDeque;->head:I

    sub-int/2addr v0, v2

    invoke-static {p1, v1, v0, v3, v4}, Lnicoid/network238/kotlin/collections/ArraysKt___ArraysJvmKt;->copyInto([Ljava/lang/Object;[Ljava/lang/Object;III)[Ljava/lang/Object;

    .line 556
    :cond_2
    :goto_0
    invoke-virtual {p0}, Lnicoid/network238/kotlin/collections/AbstractMutableList;->size()I

    move-result p1

    invoke-static {p1, v1}, Lnicoid/network238/kotlin/collections/CollectionsKt__CollectionsJVMKt;->terminateCollectionToArray(I[Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method
