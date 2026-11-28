.class final Lcom/google/common/cache/LocalCache$WeightedWeakValueReference;
.super Lcom/google/common/cache/LocalCache$WeakValueReference;
.source "LocalCache.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/cache/LocalCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "WeightedWeakValueReference"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/common/cache/LocalCache$WeakValueReference<",
        "TK;TV;>;"
    }
.end annotation


# instance fields
.field final weight:I


# direct methods
.method constructor <init>(Ljava/lang/ref/ReferenceQueue;Ljava/lang/Object;Lcom/google/common/cache/ReferenceEntry;I)V
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "queue",
            "referent",
            "entry",
            "weight"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/ref/ReferenceQueue<",
            "TV;>;TV;",
            "Lcom/google/common/cache/ReferenceEntry<",
            "TK;TV;>;I)V"
        }
    .end annotation

    .line 1622
    invoke-direct {p0, p1, p2, p3}, Lcom/google/common/cache/LocalCache$WeakValueReference;-><init>(Ljava/lang/ref/ReferenceQueue;Ljava/lang/Object;Lcom/google/common/cache/ReferenceEntry;)V

    .line 1623
    iput p4, p0, Lcom/google/common/cache/LocalCache$WeightedWeakValueReference;->weight:I

    return-void
.end method


# virtual methods
.method public copyFor(Ljava/lang/ref/ReferenceQueue;Ljava/lang/Object;Lcom/google/common/cache/ReferenceEntry;)Lcom/google/common/cache/LocalCache$ValueReference;
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "queue",
            "value",
            "entry"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/ref/ReferenceQueue<",
            "TV;>;TV;",
            "Lcom/google/common/cache/ReferenceEntry<",
            "TK;TV;>;)",
            "Lcom/google/common/cache/LocalCache$ValueReference<",
            "TK;TV;>;"
        }
    .end annotation

    .line 1634
    new-instance v0, Lcom/google/common/cache/LocalCache$WeightedWeakValueReference;

    iget p0, p0, Lcom/google/common/cache/LocalCache$WeightedWeakValueReference;->weight:I

    invoke-direct {v0, p1, p2, p3, p0}, Lcom/google/common/cache/LocalCache$WeightedWeakValueReference;-><init>(Ljava/lang/ref/ReferenceQueue;Ljava/lang/Object;Lcom/google/common/cache/ReferenceEntry;I)V

    return-object v0
.end method

.method public getWeight()I
    .registers 1

    .line 1628
    iget p0, p0, Lcom/google/common/cache/LocalCache$WeightedWeakValueReference;->weight:I

    return p0
.end method
