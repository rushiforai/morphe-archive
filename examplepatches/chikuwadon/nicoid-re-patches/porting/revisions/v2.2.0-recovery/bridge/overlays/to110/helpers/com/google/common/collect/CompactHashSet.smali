.class Lcom/google/common/collect/CompactHashSet;
.super Ljava/util/AbstractSet;
.source "CompactHashSet.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/AbstractSet<",
        "TE;>;",
        "Ljava/io/Serializable;"
    }
.end annotation


# static fields
.field static final HASH_FLOODING_FPP:D = 0.001

.field private static final MAX_HASH_BUCKET_LENGTH:I = 0x9

.field private static final serialVersionUID:J = -0x55de2508dcbc049cL


# instance fields
.field transient elements:[Ljava/lang/Object;

.field private transient entries:[I

.field private transient metadata:I

.field private transient size:I

.field private transient table:Ljava/lang/Object;


# direct methods
.method constructor <init>()V
    .registers 2

    .line 201
    invoke-direct {p0}, Ljava/util/AbstractSet;-><init>()V

    const/4 v0, 0x3

    .line 202
    invoke-virtual {p0, v0}, Lcom/google/common/collect/CompactHashSet;->init(I)V

    return-void
.end method

.method constructor <init>(I)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "expectedSize"
        }
    .end annotation

    .line 210
    invoke-direct {p0}, Ljava/util/AbstractSet;-><init>()V

    .line 211
    invoke-virtual {p0, p1}, Lcom/google/common/collect/CompactHashSet;->init(I)V

    return-void
.end method

.method static synthetic access$000(Lcom/google/common/collect/CompactHashSet;)I
    .registers 1

    .line 77
    iget p0, p0, Lcom/google/common/collect/CompactHashSet;->metadata:I

    return p0
.end method

.method static synthetic access$100(Lcom/google/common/collect/CompactHashSet;I)Ljava/lang/Object;
    .registers 2

    .line 77
    invoke-direct {p0, p1}, Lcom/google/common/collect/CompactHashSet;->element(I)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static create()Lcom/google/common/collect/CompactHashSet;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">()",
            "Lcom/google/common/collect/CompactHashSet<",
            "TE;>;"
        }
    .end annotation

    .line 82
    new-instance v0, Lcom/google/common/collect/CompactHashSet;

    invoke-direct {v0}, Lcom/google/common/collect/CompactHashSet;-><init>()V

    return-object v0
.end method

.method public static create(Ljava/util/Collection;)Lcom/google/common/collect/CompactHashSet;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "collection"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Collection<",
            "+TE;>;)",
            "Lcom/google/common/collect/CompactHashSet<",
            "TE;>;"
        }
    .end annotation

    .line 94
    invoke-interface {p0}, Ljava/util/Collection;->size()I

    move-result v0

    invoke-static {v0}, Lcom/google/common/collect/CompactHashSet;->createWithExpectedSize(I)Lcom/google/common/collect/CompactHashSet;

    move-result-object v0

    .line 95
    invoke-virtual {v0, p0}, Lcom/google/common/collect/CompactHashSet;->addAll(Ljava/util/Collection;)Z

    return-object v0
.end method

.method public static varargs create([Ljava/lang/Object;)Lcom/google/common/collect/CompactHashSet;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "elements"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">([TE;)",
            "Lcom/google/common/collect/CompactHashSet<",
            "TE;>;"
        }
    .end annotation

    .annotation runtime Ljava/lang/SafeVarargs;
    .end annotation

    .line 108
    array-length v0, p0

    invoke-static {v0}, Lcom/google/common/collect/CompactHashSet;->createWithExpectedSize(I)Lcom/google/common/collect/CompactHashSet;

    move-result-object v0

    .line 109
    invoke-static {v0, p0}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    return-object v0
.end method

.method private createHashFloodingResistantDelegate(I)Ljava/util/Set;
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "tableSize"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/Set<",
            "TE;>;"
        }
    .end annotation

    .line 253
    new-instance p0, Ljava/util/LinkedHashSet;

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-direct {p0, p1, v0}, Ljava/util/LinkedHashSet;-><init>(IF)V

    return-object p0
.end method

.method public static createWithExpectedSize(I)Lcom/google/common/collect/CompactHashSet;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "expectedSize"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">(I)",
            "Lcom/google/common/collect/CompactHashSet<",
            "TE;>;"
        }
    .end annotation

    .line 124
    new-instance v0, Lcom/google/common/collect/CompactHashSet;

    invoke-direct {v0, p0}, Lcom/google/common/collect/CompactHashSet;-><init>(I)V

    return-object v0
.end method

