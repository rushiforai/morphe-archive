.class Lcom/google/common/collect/CompactHashMap;
.super Ljava/lang/Object;
.source "CompactHashMap.java"

# interfaces
.implements Ljava/util/Map;
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/common/collect/CompactHashMap$KeySetView;,
        Lcom/google/common/collect/CompactHashMap$EntrySetView;,
        Lcom/google/common/collect/CompactHashMap$ValuesView;,
        Lcom/google/common/collect/CompactHashMap$MapEntry;,
        Lcom/google/common/collect/CompactHashMap$Itr;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/util/Map<",
        "TK;TV;>;",
        "Ljava/io/Serializable;"
    }
.end annotation


# static fields
.field static final HASH_FLOODING_FPP:D = 0.001

.field private static final MAX_HASH_BUCKET_LENGTH:I = 0x9

.field private static final NOT_FOUND:Ljava/lang/Object;

.field private static final serialVersionUID:J = -0x1ad296ddac8faad2L


# instance fields
.field transient entries:[I

.field transient keys:[Ljava/lang/Object;

.field private transient metadata:I

.field private transient size:I

.field private transient table:Ljava/lang/Object;

.field transient values:[Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 109
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/google/common/collect/CompactHashMap;->NOT_FOUND:Ljava/lang/Object;

    return-void
.end method

.method constructor <init>()V
    .registers 2

    .line 233
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x3

    .line 234
    invoke-virtual {p0, v0}, Lcom/google/common/collect/CompactHashMap;->init(I)V

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

    .line 242
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 243
    invoke-virtual {p0, p1}, Lcom/google/common/collect/CompactHashMap;->init(I)V

    return-void
.end method

.method static synthetic access$000(Lcom/google/common/collect/CompactHashMap;)I
    .registers 1

    .line 79
    iget p0, p0, Lcom/google/common/collect/CompactHashMap;->metadata:I

    return p0
.end method

.method static synthetic access$100(Lcom/google/common/collect/CompactHashMap;I)Ljava/lang/Object;
    .registers 2

    .line 79
    invoke-direct {p0, p1}, Lcom/google/common/collect/CompactHashMap;->key(I)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$1000(Lcom/google/common/collect/CompactHashMap;)Ljava/lang/Object;
    .registers 1

    .line 79
    invoke-direct {p0}, Lcom/google/common/collect/CompactHashMap;->requireTable()Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$1100(Lcom/google/common/collect/CompactHashMap;)[I
    .registers 1

    .line 79
    invoke-direct {p0}, Lcom/google/common/collect/CompactHashMap;->requireEntries()[I

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$1200(Lcom/google/common/collect/CompactHashMap;)[Ljava/lang/Object;
    .registers 1

    .line 79
    invoke-direct {p0}, Lcom/google/common/collect/CompactHashMap;->requireKeys()[Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$1300(Lcom/google/common/collect/CompactHashMap;)[Ljava/lang/Object;
    .registers 1

    .line 79
    invoke-direct {p0}, Lcom/google/common/collect/CompactHashMap;->requireValues()[Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$1410(Lcom/google/common/collect/CompactHashMap;)I
    .registers 3

    .line 79
    iget v0, p0, Lcom/google/common/collect/CompactHashMap;->size:I

    add-int/lit8 v1, v0, -0x1

    iput v1, p0, Lcom/google/common/collect/CompactHashMap;->size:I

    return v0
.end method

.method static synthetic access$1500(Lcom/google/common/collect/CompactHashMap;ILjava/lang/Object;)V
    .registers 3

    .line 79
    invoke-direct {p0, p1, p2}, Lcom/google/common/collect/CompactHashMap;->setValue(ILjava/lang/Object;)V

    return-void
.end method

.method static synthetic access$300(Lcom/google/common/collect/CompactHashMap;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2

    .line 79
    invoke-direct {p0, p1}, Lcom/google/common/collect/CompactHashMap;->removeHelper(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$400()Ljava/lang/Object;
    .registers 1

    .line 79
    sget-object v0, Lcom/google/common/collect/CompactHashMap;->NOT_FOUND:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$700(Lcom/google/common/collect/CompactHashMap;Ljava/lang/Object;)I
    .registers 2

    .line 79
    invoke-direct {p0, p1}, Lcom/google/common/collect/CompactHashMap;->indexOf(Ljava/lang/Object;)I

    move-result p0

    return p0
.end method

.method static synthetic access$800(Lcom/google/common/collect/CompactHashMap;I)Ljava/lang/Object;
    .registers 2

    .line 79
    invoke-direct {p0, p1}, Lcom/google/common/collect/CompactHashMap;->value(I)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$900(Lcom/google/common/collect/CompactHashMap;)I
    .registers 1

    .line 79
    invoke-direct {p0}, Lcom/google/common/collect/CompactHashMap;->hashTableMask()I

    move-result p0

    return p0
.end method

.method public static create()Lcom/google/common/collect/CompactHashMap;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">()",
            "Lcom/google/common/collect/CompactHashMap<",
            "TK;TV;>;"
        }
    .end annotation

    .line 92
    new-instance v0, Lcom/google/common/collect/CompactHashMap;

    invoke-direct {v0}, Lcom/google/common/collect/CompactHashMap;-><init>()V

    return-object v0
.end method

.method public static createWithExpectedSize(I)Lcom/google/common/collect/CompactHashMap;
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
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(I)",
            "Lcom/google/common/collect/CompactHashMap<",
            "TK;TV;>;"
        }
    .end annotation

    .line 106
    new-instance v0, Lcom/google/common/collect/CompactHashMap;

    invoke-direct {v0, p0}, Lcom/google/common/collect/CompactHashMap;-><init>(I)V

    return-object v0
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

    .line 1069
    invoke-direct {p0}, Lcom/google/common/collect/CompactHashMap;->requireEntries()[I

    move-result-object p0

    aget p0, p0, p1

    return p0
.end method

.method private hashTableMask()I
    .registers 2

    .line 312
    iget p0, p0, Lcom/google/common/collect/CompactHashMap;->metadata:I

    and-int/lit8 p0, p0, 0x1f

    const/4 v0, 0x1

    shl-int p0, v0, p0

    sub-int/2addr p0, v0

    return p0
.end method

.method private indexOf(Ljava/lang/Object;)I
    .registers 8
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "key"
        }
    .end annotation

    .line 473
    invoke-virtual {p0}, Lcom/google/common/collect/CompactHashMap;->needsAllocArrays()Z

    move-result v0

    const/4 v1, -0x1

    if-eqz v0, :cond_0

    return v1

    .line 476
    :cond_0
    invoke-static {p1}, Lcom/google/common/collect/Hashing;->smearedHash(Ljava/lang/Object;)I

    move-result v0

    .line 477
    invoke-direct {p0}, Lcom/google/common/collect/CompactHashMap;->hashTableMask()I

    move-result v2

    .line 478
    invoke-direct {p0}, Lcom/google/common/collect/CompactHashMap;->requireTable()Ljava/lang/Object;

    move-result-object v3

    and-int v4, v0, v2

    invoke-static {v3, v4}, Lcom/google/common/collect/CompactHashing;->tableGet(Ljava/lang/Object;I)I

    move-result v3

    if-nez v3, :cond_1

    return v1

    .line 482
    :cond_1
    invoke-static {v0, v2}, Lcom/google/common/collect/CompactHashing;->getHashPrefix(II)I

    move-result v0

    :cond_2
    add-int/lit8 v3, v3, -0x1

    .line 485
    invoke-direct {p0, v3}, Lcom/google/common/collect/CompactHashMap;->entry(I)I

    move-result v4

    .line 486
    invoke-static {v4, v2}, Lcom/google/common/collect/CompactHashing;->getHashPrefix(II)I

    move-result v5

    if-ne v5, v0, :cond_3

    .line 487
    invoke-direct {p0, v3}, Lcom/google/common/collect/CompactHashMap;->key(I)Ljava/lang/Object;

    move-result-object v5

    invoke-static {p1, v5}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    return v3

    .line 490
    :cond_3
    invoke-static {v4, v2}, Lcom/google/common/collect/CompactHashing;->getNext(II)I

    move-result v3

    if-nez v3, :cond_2

    return v1
.end method

.method private key(I)Ljava/lang/Object;
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
            "(I)TK;"
        }
    .end annotation

    .line 1060
    invoke-direct {p0}, Lcom/google/common/collect/CompactHashMap;->requireKeys()[Ljava/lang/Object;

    move-result-object p0

    aget-object p0, p0, p1

    return-object p0
.end method

.method private readObject(Ljava/io/ObjectInputStream;)V
    .registers 6
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

    .line 1007
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->defaultReadObject()V

    .line 1008
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readInt()I

    move-result v0

    if-ltz v0, :cond_1

    const/16 v1, 0x100

    .line 1012
    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v1

    invoke-virtual {p0, v1}, Lcom/google/common/collect/CompactHashMap;->init(I)V

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    .line 1014
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v2

    .line 1015
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v3

    .line 1016
    invoke-virtual {p0, v2, v3}, Lcom/google/common/collect/CompactHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-void

    .line 1010
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

.method private removeHelper(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 9
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "key"
        }
    .end annotation

    .line 535
    invoke-virtual {p0}, Lcom/google/common/collect/CompactHashMap;->needsAllocArrays()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 536
    sget-object p0, Lcom/google/common/collect/CompactHashMap;->NOT_FOUND:Ljava/lang/Object;

    return-object p0

    .line 538
    :cond_0
    invoke-direct {p0}, Lcom/google/common/collect/CompactHashMap;->hashTableMask()I

    move-result v2

    .line 544
    invoke-direct {p0}, Lcom/google/common/collect/CompactHashMap;->requireTable()Ljava/lang/Object;

    move-result-object v3

    .line 545
    invoke-direct {p0}, Lcom/google/common/collect/CompactHashMap;->requireEntries()[I

    move-result-object v4

    .line 546
    invoke-direct {p0}, Lcom/google/common/collect/CompactHashMap;->requireKeys()[Ljava/lang/Object;

    move-result-object v5

    const/4 v6, 0x0

    const/4 v1, 0x0

    move-object v0, p1

    .line 540
    invoke-static/range {v0 .. v6}, Lcom/google/common/collect/CompactHashing;->remove(Ljava/lang/Object;Ljava/lang/Object;ILjava/lang/Object;[I[Ljava/lang/Object;[Ljava/lang/Object;)I

    move-result p1

    const/4 v0, -0x1

    if-ne p1, v0, :cond_1

    .line 549
    sget-object p0, Lcom/google/common/collect/CompactHashMap;->NOT_FOUND:Ljava/lang/Object;

    return-object p0

    .line 552
    :cond_1
    invoke-direct {p0, p1}, Lcom/google/common/collect/CompactHashMap;->value(I)Ljava/lang/Object;

    move-result-object v0

    .line 554
    invoke-virtual {p0, p1, v2}, Lcom/google/common/collect/CompactHashMap;->moveLastEntry(II)V

    .line 555
    iget p1, p0, Lcom/google/common/collect/CompactHashMap;->size:I

    add-int/lit8 p1, p1, -0x1

    iput p1, p0, Lcom/google/common/collect/CompactHashMap;->size:I

    .line 556
    invoke-virtual {p0}, Lcom/google/common/collect/CompactHashMap;->incrementModCount()V

    return-object v0
.end method

.method private requireEntries()[I
    .registers 1

    .line 1039
    iget-object p0, p0, Lcom/google/common/collect/CompactHashMap;->entries:[I

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [I

    return-object p0
.end method

.method private requireKeys()[Ljava/lang/Object;
    .registers 1

    .line 1043
    iget-object p0, p0, Lcom/google/common/collect/CompactHashMap;->keys:[Ljava/lang/Object;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [Ljava/lang/Object;

    return-object p0
.end method

.method private requireTable()Ljava/lang/Object;
    .registers 1

    .line 1035
    iget-object p0, p0, Lcom/google/common/collect/CompactHashMap;->table:Ljava/lang/Object;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method private requireValues()[Ljava/lang/Object;
    .registers 1

    .line 1047
    iget-object p0, p0, Lcom/google/common/collect/CompactHashMap;->values:[Ljava/lang/Object;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [Ljava/lang/Object;

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

    .line 405
    invoke-direct {p0}, Lcom/google/common/collect/CompactHashMap;->requireEntries()[I

    move-result-object v0

    array-length v0, v0

    if-le p1, v0, :cond_0

    ushr-int/lit8 p1, v0, 0x1

    const/4 v1, 0x1

    .line 408
    invoke-static {v1, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    add-int/2addr p1, v0

    or-int/2addr p1, v1

    const v1, 0x3fffffff    # 1.9999999f

    invoke-static {v1, p1}, Ljava/lang/Math;->min(II)I

    move-result p1

    if-eq p1, v0, :cond_0

    .line 410
    invoke-virtual {p0, p1}, Lcom/google/common/collect/CompactHashMap;->resizeEntries(I)V

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

    .line 427
    invoke-static {p2}, Lcom/google/common/collect/CompactHashing;->createTable(I)Ljava/lang/Object;

    move-result-object v0

    add-int/lit8 p2, p2, -0x1

    if-eqz p4, :cond_0

    and-int/2addr p3, p2

    add-int/lit8 p4, p4, 0x1

    .line 432
    invoke-static {v0, p3, p4}, Lcom/google/common/collect/CompactHashing;->tableSet(Ljava/lang/Object;II)V

    .line 435
    :cond_0
    invoke-direct {p0}, Lcom/google/common/collect/CompactHashMap;->requireTable()Ljava/lang/Object;

    move-result-object p3

    .line 436
    invoke-direct {p0}, Lcom/google/common/collect/CompactHashMap;->requireEntries()[I

    move-result-object p4

    const/4 v1, 0x0

    :goto_0
    if-gt v1, p1, :cond_2

    .line 444
    invoke-static {p3, v1}, Lcom/google/common/collect/CompactHashing;->tableGet(Ljava/lang/Object;I)I

    move-result v2

    :goto_1
    if-eqz v2, :cond_1

    add-int/lit8 v3, v2, -0x1

    .line 453
    aget v4, p4, v3

    .line 456
    invoke-static {v4, p1}, Lcom/google/common/collect/CompactHashing;->getHashPrefix(II)I

    move-result v5

    or-int/2addr v5, v1

    and-int v6, v5, p2

    .line 459
    invoke-static {v0, v6}, Lcom/google/common/collect/CompactHashing;->tableGet(Ljava/lang/Object;I)I

    move-result v7

    .line 460
    invoke-static {v0, v6, v2}, Lcom/google/common/collect/CompactHashing;->tableSet(Ljava/lang/Object;II)V

    .line 461
    invoke-static {v5, v7, p2}, Lcom/google/common/collect/CompactHashing;->maskCombine(III)I

    move-result v2

    aput v2, p4, v3

    .line 463
    invoke-static {v4, p1}, Lcom/google/common/collect/CompactHashing;->getNext(II)I

    move-result v2

    goto :goto_1

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 467
    :cond_2
    iput-object v0, p0, Lcom/google/common/collect/CompactHashMap;->table:Ljava/lang/Object;

    .line 468
    invoke-direct {p0, p2}, Lcom/google/common/collect/CompactHashMap;->setHashTableMask(I)V

    return p2
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

    .line 1081
    invoke-direct {p0}, Lcom/google/common/collect/CompactHashMap;->requireEntries()[I

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

    .line 305
    invoke-static {p1}, Ljava/lang/Integer;->numberOfLeadingZeros(I)I

    move-result p1

    rsub-int/lit8 p1, p1, 0x20

    .line 306
    iget v0, p0, Lcom/google/common/collect/CompactHashMap;->metadata:I

    const/16 v1, 0x1f

    .line 307
    invoke-static {v0, p1, v1}, Lcom/google/common/collect/CompactHashing;->maskCombine(III)I

    move-result p1

    iput p1, p0, Lcom/google/common/collect/CompactHashMap;->metadata:I

    return-void
.end method

.method private setKey(ILjava/lang/Object;)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "i",
            "key"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITK;)V"
        }
    .end annotation

    .line 1073
    invoke-direct {p0}, Lcom/google/common/collect/CompactHashMap;->requireKeys()[Ljava/lang/Object;

    move-result-object p0

    aput-object p2, p0, p1

    return-void
.end method

.method private setValue(ILjava/lang/Object;)V
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
            "(ITV;)V"
        }
    .end annotation

    .line 1077
    invoke-direct {p0}, Lcom/google/common/collect/CompactHashMap;->requireValues()[Ljava/lang/Object;

    move-result-object p0

    aput-object p2, p0, p1

    return-void
.end method

.method private value(I)Ljava/lang/Object;
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
            "(I)TV;"
        }
    .end annotation

    .line 1065
    invoke-direct {p0}, Lcom/google/common/collect/CompactHashMap;->requireValues()[Ljava/lang/Object;

    move-result-object p0

    aget-object p0, p0, p1

    return-object p0
.end method

.method private writeObject(Ljava/io/ObjectOutputStream;)V
    .registers 4
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

    .line 994
    invoke-virtual {p1}, Ljava/io/ObjectOutputStream;->defaultWriteObject()V

    .line 995
    invoke-virtual {p0}, Lcom/google/common/collect/CompactHashMap;->size()I

    move-result v0

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeInt(I)V

    .line 996
    invoke-virtual {p0}, Lcom/google/common/collect/CompactHashMap;->entrySetIterator()Ljava/util/Iterator;

    move-result-object p0

    .line 997
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 998
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 999
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 1000
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    goto :goto_0

    :cond_0
    return-void
.end method


# virtual methods
.method accessEntry(I)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "index"
        }
    .end annotation

    return-void
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

    .line 262
    invoke-virtual {p0}, Lcom/google/common/collect/CompactHashMap;->needsAllocArrays()Z

    move-result v0

    const-string v1, "Arrays already allocated"

    invoke-static {v0, v1}, Lcom/google/common/base/Preconditions;->checkState(ZLjava/lang/Object;)V

    .line 264
    iget v0, p0, Lcom/google/common/collect/CompactHashMap;->metadata:I

    .line 265
    invoke-static {v0}, Lcom/google/common/collect/CompactHashing;->tableSize(I)I

    move-result v1

    .line 266
    invoke-static {v1}, Lcom/google/common/collect/CompactHashing;->createTable(I)Ljava/lang/Object;

    move-result-object v2

    iput-object v2, p0, Lcom/google/common/collect/CompactHashMap;->table:Ljava/lang/Object;

    add-int/lit8 v1, v1, -0x1

    .line 267
    invoke-direct {p0, v1}, Lcom/google/common/collect/CompactHashMap;->setHashTableMask(I)V

    .line 269
    new-array v1, v0, [I

    iput-object v1, p0, Lcom/google/common/collect/CompactHashMap;->entries:[I

    .line 270
    new-array v1, v0, [Ljava/lang/Object;

    iput-object v1, p0, Lcom/google/common/collect/CompactHashMap;->keys:[Ljava/lang/Object;

    .line 271
    new-array v1, v0, [Ljava/lang/Object;

    iput-object v1, p0, Lcom/google/common/collect/CompactHashMap;->values:[Ljava/lang/Object;

    return v0
.end method

.method public clear()V
    .registers 7

    .line 972
    invoke-virtual {p0}, Lcom/google/common/collect/CompactHashMap;->needsAllocArrays()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 975
    :cond_0
    invoke-virtual {p0}, Lcom/google/common/collect/CompactHashMap;->incrementModCount()V

    .line 976
    invoke-virtual {p0}, Lcom/google/common/collect/CompactHashMap;->delegateOrNull()Ljava/util/Map;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    if-eqz v0, :cond_1

    .line 979
    invoke-virtual {p0}, Lcom/google/common/collect/CompactHashMap;->size()I

    move-result v3

    const/4 v4, 0x3

    const v5, 0x3fffffff    # 1.9999999f

    invoke-static {v3, v4, v5}, Lcom/google/common/primitives/Ints;->constrainToRange(III)I

    move-result v3

    iput v3, p0, Lcom/google/common/collect/CompactHashMap;->metadata:I

    .line 980
    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 981
    iput-object v1, p0, Lcom/google/common/collect/CompactHashMap;->table:Ljava/lang/Object;

    .line 982
    iput v2, p0, Lcom/google/common/collect/CompactHashMap;->size:I

    return-void

    .line 984
    :cond_1
    invoke-direct {p0}, Lcom/google/common/collect/CompactHashMap;->requireKeys()[Ljava/lang/Object;

    move-result-object v0

    iget v3, p0, Lcom/google/common/collect/CompactHashMap;->size:I

    invoke-static {v0, v2, v3, v1}, Ljava/util/Arrays;->fill([Ljava/lang/Object;IILjava/lang/Object;)V

    .line 985
    invoke-direct {p0}, Lcom/google/common/collect/CompactHashMap;->requireValues()[Ljava/lang/Object;

    move-result-object v0

    iget v3, p0, Lcom/google/common/collect/CompactHashMap;->size:I

    invoke-static {v0, v2, v3, v1}, Ljava/util/Arrays;->fill([Ljava/lang/Object;IILjava/lang/Object;)V

    .line 986
    invoke-direct {p0}, Lcom/google/common/collect/CompactHashMap;->requireTable()Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lcom/google/common/collect/CompactHashing;->tableClear(Ljava/lang/Object;)V

    .line 987
    invoke-direct {p0}, Lcom/google/common/collect/CompactHashMap;->requireEntries()[I

    move-result-object v0

    iget v1, p0, Lcom/google/common/collect/CompactHashMap;->size:I

    invoke-static {v0, v2, v1, v2}, Ljava/util/Arrays;->fill([IIII)V

    .line 988
    iput v2, p0, Lcom/google/common/collect/CompactHashMap;->size:I

    return-void
.end method

.method public final containsKey(Ljava/lang/Object;)Z
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "key"
        }
    .end annotation

    .line 504
    invoke-virtual {p0}, Lcom/google/common/collect/CompactHashMap;->delegateOrNull()Ljava/util/Map;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 505
    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result p0

    return p0

    :cond_0
    invoke-direct {p0, p1}, Lcom/google/common/collect/CompactHashMap;->indexOf(Ljava/lang/Object;)I

    move-result p0

    const/4 p1, -0x1

    if-eq p0, p1, :cond_1

    const/4 p0, 0x1

    return p0

    :cond_1
    const/4 p0, 0x0

    return p0
.end method

.method public final containsValue(Ljava/lang/Object;)Z
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "value"
        }
    .end annotation

    .line 896
    invoke-virtual {p0}, Lcom/google/common/collect/CompactHashMap;->delegateOrNull()Ljava/util/Map;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 898
    invoke-interface {v0, p1}, Ljava/util/Map;->containsValue(Ljava/lang/Object;)Z

    move-result p0

    return p0

    :cond_0
    const/4 v0, 0x0

    move v1, v0

    .line 900
    :goto_0
    iget v2, p0, Lcom/google/common/collect/CompactHashMap;->size:I

    if-ge v1, v2, :cond_2

    .line 901
    invoke-direct {p0, v1}, Lcom/google/common/collect/CompactHashMap;->value(I)Ljava/lang/Object;

    move-result-object v2

    invoke-static {p1, v2}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    const/4 p0, 0x1

    return p0

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    return v0
.end method

.method convertToHashFloodingResistantImplementation()Ljava/util/Map;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "TK;TV;>;"
        }
    .end annotation

    .line 291
    invoke-direct {p0}, Lcom/google/common/collect/CompactHashMap;->hashTableMask()I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p0, v0}, Lcom/google/common/collect/CompactHashMap;->createHashFloodingResistantDelegate(I)Ljava/util/Map;

    move-result-object v0

    .line 292
    invoke-virtual {p0}, Lcom/google/common/collect/CompactHashMap;->firstEntryIndex()I

    move-result v1

    :goto_0
    if-ltz v1, :cond_0

    .line 293
    invoke-direct {p0, v1}, Lcom/google/common/collect/CompactHashMap;->key(I)Ljava/lang/Object;

    move-result-object v2

    invoke-direct {p0, v1}, Lcom/google/common/collect/CompactHashMap;->value(I)Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 292
    invoke-virtual {p0, v1}, Lcom/google/common/collect/CompactHashMap;->getSuccessor(I)I

    move-result v1

    goto :goto_0

    .line 295
    :cond_0
    iput-object v0, p0, Lcom/google/common/collect/CompactHashMap;->table:Ljava/lang/Object;

    const/4 v1, 0x0

    .line 296
    iput-object v1, p0, Lcom/google/common/collect/CompactHashMap;->entries:[I

    .line 297
    iput-object v1, p0, Lcom/google/common/collect/CompactHashMap;->keys:[Ljava/lang/Object;

    .line 298
    iput-object v1, p0, Lcom/google/common/collect/CompactHashMap;->values:[Ljava/lang/Object;

    .line 299
    invoke-virtual {p0}, Lcom/google/common/collect/CompactHashMap;->incrementModCount()V

    return-object v0
.end method

.method createHashFloodingResistantDelegate(I)Ljava/util/Map;
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
            "Ljava/util/Map<",
            "TK;TV;>;"
        }
    .end annotation

    .line 286
    new-instance p0, Ljava/util/LinkedHashMap;

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-direct {p0, p1, v0}, Ljava/util/LinkedHashMap;-><init>(IF)V

    return-object p0
.end method

.method final delegateOrNull()Ljava/util/Map;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "TK;TV;>;"
        }
    .end annotation

    .line 279
    iget-object p0, p0, Lcom/google/common/collect/CompactHashMap;->table:Ljava/lang/Object;

    instance-of v0, p0, Ljava/util/Map;

    if-eqz v0, :cond_0

    .line 280
    check-cast p0, Ljava/util/Map;

    return-object p0

    :cond_0
    const/4 p0, 0x0

    return-object p0
.end method

.method public entrySet()Ljava/util/Set;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/util/Map$Entry<",
            "TK;TV;>;>;"
        }
    .end annotation

    .line 738
    new-instance v0, Lcom/google/common/collect/CompactHashMap$EntrySetView;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/google/common/collect/CompactHashMap$EntrySetView;-><init>(Lcom/google/common/collect/CompactHashMap;Lcom/google/common/collect/CompactHashMap$1;)V

    return-object v0
.end method

.method final entrySetIterator()Ljava/util/Iterator;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "Ljava/util/Map$Entry<",
            "TK;TV;>;>;"
        }
    .end annotation

    .line 805
    invoke-virtual {p0}, Lcom/google/common/collect/CompactHashMap;->delegateOrNull()Ljava/util/Map;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 807
    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    return-object p0

    .line 809
    :cond_0
    new-instance v0, Lcom/google/common/collect/CompactHashMap$2;

    invoke-direct {v0, p0}, Lcom/google/common/collect/CompactHashMap$2;-><init>(Lcom/google/common/collect/CompactHashMap;)V

    return-object v0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "obj"
        }
    .end annotation

    .line 627
    invoke-static {p0, p1}, Lcom/google/common/collect/Maps;->equalsImpl(Ljava/util/Map;Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method firstEntryIndex()I
    .registers 1

    .line 609
    invoke-virtual {p0}, Lcom/google/common/collect/CompactHashMap;->isEmpty()Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, -0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public final get(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "key"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")TV;"
        }
    .end annotation

    .line 510
    invoke-virtual {p0}, Lcom/google/common/collect/CompactHashMap;->delegateOrNull()Ljava/util/Map;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 512
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    .line 514
    :cond_0
    invoke-direct {p0, p1}, Lcom/google/common/collect/CompactHashMap;->indexOf(Ljava/lang/Object;)I

    move-result p1

    const/4 v0, -0x1

    if-ne p1, v0, :cond_1

    const/4 p0, 0x0

    return-object p0

    .line 518
    :cond_1
    invoke-virtual {p0, p1}, Lcom/google/common/collect/CompactHashMap;->accessEntry(I)V

    .line 519
    invoke-direct {p0, p1}, Lcom/google/common/collect/CompactHashMap;->value(I)Ljava/lang/Object;

    move-result-object p0

    return-object p0
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

    .line 613
    iget p0, p0, Lcom/google/common/collect/CompactHashMap;->size:I

    if-ge p1, p0, :cond_0

    return p1

    :cond_0
    const/4 p0, -0x1

    return p0
.end method

.method public final hashCode()I
    .registers 1

    .line 632
    invoke-virtual {p0}, Lcom/google/common/collect/CompactHashMap;->entrySet()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->hashCode()I

    move-result p0

    return p0
.end method

.method final incrementModCount()V
    .registers 2

    .line 316
    iget v0, p0, Lcom/google/common/collect/CompactHashMap;->metadata:I

    add-int/lit8 v0, v0, 0x20

    iput v0, p0, Lcom/google/common/collect/CompactHashMap;->metadata:I

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

    .line 248
    :goto_0
    const-string v2, "Expected size must be >= 0"

    invoke-static {v1, v2}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    const v1, 0x3fffffff    # 1.9999999f

    .line 251
    invoke-static {p1, v0, v1}, Lcom/google/common/primitives/Ints;->constrainToRange(III)I

    move-result p1

    iput p1, p0, Lcom/google/common/collect/CompactHashMap;->metadata:I

    return-void
.end method

.method insertEntry(ILjava/lang/Object;Ljava/lang/Object;II)V
    .registers 7
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "entryIndex",
            "key",
            "value",
            "hash",
            "mask"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITK;TV;II)V"
        }
    .end annotation

    const/4 v0, 0x0

    .line 398
    invoke-static {p4, v0, p5}, Lcom/google/common/collect/CompactHashing;->maskCombine(III)I

    move-result p4

    invoke-direct {p0, p1, p4}, Lcom/google/common/collect/CompactHashMap;->setEntry(II)V

    .line 399
    invoke-direct {p0, p1, p2}, Lcom/google/common/collect/CompactHashMap;->setKey(ILjava/lang/Object;)V

    .line 400
    invoke-direct {p0, p1, p3}, Lcom/google/common/collect/CompactHashMap;->setValue(ILjava/lang/Object;)V

    return-void
.end method

.method public final isEmpty()Z
    .registers 1

    .line 891
    invoke-virtual {p0}, Lcom/google/common/collect/CompactHashMap;->size()I

    move-result p0

    if-nez p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public keySet()Ljava/util/Set;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "TK;>;"
        }
    .end annotation

    .line 689
    new-instance v0, Lcom/google/common/collect/CompactHashMap$KeySetView;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/google/common/collect/CompactHashMap$KeySetView;-><init>(Lcom/google/common/collect/CompactHashMap;Lcom/google/common/collect/CompactHashMap$1;)V

    return-object v0
.end method

.method final keySetIterator()Ljava/util/Iterator;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "TK;>;"
        }
    .end annotation

    .line 723
    invoke-virtual {p0}, Lcom/google/common/collect/CompactHashMap;->delegateOrNull()Ljava/util/Map;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 725
    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    return-object p0

    .line 727
    :cond_0
    new-instance v0, Lcom/google/common/collect/CompactHashMap$1;

    invoke-direct {v0, p0}, Lcom/google/common/collect/CompactHashMap$1;-><init>(Lcom/google/common/collect/CompactHashMap;)V

    return-object v0
.end method

.method moveLastEntry(II)V
    .registers 12
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

    .line 565
    invoke-direct {p0}, Lcom/google/common/collect/CompactHashMap;->requireTable()Ljava/lang/Object;

    move-result-object v0

    .line 566
    invoke-direct {p0}, Lcom/google/common/collect/CompactHashMap;->requireEntries()[I

    move-result-object v1

    .line 567
    invoke-direct {p0}, Lcom/google/common/collect/CompactHashMap;->requireKeys()[Ljava/lang/Object;

    move-result-object v2

    .line 568
    invoke-direct {p0}, Lcom/google/common/collect/CompactHashMap;->requireValues()[Ljava/lang/Object;

    move-result-object v3

    .line 569
    invoke-virtual {p0}, Lcom/google/common/collect/CompactHashMap;->size()I

    move-result p0

    add-int/lit8 v4, p0, -0x1

    const/4 v5, 0x0

    const/4 v6, 0x0

    if-ge p1, v4, :cond_2

    .line 572
    aget-object v7, v2, v4

    .line 573
    aput-object v7, v2, p1

    .line 574
    aget-object v8, v3, v4

    aput-object v8, v3, p1

    .line 575
    aput-object v6, v2, v4

    .line 576
    aput-object v6, v3, v4

    .line 579
    aget v2, v1, v4

    aput v2, v1, p1

    .line 580
    aput v5, v1, v4

    .line 583
    invoke-static {v7}, Lcom/google/common/collect/Hashing;->smearedHash(Ljava/lang/Object;)I

    move-result v2

    and-int/2addr v2, p2

    .line 584
    invoke-static {v0, v2}, Lcom/google/common/collect/CompactHashing;->tableGet(Ljava/lang/Object;I)I

    move-result v3

    if-ne v3, p0, :cond_0

    add-int/lit8 p1, p1, 0x1

    .line 588
    invoke-static {v0, v2, p1}, Lcom/google/common/collect/CompactHashing;->tableSet(Ljava/lang/Object;II)V

    return-void

    :cond_0
    :goto_0
    add-int/lit8 v3, v3, -0x1

    .line 595
    aget v0, v1, v3

    .line 596
    invoke-static {v0, p2}, Lcom/google/common/collect/CompactHashing;->getNext(II)I

    move-result v2

    if-ne v2, p0, :cond_1

    add-int/lit8 p1, p1, 0x1

    .line 599
    invoke-static {v0, p1, p2}, Lcom/google/common/collect/CompactHashing;->maskCombine(III)I

    move-result p0

    aput p0, v1, v3

    return-void

    :cond_1
    move v3, v2

    goto :goto_0

    .line 602
    :cond_2
    aput-object v6, v2, p1

    .line 603
    aput-object v6, v3, p1

    .line 604
    aput v5, v1, p1

    return-void
.end method

.method final needsAllocArrays()Z
    .registers 1

    .line 256
    iget-object p0, p0, Lcom/google/common/collect/CompactHashMap;->table:Ljava/lang/Object;

    if-nez p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public final put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 15
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "key",
            "value"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;)TV;"
        }
    .end annotation

    .line 330
    invoke-virtual {p0}, Lcom/google/common/collect/CompactHashMap;->needsAllocArrays()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 331
    invoke-virtual {p0}, Lcom/google/common/collect/CompactHashMap;->allocArrays()I

    .line 333
    :cond_0
    invoke-virtual {p0}, Lcom/google/common/collect/CompactHashMap;->delegateOrNull()Ljava/util/Map;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 335
    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    .line 337
    :cond_1
    invoke-direct {p0}, Lcom/google/common/collect/CompactHashMap;->requireEntries()[I

    move-result-object v0

    .line 338
    invoke-direct {p0}, Lcom/google/common/collect/CompactHashMap;->requireKeys()[Ljava/lang/Object;

    move-result-object v1

    .line 339
    invoke-direct {p0}, Lcom/google/common/collect/CompactHashMap;->requireValues()[Ljava/lang/Object;

    move-result-object v2

    .line 341
    iget v4, p0, Lcom/google/common/collect/CompactHashMap;->size:I

    add-int/lit8 v9, v4, 0x1

    .line 343
    invoke-static {p1}, Lcom/google/common/collect/Hashing;->smearedHash(Ljava/lang/Object;)I

    move-result v7

    .line 344
    invoke-direct {p0}, Lcom/google/common/collect/CompactHashMap;->hashTableMask()I

    move-result v3

    and-int v5, v7, v3

    .line 346
    invoke-direct {p0}, Lcom/google/common/collect/CompactHashMap;->requireTable()Ljava/lang/Object;

    move-result-object v6

    invoke-static {v6, v5}, Lcom/google/common/collect/CompactHashing;->tableGet(Ljava/lang/Object;I)I

    move-result v6

    if-nez v6, :cond_3

    if-le v9, v3, :cond_2

    .line 350
    invoke-static {v3}, Lcom/google/common/collect/CompactHashing;->newCapacity(I)I

    move-result v0

    invoke-direct {p0, v3, v0, v7, v4}, Lcom/google/common/collect/CompactHashMap;->resizeTable(IIII)I

    move-result v3

    goto :goto_1

    .line 352
    :cond_2
    invoke-direct {p0}, Lcom/google/common/collect/CompactHashMap;->requireTable()Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0, v5, v9}, Lcom/google/common/collect/CompactHashing;->tableSet(Ljava/lang/Object;II)V

    goto :goto_1

    .line 357
    :cond_3
    invoke-static {v7, v3}, Lcom/google/common/collect/CompactHashing;->getHashPrefix(II)I

    move-result v5

    const/4 v8, 0x0

    :goto_0
    add-int/lit8 v6, v6, -0x1

    .line 361
    aget v10, v0, v6

    .line 362
    invoke-static {v10, v3}, Lcom/google/common/collect/CompactHashing;->getHashPrefix(II)I

    move-result v11

    if-ne v11, v5, :cond_4

    aget-object v11, v1, v6

    .line 363
    invoke-static {p1, v11}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_4

    .line 365
    aget-object p1, v2, v6

    .line 367
    aput-object p2, v2, v6

    .line 368
    invoke-virtual {p0, v6}, Lcom/google/common/collect/CompactHashMap;->accessEntry(I)V

    return-object p1

    .line 371
    :cond_4
    invoke-static {v10, v3}, Lcom/google/common/collect/CompactHashing;->getNext(II)I

    move-result v11

    add-int/lit8 v8, v8, 0x1

    if-nez v11, :cond_7

    const/16 v1, 0x9

    if-lt v8, v1, :cond_5

    .line 376
    invoke-virtual {p0}, Lcom/google/common/collect/CompactHashMap;->convertToHashFloodingResistantImplementation()Ljava/util/Map;

    move-result-object p0

    invoke-interface {p0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :cond_5
    if-le v9, v3, :cond_6

    .line 381
    invoke-static {v3}, Lcom/google/common/collect/CompactHashing;->newCapacity(I)I

    move-result v0

    invoke-direct {p0, v3, v0, v7, v4}, Lcom/google/common/collect/CompactHashMap;->resizeTable(IIII)I

    move-result v3

    goto :goto_1

    .line 383
    :cond_6
    invoke-static {v10, v9, v3}, Lcom/google/common/collect/CompactHashing;->maskCombine(III)I

    move-result v1

    aput v1, v0, v6

    :goto_1
    move v8, v3

    .line 386
    invoke-direct {p0, v9}, Lcom/google/common/collect/CompactHashMap;->resizeMeMaybe(I)V

    move-object v3, p0

    move-object v5, p1

    move-object v6, p2

    .line 387
    invoke-virtual/range {v3 .. v8}, Lcom/google/common/collect/CompactHashMap;->insertEntry(ILjava/lang/Object;Ljava/lang/Object;II)V

    .line 388
    iput v9, p0, Lcom/google/common/collect/CompactHashMap;->size:I

    .line 389
    invoke-virtual {p0}, Lcom/google/common/collect/CompactHashMap;->incrementModCount()V

    const/4 p0, 0x0

    return-object p0

    :cond_7
    move v6, v11

    goto :goto_0
.end method

.method public final putAll(Ljava/util/Map;)V
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "m"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "+TK;+TV;>;)V"
        }
    .end annotation

    .line 497
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 498
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p0, v1, v0}, Lcom/google/common/collect/CompactHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_0
    return-void
.end method

.method public final remove(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "key"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")TV;"
        }
    .end annotation

    .line 526
    invoke-virtual {p0}, Lcom/google/common/collect/CompactHashMap;->delegateOrNull()Ljava/util/Map;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 528
    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    .line 530
    :cond_0
    invoke-direct {p0, p1}, Lcom/google/common/collect/CompactHashMap;->removeHelper(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    .line 531
    sget-object p1, Lcom/google/common/collect/CompactHashMap;->NOT_FOUND:Ljava/lang/Object;

    if-ne p0, p1, :cond_1

    const/4 p0, 0x0

    :cond_1
    return-object p0
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

    .line 420
    invoke-direct {p0}, Lcom/google/common/collect/CompactHashMap;->requireEntries()[I

    move-result-object v0

    invoke-static {v0, p1}, Ljava/util/Arrays;->copyOf([II)[I

    move-result-object v0

    iput-object v0, p0, Lcom/google/common/collect/CompactHashMap;->entries:[I

    .line 421
    invoke-direct {p0}, Lcom/google/common/collect/CompactHashMap;->requireKeys()[Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0, p1}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lcom/google/common/collect/CompactHashMap;->keys:[Ljava/lang/Object;

    .line 422
    invoke-direct {p0}, Lcom/google/common/collect/CompactHashMap;->requireValues()[Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0, p1}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object p1

    iput-object p1, p0, Lcom/google/common/collect/CompactHashMap;->values:[Ljava/lang/Object;

    return-void
.end method

.method public final size()I
    .registers 2

    .line 885
    invoke-virtual {p0}, Lcom/google/common/collect/CompactHashMap;->delegateOrNull()Ljava/util/Map;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 886
    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result p0

    return p0

    :cond_0
    iget p0, p0, Lcom/google/common/collect/CompactHashMap;->size:I

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    .line 637
    invoke-static {p0}, Lcom/google/common/collect/Maps;->toStringImpl(Ljava/util/Map;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public trimToSize()V
    .registers 4

    .line 949
    invoke-virtual {p0}, Lcom/google/common/collect/CompactHashMap;->needsAllocArrays()Z

    move-result v0

    if-nez v0, :cond_2

    .line 952
    invoke-virtual {p0}, Lcom/google/common/collect/CompactHashMap;->delegateOrNull()Ljava/util/Map;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 954
    invoke-virtual {p0}, Lcom/google/common/collect/CompactHashMap;->size()I

    move-result v1

    invoke-virtual {p0, v1}, Lcom/google/common/collect/CompactHashMap;->createHashFloodingResistantDelegate(I)Ljava/util/Map;

    move-result-object v1

    .line 955
    invoke-interface {v1, v0}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 956
    iput-object v1, p0, Lcom/google/common/collect/CompactHashMap;->table:Ljava/lang/Object;

    return-void

    .line 959
    :cond_0
    iget v0, p0, Lcom/google/common/collect/CompactHashMap;->size:I

    .line 960
    invoke-direct {p0}, Lcom/google/common/collect/CompactHashMap;->requireEntries()[I

    move-result-object v1

    array-length v1, v1

    if-ge v0, v1, :cond_1

    .line 961
    invoke-virtual {p0, v0}, Lcom/google/common/collect/CompactHashMap;->resizeEntries(I)V

    .line 963
    :cond_1
    invoke-static {v0}, Lcom/google/common/collect/CompactHashing;->tableSize(I)I

    move-result v0

    .line 964
    invoke-direct {p0}, Lcom/google/common/collect/CompactHashMap;->hashTableMask()I

    move-result v1

    if-ge v0, v1, :cond_2

    const/4 v2, 0x0

    .line 966
    invoke-direct {p0, v1, v0, v2, v2}, Lcom/google/common/collect/CompactHashMap;->resizeTable(IIII)I

    :cond_2
    return-void
.end method

.method public values()Ljava/util/Collection;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "TV;>;"
        }
    .end annotation

    .line 910
    new-instance v0, Lcom/google/common/collect/CompactHashMap$ValuesView;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/google/common/collect/CompactHashMap$ValuesView;-><init>(Lcom/google/common/collect/CompactHashMap;Lcom/google/common/collect/CompactHashMap$1;)V

    return-object v0
.end method

.method final valuesIterator()Ljava/util/Iterator;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "TV;>;"
        }
    .end annotation

    .line 931
    invoke-virtual {p0}, Lcom/google/common/collect/CompactHashMap;->delegateOrNull()Ljava/util/Map;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 933
    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p0

    return-object p0

    .line 935
    :cond_0
    new-instance v0, Lcom/google/common/collect/CompactHashMap$3;

    invoke-direct {v0, p0}, Lcom/google/common/collect/CompactHashMap$3;-><init>(Lcom/google/common/collect/CompactHashMap;)V

    return-object v0
.end method
