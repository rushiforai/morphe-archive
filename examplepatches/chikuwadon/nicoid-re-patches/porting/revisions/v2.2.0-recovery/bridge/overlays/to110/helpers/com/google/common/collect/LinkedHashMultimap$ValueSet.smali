.class final Lcom/google/common/collect/LinkedHashMultimap$ValueSet;
.super Lcom/google/common/collect/Sets$ImprovedAbstractSet;
.source "LinkedHashMultimap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/LinkedHashMultimap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "ValueSet"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/common/collect/Sets$ImprovedAbstractSet<",
        "TV;>;"
    }
.end annotation


# instance fields
.field private firstEntry:Lcom/google/common/collect/LinkedHashMultimap$ValueEntry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/LinkedHashMultimap$ValueEntry<",
            "TK;TV;>;"
        }
    .end annotation
.end field

.field private hashTable:Ljava/lang/Object;

.field private final key:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TK;"
        }
    .end annotation
.end field

.field private lastEntry:Lcom/google/common/collect/LinkedHashMultimap$ValueEntry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/LinkedHashMultimap$ValueEntry<",
            "TK;TV;>;"
        }
    .end annotation
.end field

.field private modCount:I

.field private size:I

.field final synthetic this$0:Lcom/google/common/collect/LinkedHashMultimap;


# direct methods
.method constructor <init>(Lcom/google/common/collect/LinkedHashMultimap;Ljava/lang/Object;I)V
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x0,
            0x0
        }
        names = {
            "this$0",
            "key",
            "expectedValues"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;I)V"
        }
    .end annotation

    .line 292
    iput-object p1, p0, Lcom/google/common/collect/LinkedHashMultimap$ValueSet;->this$0:Lcom/google/common/collect/LinkedHashMultimap;

    invoke-direct {p0}, Lcom/google/common/collect/Sets$ImprovedAbstractSet;-><init>()V

    const/4 p1, 0x0

    .line 286
    iput p1, p0, Lcom/google/common/collect/LinkedHashMultimap$ValueSet;->size:I

    .line 287
    iput p1, p0, Lcom/google/common/collect/LinkedHashMultimap$ValueSet;->modCount:I

    .line 293
    iput-object p2, p0, Lcom/google/common/collect/LinkedHashMultimap$ValueSet;->key:Ljava/lang/Object;

    const-wide/high16 p1, 0x3ff0000000000000L    # 1.0

    .line 295
    invoke-static {p3, p1, p2}, Lcom/google/common/collect/Hashing;->closedTableSize(ID)I

    move-result p1

    .line 298
    new-array p1, p1, [Lcom/google/common/collect/LinkedHashMultimap$ValueEntry;

    .line 299
    iput-object p1, p0, Lcom/google/common/collect/LinkedHashMultimap$ValueSet;->hashTable:Ljava/lang/Object;

    return-void
.end method

.method static synthetic access$400(Lcom/google/common/collect/LinkedHashMultimap$ValueSet;)Lcom/google/common/collect/LinkedHashMultimap$ValueEntry;
    .registers 1

    .line 272
    iget-object p0, p0, Lcom/google/common/collect/LinkedHashMultimap$ValueSet;->firstEntry:Lcom/google/common/collect/LinkedHashMultimap$ValueEntry;

    return-object p0
.end method

.method static synthetic access$500(Lcom/google/common/collect/LinkedHashMultimap$ValueSet;)I
    .registers 1

    .line 272
    iget p0, p0, Lcom/google/common/collect/LinkedHashMultimap$ValueSet;->modCount:I

    return p0
.end method

.method private addEntryExceptToHashTable(Ljava/lang/Object;ILcom/google/common/collect/LinkedHashMultimap$ValueEntry;)Lcom/google/common/collect/LinkedHashMultimap$ValueEntry;
    .registers 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "value",
            "smearedHash",
            "nextInValueBucket"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TV;I",
            "Lcom/google/common/collect/LinkedHashMultimap$ValueEntry<",
            "TK;TV;>;)",
            "Lcom/google/common/collect/LinkedHashMultimap$ValueEntry<",
            "TK;TV;>;"
        }
    .end annotation

    .line 355
    new-instance v0, Lcom/google/common/collect/LinkedHashMultimap$ValueEntry;

    iget-object v1, p0, Lcom/google/common/collect/LinkedHashMultimap$ValueSet;->key:Ljava/lang/Object;

    invoke-direct {v0, v1, p1, p2, p3}, Lcom/google/common/collect/LinkedHashMultimap$ValueEntry;-><init>(Ljava/lang/Object;Ljava/lang/Object;ILcom/google/common/collect/LinkedHashMultimap$ValueEntry;)V

    .line 356
    iget-object p1, p0, Lcom/google/common/collect/LinkedHashMultimap$ValueSet;->lastEntry:Lcom/google/common/collect/LinkedHashMultimap$ValueEntry;

    invoke-direct {p0, p1, v0}, Lcom/google/common/collect/LinkedHashMultimap$ValueSet;->succeedsInValueSet(Lcom/google/common/collect/LinkedHashMultimap$ValueEntry;Lcom/google/common/collect/LinkedHashMultimap$ValueEntry;)V

    .line 357
    iput-object v0, p0, Lcom/google/common/collect/LinkedHashMultimap$ValueSet;->lastEntry:Lcom/google/common/collect/LinkedHashMultimap$ValueEntry;

    .line 358
    iget-object p1, p0, Lcom/google/common/collect/LinkedHashMultimap$ValueSet;->this$0:Lcom/google/common/collect/LinkedHashMultimap;

    # getter for: Lcom/google/common/collect/LinkedHashMultimap;->multimapIterationChain:Lcom/google/common/collect/LinkedHashMultimap$MultimapIterationChain;
    invoke-static {p1}, Lcom/google/common/collect/LinkedHashMultimap;->access$300(Lcom/google/common/collect/LinkedHashMultimap;)Lcom/google/common/collect/LinkedHashMultimap$MultimapIterationChain;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/google/common/collect/LinkedHashMultimap$MultimapIterationChain;->append(Lcom/google/common/collect/LinkedHashMultimap$ValueEntry;)V

    .line 359
    iget p1, p0, Lcom/google/common/collect/LinkedHashMultimap$ValueSet;->size:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lcom/google/common/collect/LinkedHashMultimap$ValueSet;->size:I

    .line 360
    iget p1, p0, Lcom/google/common/collect/LinkedHashMultimap$ValueSet;->modCount:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lcom/google/common/collect/LinkedHashMultimap$ValueSet;->modCount:I

    return-object v0
