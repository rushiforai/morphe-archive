.class public final Lcom/google/common/collect/HashBiMap;
.super Ljava/util/AbstractMap;
.source "HashBiMap.java"

# interfaces
.implements Lcom/google/common/collect/BiMap;
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/common/collect/HashBiMap$KeySet;,
        Lcom/google/common/collect/HashBiMap$ValueSet;,
        Lcom/google/common/collect/HashBiMap$EntrySet;,
        Lcom/google/common/collect/HashBiMap$Inverse;,
        Lcom/google/common/collect/HashBiMap$EntryForValue;,
        Lcom/google/common/collect/HashBiMap$InverseEntrySet;,
        Lcom/google/common/collect/HashBiMap$EntryForKey;,
        Lcom/google/common/collect/HashBiMap$View;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/AbstractMap<",
        "TK;TV;>;",
        "Lcom/google/common/collect/BiMap<",
        "TK;TV;>;",
        "Ljava/io/Serializable;"
    }
.end annotation


# static fields
.field private static final ABSENT:I = -0x1

.field private static final ENDPOINT:I = -0x2


# instance fields
.field private transient entrySet:Ljava/util/Set;
    .annotation runtime Lcom/google/errorprone/annotations/concurrent/LazyInit;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/util/Map$Entry<",
            "TK;TV;>;>;"
        }
    .end annotation
.end field

.field private transient firstInInsertionOrder:I

.field private transient hashTableKToV:[I

.field private transient hashTableVToK:[I

.field private transient inverse:Lcom/google/common/collect/BiMap;
    .annotation runtime Lcom/google/errorprone/annotations/concurrent/LazyInit;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/BiMap<",
            "TV;TK;>;"
        }
    .end annotation
.end field

.field private transient keySet:Ljava/util/Set;
    .annotation runtime Lcom/google/errorprone/annotations/concurrent/LazyInit;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "TK;>;"
        }
    .end annotation
.end field