.method private element(I)Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "i"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TE;"
        }
    .end annotation

    .line 714
    invoke-direct {p0}, Lcom/google/common/collect/CompactHashSet;->requireElements()[Ljava/lang/Object;

    move-result-object p0

    aget-object p0, p0, p1

    return-object p0
.end method

.method private entry(I)I
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "i"
        }
    .end annotation

    .line 718
    invoke-direct {p0}, Lcom/google/common/collect/CompactHashSet;->requireEntries()[I

    move-result-object p0

    aget p0, p0, p1

    return p0
.end method

.method private hashTableMask()I
    .registers 2

    .line 283
    iget p0, p0, Lcom/google/common/collect/CompactHashSet;->metadata:I

    and-int/lit8 p0, p0, 0x1f

    const/4 v0, 0x1

    shl-int p0, v0, p0

    sub-int/2addr p0, v0

    return p0
.end method

.method private readObject(Ljava/io/ObjectInputStream;)V
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "stream"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .line 681
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->defaultReadObject()V

    .line 682
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readInt()I

    move-result v0

    if-ltz v0, :cond_1

    const/16 v1, 0x100

    .line 686
    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v1

    invoke-virtual {p0, v1}, Lcom/google/common/collect/CompactHashSet;->init(I)V

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    .line 688
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v2

    .line 689
    invoke-virtual {p0, v2}, Lcom/google/common/collect/CompactHashSet;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-void

    .line 684
    :cond_1
    new-instance p0, Ljava/io/InvalidObjectException;

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v1, "Invalid size: "

    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/io/InvalidObjectException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private requireElements()[Ljava/lang/Object;
    .registers 1

    .line 709
    iget-object p0, p0, Lcom/google/common/collect/CompactHashSet;->elements:[Ljava/lang/Object;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [Ljava/lang/Object;

    return-object p0
.end method

.method private requireEntries()[I
    .registers 1

    .line 705
    iget-object p0, p0, Lcom/google/common/collect/CompactHashSet;->entries:[I

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [I

    return-object p0
.end method

.method private requireTable()Ljava/lang/Object;
    .registers 1

    .line 701
    iget-object p0, p0, Lcom/google/common/collect/CompactHashSet;->table:Ljava/lang/Object;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method private resizeMeMaybe(I)V
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "newSize"
        }
    .end annotation

    .line 360
    invoke-direct {p0}, Lcom/google/common/collect/CompactHashSet;->requireEntries()[I

    move-result-object v0

    array-length v0, v0

    if-le p1, v0, :cond_0

    ushr-int/lit8 p1, v0, 0x1

    const/4 v1, 0x1

    .line 363
    invoke-static {v1, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    add-int/2addr p1, v0

    or-int/2addr p1, v1

    const v1, 0x3fffffff    # 1.9999999f

    invoke-static {v1, p1}, Ljava/lang/Math;->min(II)I

    move-result p1

    if-eq p1, v0, :cond_0

    .line 365
    invoke-virtual {p0, p1}, Lcom/google/common/collect/CompactHashSet;->resizeEntries(I)V

    :cond_0
    return-void
.end method

.method private resizeTable(IIII)I
    .registers 13
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "oldMask",
            "newCapacity",
            "targetHash",
            "targetEntryIndex"
        }
    .end annotation

    .line 381
    invoke-static {p2}, Lcom/google/common/collect/CompactHashing;->createTable(I)Ljava/lang/Object;

    move-result-object v0

    add-int/lit8 p2, p2, -0x1

    if-eqz p4, :cond_0

    and-int/2addr p3, p2

    add-int/lit8 p4, p4, 0x1

    .line 386
    invoke-static {v0, p3, p4}, Lcom/google/common/collect/CompactHashing;->tableSet(Ljava/lang/Object;II)V

    .line 389
    :cond_0
    invoke-direct {p0}, Lcom/google/common/collect/CompactHashSet;->requireTable()Ljava/lang/Object;

    move-result-object p3

    .line 390
    invoke-direct {p0}, Lcom/google/common/collect/CompactHashSet;->requireEntries()[I

    move-result-object p4

    const/4 v1, 0x0

    :goto_0
    if-gt v1, p1, :cond_2

    .line 394
    invoke-static {p3, v1}, Lcom/google/common/collect/CompactHashing;->tableGet(Ljava/lang/Object;I)I

    move-result v2

    :goto_1
    if-eqz v2, :cond_1

    add-int/lit8 v3, v2, -0x1

    .line 397
    aget v4, p4, v3

    .line 400
    invoke-static {v4, p1}, Lcom/google/common/collect/CompactHashing;->getHashPrefix(II)I

    move-result v5

    or-int/2addr v5, v1

    and-int v6, v5, p2

    .line 403
    invoke-static {v0, v6}, Lcom/google/common/collect/CompactHashing;->tableGet(Ljava/lang/Object;I)I

    move-result v7

    .line 404
    invoke-static {v0, v6, v2}, Lcom/google/common/collect/CompactHashing;->tableSet(Ljava/lang/Object;II)V

    .line 405
    invoke-static {v5, v7, p2}, Lcom/google/common/collect/CompactHashing;->maskCombine(III)I

    move-result v2

    aput v2, p4, v3

    .line 407
    invoke-static {v4, p1}, Lcom/google/common/collect/CompactHashing;->getNext(II)I

    move-result v2

    goto :goto_1

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 411
    :cond_2
    iput-object v0, p0, Lcom/google/common/collect/CompactHashSet;->table:Ljava/lang/Object;

    .line 412
    invoke-direct {p0, p2}, Lcom/google/common/collect/CompactHashSet;->setHashTableMask(I)V

    return p2
.end method

.method private setElement(ILjava/lang/Object;)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "i",
            "value"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITE;)V"
        }
    .end annotation

    .line 722
    invoke-direct {p0}, Lcom/google/common/collect/CompactHashSet;->requireElements()[Ljava/lang/Object;

    move-result-object p0

    aput-object p2, p0, p1

    return-void
.end method

.method private setEntry(II)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "i",
            "value"
        }
    .end annotation

    .line 726
    invoke-direct {p0}, Lcom/google/common/collect/CompactHashSet;->requireEntries()[I

    move-result-object p0

    aput p2, p0, p1

    return-void
.end method

.method private setHashTableMask(I)V
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "mask"
        }
    .end annotation

    .line 276
    invoke-static {p1}, Ljava/lang/Integer;->numberOfLeadingZeros(I)I

    move-result p1

    rsub-int/lit8 p1, p1, 0x20

    .line 277
    iget v0, p0, Lcom/google/common/collect/CompactHashSet;->metadata:I

    const/16 v1, 0x1f

    .line 278
    invoke-static {v0, p1, v1}, Lcom/google/common/collect/CompactHashing;->maskCombine(III)I

    move-result p1

    iput p1, p0, Lcom/google/common/collect/CompactHashSet;->metadata:I

    return-void
.end method

.method private writeObject(Ljava/io/ObjectOutputStream;)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "stream"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 671
    invoke-virtual {p1}, Ljava/io/ObjectOutputStream;->defaultWriteObject()V

    .line 672
    invoke-virtual {p0}, Lcom/google/common/collect/CompactHashSet;->size()I

    move-result v0

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeInt(I)V

    .line 673
    invoke-virtual {p0}, Lcom/google/common/collect/CompactHashSet;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    .line 674
    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    goto :goto_0

    :cond_0
    return-void
.end method


# virtual methods
.method public final add(Ljava/lang/Object;)Z
    .registers 15
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "object"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)Z"
        }
    .end annotation

    .line 293
    invoke-virtual {p0}, Lcom/google/common/collect/CompactHashSet;->needsAllocArrays()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 294
    invoke-virtual {p0}, Lcom/google/common/collect/CompactHashSet;->allocArrays()I

    .line 296
    :cond_0
    invoke-virtual {p0}, Lcom/google/common/collect/CompactHashSet;->delegateOrNull()Ljava/util/Set;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 298
    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result p0

    return p0

    .line 300
    :cond_1
    invoke-direct {p0}, Lcom/google/common/collect/CompactHashSet;->requireEntries()[I

    move-result-object v0

    .line 301
    invoke-direct {p0}, Lcom/google/common/collect/CompactHashSet;->requireElements()[Ljava/lang/Object;

    move-result-object v1

    .line 303
    iget v2, p0, Lcom/google/common/collect/CompactHashSet;->size:I

    add-int/lit8 v3, v2, 0x1

    .line 305
    invoke-static {p1}, Lcom/google/common/collect/Hashing;->smearedHash(Ljava/lang/Object;)I

    move-result v4

    .line 306
    invoke-direct {p0}, Lcom/google/common/collect/CompactHashSet;->hashTableMask()I

    move-result v5

    and-int v6, v4, v5

    .line 308
    invoke-direct {p0}, Lcom/google/common/collect/CompactHashSet;->requireTable()Ljava/lang/Object;

    move-result-object v7

    invoke-static {v7, v6}, Lcom/google/common/collect/CompactHashing;->tableGet(Ljava/lang/Object;I)I

    move-result v7

    const/4 v8, 0x1

    if-nez v7, :cond_3

    if-le v3, v5, :cond_2

    .line 312
    invoke-static {v5}, Lcom/google/common/collect/CompactHashing;->newCapacity(I)I

    move-result v0

    invoke-direct {p0, v5, v0, v4, v2}, Lcom/google/common/collect/CompactHashSet;->resizeTable(IIII)I

    move-result v5

    goto :goto_1

    .line 314
    :cond_2
    invoke-direct {p0}, Lcom/google/common/collect/CompactHashSet;->requireTable()Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0, v6, v3}, Lcom/google/common/collect/CompactHashing;->tableSet(Ljava/lang/Object;II)V

    goto :goto_1

    .line 319
    :cond_3
    invoke-static {v4, v5}, Lcom/google/common/collect/CompactHashing;->getHashPrefix(II)I

    move-result v6

    const/4 v9, 0x0

    move v10, v9

    :goto_0
    sub-int/2addr v7, v8

    .line 323
    aget v11, v0, v7

    .line 324
    invoke-static {v11, v5}, Lcom/google/common/collect/CompactHashing;->getHashPrefix(II)I

    move-result v12

    if-ne v12, v6, :cond_4

    aget-object v12, v1, v7

    .line 325
    invoke-static {p1, v12}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_4

    return v9

    .line 328
    :cond_4
    invoke-static {v11, v5}, Lcom/google/common/collect/CompactHashing;->getNext(II)I

    move-result v12

    add-int/2addr v10, v8

    if-nez v12, :cond_7

    const/16 v1, 0x9

    if-lt v10, v1, :cond_5

    .line 333
    invoke-virtual {p0}, Lcom/google/common/collect/CompactHashSet;->convertToHashFloodingResistantImplementation()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result p0

    return p0

    :cond_5
    if-le v3, v5, :cond_6

    .line 338
    invoke-static {v5}, Lcom/google/common/collect/CompactHashing;->newCapacity(I)I

    move-result v0

    invoke-direct {p0, v5, v0, v4, v2}, Lcom/google/common/collect/CompactHashSet;->resizeTable(IIII)I

    move-result v5

    goto :goto_1

    .line 340
    :cond_6
    invoke-static {v11, v3, v5}, Lcom/google/common/collect/CompactHashing;->maskCombine(III)I

    move-result v1

    aput v1, v0, v7

    .line 343
    :goto_1
    invoke-direct {p0, v3}, Lcom/google/common/collect/CompactHashSet;->resizeMeMaybe(I)V

    .line 344
    invoke-virtual {p0, v2, p1, v4, v5}, Lcom/google/common/collect/CompactHashSet;->insertEntry(ILjava/lang/Object;II)V

    .line 345
    iput v3, p0, Lcom/google/common/collect/CompactHashSet;->size:I

    .line 346
    invoke-virtual {p0}, Lcom/google/common/collect/CompactHashSet;->incrementModCount()V

    return v8

    :cond_7
    move v7, v12

    goto :goto_0
.end method

.method adjustAfterRemove(II)I
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "indexBeforeRemove",
            "indexRemoved"
        }
    .end annotation

    add-int/lit8 p1, p1, -0x1

    return p1
.end method

.method allocArrays()I
    .registers 4

    .line 230
    invoke-virtual {p0}, Lcom/google/common/collect/CompactHashSet;->needsAllocArrays()Z

    move-result v0

    const-string v1, "Arrays already allocated"

    invoke-static {v0, v1}, Lcom/google/common/base/Preconditions;->checkState(ZLjava/lang/Object;)V

    .line 232
    iget v0, p0, Lcom/google/common/collect/CompactHashSet;->metadata:I

    .line 233
    invoke-static {v0}, Lcom/google/common/collect/CompactHashing;->tableSize(I)I

    move-result v1

    .line 234
    invoke-static {v1}, Lcom/google/common/collect/CompactHashing;->createTable(I)Ljava/lang/Object;

    move-result-object v2

    iput-object v2, p0, Lcom/google/common/collect/CompactHashSet;->table:Ljava/lang/Object;

    add-int/lit8 v1, v1, -0x1

    .line 235
    invoke-direct {p0, v1}, Lcom/google/common/collect/CompactHashSet;->setHashTableMask(I)V

    .line 237
    new-array v1, v0, [I

    iput-object v1, p0, Lcom/google/common/collect/CompactHashSet;->entries:[I

    .line 238
    new-array v1, v0, [Ljava/lang/Object;

    iput-object v1, p0, Lcom/google/common/collect/CompactHashSet;->elements:[Ljava/lang/Object;

    return v0
.end method

.method public clear()V
    .registers 7

    .line 650
    invoke-virtual {p0}, Lcom/google/common/collect/CompactHashSet;->needsAllocArrays()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 653
    :cond_0
    invoke-virtual {p0}, Lcom/google/common/collect/CompactHashSet;->incrementModCount()V

    .line 654
    invoke-virtual {p0}, Lcom/google/common/collect/CompactHashSet;->delegateOrNull()Ljava/util/Set;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    if-eqz v0, :cond_1

    .line 657
    invoke-virtual {p0}, Lcom/google/common/collect/CompactHashSet;->size()I

    move-result v3

    const/4 v4, 0x3

    const v5, 0x3fffffff    # 1.9999999f

    invoke-static {v3, v4, v5}, Lcom/google/common/primitives/Ints;->constrainToRange(III)I

    move-result v3

    iput v3, p0, Lcom/google/common/collect/CompactHashSet;->metadata:I

    .line 658
    invoke-interface {v0}, Ljava/util/Set;->clear()V

    .line 659
    iput-object v1, p0, Lcom/google/common/collect/CompactHashSet;->table:Ljava/lang/Object;

    .line 660
    iput v2, p0, Lcom/google/common/collect/CompactHashSet;->size:I

    return-void

    .line 662
    :cond_1
    invoke-direct {p0}, Lcom/google/common/collect/CompactHashSet;->requireElements()[Ljava/lang/Object;

    move-result-object v0

    iget v3, p0, Lcom/google/common/collect/CompactHashSet;->size:I

    invoke-static {v0, v2, v3, v1}, Ljava/util/Arrays;->fill([Ljava/lang/Object;IILjava/lang/Object;)V

    .line 663
    invoke-direct {p0}, Lcom/google/common/collect/CompactHashSet;->requireTable()Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lcom/google/common/collect/CompactHashing;->tableClear(Ljava/lang/Object;)V

    .line 664
    invoke-direct {p0}, Lcom/google/common/collect/CompactHashSet;->requireEntries()[I

    move-result-object v0

    iget v1, p0, Lcom/google/common/collect/CompactHashSet;->size:I

    invoke-static {v0, v2, v1, v2}, Ljava/util/Arrays;->fill([IIII)V

    .line 665
    iput v2, p0, Lcom/google/common/collect/CompactHashSet;->size:I

    return-void
.end method

.method public final contains(Ljava/lang/Object;)Z
    .registers 9
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "object"
        }
    .end annotation

    .line 418
    invoke-virtual {p0}, Lcom/google/common/collect/CompactHashSet;->needsAllocArrays()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    .line 421
    :cond_0
    invoke-virtual {p0}, Lcom/google/common/collect/CompactHashSet;->delegateOrNull()Ljava/util/Set;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 423
    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0

    .line 425
    :cond_1
    invoke-static {p1}, Lcom/google/common/collect/Hashing;->smearedHash(Ljava/lang/Object;)I

    move-result v0

    .line 426
    invoke-direct {p0}, Lcom/google/common/collect/CompactHashSet;->hashTableMask()I

    move-result v2

    .line 427
    invoke-direct {p0}, Lcom/google/common/collect/CompactHashSet;->requireTable()Ljava/lang/Object;

    move-result-object v3

    and-int v4, v0, v2

    invoke-static {v3, v4}, Lcom/google/common/collect/CompactHashing;->tableGet(Ljava/lang/Object;I)I

    move-result v3

    if-nez v3, :cond_2

    return v1

    .line 431
    :cond_2
    invoke-static {v0, v2}, Lcom/google/common/collect/CompactHashing;->getHashPrefix(II)I

    move-result v0

    :cond_3
    const/4 v4, 0x1

    sub-int/2addr v3, v4

    .line 434
    invoke-direct {p0, v3}, Lcom/google/common/collect/CompactHashSet;->entry(I)I

    move-result v5

    .line 435
    invoke-static {v5, v2}, Lcom/google/common/collect/CompactHashing;->getHashPrefix(II)I

    move-result v6

    if-ne v6, v0, :cond_4

    .line 436
    invoke-direct {p0, v3}, Lcom/google/common/collect/CompactHashSet;->element(I)Ljava/lang/Object;

    move-result-object v3

    invoke-static {p1, v3}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    return v4

    .line 439
    :cond_4
    invoke-static {v5, v2}, Lcom/google/common/collect/CompactHashing;->getNext(II)I

    move-result v3

    if-nez v3, :cond_3

    return v1
.end method

.method convertToHashFloodingResistantImplementation()Ljava/util/Set;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "TE;>;"
        }
    .end annotation

    .line 258
    invoke-direct {p0}, Lcom/google/common/collect/CompactHashSet;->hashTableMask()I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    invoke-direct {p0, v0}, Lcom/google/common/collect/CompactHashSet;->createHashFloodingResistantDelegate(I)Ljava/util/Set;

    move-result-object v0

    .line 259
    invoke-virtual {p0}, Lcom/google/common/collect/CompactHashSet;->firstEntryIndex()I

    move-result v1

    :goto_0
    if-ltz v1, :cond_0

    .line 260
    invoke-direct {p0, v1}, Lcom/google/common/collect/CompactHashSet;->element(I)Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 259
    invoke-virtual {p0, v1}, Lcom/google/common/collect/CompactHashSet;->getSuccessor(I)I

    move-result v1

    goto :goto_0

    .line 262
    :cond_0
    iput-object v0, p0, Lcom/google/common/collect/CompactHashSet;->table:Ljava/lang/Object;

    const/4 v1, 0x0

    .line 263
    iput-object v1, p0, Lcom/google/common/collect/CompactHashSet;->entries:[I

    .line 264
    iput-object v1, p0, Lcom/google/common/collect/CompactHashSet;->elements:[Ljava/lang/Object;

    .line 265
    invoke-virtual {p0}, Lcom/google/common/collect/CompactHashSet;->incrementModCount()V

    return-object v0
.end method

.method final delegateOrNull()Ljava/util/Set;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "TE;>;"
        }
    .end annotation

    .line 246
    iget-object p0, p0, Lcom/google/common/collect/CompactHashSet;->table:Ljava/lang/Object;

    instance-of v0, p0, Ljava/util/Set;

    if-eqz v0, :cond_0

    .line 247
    check-cast p0, Ljava/util/Set;

    return-object p0

    :cond_0
    const/4 p0, 0x0

    return-object p0
.end method

.method firstEntryIndex()I
    .registers 1

    .line 519
    invoke-virtual {p0}, Lcom/google/common/collect/CompactHashSet;->isEmpty()Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, -0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method getSuccessor(I)I
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "entryIndex"
        }
    .end annotation

    add-int/lit8 p1, p1, 0x1

    .line 523
    iget p0, p0, Lcom/google/common/collect/CompactHashSet;->size:I

    if-ge p1, p0, :cond_0

    return p1

    :cond_0
    const/4 p0, -0x1

    return p0
.end method

.method final incrementModCount()V
    .registers 2

    .line 287
    iget v0, p0, Lcom/google/common/collect/CompactHashSet;->metadata:I

    add-int/lit8 v0, v0, 0x20

    iput v0, p0, Lcom/google/common/collect/CompactHashSet;->metadata:I

    return-void
.end method

.method init(I)V
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "expectedSize"
        }
    .end annotation

    const/4 v0, 0x1

    if-ltz p1, :cond_0

    move v1, v0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 216
    :goto_0
    const-string v2, "Expected size must be >= 0"

    invoke-static {v1, v2}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    const v1, 0x3fffffff    # 1.9999999f

    .line 219
    invoke-static {p1, v0, v1}, Lcom/google/common/primitives/Ints;->constrainToRange(III)I

    move-result p1

    iput p1, p0, Lcom/google/common/collect/CompactHashSet;->metadata:I

    return-void
.end method

.method insertEntry(ILjava/lang/Object;II)V
    .registers 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "entryIndex",
            "object",
            "hash",
            "mask"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITE;II)V"
        }
    .end annotation

    const/4 v0, 0x0

    .line 354
    invoke-static {p3, v0, p4}, Lcom/google/common/collect/CompactHashing;->maskCombine(III)I

    move-result p3

    invoke-direct {p0, p1, p3}, Lcom/google/common/collect/CompactHashSet;->setEntry(II)V

    .line 355
    invoke-direct {p0, p1, p2}, Lcom/google/common/collect/CompactHashSet;->setElement(ILjava/lang/Object;)V

    return-void
.end method

.method public final isEmpty()Z
    .registers 1

    .line 594
    invoke-virtual {p0}, Lcom/google/common/collect/CompactHashSet;->size()I

    move-result p0

    if-nez p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method isUsingHashFloodingResistance()Z
    .registers 1

    .line 271
    invoke-virtual {p0}, Lcom/google/common/collect/CompactHashSet;->delegateOrNull()Ljava/util/Set;

    move-result-object p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public final iterator()Ljava/util/Iterator;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "TE;>;"
        }
    .end annotation

    .line 537
    invoke-virtual {p0}, Lcom/google/common/collect/CompactHashSet;->delegateOrNull()Ljava/util/Set;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 539
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    return-object p0

    .line 541
    :cond_0
    new-instance v0, Lcom/google/common/collect/CompactHashSet$1;

    invoke-direct {v0, p0}, Lcom/google/common/collect/CompactHashSet$1;-><init>(Lcom/google/common/collect/CompactHashSet;)V

    return-object v0
.end method

.method moveLastEntry(II)V
    .registers 10
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "dstIndex",
            "mask"
        }
    .end annotation

    .line 479
    invoke-direct {p0}, Lcom/google/common/collect/CompactHashSet;->requireTable()Ljava/lang/Object;

    move-result-object v0

    .line 480
    invoke-direct {p0}, Lcom/google/common/collect/CompactHashSet;->requireEntries()[I

    move-result-object v1

    .line 481
    invoke-direct {p0}, Lcom/google/common/collect/CompactHashSet;->requireElements()[Ljava/lang/Object;

    move-result-object v2

    .line 482
    invoke-virtual {p0}, Lcom/google/common/collect/CompactHashSet;->size()I

    move-result p0

    add-int/lit8 v3, p0, -0x1

    const/4 v4, 0x0

    const/4 v5, 0x0

    if-ge p1, v3, :cond_2

    .line 485
    aget-object v6, v2, v3

    .line 486
    aput-object v6, v2, p1

    .line 487
    aput-object v5, v2, v3

    .line 490
    aget v2, v1, v3

    aput v2, v1, p1

    .line 491
    aput v4, v1, v3

    .line 494
    invoke-static {v6}, Lcom/google/common/collect/Hashing;->smearedHash(Ljava/lang/Object;)I

    move-result v2

    and-int/2addr v2, p2

    .line 495
    invoke-static {v0, v2}, Lcom/google/common/collect/CompactHashing;->tableGet(Ljava/lang/Object;I)I

    move-result v3

    if-ne v3, p0, :cond_0

    add-int/lit8 p1, p1, 0x1

    .line 499
    invoke-static {v0, v2, p1}, Lcom/google/common/collect/CompactHashing;->tableSet(Ljava/lang/Object;II)V

    return-void

    :cond_0
    :goto_0
    add-int/lit8 v3, v3, -0x1

    .line 506
    aget v0, v1, v3

    .line 507
    invoke-static {v0, p2}, Lcom/google/common/collect/CompactHashing;->getNext(II)I

    move-result v2

    if-ne v2, p0, :cond_1

    add-int/lit8 p1, p1, 0x1

    .line 510
    invoke-static {v0, p1, p2}, Lcom/google/common/collect/CompactHashing;->maskCombine(III)I

    move-result p0

    aput p0, v1, v3

    return-void

    :cond_1
    move v3, v2

    goto :goto_0

    .line 513
    :cond_2
    aput-object v5, v2, p1

    .line 514
    aput v4, v1, p1

    return-void
.end method

.method final needsAllocArrays()Z
    .registers 1

    .line 224
    iget-object p0, p0, Lcom/google/common/collect/CompactHashSet;->table:Ljava/lang/Object;

    if-nez p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public final remove(Ljava/lang/Object;)Z
    .registers 11
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "object"
        }
    .end annotation

    .line 447
    invoke-virtual {p0}, Lcom/google/common/collect/CompactHashSet;->needsAllocArrays()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    .line 450
    :cond_0
    invoke-virtual {p0}, Lcom/google/common/collect/CompactHashSet;->delegateOrNull()Ljava/util/Set;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 452
    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    move-result p0

    return p0

    .line 454
    :cond_1
    invoke-direct {p0}, Lcom/google/common/collect/CompactHashSet;->hashTableMask()I

    move-result v4

    .line 460
    invoke-direct {p0}, Lcom/google/common/collect/CompactHashSet;->requireTable()Ljava/lang/Object;

    move-result-object v5

    .line 461
    invoke-direct {p0}, Lcom/google/common/collect/CompactHashSet;->requireEntries()[I

    move-result-object v6

    .line 462
    invoke-direct {p0}, Lcom/google/common/collect/CompactHashSet;->requireElements()[Ljava/lang/Object;

    move-result-object v7

    const/4 v8, 0x0

    const/4 v3, 0x0

    move-object v2, p1

    .line 456
    invoke-static/range {v2 .. v8}, Lcom/google/common/collect/CompactHashing;->remove(Ljava/lang/Object;Ljava/lang/Object;ILjava/lang/Object;[I[Ljava/lang/Object;[Ljava/lang/Object;)I

    move-result p1

    const/4 v0, -0x1

    if-ne p1, v0, :cond_2

    return v1

    .line 468
    :cond_2
    invoke-virtual {p0, p1, v4}, Lcom/google/common/collect/CompactHashSet;->moveLastEntry(II)V

    .line 469
    iget p1, p0, Lcom/google/common/collect/CompactHashSet;->size:I

    const/4 v0, 0x1

    sub-int/2addr p1, v0

    iput p1, p0, Lcom/google/common/collect/CompactHashSet;->size:I

    .line 470
    invoke-virtual {p0}, Lcom/google/common/collect/CompactHashSet;->incrementModCount()V

    return v0
.end method

.method resizeEntries(I)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "newCapacity"
        }
    .end annotation

    .line 375
    invoke-direct {p0}, Lcom/google/common/collect/CompactHashSet;->requireEntries()[I

    move-result-object v0

    invoke-static {v0, p1}, Ljava/util/Arrays;->copyOf([II)[I

    move-result-object v0

    iput-object v0, p0, Lcom/google/common/collect/CompactHashSet;->entries:[I

    .line 376
    invoke-direct {p0}, Lcom/google/common/collect/CompactHashSet;->requireElements()[Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0, p1}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object p1

    iput-object p1, p0, Lcom/google/common/collect/CompactHashSet;->elements:[Ljava/lang/Object;

    return-void
.end method

.method public final size()I
    .registers 2

    .line 588
    invoke-virtual {p0}, Lcom/google/common/collect/CompactHashSet;->delegateOrNull()Ljava/util/Set;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 589
    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result p0

    return p0

    :cond_0
    iget p0, p0, Lcom/google/common/collect/CompactHashSet;->size:I

    return p0
.end method

.method public toArray()[Ljava/lang/Object;
    .registers 2

    .line 599
    invoke-virtual {p0}, Lcom/google/common/collect/CompactHashSet;->needsAllocArrays()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p0, 0x0

    .line 600
    new-array p0, p0, [Ljava/lang/Object;

    return-object p0

    .line 602
    :cond_0
    invoke-virtual {p0}, Lcom/google/common/collect/CompactHashSet;->delegateOrNull()Ljava/util/Set;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 603
    invoke-interface {v0}, Ljava/util/Set;->toArray()[Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :cond_1
    invoke-direct {p0}, Lcom/google/common/collect/CompactHashSet;->requireElements()[Ljava/lang/Object;

    move-result-object v0

    iget p0, p0, Lcom/google/common/collect/CompactHashSet;->size:I

    invoke-static {v0, p0}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public toArray([Ljava/lang/Object;)[Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "a"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([TT;)[TT;"
        }
    .end annotation

    .line 610
    invoke-virtual {p0}, Lcom/google/common/collect/CompactHashSet;->needsAllocArrays()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 611
    array-length p0, p1

    if-lez p0, :cond_0

    const/4 p0, 0x0

    .line 612
    aput-object p0, p1, v1

    :cond_0
    return-object p1

    .line 616
    :cond_1
    invoke-virtual {p0}, Lcom/google/common/collect/CompactHashSet;->delegateOrNull()Ljava/util/Set;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 618
    invoke-interface {v0, p1}, Ljava/util/Set;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p0

    return-object p0

    .line 619
    :cond_2
    invoke-direct {p0}, Lcom/google/common/collect/CompactHashSet;->requireElements()[Ljava/lang/Object;

    move-result-object v0

    iget p0, p0, Lcom/google/common/collect/CompactHashSet;->size:I

    invoke-static {v0, v1, p0, p1}, Lcom/google/common/collect/ObjectArrays;->toArrayImpl([Ljava/lang/Object;II[Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public trimToSize()V
    .registers 4

    .line 627
    invoke-virtual {p0}, Lcom/google/common/collect/CompactHashSet;->needsAllocArrays()Z

    move-result v0

    if-nez v0, :cond_2

    .line 630
    invoke-virtual {p0}, Lcom/google/common/collect/CompactHashSet;->delegateOrNull()Ljava/util/Set;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 632
    invoke-virtual {p0}, Lcom/google/common/collect/CompactHashSet;->size()I

    move-result v1

    invoke-direct {p0, v1}, Lcom/google/common/collect/CompactHashSet;->createHashFloodingResistantDelegate(I)Ljava/util/Set;

    move-result-object v1

    .line 633
    invoke-interface {v1, v0}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 634
    iput-object v1, p0, Lcom/google/common/collect/CompactHashSet;->table:Ljava/lang/Object;

    return-void

    .line 637
    :cond_0
    iget v0, p0, Lcom/google/common/collect/CompactHashSet;->size:I

    .line 638
    invoke-direct {p0}, Lcom/google/common/collect/CompactHashSet;->requireEntries()[I

    move-result-object v1

    array-length v1, v1

    if-ge v0, v1, :cond_1

    .line 639
    invoke-virtual {p0, v0}, Lcom/google/common/collect/CompactHashSet;->resizeEntries(I)V

    .line 641
    :cond_1
    invoke-static {v0}, Lcom/google/common/collect/CompactHashing;->tableSize(I)I

    move-result v0

    .line 642
    invoke-direct {p0}, Lcom/google/common/collect/CompactHashSet;->hashTableMask()I

    move-result v1

    if-ge v0, v1, :cond_2

    const/4 v2, 0x0

    .line 644
    invoke-direct {p0, v1, v0, v2, v2}, Lcom/google/common/collect/CompactHashSet;->resizeTable(IIII)I

    :cond_2
    return-void
.end method