.end method

.method private deleteEntryExceptFromHashTable(Lcom/google/common/collect/LinkedHashMultimap$ValueEntry;)V
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "entry"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/LinkedHashMultimap$ValueEntry<",
            "TK;TV;>;)V"
        }
    .end annotation

    .line 344
    # getter for: Lcom/google/common/collect/LinkedHashMultimap$ValueEntry;->predecessorInValueSet:Lcom/google/common/collect/LinkedHashMultimap$ValueEntry;
    invoke-static {p1}, Lcom/google/common/collect/LinkedHashMultimap$ValueEntry;->access$200(Lcom/google/common/collect/LinkedHashMultimap$ValueEntry;)Lcom/google/common/collect/LinkedHashMultimap$ValueEntry;

    move-result-object v0

    # getter for: Lcom/google/common/collect/LinkedHashMultimap$ValueEntry;->successorInValueSet:Lcom/google/common/collect/LinkedHashMultimap$ValueEntry;
    invoke-static {p1}, Lcom/google/common/collect/LinkedHashMultimap$ValueEntry;->access$100(Lcom/google/common/collect/LinkedHashMultimap$ValueEntry;)Lcom/google/common/collect/LinkedHashMultimap$ValueEntry;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/google/common/collect/LinkedHashMultimap$ValueSet;->succeedsInValueSet(Lcom/google/common/collect/LinkedHashMultimap$ValueEntry;Lcom/google/common/collect/LinkedHashMultimap$ValueEntry;)V

    .line 345
    iget-object v0, p0, Lcom/google/common/collect/LinkedHashMultimap$ValueSet;->this$0:Lcom/google/common/collect/LinkedHashMultimap;

    # getter for: Lcom/google/common/collect/LinkedHashMultimap;->multimapIterationChain:Lcom/google/common/collect/LinkedHashMultimap$MultimapIterationChain;
    invoke-static {v0}, Lcom/google/common/collect/LinkedHashMultimap;->access$300(Lcom/google/common/collect/LinkedHashMultimap;)Lcom/google/common/collect/LinkedHashMultimap$MultimapIterationChain;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/common/collect/LinkedHashMultimap$MultimapIterationChain;->delete(Lcom/google/common/collect/LinkedHashMultimap$ValueEntry;)V

    .line 347
    iget p1, p0, Lcom/google/common/collect/LinkedHashMultimap$ValueSet;->size:I

    add-int/lit8 p1, p1, -0x1

    iput p1, p0, Lcom/google/common/collect/LinkedHashMultimap$ValueSet;->size:I

    .line 348
    iget p1, p0, Lcom/google/common/collect/LinkedHashMultimap$ValueSet;->modCount:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lcom/google/common/collect/LinkedHashMultimap$ValueSet;->modCount:I

    return-void
