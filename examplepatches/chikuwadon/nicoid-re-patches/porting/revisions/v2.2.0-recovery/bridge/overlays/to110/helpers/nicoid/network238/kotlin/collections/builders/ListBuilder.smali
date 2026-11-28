.class public final Lnicoid/network238/kotlin/collections/builders/ListBuilder;
.super Lnicoid/network238/kotlin/collections/AbstractMutableList;
.source "SourceFile"

# interfaces
.implements Ljava/util/List;
.implements Ljava/util/RandomAccess;
.implements Ljava/io/Serializable;
.implements Lnicoid/network238/kotlin/jvm/internal/markers/KMutableList;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;,
        Lnicoid/network238/kotlin/collections/builders/ListBuilder$Companion;,
        Lnicoid/network238/kotlin/collections/builders/ListBuilder$Itr;
    }
.end annotation


# static fields
.field private static final Companion:Lnicoid/network238/kotlin/collections/builders/ListBuilder$Companion;

.field private static final Empty:Lnicoid/network238/kotlin/collections/builders/ListBuilder;


# instance fields
.field private backing:[Ljava/lang/Object;

.field private isReadOnly:Z

.field private length:I


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lnicoid/network238/kotlin/collections/builders/ListBuilder$Companion;-><init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->Companion:Lnicoid/network238/kotlin/collections/builders/ListBuilder$Companion;

    .line 18
    new-instance v0, Lnicoid/network238/kotlin/collections/builders/ListBuilder;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lnicoid/network238/kotlin/collections/builders/ListBuilder;-><init>(I)V

    const/4 v1, 0x1

    iput-boolean v1, v0, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->isReadOnly:Z

    sput-object v0, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->Empty:Lnicoid/network238/kotlin/collections/builders/ListBuilder;

    return-void
.end method

.method public constructor <init>(I)V
    .registers 2

    .line 12
    invoke-direct {p0}, Lnicoid/network238/kotlin/collections/AbstractMutableList;-><init>()V

    .line 13
    invoke-static {p1}, Lnicoid/network238/kotlin/collections/builders/ListBuilderKt;->arrayOfUninitializedElements(I)[Ljava/lang/Object;

    move-result-object p1

    iput-object p1, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->backing:[Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(IILnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V
    .registers 4

    and-int/lit8 p2, p2, 0x1

    if-eqz p2, :cond_0

    const/16 p1, 0xa

    .line 12
    :cond_0
    invoke-direct {p0, p1}, Lnicoid/network238/kotlin/collections/builders/ListBuilder;-><init>(I)V

    return-void
.end method

.method public static final synthetic access$addAllInternal(Lnicoid/network238/kotlin/collections/builders/ListBuilder;ILjava/util/Collection;I)V
    .registers 4

    .line 12
    invoke-direct {p0, p1, p2, p3}, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->addAllInternal(ILjava/util/Collection;I)V

    return-void
.end method

.method public static final synthetic access$addAtInternal(Lnicoid/network238/kotlin/collections/builders/ListBuilder;ILjava/lang/Object;)V
    .registers 3

    .line 12
    invoke-direct {p0, p1, p2}, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->addAtInternal(ILjava/lang/Object;)V

    return-void
.end method

.method public static final synthetic access$getBacking$p(Lnicoid/network238/kotlin/collections/builders/ListBuilder;)[Ljava/lang/Object;
    .registers 1

    .line 12
    iget-object p0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->backing:[Ljava/lang/Object;

    return-object p0
.end method

.method public static final synthetic access$getLength$p(Lnicoid/network238/kotlin/collections/builders/ListBuilder;)I
    .registers 1

    .line 12
    iget p0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->length:I

    return p0
.end method

.method public static final synthetic access$getModCount$p$s-2084097795(Lnicoid/network238/kotlin/collections/builders/ListBuilder;)I
    .registers 1

    .line 12
    iget p0, p0, Ljava/util/AbstractList;->modCount:I

    return p0
.end method

.method public static final synthetic access$isReadOnly$p(Lnicoid/network238/kotlin/collections/builders/ListBuilder;)Z
    .registers 1

    .line 12
    iget-boolean p0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->isReadOnly:Z

    return p0
.end method

.method public static final synthetic access$removeAtInternal(Lnicoid/network238/kotlin/collections/builders/ListBuilder;I)Ljava/lang/Object;
    .registers 2

    .line 12
    invoke-direct {p0, p1}, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->removeAtInternal(I)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static final synthetic access$removeRangeInternal(Lnicoid/network238/kotlin/collections/builders/ListBuilder;II)V
    .registers 3

    .line 12
    invoke-direct {p0, p1, p2}, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->removeRangeInternal(II)V

    return-void
.end method

.method public static final synthetic access$retainOrRemoveAllInternal(Lnicoid/network238/kotlin/collections/builders/ListBuilder;IILjava/util/Collection;Z)I
    .registers 5

    .line 12
    invoke-direct {p0, p1, p2, p3, p4}, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->retainOrRemoveAllInternal(IILjava/util/Collection;Z)I

    move-result p0

    return p0
.end method

.method private final addAllInternal(ILjava/util/Collection;I)V
    .registers 8

    .line 205
    invoke-direct {p0}, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->registerModification()V

    .line 206
    invoke-direct {p0, p1, p3}, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->insertAtInternal(II)V

    .line 208
    invoke-interface {p2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p2

    const/4 v0, 0x0

    :goto_0
    if-ge v0, p3, :cond_0

    .line 210
    iget-object v1, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->backing:[Ljava/lang/Object;

    add-int v2, p1, v0

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    aput-object v3, v1, v2

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method private final addAtInternal(ILjava/lang/Object;)V
    .registers 4

    .line 199
    invoke-direct {p0}, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->registerModification()V

    .line 200
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->insertAtInternal(II)V

    .line 201
    iget-object v0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->backing:[Ljava/lang/Object;

    aput-object p2, v0, p1

    return-void
.end method

.method private final checkIsMutable()V
    .registers 2

    .line 173
    iget-boolean v0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->isReadOnly:Z

    if-nez v0, :cond_0

    return-void

    :cond_0
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method private final contentEquals(Ljava/util/List;)Z
    .registers 5

    .line 189
    iget-object v0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->backing:[Ljava/lang/Object;

    iget v1, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->length:I

    const/4 v2, 0x0

    # invokes: Lnicoid/network238/kotlin/collections/builders/ListBuilderKt;->subarrayContentEquals([Ljava/lang/Object;IILjava/util/List;)Z
    invoke-static {v0, v2, v1, p1}, Lnicoid/network238/kotlin/collections/builders/ListBuilderKt;->access$subarrayContentEquals([Ljava/lang/Object;IILjava/util/List;)Z

    move-result p1

    return p1
.end method

.method private final ensureCapacityInternal(I)V
    .registers 4

    if-ltz p1, :cond_1

    .line 182
    iget-object v0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->backing:[Ljava/lang/Object;

    array-length v1, v0

    if-le p1, v1, :cond_0

    .line 183
    sget-object v1, Lnicoid/network238/kotlin/collections/AbstractList;->Companion:Lnicoid/network238/kotlin/collections/AbstractList$Companion;

    array-length v0, v0

    invoke-virtual {v1, v0, p1}, Lnicoid/network238/kotlin/collections/AbstractList$Companion;->newCapacity$kotlin_stdlib(II)I

    move-result p1

    .line 184
    iget-object v0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->backing:[Ljava/lang/Object;

    invoke-static {v0, p1}, Lnicoid/network238/kotlin/collections/builders/ListBuilderKt;->copyOfUninitializedElements([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object p1

    iput-object p1, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->backing:[Ljava/lang/Object;

    :cond_0
    return-void

    .line 181
    :cond_1
    new-instance p1, Ljava/lang/OutOfMemoryError;

    invoke-direct {p1}, Ljava/lang/OutOfMemoryError;-><init>()V

    throw p1
.end method

.method private final ensureExtraCapacity(I)V
    .registers 3

    .line 177
    iget v0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->length:I

    add-int/2addr v0, p1

    invoke-direct {p0, v0}, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->ensureCapacityInternal(I)V

    return-void
.end method

.method private final insertAtInternal(II)V
    .registers 6

    .line 193
    invoke-direct {p0, p2}, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->ensureExtraCapacity(I)V

    .line 194
    iget-object v0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->backing:[Ljava/lang/Object;

    iget v1, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->length:I

    add-int v2, p1, p2

    invoke-static {v0, v0, v2, p1, v1}, Lnicoid/network238/kotlin/collections/ArraysKt;->copyInto([Ljava/lang/Object;[Ljava/lang/Object;III)[Ljava/lang/Object;

    .line 195
    iget p1, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->length:I

    add-int/2addr p1, p2

    iput p1, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->length:I

    return-void
.end method

.method private final registerModification()V
    .registers 2

    .line 169
    iget v0, p0, Ljava/util/AbstractList;->modCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Ljava/util/AbstractList;->modCount:I

    return-void
.end method

.method private final removeAtInternal(I)Ljava/lang/Object;
    .registers 6

    .line 216
    invoke-direct {p0}, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->registerModification()V

    .line 217
    iget-object v0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->backing:[Ljava/lang/Object;

    aget-object v1, v0, p1

    add-int/lit8 v2, p1, 0x1

    .line 218
    iget v3, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->length:I

    invoke-static {v0, v0, p1, v2, v3}, Lnicoid/network238/kotlin/collections/ArraysKt;->copyInto([Ljava/lang/Object;[Ljava/lang/Object;III)[Ljava/lang/Object;

    .line 219
    iget-object p1, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->backing:[Ljava/lang/Object;

    iget v0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->length:I

    add-int/lit8 v0, v0, -0x1

    invoke-static {p1, v0}, Lnicoid/network238/kotlin/collections/builders/ListBuilderKt;->resetAt([Ljava/lang/Object;I)V

    .line 220
    iget p1, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->length:I

    add-int/lit8 p1, p1, -0x1

    iput p1, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->length:I

    return-object v1
.end method

.method private final removeRangeInternal(II)V
    .registers 6

    if-lez p2, :cond_0

    .line 225
    invoke-direct {p0}, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->registerModification()V

    .line 226
    :cond_0
    iget-object v0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->backing:[Ljava/lang/Object;

    add-int v1, p1, p2

    iget v2, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->length:I

    invoke-static {v0, v0, p1, v1, v2}, Lnicoid/network238/kotlin/collections/ArraysKt;->copyInto([Ljava/lang/Object;[Ljava/lang/Object;III)[Ljava/lang/Object;

    .line 227
    iget-object p1, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->backing:[Ljava/lang/Object;

    iget v0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->length:I

    sub-int v1, v0, p2

    invoke-static {p1, v1, v0}, Lnicoid/network238/kotlin/collections/builders/ListBuilderKt;->resetRange([Ljava/lang/Object;II)V

    .line 228
    iget p1, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->length:I

    sub-int/2addr p1, p2

    iput p1, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->length:I

    return-void
.end method

.method private final retainOrRemoveAllInternal(IILjava/util/Collection;Z)I
    .registers 10

    const/4 v0, 0x0

    move v1, v0

    .line 243
    :goto_0
    iget-object v2, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->backing:[Ljava/lang/Object;

    if-ge v0, p2, :cond_1

    add-int v3, p1, v0

    .line 236
    aget-object v2, v2, v3

    invoke-interface {p3, v2}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-ne v2, p4, :cond_0

    .line 237
    iget-object v2, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->backing:[Ljava/lang/Object;

    add-int/lit8 v4, v1, 0x1

    add-int/2addr v1, p1

    add-int/lit8 v0, v0, 0x1

    aget-object v3, v2, v3

    aput-object v3, v2, v1

    move v1, v4

    goto :goto_0

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    sub-int p3, p2, v1

    add-int/2addr p2, p1

    .line 243
    iget p4, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->length:I

    add-int/2addr p1, v1

    invoke-static {v2, v2, p1, p2, p4}, Lnicoid/network238/kotlin/collections/ArraysKt;->copyInto([Ljava/lang/Object;[Ljava/lang/Object;III)[Ljava/lang/Object;

    .line 244
    iget-object p1, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->backing:[Ljava/lang/Object;

    iget p2, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->length:I

    sub-int p4, p2, p3

    invoke-static {p1, p4, p2}, Lnicoid/network238/kotlin/collections/builders/ListBuilderKt;->resetRange([Ljava/lang/Object;II)V

    if-lez p3, :cond_2

    .line 245
    invoke-direct {p0}, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->registerModification()V

    .line 246
    :cond_2
    iget p1, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->length:I

    sub-int/2addr p1, p3

    iput p1, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->length:I

    return p3
.end method


# virtual methods
.method public add(ILjava/lang/Object;)V
    .registers 5

    .line 84
    invoke-direct {p0}, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->checkIsMutable()V

    .line 85
    sget-object v0, Lnicoid/network238/kotlin/collections/AbstractList;->Companion:Lnicoid/network238/kotlin/collections/AbstractList$Companion;

    iget v1, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->length:I

    invoke-virtual {v0, p1, v1}, Lnicoid/network238/kotlin/collections/AbstractList$Companion;->checkPositionIndex$kotlin_stdlib(II)V

    .line 86
    invoke-direct {p0, p1, p2}, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->addAtInternal(ILjava/lang/Object;)V

    return-void
.end method

.method public add(Ljava/lang/Object;)Z
    .registers 3

    .line 78
    invoke-direct {p0}, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->checkIsMutable()V

    .line 79
    iget v0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->length:I

    invoke-direct {p0, v0, p1}, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->addAtInternal(ILjava/lang/Object;)V

    const/4 p1, 0x1

    return p1
.end method

.method public addAll(ILjava/util/Collection;)Z
    .registers 5

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 97
    invoke-direct {p0}, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->checkIsMutable()V

    .line 98
    sget-object v0, Lnicoid/network238/kotlin/collections/AbstractList;->Companion:Lnicoid/network238/kotlin/collections/AbstractList$Companion;

    iget v1, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->length:I

    invoke-virtual {v0, p1, v1}, Lnicoid/network238/kotlin/collections/AbstractList$Companion;->checkPositionIndex$kotlin_stdlib(II)V

    .line 99
    invoke-interface {p2}, Ljava/util/Collection;->size()I

    move-result v0

    .line 100
    invoke-direct {p0, p1, p2, v0}, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->addAllInternal(ILjava/util/Collection;I)V

    if-lez v0, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public addAll(Ljava/util/Collection;)Z
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 90
    invoke-direct {p0}, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->checkIsMutable()V

    .line 91
    invoke-interface {p1}, Ljava/util/Collection;->size()I

    move-result v0

    .line 92
    iget v1, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->length:I

    invoke-direct {p0, v1, p1, v0}, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->addAllInternal(ILjava/util/Collection;I)V

    if-lez v0, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public final build()Ljava/util/List;
    .registers 2

    .line 22
    invoke-direct {p0}, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->checkIsMutable()V

    .line 23
    const/4 v0, 0x1

    iput-boolean v0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->isReadOnly:Z

    .line 24
    iget v0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->length:I

    if-lez v0, :cond_0

    return-object p0

    :cond_0
    sget-object v0, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->Empty:Lnicoid/network238/kotlin/collections/builders/ListBuilder;

    return-object v0
.end method

.method public clear()V
    .registers 3

    .line 105
    invoke-direct {p0}, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->checkIsMutable()V

    .line 106
    iget v0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->length:I

    const/4 v1, 0x0

    invoke-direct {p0, v1, v0}, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->removeRangeInternal(II)V

    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 3

    if-eq p1, p0, :cond_1

    .line 155
    instance-of v0, p1, Ljava/util/List;

    if-eqz v0, :cond_0

    check-cast p1, Ljava/util/List;

    invoke-direct {p0, p1}, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->contentEquals(Ljava/util/List;)Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    return p1

    :cond_1
    :goto_0
    const/4 p1, 0x1

    return p1
.end method

.method public get(I)Ljava/lang/Object;
    .registers 4

    .line 39
    sget-object v0, Lnicoid/network238/kotlin/collections/AbstractList;->Companion:Lnicoid/network238/kotlin/collections/AbstractList$Companion;

    iget v1, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->length:I

    invoke-virtual {v0, p1, v1}, Lnicoid/network238/kotlin/collections/AbstractList$Companion;->checkElementIndex$kotlin_stdlib(II)V

    .line 40
    iget-object v0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->backing:[Ljava/lang/Object;

    aget-object p1, v0, p1

    return-object p1
.end method

.method public getSize()I
    .registers 2

    .line 34
    iget v0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->length:I

    return v0
.end method

.method public hashCode()I
    .registers 4

    .line 159
    iget-object v0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->backing:[Ljava/lang/Object;

    iget v1, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->length:I

    const/4 v2, 0x0

    # invokes: Lnicoid/network238/kotlin/collections/builders/ListBuilderKt;->subarrayContentHashCode([Ljava/lang/Object;II)I
    invoke-static {v0, v2, v1}, Lnicoid/network238/kotlin/collections/builders/ListBuilderKt;->access$subarrayContentHashCode([Ljava/lang/Object;II)I

    move-result v0

    return v0
.end method

.method public indexOf(Ljava/lang/Object;)I
    .registers 4

    const/4 v0, 0x0

    .line 53
    :goto_0
    iget v1, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->length:I

    if-ge v0, v1, :cond_1

    .line 54
    iget-object v1, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->backing:[Ljava/lang/Object;

    aget-object v1, v1, v0

    invoke-static {v1, p1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    return v0

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, -0x1

    return p1
.end method

.method public isEmpty()Z
    .registers 2

    .line 36
    iget v0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->length:I

    if-nez v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public iterator()Ljava/util/Iterator;
    .registers 2

    .line 69
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->listIterator(I)Ljava/util/ListIterator;

    move-result-object v0

    return-object v0
.end method

.method public lastIndexOf(Ljava/lang/Object;)I
    .registers 4

    .line 61
    iget v0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->length:I

    add-int/lit8 v0, v0, -0x1

    :goto_0
    if-ltz v0, :cond_1

    .line 63
    iget-object v1, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->backing:[Ljava/lang/Object;

    aget-object v1, v1, v0

    invoke-static {v1, p1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    return v0

    :cond_0
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    :cond_1
    const/4 p1, -0x1

    return p1
.end method

.method public listIterator()Ljava/util/ListIterator;
    .registers 2

    .line 70
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->listIterator(I)Ljava/util/ListIterator;

    move-result-object v0

    return-object v0
.end method

.method public listIterator(I)Ljava/util/ListIterator;
    .registers 4

    .line 73
    sget-object v0, Lnicoid/network238/kotlin/collections/AbstractList;->Companion:Lnicoid/network238/kotlin/collections/AbstractList$Companion;

    iget v1, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->length:I

    invoke-virtual {v0, p1, v1}, Lnicoid/network238/kotlin/collections/AbstractList$Companion;->checkPositionIndex$kotlin_stdlib(II)V

    .line 74
    new-instance v0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$Itr;

    invoke-direct {v0, p0, p1}, Lnicoid/network238/kotlin/collections/builders/ListBuilder$Itr;-><init>(Lnicoid/network238/kotlin/collections/builders/ListBuilder;I)V

    return-object v0
.end method

.method public remove(Ljava/lang/Object;)Z
    .registers 2

    .line 116
    invoke-direct {p0}, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->checkIsMutable()V

    .line 117
    invoke-virtual {p0, p1}, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->indexOf(Ljava/lang/Object;)I

    move-result p1

    if-ltz p1, :cond_0

    .line 118
    invoke-virtual {p0, p1}, Lnicoid/network238/kotlin/collections/AbstractMutableList;->remove(I)Ljava/lang/Object;

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public removeAll(Ljava/util/Collection;)Z
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 123
    invoke-direct {p0}, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->checkIsMutable()V

    .line 124
    iget v0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->length:I

    const/4 v1, 0x0

    invoke-direct {p0, v1, v0, p1, v1}, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->retainOrRemoveAllInternal(IILjava/util/Collection;Z)I

    move-result p1

    if-lez p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    return v1
.end method

.method public removeAt(I)Ljava/lang/Object;
    .registers 4

    .line 110
    invoke-direct {p0}, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->checkIsMutable()V

    .line 111
    sget-object v0, Lnicoid/network238/kotlin/collections/AbstractList;->Companion:Lnicoid/network238/kotlin/collections/AbstractList$Companion;

    iget v1, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->length:I

    invoke-virtual {v0, p1, v1}, Lnicoid/network238/kotlin/collections/AbstractList$Companion;->checkElementIndex$kotlin_stdlib(II)V

    .line 112
    invoke-direct {p0, p1}, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->removeAtInternal(I)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public retainAll(Ljava/util/Collection;)Z
    .registers 5

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 128
    invoke-direct {p0}, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->checkIsMutable()V

    .line 129
    iget v0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->length:I

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-direct {p0, v1, v0, p1, v2}, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->retainOrRemoveAllInternal(IILjava/util/Collection;Z)I

    move-result p1

    if-lez p1, :cond_0

    return v2

    :cond_0
    return v1
.end method

.method public set(ILjava/lang/Object;)Ljava/lang/Object;
    .registers 5

    .line 44
    invoke-direct {p0}, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->checkIsMutable()V

    .line 45
    sget-object v0, Lnicoid/network238/kotlin/collections/AbstractList;->Companion:Lnicoid/network238/kotlin/collections/AbstractList$Companion;

    iget v1, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->length:I

    invoke-virtual {v0, p1, v1}, Lnicoid/network238/kotlin/collections/AbstractList$Companion;->checkElementIndex$kotlin_stdlib(II)V

    .line 46
    iget-object v0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->backing:[Ljava/lang/Object;

    aget-object v1, v0, p1

    .line 47
    aput-object p2, v0, p1

    return-object v1
.end method

.method public subList(II)Ljava/util/List;
    .registers 11

    .line 133
    sget-object v0, Lnicoid/network238/kotlin/collections/AbstractList;->Companion:Lnicoid/network238/kotlin/collections/AbstractList$Companion;

    iget v1, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->length:I

    invoke-virtual {v0, p1, p2, v1}, Lnicoid/network238/kotlin/collections/AbstractList$Companion;->checkRangeIndexes$kotlin_stdlib(III)V

    .line 134
    new-instance v2, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;

    iget-object v3, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->backing:[Ljava/lang/Object;

    sub-int v5, p2, p1

    const/4 v6, 0x0

    move-object v7, p0

    move v4, p1

    invoke-direct/range {v2 .. v7}, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;-><init>([Ljava/lang/Object;IILnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;Lnicoid/network238/kotlin/collections/builders/ListBuilder;)V

    return-object v2
.end method

.method public toArray()[Ljava/lang/Object;
    .registers 4

    .line 150
    iget-object v0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->backing:[Ljava/lang/Object;

    iget v1, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->length:I

    const/4 v2, 0x0

    invoke-static {v0, v2, v1}, Lnicoid/network238/kotlin/collections/ArraysKt;->copyOfRange([Ljava/lang/Object;II)[Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public toArray([Ljava/lang/Object;)[Ljava/lang/Object;
    .registers 6

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 139
    array-length v0, p1

    iget v1, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->length:I

    .line 143
    iget-object v2, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->backing:[Ljava/lang/Object;

    const/4 v3, 0x0

    if-ge v0, v1, :cond_0

    .line 140
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-static {v2, v3, v1, p1}, Ljava/util/Arrays;->copyOfRange([Ljava/lang/Object;IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-object p1

    :cond_0
    nop

    .line 143
    invoke-static {v2, p1, v3, v3, v1}, Lnicoid/network238/kotlin/collections/ArraysKt;->copyInto([Ljava/lang/Object;[Ljava/lang/Object;III)[Ljava/lang/Object;

    .line 145
    iget v0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->length:I

    invoke-static {v0, p1}, Lnicoid/network238/kotlin/collections/CollectionsKt;->terminateCollectionToArray(I[Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    .line 163
    iget-object v0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->backing:[Ljava/lang/Object;

    iget v1, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->length:I

    const/4 v2, 0x0

    # invokes: Lnicoid/network238/kotlin/collections/builders/ListBuilderKt;->subarrayContentToString([Ljava/lang/Object;IILjava/util/Collection;)Ljava/lang/String;
    invoke-static {v0, v2, v1, p0}, Lnicoid/network238/kotlin/collections/builders/ListBuilderKt;->access$subarrayContentToString([Ljava/lang/Object;IILjava/util/Collection;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