.field private transient keys:[Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[TK;"
        }
    .end annotation
.end field

.field private transient lastInInsertionOrder:I

.field private transient modCount:I

.field private transient nextInBucketKToV:[I

.field private transient nextInBucketVToK:[I

.field private transient nextInInsertionOrder:[I

.field private transient prevInInsertionOrder:[I

.field private transient size:I

.field private transient valueSet:Ljava/util/Set;
    .annotation runtime Lcom/google/errorprone/annotations/concurrent/LazyInit;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "TV;>;"
        }
    .end annotation
.end field

.field private transient values:[Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[TV;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(I)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "expectedSize"
        }
    .end annotation

    .line 125
    invoke-direct {p0}, Ljava/util/AbstractMap;-><init>()V

    .line 126
    invoke-virtual {p0, p1}, Lcom/google/common/collect/HashBiMap;->init(I)V

    return-void
.end method

.method static synthetic access$000(Lcom/google/common/collect/HashBiMap;)I
    .registers 1

    .line 59
    iget p0, p0, Lcom/google/common/collect/HashBiMap;->firstInInsertionOrder:I

    return p0
.end method

.method static synthetic access$100(Lcom/google/common/collect/HashBiMap;)I
    .registers 1

    .line 59
    iget p0, p0, Lcom/google/common/collect/HashBiMap;->modCount:I

    return p0
.end method

.method static synthetic access$1000(Lcom/google/common/collect/HashBiMap;II)V
    .registers 3

    .line 59
    invoke-direct {p0, p1, p2}, Lcom/google/common/collect/HashBiMap;->removeEntryValueHashKnown(II)V

    return-void
.end method

.method static synthetic access$1100(Lcom/google/common/collect/HashBiMap;Ljava/lang/Object;)I
    .registers 2

    .line 59
    invoke-direct {p0, p1}, Lcom/google/common/collect/HashBiMap;->findEntryByKey(Ljava/lang/Object;)I

    move-result p0

    return p0
.end method

.method static synthetic access$1200(Lcom/google/common/collect/HashBiMap;ILjava/lang/Object;Z)V
    .registers 4

    .line 59
    invoke-direct {p0, p1, p2, p3}, Lcom/google/common/collect/HashBiMap;->replaceValueInEntry(ILjava/lang/Object;Z)V

    return-void
.end method

.method static synthetic access$1300(Lcom/google/common/collect/HashBiMap;Ljava/lang/Object;Ljava/lang/Object;Z)Ljava/lang/Object;
    .registers 4

    .line 59
    invoke-direct {p0, p1, p2, p3}, Lcom/google/common/collect/HashBiMap;->putInverse(Ljava/lang/Object;Ljava/lang/Object;Z)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$1400(Lcom/google/common/collect/HashBiMap;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2

    .line 59
    invoke-direct {p0, p1}, Lcom/google/common/collect/HashBiMap;->removeInverse(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$1502(Lcom/google/common/collect/HashBiMap;Lcom/google/common/collect/BiMap;)Lcom/google/common/collect/BiMap;
    .registers 2

    .line 59
    iput-object p1, p0, Lcom/google/common/collect/HashBiMap;->inverse:Lcom/google/common/collect/BiMap;

    return-object p1
.end method

.method static synthetic access$1600(Lcom/google/common/collect/HashBiMap;Ljava/lang/Object;)I
    .registers 2

    .line 59
    invoke-direct {p0, p1}, Lcom/google/common/collect/HashBiMap;->findEntryByValue(Ljava/lang/Object;)I

    move-result p0

    return p0
.end method

.method static synthetic access$1700(Lcom/google/common/collect/HashBiMap;ILjava/lang/Object;Z)V
    .registers 4

    .line 59
    invoke-direct {p0, p1, p2, p3}, Lcom/google/common/collect/HashBiMap;->replaceKeyInEntry(ILjava/lang/Object;Z)V

    return-void
.end method

.method static synthetic access$200(Lcom/google/common/collect/HashBiMap;)I
    .registers 1

    .line 59
    iget p0, p0, Lcom/google/common/collect/HashBiMap;->size:I

    return p0
.end method

.method static synthetic access$300(Lcom/google/common/collect/HashBiMap;)[I
    .registers 1

    .line 59
    iget-object p0, p0, Lcom/google/common/collect/HashBiMap;->nextInInsertionOrder:[I

    return-object p0
.end method

.method static synthetic access$400(Lcom/google/common/collect/HashBiMap;I)V
    .registers 2

    .line 59
    invoke-direct {p0, p1}, Lcom/google/common/collect/HashBiMap;->removeEntry(I)V

    return-void
.end method

.method static synthetic access$500(Lcom/google/common/collect/HashBiMap;)[Ljava/lang/Object;
    .registers 1

    .line 59
    iget-object p0, p0, Lcom/google/common/collect/HashBiMap;->keys:[Ljava/lang/Object;

    return-object p0
.end method

.method static synthetic access$600(Lcom/google/common/collect/HashBiMap;Ljava/lang/Object;I)I
    .registers 3

    .line 59
    invoke-direct {p0, p1, p2}, Lcom/google/common/collect/HashBiMap;->findEntryByKey(Ljava/lang/Object;I)I

    move-result p0

    return p0
.end method

.method static synthetic access$700(Lcom/google/common/collect/HashBiMap;II)V
    .registers 3

    .line 59
    invoke-direct {p0, p1, p2}, Lcom/google/common/collect/HashBiMap;->removeEntryKeyHashKnown(II)V

    return-void
.end method

.method static synthetic access$800(Lcom/google/common/collect/HashBiMap;)[Ljava/lang/Object;
    .registers 1

    .line 59
    iget-object p0, p0, Lcom/google/common/collect/HashBiMap;->values:[Ljava/lang/Object;

    return-object p0
.end method

.method static synthetic access$900(Lcom/google/common/collect/HashBiMap;Ljava/lang/Object;I)I
    .registers 3

    .line 59
    invoke-direct {p0, p1, p2}, Lcom/google/common/collect/HashBiMap;->findEntryByValue(Ljava/lang/Object;I)I

    move-result p0

    return p0
.end method

.method private bucket(I)I
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "hash"
        }
    .end annotation

    .line 210
    iget-object p0, p0, Lcom/google/common/collect/HashBiMap;->hashTableKToV:[I

    array-length p0, p0

    add-int/lit8 p0, p0, -0x1

    and-int/2addr p1, p0

    return p1
.end method

.method public static create()Lcom/google/common/collect/HashBiMap;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">()",
            "Lcom/google/common/collect/HashBiMap<",
            "TK;TV;>;"
        }
    .end annotation

    const/16 v0, 0x10

    .line 64
    invoke-static {v0}, Lcom/google/common/collect/HashBiMap;->create(I)Lcom/google/common/collect/HashBiMap;

    move-result-object v0

    return-object v0
.end method

.method public static create(I)Lcom/google/common/collect/HashBiMap;
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
            "Lcom/google/common/collect/HashBiMap<",
            "TK;TV;>;"
        }
    .end annotation

    .line 75
    new-instance v0, Lcom/google/common/collect/HashBiMap;

    invoke-direct {v0, p0}, Lcom/google/common/collect/HashBiMap;-><init>(I)V

    return-object v0
.end method

.method public static create(Ljava/util/Map;)Lcom/google/common/collect/HashBiMap;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "map"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Map<",
            "+TK;+TV;>;)",
            "Lcom/google/common/collect/HashBiMap<",
            "TK;TV;>;"
        }
    .end annotation

    .line 84
    invoke-interface {p0}, Ljava/util/Map;->size()I

    move-result v0

    invoke-static {v0}, Lcom/google/common/collect/HashBiMap;->create(I)Lcom/google/common/collect/HashBiMap;

    move-result-object v0

    .line 85
    invoke-virtual {v0, p0}, Lcom/google/common/collect/HashBiMap;->putAll(Ljava/util/Map;)V

    return-object v0
.end method

.method private static createFilledWithAbsent(I)[I
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "size"
        }
    .end annotation

    .line 152
    new-array p0, p0, [I

    const/4 v0, -0x1

    .line 153
    invoke-static {p0, v0}, Ljava/util/Arrays;->fill([II)V

    return-object p0
.end method

.method private deleteFromTableKToV(II)V
    .registers 8
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "entry",
            "keyHash"
        }
    .end annotation

    const/4 v0, -0x1

    if-eq p1, v0, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 428
    :goto_0
    invoke-static {v1}, Lcom/google/common/base/Preconditions;->checkArgument(Z)V

    .line 429
    invoke-direct {p0, p2}, Lcom/google/common/collect/HashBiMap;->bucket(I)I

    move-result p2

    .line 431
    iget-object v1, p0, Lcom/google/common/collect/HashBiMap;->hashTableKToV:[I

    aget v2, v1, p2

    .line 438
    iget-object v3, p0, Lcom/google/common/collect/HashBiMap;->nextInBucketKToV:[I

    if-ne v2, p1, :cond_1

    .line 432
    aget p0, v3, p1

    aput p0, v1, p2

    .line 433
    aput v0, v3, p1

    return-void

    .line 438
    :cond_1
    aget p2, v3, v2

    :goto_1
    move v4, v2

    move v2, p2

    move p2, v4

    if-eq v2, v0, :cond_3

    .line 440
    iget-object v1, p0, Lcom/google/common/collect/HashBiMap;->nextInBucketKToV:[I

    if-ne v2, p1, :cond_2

    .line 442
    aget p0, v1, p1

    aput p0, v1, p2

    .line 443
    aput v0, v1, p1

    return-void

    .line 440
    :cond_2
    aget p2, v1, v2

    goto :goto_1

    .line 448
    :cond_3
    new-instance p2, Ljava/lang/AssertionError;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Expected to find entry with key "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p0, p0, Lcom/google/common/collect/HashBiMap;->keys:[Ljava/lang/Object;

    aget-object p0, p0, p1

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p2, p0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw p2
.end method

.method private deleteFromTableVToK(II)V
    .registers 8
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "entry",
            "valueHash"
        }
    .end annotation

    const/4 v0, -0x1

    if-eq p1, v0, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 456
    :goto_0
    invoke-static {v1}, Lcom/google/common/base/Preconditions;->checkArgument(Z)V

    .line 457
    invoke-direct {p0, p2}, Lcom/google/common/collect/HashBiMap;->bucket(I)I

    move-result p2

    .line 459
    iget-object v1, p0, Lcom/google/common/collect/HashBiMap;->hashTableVToK:[I

    aget v2, v1, p2

    .line 466
    iget-object v3, p0, Lcom/google/common/collect/HashBiMap;->nextInBucketVToK:[I

    if-ne v2, p1, :cond_1

    .line 460
    aget p0, v3, p1

    aput p0, v1, p2

    .line 461
    aput v0, v3, p1

    return-void

    .line 466
    :cond_1
    aget p2, v3, v2

    :goto_1
    move v4, v2

    move v2, p2

    move p2, v4

    if-eq v2, v0, :cond_3

    .line 468
    iget-object v1, p0, Lcom/google/common/collect/HashBiMap;->nextInBucketVToK:[I

    if-ne v2, p1, :cond_2

    .line 470
    aget p0, v1, p1

    aput p0, v1, p2

    .line 471
    aput v0, v1, p1

    return-void

    .line 468
    :cond_2
    aget p2, v1, v2

    goto :goto_1

    .line 476
    :cond_3
    new-instance p2, Ljava/lang/AssertionError;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Expected to find entry with value "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p0, p0, Lcom/google/common/collect/HashBiMap;->values:[Ljava/lang/Object;

    aget-object p0, p0, p1

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p2, p0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw p2
.end method

.method private ensureCapacity(I)V
    .registers 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "minCapacity"
        }
    .end annotation

    .line 174
    iget-object v0, p0, Lcom/google/common/collect/HashBiMap;->nextInBucketKToV:[I

    array-length v1, v0

    if-ge v1, p1, :cond_0

    .line 175
    array-length v0, v0

    .line 176
    invoke-static {v0, p1}, Lcom/google/common/collect/ImmutableCollection$Builder;->expandedCapacity(II)I

    move-result v0

    .line 178
    iget-object v1, p0, Lcom/google/common/collect/HashBiMap;->keys:[Ljava/lang/Object;

    invoke-static {v1, v0}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v1

    iput-object v1, p0, Lcom/google/common/collect/HashBiMap;->keys:[Ljava/lang/Object;

    .line 179
    iget-object v1, p0, Lcom/google/common/collect/HashBiMap;->values:[Ljava/lang/Object;

    invoke-static {v1, v0}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v1

    iput-object v1, p0, Lcom/google/common/collect/HashBiMap;->values:[Ljava/lang/Object;

    .line 180
    iget-object v1, p0, Lcom/google/common/collect/HashBiMap;->nextInBucketKToV:[I

    invoke-static {v1, v0}, Lcom/google/common/collect/HashBiMap;->expandAndFillWithAbsent([II)[I

    move-result-object v1

    iput-object v1, p0, Lcom/google/common/collect/HashBiMap;->nextInBucketKToV:[I

    .line 181
    iget-object v1, p0, Lcom/google/common/collect/HashBiMap;->nextInBucketVToK:[I

    invoke-static {v1, v0}, Lcom/google/common/collect/HashBiMap;->expandAndFillWithAbsent([II)[I

    move-result-object v1

    iput-object v1, p0, Lcom/google/common/collect/HashBiMap;->nextInBucketVToK:[I

    .line 182
    iget-object v1, p0, Lcom/google/common/collect/HashBiMap;->prevInInsertionOrder:[I

    invoke-static {v1, v0}, Lcom/google/common/collect/HashBiMap;->expandAndFillWithAbsent([II)[I

    move-result-object v1

    iput-object v1, p0, Lcom/google/common/collect/HashBiMap;->prevInInsertionOrder:[I

    .line 183
    iget-object v1, p0, Lcom/google/common/collect/HashBiMap;->nextInInsertionOrder:[I

    invoke-static {v1, v0}, Lcom/google/common/collect/HashBiMap;->expandAndFillWithAbsent([II)[I

    move-result-object v0

    iput-object v0, p0, Lcom/google/common/collect/HashBiMap;->nextInInsertionOrder:[I

    .line 186
    :cond_0
    iget-object v0, p0, Lcom/google/common/collect/HashBiMap;->hashTableKToV:[I

    array-length v0, v0

    if-ge v0, p1, :cond_1

    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    .line 187
    invoke-static {p1, v0, v1}, Lcom/google/common/collect/Hashing;->closedTableSize(ID)I

    move-result p1

    .line 188
    invoke-static {p1}, Lcom/google/common/collect/HashBiMap;->createFilledWithAbsent(I)[I

    move-result-object v0

    iput-object v0, p0, Lcom/google/common/collect/HashBiMap;->hashTableKToV:[I

    .line 189
    invoke-static {p1}, Lcom/google/common/collect/HashBiMap;->createFilledWithAbsent(I)[I

    move-result-object p1

    iput-object p1, p0, Lcom/google/common/collect/HashBiMap;->hashTableVToK:[I

    const/4 p1, 0x0

    .line 191
    :goto_0
    iget v0, p0, Lcom/google/common/collect/HashBiMap;->size:I

    if-ge p1, v0, :cond_1

    .line 192
    iget-object v0, p0, Lcom/google/common/collect/HashBiMap;->keys:[Ljava/lang/Object;

    aget-object v0, v0, p1

    invoke-static {v0}, Lcom/google/common/collect/Hashing;->smearedHash(Ljava/lang/Object;)I

    move-result v0

    .line 193
    invoke-direct {p0, v0}, Lcom/google/common/collect/HashBiMap;->bucket(I)I

    move-result v0

    .line 194
    iget-object v1, p0, Lcom/google/common/collect/HashBiMap;->nextInBucketKToV:[I

    iget-object v2, p0, Lcom/google/common/collect/HashBiMap;->hashTableKToV:[I

    aget v3, v2, v0

    aput v3, v1, p1

    .line 195
    aput p1, v2, v0

    .line 197
    iget-object v0, p0, Lcom/google/common/collect/HashBiMap;->values:[Ljava/lang/Object;

    aget-object v0, v0, p1

    invoke-static {v0}, Lcom/google/common/collect/Hashing;->smearedHash(Ljava/lang/Object;)I

    move-result v0

    .line 198
    invoke-direct {p0, v0}, Lcom/google/common/collect/HashBiMap;->bucket(I)I

    move-result v0

    .line 199
    iget-object v1, p0, Lcom/google/common/collect/HashBiMap;->nextInBucketVToK:[I

    iget-object v2, p0, Lcom/google/common/collect/HashBiMap;->hashTableVToK:[I

    aget v3, v2, v0

    aput v3, v1, p1

    .line 200
    aput p1, v2, v0

    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method private static expandAndFillWithAbsent([II)[I
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "array",
            "newSize"
        }
    .end annotation

    .line 159
    array-length v0, p0

    .line 160
    invoke-static {p0, p1}, Ljava/util/Arrays;->copyOf([II)[I

    move-result-object p0

    const/4 v1, -0x1

    .line 161
    invoke-static {p0, v0, p1, v1}, Ljava/util/Arrays;->fill([IIII)V

    return-object p0
.end method

.method private findEntry(Ljava/lang/Object;I[I[I[Ljava/lang/Object;)I
    .registers 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "o",
            "oHash",
            "hashTable",
            "nextInBucket",
            "array"
        }
    .end annotation

    .line 244
    invoke-direct {p0, p2}, Lcom/google/common/collect/HashBiMap;->bucket(I)I

    move-result p0

    aget p0, p3, p0

    :goto_0
    const/4 p2, -0x1

    if-eq p0, p2, :cond_1

    .line 245
    aget-object p2, p5, p0

    invoke-static {p2, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_0

    return p0

    .line 244
    :cond_0
    aget p0, p4, p0

    goto :goto_0

    :cond_1
    return p2
.end method

.method private findEntryByKey(Ljava/lang/Object;)I
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "key"
        }
    .end annotation

    .line 215
    invoke-static {p1}, Lcom/google/common/collect/Hashing;->smearedHash(Ljava/lang/Object;)I

    move-result v0

    invoke-direct {p0, p1, v0}, Lcom/google/common/collect/HashBiMap;->findEntryByKey(Ljava/lang/Object;I)I

    move-result p0

    return p0
.end method

.method private findEntryByKey(Ljava/lang/Object;I)I
    .registers 9
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "key",
            "keyHash"
        }
    .end annotation

    .line 222
    iget-object v3, p0, Lcom/google/common/collect/HashBiMap;->hashTableKToV:[I

    iget-object v4, p0, Lcom/google/common/collect/HashBiMap;->nextInBucketKToV:[I

    iget-object v5, p0, Lcom/google/common/collect/HashBiMap;->keys:[Ljava/lang/Object;

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    invoke-direct/range {v0 .. v5}, Lcom/google/common/collect/HashBiMap;->findEntry(Ljava/lang/Object;I[I[I[Ljava/lang/Object;)I

    move-result p0

    return p0
.end method

.method private findEntryByValue(Ljava/lang/Object;)I
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "value"
        }
    .end annotation

    .line 227
    invoke-static {p1}, Lcom/google/common/collect/Hashing;->smearedHash(Ljava/lang/Object;)I

    move-result v0

    invoke-direct {p0, p1, v0}, Lcom/google/common/collect/HashBiMap;->findEntryByValue(Ljava/lang/Object;I)I

    move-result p0

    return p0
.end method

.method private findEntryByValue(Ljava/lang/Object;I)I
    .registers 9
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "value",
            "valueHash"
        }
    .end annotation

    .line 235
    iget-object v3, p0, Lcom/google/common/collect/HashBiMap;->hashTableVToK:[I

    iget-object v4, p0, Lcom/google/common/collect/HashBiMap;->nextInBucketVToK:[I

    iget-object v5, p0, Lcom/google/common/collect/HashBiMap;->values:[Ljava/lang/Object;

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    invoke-direct/range {v0 .. v5}, Lcom/google/common/collect/HashBiMap;->findEntry(Ljava/lang/Object;I[I[I[Ljava/lang/Object;)I

    move-result p0

    return p0
.end method

.method private insertIntoTableKToV(II)V
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "entry",
            "keyHash"
        }
    .end annotation

    const/4 v0, -0x1

    if-eq p1, v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 406
    :goto_0
    invoke-static {v0}, Lcom/google/common/base/Preconditions;->checkArgument(Z)V

    .line 407
    invoke-direct {p0, p2}, Lcom/google/common/collect/HashBiMap;->bucket(I)I

    move-result p2

    .line 408
    iget-object v0, p0, Lcom/google/common/collect/HashBiMap;->nextInBucketKToV:[I

    iget-object p0, p0, Lcom/google/common/collect/HashBiMap;->hashTableKToV:[I

    aget v1, p0, p2

    aput v1, v0, p1

    .line 409
    aput p1, p0, p2

    return-void
.end method

.method private insertIntoTableVToK(II)V
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "entry",
            "valueHash"
        }
    .end annotation

    const/4 v0, -0x1

    if-eq p1, v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 417
    :goto_0
    invoke-static {v0}, Lcom/google/common/base/Preconditions;->checkArgument(Z)V

    .line 418
    invoke-direct {p0, p2}, Lcom/google/common/collect/HashBiMap;->bucket(I)I

    move-result p2

    .line 419
    iget-object v0, p0, Lcom/google/common/collect/HashBiMap;->nextInBucketVToK:[I

    iget-object p0, p0, Lcom/google/common/collect/HashBiMap;->hashTableVToK:[I

    aget v1, p0, p2

    aput v1, v0, p1

    .line 420
    aput p1, p0, p2

    return-void
.end method

.method private moveEntryToIndex(II)V
    .registers 9
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "src",
            "dest"
        }
    .end annotation

    if-ne p1, p2, :cond_0

    return-void

    .line 621
    :cond_0
    iget-object v0, p0, Lcom/google/common/collect/HashBiMap;->prevInInsertionOrder:[I

    aget v0, v0, p1

    .line 622
    iget-object v1, p0, Lcom/google/common/collect/HashBiMap;->nextInInsertionOrder:[I

    aget v1, v1, p1

    .line 623
    invoke-direct {p0, v0, p2}, Lcom/google/common/collect/HashBiMap;->setSucceeds(II)V

    .line 624
    invoke-direct {p0, p2, v1}, Lcom/google/common/collect/HashBiMap;->setSucceeds(II)V

    .line 626
    iget-object v0, p0, Lcom/google/common/collect/HashBiMap;->keys:[Ljava/lang/Object;

    aget-object v1, v0, p1

    .line 627
    iget-object v2, p0, Lcom/google/common/collect/HashBiMap;->values:[Ljava/lang/Object;

    aget-object v3, v2, p1

    .line 629
    aput-object v1, v0, p2

    .line 630
    aput-object v3, v2, p2

    .line 633
    invoke-static {v1}, Lcom/google/common/collect/Hashing;->smearedHash(Ljava/lang/Object;)I

    move-result v0

    .line 634
    invoke-direct {p0, v0}, Lcom/google/common/collect/HashBiMap;->bucket(I)I

    move-result v0

    .line 635
    iget-object v1, p0, Lcom/google/common/collect/HashBiMap;->hashTableKToV:[I

    aget v2, v1, v0

    if-ne v2, p1, :cond_1

    .line 636
    aput p2, v1, v0

    goto :goto_1

    .line 639
    :cond_1
    iget-object v0, p0, Lcom/google/common/collect/HashBiMap;->nextInBucketKToV:[I

    aget v0, v0, v2

    :goto_0
    move v5, v2

    move v2, v0

    move v0, v5

    .line 641
    iget-object v1, p0, Lcom/google/common/collect/HashBiMap;->nextInBucketKToV:[I

    if-ne v2, p1, :cond_4

    .line 643
    aput p2, v1, v0

    .line 649
    :goto_1
    iget-object v0, p0, Lcom/google/common/collect/HashBiMap;->nextInBucketKToV:[I

    aget v1, v0, p1

    aput v1, v0, p2

    const/4 v4, -0x1

    .line 650
    aput v4, v0, p1

    .line 653
    invoke-static {v3}, Lcom/google/common/collect/Hashing;->smearedHash(Ljava/lang/Object;)I

    move-result v0

    .line 654
    invoke-direct {p0, v0}, Lcom/google/common/collect/HashBiMap;->bucket(I)I

    move-result v0

    .line 655
    iget-object v1, p0, Lcom/google/common/collect/HashBiMap;->hashTableVToK:[I

    aget v2, v1, v0

    if-ne v2, p1, :cond_2

    .line 656
    aput p2, v1, v0

    goto :goto_3

    .line 659
    :cond_2
    iget-object v0, p0, Lcom/google/common/collect/HashBiMap;->nextInBucketVToK:[I

    aget v0, v0, v2

    :goto_2
    move v5, v2

    move v2, v0

    move v0, v5

    .line 661
    iget-object v1, p0, Lcom/google/common/collect/HashBiMap;->nextInBucketVToK:[I

    if-ne v2, p1, :cond_3

    .line 663
    aput p2, v1, v0

    .line 669
    :goto_3
    iget-object p0, p0, Lcom/google/common/collect/HashBiMap;->nextInBucketVToK:[I

    aget v0, p0, p1

    aput v0, p0, p2

    .line 670
    aput v4, p0, p1

    return-void

    .line 661
    :cond_3
    aget v0, v1, v2

    goto :goto_2

    .line 641
    :cond_4
    aget v0, v1, v2

    goto :goto_0
.end method

.method private put(Ljava/lang/Object;Ljava/lang/Object;Z)Ljava/lang/Object;
    .registers 9
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "key",
            "value",
            "force"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;Z)TV;"
        }
    .end annotation

    .line 290
    invoke-static {p1}, Lcom/google/common/collect/Hashing;->smearedHash(Ljava/lang/Object;)I

    move-result v0

    .line 291
    invoke-direct {p0, p1, v0}, Lcom/google/common/collect/HashBiMap;->findEntryByKey(Ljava/lang/Object;I)I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_1

    .line 293
    iget-object p1, p0, Lcom/google/common/collect/HashBiMap;->values:[Ljava/lang/Object;

    aget-object p1, p1, v1

    .line 294
    invoke-static {p1, p2}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-object p2

    .line 297
    :cond_0
    invoke-direct {p0, v1, p2, p3}, Lcom/google/common/collect/HashBiMap;->replaceValueInEntry(ILjava/lang/Object;Z)V

    return-object p1

    .line 302
    :cond_1
    invoke-static {p2}, Lcom/google/common/collect/Hashing;->smearedHash(Ljava/lang/Object;)I

    move-result v1

    .line 303
    invoke-direct {p0, p2, v1}, Lcom/google/common/collect/HashBiMap;->findEntryByValue(Ljava/lang/Object;I)I

    move-result v3

    const/4 v4, 0x1

    if-eqz p3, :cond_2

    if-eq v3, v2, :cond_4

    .line 306
    invoke-direct {p0, v3, v1}, Lcom/google/common/collect/HashBiMap;->removeEntryValueHashKnown(II)V

    goto :goto_1

    :cond_2
    if-ne v3, v2, :cond_3

    move p3, v4

    goto :goto_0

    :cond_3
    const/4 p3, 0x0

    .line 309
    :goto_0
    const-string v2, "Value already present: %s"

    invoke-static {p3, v2, p2}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;Ljava/lang/Object;)V

    .line 312
    :cond_4
    :goto_1
    iget p3, p0, Lcom/google/common/collect/HashBiMap;->size:I

    add-int/2addr p3, v4

    invoke-direct {p0, p3}, Lcom/google/common/collect/HashBiMap;->ensureCapacity(I)V

    .line 313
    iget-object p3, p0, Lcom/google/common/collect/HashBiMap;->keys:[Ljava/lang/Object;

    iget v2, p0, Lcom/google/common/collect/HashBiMap;->size:I

    aput-object p1, p3, v2

    .line 314
    iget-object p1, p0, Lcom/google/common/collect/HashBiMap;->values:[Ljava/lang/Object;

    aput-object p2, p1, v2

    .line 316
    invoke-direct {p0, v2, v0}, Lcom/google/common/collect/HashBiMap;->insertIntoTableKToV(II)V

    .line 317
    iget p1, p0, Lcom/google/common/collect/HashBiMap;->size:I

    invoke-direct {p0, p1, v1}, Lcom/google/common/collect/HashBiMap;->insertIntoTableVToK(II)V

    .line 319
    iget p1, p0, Lcom/google/common/collect/HashBiMap;->lastInInsertionOrder:I

    iget p2, p0, Lcom/google/common/collect/HashBiMap;->size:I

    invoke-direct {p0, p1, p2}, Lcom/google/common/collect/HashBiMap;->setSucceeds(II)V

    .line 320
    iget p1, p0, Lcom/google/common/collect/HashBiMap;->size:I

    const/4 p2, -0x2

    invoke-direct {p0, p1, p2}, Lcom/google/common/collect/HashBiMap;->setSucceeds(II)V

    .line 321
    iget p1, p0, Lcom/google/common/collect/HashBiMap;->size:I

    add-int/2addr p1, v4

    iput p1, p0, Lcom/google/common/collect/HashBiMap;->size:I

    .line 322
    iget p1, p0, Lcom/google/common/collect/HashBiMap;->modCount:I

    add-int/2addr p1, v4

    iput p1, p0, Lcom/google/common/collect/HashBiMap;->modCount:I

    const/4 p0, 0x0

    return-object p0
.end method

.method private putInverse(Ljava/lang/Object;Ljava/lang/Object;Z)Ljava/lang/Object;
    .registers 10
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "value",
            "key",
            "force"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TV;TK;Z)TK;"
        }
    .end annotation

    .line 335
    invoke-static {p1}, Lcom/google/common/collect/Hashing;->smearedHash(Ljava/lang/Object;)I

    move-result v0

    .line 336
    invoke-direct {p0, p1, v0}, Lcom/google/common/collect/HashBiMap;->findEntryByValue(Ljava/lang/Object;I)I

    move-result v1

    const/4 v2, 0x1

    const/4 v3, -0x1

    if-eq v1, v3, :cond_1

    .line 338
    iget-object p1, p0, Lcom/google/common/collect/HashBiMap;->keys:[Ljava/lang/Object;

    aget-object p1, p1, v1

    .line 339
    invoke-static {p1, p2}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-object p2

    .line 342
    :cond_0
    invoke-direct {p0, v1, p2, p3}, Lcom/google/common/collect/HashBiMap;->replaceKeyInEntry(ILjava/lang/Object;Z)V

    .line 343
    iget p2, p0, Lcom/google/common/collect/HashBiMap;->modCount:I

    add-int/2addr p2, v2

    iput p2, p0, Lcom/google/common/collect/HashBiMap;->modCount:I

    return-object p1

    .line 348
    :cond_1
    iget v1, p0, Lcom/google/common/collect/HashBiMap;->lastInInsertionOrder:I

    .line 349
    invoke-static {p2}, Lcom/google/common/collect/Hashing;->smearedHash(Ljava/lang/Object;)I

    move-result v4

    .line 350
    invoke-direct {p0, p2, v4}, Lcom/google/common/collect/HashBiMap;->findEntryByKey(Ljava/lang/Object;I)I

    move-result v5

    if-eqz p3, :cond_2

    if-eq v5, v3, :cond_4

    .line 353
    iget-object p3, p0, Lcom/google/common/collect/HashBiMap;->prevInInsertionOrder:[I

    aget v1, p3, v5

    .line 354
    invoke-direct {p0, v5, v4}, Lcom/google/common/collect/HashBiMap;->removeEntryKeyHashKnown(II)V

    .line 355
    iget p3, p0, Lcom/google/common/collect/HashBiMap;->size:I

    if-ne v1, p3, :cond_4

    move v1, v5

    goto :goto_1

    :cond_2
    if-ne v5, v3, :cond_3

    move p3, v2

    goto :goto_0

    :cond_3
    const/4 p3, 0x0

    .line 360
    :goto_0
    const-string v3, "Key already present: %s"

    invoke-static {p3, v3, p2}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;Ljava/lang/Object;)V

    .line 367
    :cond_4
    :goto_1
    iget p3, p0, Lcom/google/common/collect/HashBiMap;->size:I

    add-int/2addr p3, v2

    invoke-direct {p0, p3}, Lcom/google/common/collect/HashBiMap;->ensureCapacity(I)V

    .line 368
    iget-object p3, p0, Lcom/google/common/collect/HashBiMap;->keys:[Ljava/lang/Object;

    iget v3, p0, Lcom/google/common/collect/HashBiMap;->size:I

    aput-object p2, p3, v3

    .line 369
    iget-object p2, p0, Lcom/google/common/collect/HashBiMap;->values:[Ljava/lang/Object;

    aput-object p1, p2, v3

    .line 371
    invoke-direct {p0, v3, v4}, Lcom/google/common/collect/HashBiMap;->insertIntoTableKToV(II)V

    .line 372
    iget p1, p0, Lcom/google/common/collect/HashBiMap;->size:I

    invoke-direct {p0, p1, v0}, Lcom/google/common/collect/HashBiMap;->insertIntoTableVToK(II)V

    const/4 p1, -0x2

    if-ne v1, p1, :cond_5

    .line 375
    iget p1, p0, Lcom/google/common/collect/HashBiMap;->firstInInsertionOrder:I

    goto :goto_2

    :cond_5
    iget-object p1, p0, Lcom/google/common/collect/HashBiMap;->nextInInsertionOrder:[I

    aget p1, p1, v1

    .line 376
    :goto_2
    iget p2, p0, Lcom/google/common/collect/HashBiMap;->size:I

    invoke-direct {p0, v1, p2}, Lcom/google/common/collect/HashBiMap;->setSucceeds(II)V

    .line 377
    iget p2, p0, Lcom/google/common/collect/HashBiMap;->size:I

    invoke-direct {p0, p2, p1}, Lcom/google/common/collect/HashBiMap;->setSucceeds(II)V

    .line 378
    iget p1, p0, Lcom/google/common/collect/HashBiMap;->size:I

    add-int/2addr p1, v2

    iput p1, p0, Lcom/google/common/collect/HashBiMap;->size:I

    .line 379
    iget p1, p0, Lcom/google/common/collect/HashBiMap;->modCount:I

    add-int/2addr p1, v2

    iput p1, p0, Lcom/google/common/collect/HashBiMap;->modCount:I

    const/4 p0, 0x0

    return-object p0
.end method

.method private readObject(Ljava/io/ObjectInputStream;)V
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
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .line 1184
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->defaultReadObject()V

    .line 1185
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readInt()I

    move-result v0

    const/16 v1, 0x10

    .line 1186
    invoke-virtual {p0, v1}, Lcom/google/common/collect/HashBiMap;->init(I)V

    .line 1187
    invoke-static {p0, p1, v0}, Lcom/google/common/collect/Serialization;->populateMap(Ljava/util/Map;Ljava/io/ObjectInputStream;I)V

    return-void
.end method

.method private removeEntry(I)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "entry"
        }
    .end annotation

    .line 583
    iget-object v0, p0, Lcom/google/common/collect/HashBiMap;->keys:[Ljava/lang/Object;

    aget-object v0, v0, p1

    invoke-static {v0}, Lcom/google/common/collect/Hashing;->smearedHash(Ljava/lang/Object;)I

    move-result v0

    invoke-direct {p0, p1, v0}, Lcom/google/common/collect/HashBiMap;->removeEntryKeyHashKnown(II)V

    return-void
.end method

.method private removeEntry(III)V
    .registers 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "entry",
            "keyHash",
            "valueHash"
        }
    .end annotation

    const/4 v0, -0x1

    const/4 v1, 0x1

    if-eq p1, v0, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 588
    :goto_0
    invoke-static {v0}, Lcom/google/common/base/Preconditions;->checkArgument(Z)V

    .line 589
    invoke-direct {p0, p1, p2}, Lcom/google/common/collect/HashBiMap;->deleteFromTableKToV(II)V

    .line 590
    invoke-direct {p0, p1, p3}, Lcom/google/common/collect/HashBiMap;->deleteFromTableVToK(II)V

    .line 592
    iget-object p2, p0, Lcom/google/common/collect/HashBiMap;->prevInInsertionOrder:[I

    aget p2, p2, p1

    .line 593
    iget-object p3, p0, Lcom/google/common/collect/HashBiMap;->nextInInsertionOrder:[I

    aget p3, p3, p1

    .line 594
    invoke-direct {p0, p2, p3}, Lcom/google/common/collect/HashBiMap;->setSucceeds(II)V

    .line 596
    iget p2, p0, Lcom/google/common/collect/HashBiMap;->size:I

    sub-int/2addr p2, v1

    invoke-direct {p0, p2, p1}, Lcom/google/common/collect/HashBiMap;->moveEntryToIndex(II)V

    .line 597
    iget-object p1, p0, Lcom/google/common/collect/HashBiMap;->keys:[Ljava/lang/Object;

    iget p2, p0, Lcom/google/common/collect/HashBiMap;->size:I

    add-int/lit8 p3, p2, -0x1

    const/4 v0, 0x0

    aput-object v0, p1, p3

    .line 598
    iget-object p1, p0, Lcom/google/common/collect/HashBiMap;->values:[Ljava/lang/Object;

    add-int/lit8 p3, p2, -0x1

    aput-object v0, p1, p3

    sub-int/2addr p2, v1

    .line 599
    iput p2, p0, Lcom/google/common/collect/HashBiMap;->size:I

    .line 600
    iget p1, p0, Lcom/google/common/collect/HashBiMap;->modCount:I

    add-int/2addr p1, v1

    iput p1, p0, Lcom/google/common/collect/HashBiMap;->modCount:I

    return-void
.end method

.method private removeEntryKeyHashKnown(II)V
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "entry",
            "keyHash"
        }
    .end annotation

    .line 605
    iget-object v0, p0, Lcom/google/common/collect/HashBiMap;->values:[Ljava/lang/Object;

    aget-object v0, v0, p1

    invoke-static {v0}, Lcom/google/common/collect/Hashing;->smearedHash(Ljava/lang/Object;)I

    move-result v0

    invoke-direct {p0, p1, p2, v0}, Lcom/google/common/collect/HashBiMap;->removeEntry(III)V

    return-void
.end method

.method private removeEntryValueHashKnown(II)V
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "entry",
            "valueHash"
        }
    .end annotation

    .line 610
    iget-object v0, p0, Lcom/google/common/collect/HashBiMap;->keys:[Ljava/lang/Object;

    aget-object v0, v0, p1

    invoke-static {v0}, Lcom/google/common/collect/Hashing;->smearedHash(Ljava/lang/Object;)I

    move-result v0

    invoke-direct {p0, p1, v0, p2}, Lcom/google/common/collect/HashBiMap;->removeEntry(III)V

    return-void
.end method

.method private removeInverse(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "value"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")TK;"
        }
    .end annotation

    .line 570
    invoke-static {p1}, Lcom/google/common/collect/Hashing;->smearedHash(Ljava/lang/Object;)I

    move-result v0

    .line 571
    invoke-direct {p0, p1, v0}, Lcom/google/common/collect/HashBiMap;->findEntryByValue(Ljava/lang/Object;I)I

    move-result p1

    const/4 v1, -0x1

    if-ne p1, v1, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 575
    :cond_0
    iget-object v1, p0, Lcom/google/common/collect/HashBiMap;->keys:[Ljava/lang/Object;

    aget-object v1, v1, p1

    .line 576
    invoke-direct {p0, p1, v0}, Lcom/google/common/collect/HashBiMap;->removeEntryValueHashKnown(II)V

    return-object v1
.end method

.method private replaceKeyInEntry(ILjava/lang/Object;Z)V
    .registers 8
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "entry",
            "newKey",
            "force"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITK;Z)V"
        }
    .end annotation

    const/4 v0, -0x1

    if-eq p1, v0, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 509
    :goto_0
    invoke-static {v1}, Lcom/google/common/base/Preconditions;->checkArgument(Z)V

    .line 510
    invoke-static {p2}, Lcom/google/common/collect/Hashing;->smearedHash(Ljava/lang/Object;)I

    move-result v1

    .line 511
    invoke-direct {p0, p2, v1}, Lcom/google/common/collect/HashBiMap;->findEntryByKey(Ljava/lang/Object;I)I

    move-result v2

    .line 513
    iget v3, p0, Lcom/google/common/collect/HashBiMap;->lastInInsertionOrder:I

    if-eq v2, v0, :cond_2

    if-eqz p3, :cond_1

    .line 517
    iget-object p3, p0, Lcom/google/common/collect/HashBiMap;->prevInInsertionOrder:[I

    aget v3, p3, v2

    .line 518
    iget-object p3, p0, Lcom/google/common/collect/HashBiMap;->nextInInsertionOrder:[I

    aget p3, p3, v2

    .line 519
    invoke-direct {p0, v2, v1}, Lcom/google/common/collect/HashBiMap;->removeEntryKeyHashKnown(II)V

    .line 520
    iget v0, p0, Lcom/google/common/collect/HashBiMap;->size:I

    if-ne p1, v0, :cond_3

    move p1, v2

    goto :goto_1

    .line 524
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    new-instance p1, Ljava/lang/StringBuilder;

    const-string p3, "Key already present in map: "

    invoke-direct {p1, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_2
    const/4 p3, -0x2

    .line 528
    :cond_3
    :goto_1
    iget v0, p0, Lcom/google/common/collect/HashBiMap;->size:I

    if-ne v3, v0, :cond_4

    move v3, v2

    :cond_4
    if-ne v3, p1, :cond_5

    .line 532
    iget-object v1, p0, Lcom/google/common/collect/HashBiMap;->prevInInsertionOrder:[I

    aget v3, v1, p1

    :cond_5
    if-eq p3, v0, :cond_6

    move v2, p3

    :cond_6
    if-ne v2, p1, :cond_7

    .line 539
    iget-object p3, p0, Lcom/google/common/collect/HashBiMap;->nextInInsertionOrder:[I

    aget v2, p3, p1

    .line 542
    :cond_7
    iget-object p3, p0, Lcom/google/common/collect/HashBiMap;->prevInInsertionOrder:[I

    aget p3, p3, p1

    .line 543
    iget-object v0, p0, Lcom/google/common/collect/HashBiMap;->nextInInsertionOrder:[I

    aget v0, v0, p1

    .line 544
    invoke-direct {p0, p3, v0}, Lcom/google/common/collect/HashBiMap;->setSucceeds(II)V

    .line 546
    iget-object p3, p0, Lcom/google/common/collect/HashBiMap;->keys:[Ljava/lang/Object;

    aget-object p3, p3, p1

    invoke-static {p3}, Lcom/google/common/collect/Hashing;->smearedHash(Ljava/lang/Object;)I

    move-result p3

    invoke-direct {p0, p1, p3}, Lcom/google/common/collect/HashBiMap;->deleteFromTableKToV(II)V

    .line 547
    iget-object p3, p0, Lcom/google/common/collect/HashBiMap;->keys:[Ljava/lang/Object;

    aput-object p2, p3, p1

    .line 548
    invoke-static {p2}, Lcom/google/common/collect/Hashing;->smearedHash(Ljava/lang/Object;)I

    move-result p2

    invoke-direct {p0, p1, p2}, Lcom/google/common/collect/HashBiMap;->insertIntoTableKToV(II)V

    .line 551
    invoke-direct {p0, v3, p1}, Lcom/google/common/collect/HashBiMap;->setSucceeds(II)V

    .line 552
    invoke-direct {p0, p1, v2}, Lcom/google/common/collect/HashBiMap;->setSucceeds(II)V

    return-void
.end method

.method private replaceValueInEntry(ILjava/lang/Object;Z)V
    .registers 7
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "entry",
            "newValue",
            "force"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITV;Z)V"
        }
    .end annotation

    const/4 v0, -0x1

    if-eq p1, v0, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 484
    :goto_0
    invoke-static {v1}, Lcom/google/common/base/Preconditions;->checkArgument(Z)V

    .line 485
    invoke-static {p2}, Lcom/google/common/collect/Hashing;->smearedHash(Ljava/lang/Object;)I

    move-result v1

    .line 486
    invoke-direct {p0, p2, v1}, Lcom/google/common/collect/HashBiMap;->findEntryByValue(Ljava/lang/Object;I)I

    move-result v2

    if-eq v2, v0, :cond_2

    if-eqz p3, :cond_1

    .line 489
    invoke-direct {p0, v2, v1}, Lcom/google/common/collect/HashBiMap;->removeEntryValueHashKnown(II)V

    .line 490
    iget p3, p0, Lcom/google/common/collect/HashBiMap;->size:I

    if-ne p1, p3, :cond_2

    move p1, v2

    goto :goto_1

    .line 494
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    new-instance p1, Ljava/lang/StringBuilder;

    const-string p3, "Value already present in map: "

    invoke-direct {p1, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 498
    :cond_2
    :goto_1
    iget-object p3, p0, Lcom/google/common/collect/HashBiMap;->values:[Ljava/lang/Object;

    aget-object p3, p3, p1

    invoke-static {p3}, Lcom/google/common/collect/Hashing;->smearedHash(Ljava/lang/Object;)I

    move-result p3

    invoke-direct {p0, p1, p3}, Lcom/google/common/collect/HashBiMap;->deleteFromTableVToK(II)V

    .line 499
    iget-object p3, p0, Lcom/google/common/collect/HashBiMap;->values:[Ljava/lang/Object;

    aput-object p2, p3, p1

    .line 500
    invoke-direct {p0, p1, v1}, Lcom/google/common/collect/HashBiMap;->insertIntoTableVToK(II)V

    return-void
.end method

.method private setSucceeds(II)V
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "prev",
            "next"
        }
    .end annotation

    const/4 v0, -0x2

    if-ne p1, v0, :cond_0

    .line 390
    iput p2, p0, Lcom/google/common/collect/HashBiMap;->firstInInsertionOrder:I

    goto :goto_0

    .line 392
    :cond_0
    iget-object v1, p0, Lcom/google/common/collect/HashBiMap;->nextInInsertionOrder:[I

    aput p2, v1, p1

    :goto_0
    if-ne p2, v0, :cond_1

    .line 395
    iput p1, p0, Lcom/google/common/collect/HashBiMap;->lastInInsertionOrder:I

    return-void

    .line 397
    :cond_1
    iget-object p0, p0, Lcom/google/common/collect/HashBiMap;->prevInInsertionOrder:[I

    aput p1, p0, p2

    return-void
.end method

.method private writeObject(Ljava/io/ObjectOutputStream;)V
    .registers 2
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

    .line 1177
    invoke-virtual {p1}, Ljava/io/ObjectOutputStream;->defaultWriteObject()V

    .line 1178
    invoke-static {p0, p1}, Lcom/google/common/collect/Serialization;->writeMap(Ljava/util/Map;Ljava/io/ObjectOutputStream;)V

    return-void
.end method


# virtual methods
.method public clear()V
    .registers 5

    .line 675
    iget-object v0, p0, Lcom/google/common/collect/HashBiMap;->keys:[Ljava/lang/Object;

    iget v1, p0, Lcom/google/common/collect/HashBiMap;->size:I

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-static {v0, v2, v1, v3}, Ljava/util/Arrays;->fill([Ljava/lang/Object;IILjava/lang/Object;)V

    .line 676
    iget-object v0, p0, Lcom/google/common/collect/HashBiMap;->values:[Ljava/lang/Object;

    iget v1, p0, Lcom/google/common/collect/HashBiMap;->size:I

    invoke-static {v0, v2, v1, v3}, Ljava/util/Arrays;->fill([Ljava/lang/Object;IILjava/lang/Object;)V

    .line 677
    iget-object v0, p0, Lcom/google/common/collect/HashBiMap;->hashTableKToV:[I

    const/4 v1, -0x1

    invoke-static {v0, v1}, Ljava/util/Arrays;->fill([II)V

    .line 678
    iget-object v0, p0, Lcom/google/common/collect/HashBiMap;->hashTableVToK:[I

    invoke-static {v0, v1}, Ljava/util/Arrays;->fill([II)V

    .line 679
    iget-object v0, p0, Lcom/google/common/collect/HashBiMap;->nextInBucketKToV:[I

    iget v3, p0, Lcom/google/common/collect/HashBiMap;->size:I

    invoke-static {v0, v2, v3, v1}, Ljava/util/Arrays;->fill([IIII)V

    .line 680
    iget-object v0, p0, Lcom/google/common/collect/HashBiMap;->nextInBucketVToK:[I

    iget v3, p0, Lcom/google/common/collect/HashBiMap;->size:I

    invoke-static {v0, v2, v3, v1}, Ljava/util/Arrays;->fill([IIII)V

    .line 681
    iget-object v0, p0, Lcom/google/common/collect/HashBiMap;->prevInInsertionOrder:[I

    iget v3, p0, Lcom/google/common/collect/HashBiMap;->size:I

    invoke-static {v0, v2, v3, v1}, Ljava/util/Arrays;->fill([IIII)V

    .line 682
    iget-object v0, p0, Lcom/google/common/collect/HashBiMap;->nextInInsertionOrder:[I

    iget v3, p0, Lcom/google/common/collect/HashBiMap;->size:I

    invoke-static {v0, v2, v3, v1}, Ljava/util/Arrays;->fill([IIII)V

    .line 683
    iput v2, p0, Lcom/google/common/collect/HashBiMap;->size:I

    const/4 v0, -0x2

    .line 684
    iput v0, p0, Lcom/google/common/collect/HashBiMap;->firstInInsertionOrder:I

    .line 685
    iput v0, p0, Lcom/google/common/collect/HashBiMap;->lastInInsertionOrder:I

    .line 686
    iget v0, p0, Lcom/google/common/collect/HashBiMap;->modCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/google/common/collect/HashBiMap;->modCount:I

    return-void
.end method

.method public containsKey(Ljava/lang/Object;)Z
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "key"
        }
    .end annotation

    .line 254
    invoke-direct {p0, p1}, Lcom/google/common/collect/HashBiMap;->findEntryByKey(Ljava/lang/Object;)I

    move-result p0

    const/4 p1, -0x1

    if-eq p0, p1, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public containsValue(Ljava/lang/Object;)Z
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "value"
        }
    .end annotation

    .line 269
    invoke-direct {p0, p1}, Lcom/google/common/collect/HashBiMap;->findEntryByValue(Ljava/lang/Object;)I

    move-result p0

    const/4 p1, -0x1

    if-eq p0, p1, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public entrySet()Ljava/util/Set;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/util/Map$Entry<",
            "TK;TV;>;>;"
        }
    .end annotation

    .line 849
    iget-object v0, p0, Lcom/google/common/collect/HashBiMap;->entrySet:Ljava/util/Set;

    if-nez v0, :cond_0

    .line 851
    new-instance v0, Lcom/google/common/collect/HashBiMap$EntrySet;

    invoke-direct {v0, p0}, Lcom/google/common/collect/HashBiMap$EntrySet;-><init>(Lcom/google/common/collect/HashBiMap;)V

    iput-object v0, p0, Lcom/google/common/collect/HashBiMap;->entrySet:Ljava/util/Set;

    :cond_0
    return-object v0
.end method

.method public forcePut(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4
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

    const/4 v0, 0x1

    .line 329
    invoke-direct {p0, p1, p2, v0}, Lcom/google/common/collect/HashBiMap;->put(Ljava/lang/Object;Ljava/lang/Object;Z)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public get(Ljava/lang/Object;)Ljava/lang/Object;
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

    .line 274
    invoke-direct {p0, p1}, Lcom/google/common/collect/HashBiMap;->findEntryByKey(Ljava/lang/Object;)I

    move-result p1

    const/4 v0, -0x1

    if-ne p1, v0, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 275
    :cond_0
    iget-object p0, p0, Lcom/google/common/collect/HashBiMap;->values:[Ljava/lang/Object;

    aget-object p0, p0, p1

    return-object p0
.end method

.method getInverse(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "value"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")TK;"
        }
    .end annotation

    .line 279
    invoke-direct {p0, p1}, Lcom/google/common/collect/HashBiMap;->findEntryByValue(Ljava/lang/Object;)I

    move-result p1

    const/4 v0, -0x1

    if-ne p1, v0, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 280
    :cond_0
    iget-object p0, p0, Lcom/google/common/collect/HashBiMap;->keys:[Ljava/lang/Object;

    aget-object p0, p0, p1

    return-object p0
.end method

.method init(I)V
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "expectedSize"
        }
    .end annotation

    .line 131
    const-string v0, "expectedSize"

    invoke-static {p1, v0}, Lcom/google/common/collect/CollectPreconditions;->checkNonnegative(ILjava/lang/String;)I

    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    .line 132
    invoke-static {p1, v0, v1}, Lcom/google/common/collect/Hashing;->closedTableSize(ID)I

    move-result v0

    const/4 v1, 0x0

    .line 133
    iput v1, p0, Lcom/google/common/collect/HashBiMap;->size:I

    .line 135
    new-array v1, p1, [Ljava/lang/Object;

    iput-object v1, p0, Lcom/google/common/collect/HashBiMap;->keys:[Ljava/lang/Object;

    .line 136
    new-array v1, p1, [Ljava/lang/Object;

    iput-object v1, p0, Lcom/google/common/collect/HashBiMap;->values:[Ljava/lang/Object;

    .line 138
    invoke-static {v0}, Lcom/google/common/collect/HashBiMap;->createFilledWithAbsent(I)[I

    move-result-object v1

    iput-object v1, p0, Lcom/google/common/collect/HashBiMap;->hashTableKToV:[I

    .line 139
    invoke-static {v0}, Lcom/google/common/collect/HashBiMap;->createFilledWithAbsent(I)[I

    move-result-object v0

    iput-object v0, p0, Lcom/google/common/collect/HashBiMap;->hashTableVToK:[I

    .line 140
    invoke-static {p1}, Lcom/google/common/collect/HashBiMap;->createFilledWithAbsent(I)[I

    move-result-object v0

    iput-object v0, p0, Lcom/google/common/collect/HashBiMap;->nextInBucketKToV:[I

    .line 141
    invoke-static {p1}, Lcom/google/common/collect/HashBiMap;->createFilledWithAbsent(I)[I

    move-result-object v0

    iput-object v0, p0, Lcom/google/common/collect/HashBiMap;->nextInBucketVToK:[I

    const/4 v0, -0x2

    .line 143
    iput v0, p0, Lcom/google/common/collect/HashBiMap;->firstInInsertionOrder:I

    .line 144
    iput v0, p0, Lcom/google/common/collect/HashBiMap;->lastInInsertionOrder:I

    .line 146
    invoke-static {p1}, Lcom/google/common/collect/HashBiMap;->createFilledWithAbsent(I)[I

    move-result-object v0

    iput-object v0, p0, Lcom/google/common/collect/HashBiMap;->prevInInsertionOrder:[I

    .line 147
    invoke-static {p1}, Lcom/google/common/collect/HashBiMap;->createFilledWithAbsent(I)[I

    move-result-object p1

    iput-object p1, p0, Lcom/google/common/collect/HashBiMap;->nextInInsertionOrder:[I

    return-void
.end method

.method public inverse()Lcom/google/common/collect/BiMap;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/BiMap<",
            "TV;TK;>;"
        }
    .end annotation

    .line 969
    iget-object v0, p0, Lcom/google/common/collect/HashBiMap;->inverse:Lcom/google/common/collect/BiMap;

    if-nez v0, :cond_0

    .line 971
    new-instance v0, Lcom/google/common/collect/HashBiMap$Inverse;

    invoke-direct {v0, p0}, Lcom/google/common/collect/HashBiMap$Inverse;-><init>(Lcom/google/common/collect/HashBiMap;)V

    iput-object v0, p0, Lcom/google/common/collect/HashBiMap;->inverse:Lcom/google/common/collect/BiMap;

    :cond_0
    return-object v0
.end method

.method public keySet()Ljava/util/Set;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "TK;>;"
        }
    .end annotation

    .line 767
    iget-object v0, p0, Lcom/google/common/collect/HashBiMap;->keySet:Ljava/util/Set;

    if-nez v0, :cond_0

    .line 769
    new-instance v0, Lcom/google/common/collect/HashBiMap$KeySet;

    invoke-direct {v0, p0}, Lcom/google/common/collect/HashBiMap$KeySet;-><init>(Lcom/google/common/collect/HashBiMap;)V

    iput-object v0, p0, Lcom/google/common/collect/HashBiMap;->keySet:Ljava/util/Set;

    :cond_0
    return-object v0
.end method

.method public put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4
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

    const/4 v0, 0x0

    .line 286
    invoke-direct {p0, p1, p2, v0}, Lcom/google/common/collect/HashBiMap;->put(Ljava/lang/Object;Ljava/lang/Object;Z)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public remove(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4
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

    .line 558
    invoke-static {p1}, Lcom/google/common/collect/Hashing;->smearedHash(Ljava/lang/Object;)I

    move-result v0

    .line 559
    invoke-direct {p0, p1, v0}, Lcom/google/common/collect/HashBiMap;->findEntryByKey(Ljava/lang/Object;I)I

    move-result p1

    const/4 v1, -0x1

    if-ne p1, v1, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 563
    :cond_0
    iget-object v1, p0, Lcom/google/common/collect/HashBiMap;->values:[Ljava/lang/Object;

    aget-object v1, v1, p1

    .line 564
    invoke-direct {p0, p1, v0}, Lcom/google/common/collect/HashBiMap;->removeEntryKeyHashKnown(II)V

    return-object v1
.end method

.method public size()I
    .registers 1

    .line 167
    iget p0, p0, Lcom/google/common/collect/HashBiMap;->size:I

    return p0
.end method

.method public bridge synthetic values()Ljava/util/Collection;
    .registers 1

    .line 58
    invoke-virtual {p0}, Lcom/google/common/collect/HashBiMap;->values()Ljava/util/Set;

    move-result-object p0

    return-object p0
.end method

.method public values()Ljava/util/Set;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "TV;>;"
        }
    .end annotation

    .line 808
    iget-object v0, p0, Lcom/google/common/collect/HashBiMap;->valueSet:Ljava/util/Set;

    if-nez v0, :cond_0

    .line 810
    new-instance v0, Lcom/google/common/collect/HashBiMap$ValueSet;

    invoke-direct {v0, p0}, Lcom/google/common/collect/HashBiMap$ValueSet;-><init>(Lcom/google/common/collect/HashBiMap;)V

    iput-object v0, p0, Lcom/google/common/collect/HashBiMap;->valueSet:Ljava/util/Set;

    :cond_0
    return-object v0
.end method