.end method

.method private rehashIfNecessary([Lcom/google/common/collect/LinkedHashMultimap$ValueEntry;)V
    .registers 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "oldHashTable"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lcom/google/common/collect/LinkedHashMultimap$ValueEntry<",
            "TK;TV;>;)V"
        }
    .end annotation

    .line 469
    iget v0, p0, Lcom/google/common/collect/LinkedHashMultimap$ValueSet;->size:I

    array-length v1, p1

    const-wide/high16 v2, 0x3ff0000000000000L    # 1.0

    invoke-static {v0, v1, v2, v3}, Lcom/google/common/collect/Hashing;->needsResizing(IID)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 471
    array-length p1, p1

    shl-int/lit8 p1, p1, 0x1

    new-array v0, p1, [Lcom/google/common/collect/LinkedHashMultimap$ValueEntry;

    .line 473
    iput-object v0, p0, Lcom/google/common/collect/LinkedHashMultimap$ValueSet;->hashTable:Ljava/lang/Object;

    add-int/lit8 p1, p1, -0x1

    .line 475
    iget-object p0, p0, Lcom/google/common/collect/LinkedHashMultimap$ValueSet;->firstEntry:Lcom/google/common/collect/LinkedHashMultimap$ValueEntry;

    :goto_0
    if-eqz p0, :cond_0

    .line 478
    iget v1, p0, Lcom/google/common/collect/LinkedHashMultimap$ValueEntry;->smearedValueHash:I

    and-int/2addr v1, p1

    .line 479
    aget-object v2, v0, v1

    iput-object v2, p0, Lcom/google/common/collect/LinkedHashMultimap$ValueEntry;->nextInValueBucket:Lcom/google/common/collect/LinkedHashMultimap$ValueEntry;

    .line 480
    aput-object p0, v0, v1

    .line 477
    # getter for: Lcom/google/common/collect/LinkedHashMultimap$ValueEntry;->successorInValueSet:Lcom/google/common/collect/LinkedHashMultimap$ValueEntry;
    invoke-static {p0}, Lcom/google/common/collect/LinkedHashMultimap$ValueEntry;->access$100(Lcom/google/common/collect/LinkedHashMultimap$ValueEntry;)Lcom/google/common/collect/LinkedHashMultimap$ValueEntry;

    move-result-object p0

    goto :goto_0

    :cond_0
    return-void
.end method

.method private succeedsInValueSet(Lcom/google/common/collect/LinkedHashMultimap$ValueEntry;Lcom/google/common/collect/LinkedHashMultimap$ValueEntry;)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "pred",
            "succ"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/LinkedHashMultimap$ValueEntry<",
            "TK;TV;>;",
            "Lcom/google/common/collect/LinkedHashMultimap$ValueEntry<",
            "TK;TV;>;)V"
        }
    .end annotation

    if-nez p1, :cond_0

    .line 332
    iput-object p2, p0, Lcom/google/common/collect/LinkedHashMultimap$ValueSet;->firstEntry:Lcom/google/common/collect/LinkedHashMultimap$ValueEntry;

    goto :goto_0

    .line 334
    :cond_0
    # setter for: Lcom/google/common/collect/LinkedHashMultimap$ValueEntry;->successorInValueSet:Lcom/google/common/collect/LinkedHashMultimap$ValueEntry;
    invoke-static {p1, p2}, Lcom/google/common/collect/LinkedHashMultimap$ValueEntry;->access$102(Lcom/google/common/collect/LinkedHashMultimap$ValueEntry;Lcom/google/common/collect/LinkedHashMultimap$ValueEntry;)Lcom/google/common/collect/LinkedHashMultimap$ValueEntry;

    :goto_0
    if-nez p2, :cond_1

    .line 337
    iput-object p1, p0, Lcom/google/common/collect/LinkedHashMultimap$ValueSet;->lastEntry:Lcom/google/common/collect/LinkedHashMultimap$ValueEntry;

    return-void

    .line 339
    :cond_1
    # setter for: Lcom/google/common/collect/LinkedHashMultimap$ValueEntry;->predecessorInValueSet:Lcom/google/common/collect/LinkedHashMultimap$ValueEntry;
    invoke-static {p2, p1}, Lcom/google/common/collect/LinkedHashMultimap$ValueEntry;->access$202(Lcom/google/common/collect/LinkedHashMultimap$ValueEntry;Lcom/google/common/collect/LinkedHashMultimap$ValueEntry;)Lcom/google/common/collect/LinkedHashMultimap$ValueEntry;

    return-void
.end method


# virtual methods
.method public add(Ljava/lang/Object;)Z
    .registers 11
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
            "(TV;)Z"
        }
    .end annotation

    .line 434
    invoke-static {p1}, Lcom/google/common/collect/Hashing;->smearedHash(Ljava/lang/Object;)I

    move-result v0

    .line 436
    invoke-virtual {p0}, Lcom/google/common/collect/LinkedHashMultimap$ValueSet;->delegateOrNull()Ljava/util/Map;

    move-result-object v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eqz v1, :cond_1

    .line 438
    invoke-interface {v1, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    return v2

    :cond_0
    const/4 v2, 0x0

    .line 442
    invoke-direct {p0, p1, v0, v2}, Lcom/google/common/collect/LinkedHashMultimap$ValueSet;->addEntryExceptToHashTable(Ljava/lang/Object;ILcom/google/common/collect/LinkedHashMultimap$ValueEntry;)Lcom/google/common/collect/LinkedHashMultimap$ValueEntry;

    move-result-object p0

    .line 443
    invoke-interface {v1, p1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return v3

    .line 447
    :cond_1
    invoke-virtual {p0}, Lcom/google/common/collect/LinkedHashMultimap$ValueSet;->hashTableArray()[Lcom/google/common/collect/LinkedHashMultimap$ValueEntry;

    move-result-object v1

    .line 448
    array-length v4, v1

    sub-int/2addr v4, v3

    and-int/2addr v4, v0

    .line 450
    aget-object v5, v1, v4

    move v7, v2

    move-object v6, v5

    :goto_0
    if-eqz v6, :cond_3

    .line 453
    invoke-virtual {v6, p1, v0}, Lcom/google/common/collect/LinkedHashMultimap$ValueEntry;->matchesValue(Ljava/lang/Object;I)Z

    move-result v8

    if-eqz v8, :cond_2

    return v2

    :cond_2
    add-int/lit8 v7, v7, 0x1

    .line 452
    iget-object v6, v6, Lcom/google/common/collect/LinkedHashMultimap$ValueEntry;->nextInValueBucket:Lcom/google/common/collect/LinkedHashMultimap$ValueEntry;

    goto :goto_0

    .line 459
    :cond_3
    invoke-direct {p0, p1, v0, v5}, Lcom/google/common/collect/LinkedHashMultimap$ValueSet;->addEntryExceptToHashTable(Ljava/lang/Object;ILcom/google/common/collect/LinkedHashMultimap$ValueEntry;)Lcom/google/common/collect/LinkedHashMultimap$ValueEntry;

    move-result-object p1

    aput-object p1, v1, v4

    const/16 p1, 0x9

    if-lt v7, p1, :cond_4

    .line 461
    invoke-virtual {p0}, Lcom/google/common/collect/LinkedHashMultimap$ValueSet;->convertToHashFloodingResistantImplementation()V

    goto :goto_1

    .line 463
    :cond_4
    invoke-direct {p0, v1}, Lcom/google/common/collect/LinkedHashMultimap$ValueSet;->rehashIfNecessary([Lcom/google/common/collect/LinkedHashMultimap$ValueEntry;)V

    :goto_1
    return v3
.end method

.method public clear()V
    .registers 4

    .line 521
    invoke-virtual {p0}, Lcom/google/common/collect/LinkedHashMultimap$ValueSet;->delegateOrNull()Ljava/util/Map;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 523
    invoke-interface {v0}, Ljava/util/Map;->clear()V

    goto :goto_0

    .line 525
    :cond_0
    invoke-virtual {p0}, Lcom/google/common/collect/LinkedHashMultimap$ValueSet;->hashTableArray()[Lcom/google/common/collect/LinkedHashMultimap$ValueEntry;

    move-result-object v0

    invoke-static {v0, v1}, Ljava/util/Arrays;->fill([Ljava/lang/Object;Ljava/lang/Object;)V

    :goto_0
    const/4 v0, 0x0

    .line 527
    iput v0, p0, Lcom/google/common/collect/LinkedHashMultimap$ValueSet;->size:I

    .line 528
    iget-object v0, p0, Lcom/google/common/collect/LinkedHashMultimap$ValueSet;->firstEntry:Lcom/google/common/collect/LinkedHashMultimap$ValueEntry;

    :goto_1
    if-eqz v0, :cond_1

    .line 529
    iget-object v2, p0, Lcom/google/common/collect/LinkedHashMultimap$ValueSet;->this$0:Lcom/google/common/collect/LinkedHashMultimap;

    # getter for: Lcom/google/common/collect/LinkedHashMultimap;->multimapIterationChain:Lcom/google/common/collect/LinkedHashMultimap$MultimapIterationChain;
    invoke-static {v2}, Lcom/google/common/collect/LinkedHashMultimap;->access$300(Lcom/google/common/collect/LinkedHashMultimap;)Lcom/google/common/collect/LinkedHashMultimap$MultimapIterationChain;

    move-result-object v2

    invoke-virtual {v2, v0}, Lcom/google/common/collect/LinkedHashMultimap$MultimapIterationChain;->delete(Lcom/google/common/collect/LinkedHashMultimap$ValueEntry;)V

    .line 528
    # getter for: Lcom/google/common/collect/LinkedHashMultimap$ValueEntry;->successorInValueSet:Lcom/google/common/collect/LinkedHashMultimap$ValueEntry;
    invoke-static {v0}, Lcom/google/common/collect/LinkedHashMultimap$ValueEntry;->access$100(Lcom/google/common/collect/LinkedHashMultimap$ValueEntry;)Lcom/google/common/collect/LinkedHashMultimap$ValueEntry;

    move-result-object v0

    goto :goto_1

    .line 540
    :cond_1
    iput-object v1, p0, Lcom/google/common/collect/LinkedHashMultimap$ValueSet;->firstEntry:Lcom/google/common/collect/LinkedHashMultimap$ValueEntry;

    .line 541
    iput-object v1, p0, Lcom/google/common/collect/LinkedHashMultimap$ValueSet;->lastEntry:Lcom/google/common/collect/LinkedHashMultimap$ValueEntry;

    .line 542
    iget v0, p0, Lcom/google/common/collect/LinkedHashMultimap$ValueSet;->modCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/google/common/collect/LinkedHashMultimap$ValueSet;->modCount:I

    return-void
.end method

.method public contains(Ljava/lang/Object;)Z
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "o"
        }
    .end annotation

    .line 415
    invoke-virtual {p0}, Lcom/google/common/collect/LinkedHashMultimap$ValueSet;->delegateOrNull()Ljava/util/Map;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 417
    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result p0

    return p0

    .line 420
    :cond_0
    invoke-virtual {p0}, Lcom/google/common/collect/LinkedHashMultimap$ValueSet;->hashTableArray()[Lcom/google/common/collect/LinkedHashMultimap$ValueEntry;

    move-result-object p0

    .line 421
    invoke-static {p1}, Lcom/google/common/collect/Hashing;->smearedHash(Ljava/lang/Object;)I

    move-result v0

    .line 422
    array-length v1, p0

    const/4 v2, 0x1

    sub-int/2addr v1, v2

    and-int/2addr v1, v0

    aget-object p0, p0, v1

    :goto_0
    if-eqz p0, :cond_2

    .line 425
    invoke-virtual {p0, p1, v0}, Lcom/google/common/collect/LinkedHashMultimap$ValueEntry;->matchesValue(Ljava/lang/Object;I)Z

    move-result v1

    if-eqz v1, :cond_1

    return v2

    .line 424
    :cond_1
    iget-object p0, p0, Lcom/google/common/collect/LinkedHashMultimap$ValueEntry;->nextInValueBucket:Lcom/google/common/collect/LinkedHashMultimap$ValueEntry;

    goto :goto_0

    :cond_2
    const/4 p0, 0x0

    return p0
.end method

.method convertToHashFloodingResistantImplementation()V
    .registers 4

    .line 321
    new-instance v0, Ljava/util/HashMap;

    invoke-virtual {p0}, Lcom/google/common/collect/LinkedHashMultimap$ValueSet;->hashTableArray()[Lcom/google/common/collect/LinkedHashMultimap$ValueEntry;

    move-result-object v1

    array-length v1, v1

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-direct {v0, v1, v2}, Ljava/util/HashMap;-><init>(IF)V

    .line 322
    iget-object v1, p0, Lcom/google/common/collect/LinkedHashMultimap$ValueSet;->firstEntry:Lcom/google/common/collect/LinkedHashMultimap$ValueEntry;

    :goto_0
    if-eqz v1, :cond_0

    .line 323
    invoke-virtual {v1}, Lcom/google/common/collect/LinkedHashMultimap$ValueEntry;->getValue()Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v2, 0x0

    .line 324
    iput-object v2, v1, Lcom/google/common/collect/LinkedHashMultimap$ValueEntry;->nextInValueBucket:Lcom/google/common/collect/LinkedHashMultimap$ValueEntry;

    .line 322
    # getter for: Lcom/google/common/collect/LinkedHashMultimap$ValueEntry;->successorInValueSet:Lcom/google/common/collect/LinkedHashMultimap$ValueEntry;
    invoke-static {v1}, Lcom/google/common/collect/LinkedHashMultimap$ValueEntry;->access$100(Lcom/google/common/collect/LinkedHashMultimap$ValueEntry;)Lcom/google/common/collect/LinkedHashMultimap$ValueEntry;

    move-result-object v1

    goto :goto_0

    .line 326
    :cond_0
    iput-object v0, p0, Lcom/google/common/collect/LinkedHashMultimap$ValueSet;->hashTable:Ljava/lang/Object;

    return-void
.end method

.method delegateOrNull()Ljava/util/Map;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "TV;",
            "Lcom/google/common/collect/LinkedHashMultimap$ValueEntry<",
            "TK;TV;>;>;"
        }
    .end annotation

    .line 306
    iget-object p0, p0, Lcom/google/common/collect/LinkedHashMultimap$ValueSet;->hashTable:Ljava/lang/Object;

    instance-of v0, p0, Ljava/util/Map;

    if-eqz v0, :cond_0

    .line 307
    check-cast p0, Ljava/util/Map;

    return-object p0

    :cond_0
    const/4 p0, 0x0

    return-object p0
.end method

.method hashTableArray()[Lcom/google/common/collect/LinkedHashMultimap$ValueEntry;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()[",
            "Lcom/google/common/collect/LinkedHashMultimap$ValueEntry<",
            "TK;TV;>;"
        }
    .end annotation

    .line 316
    iget-object p0, p0, Lcom/google/common/collect/LinkedHashMultimap$ValueSet;->hashTable:Ljava/lang/Object;

    check-cast p0, [Lcom/google/common/collect/LinkedHashMultimap$ValueEntry;

    return-object p0
.end method

.method public iterator()Ljava/util/Iterator;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "TV;>;"
        }
    .end annotation

    .line 366
    new-instance v0, Lcom/google/common/collect/LinkedHashMultimap$ValueSet$1;

    invoke-direct {v0, p0}, Lcom/google/common/collect/LinkedHashMultimap$ValueSet$1;-><init>(Lcom/google/common/collect/LinkedHashMultimap$ValueSet;)V

    return-object v0
.end method

.method public remove(Ljava/lang/Object;)Z
    .registers 11
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "o"
        }
    .end annotation

    .line 488
    invoke-virtual {p0}, Lcom/google/common/collect/LinkedHashMultimap$ValueSet;->delegateOrNull()Ljava/util/Map;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_1

    .line 490
    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/common/collect/LinkedHashMultimap$ValueEntry;

    if-eqz p1, :cond_0

    .line 492
    invoke-direct {p0, p1}, Lcom/google/common/collect/LinkedHashMultimap$ValueSet;->deleteEntryExceptFromHashTable(Lcom/google/common/collect/LinkedHashMultimap$ValueEntry;)V

    return v2

    :cond_0
    return v1

    .line 498
    :cond_1
    invoke-virtual {p0}, Lcom/google/common/collect/LinkedHashMultimap$ValueSet;->hashTableArray()[Lcom/google/common/collect/LinkedHashMultimap$ValueEntry;

    move-result-object v0

    .line 499
    invoke-static {p1}, Lcom/google/common/collect/Hashing;->smearedHash(Ljava/lang/Object;)I

    move-result v3

    .line 500
    array-length v4, v0

    sub-int/2addr v4, v2

    and-int/2addr v4, v3

    .line 502
    aget-object v5, v0, v4

    const/4 v6, 0x0

    :goto_0
    if-eqz v5, :cond_4

    .line 505
    invoke-virtual {v5, p1, v3}, Lcom/google/common/collect/LinkedHashMultimap$ValueEntry;->matchesValue(Ljava/lang/Object;I)Z

    move-result v7

    if-eqz v7, :cond_3

    if-nez v6, :cond_2

    .line 508
    iget-object p1, v5, Lcom/google/common/collect/LinkedHashMultimap$ValueEntry;->nextInValueBucket:Lcom/google/common/collect/LinkedHashMultimap$ValueEntry;

    aput-object p1, v0, v4

    goto :goto_1

    .line 510
    :cond_2
    iget-object p1, v5, Lcom/google/common/collect/LinkedHashMultimap$ValueEntry;->nextInValueBucket:Lcom/google/common/collect/LinkedHashMultimap$ValueEntry;

    iput-object p1, v6, Lcom/google/common/collect/LinkedHashMultimap$ValueEntry;->nextInValueBucket:Lcom/google/common/collect/LinkedHashMultimap$ValueEntry;

    .line 512
    :goto_1
    invoke-direct {p0, v5}, Lcom/google/common/collect/LinkedHashMultimap$ValueSet;->deleteEntryExceptFromHashTable(Lcom/google/common/collect/LinkedHashMultimap$ValueEntry;)V

    return v2

    .line 504
    :cond_3
    iget-object v6, v5, Lcom/google/common/collect/LinkedHashMultimap$ValueEntry;->nextInValueBucket:Lcom/google/common/collect/LinkedHashMultimap$ValueEntry;

    move-object v8, v6

    move-object v6, v5

    move-object v5, v8

    goto :goto_0

    :cond_4
    return v1
.end method

.method public size()I
    .registers 1

    .line 410
    iget p0, p0, Lcom/google/common/collect/LinkedHashMultimap$ValueSet;->size:I

    return p0
.end method
