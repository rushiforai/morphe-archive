.class final Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueSegment;
.super Lcom/google/common/collect/MapMakerInternalMap$Segment;
.source "MapMakerInternalMap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/MapMakerInternalMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "WeakKeyWeakValueSegment"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/common/collect/MapMakerInternalMap$Segment<",
        "TK;TV;",
        "Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueEntry<",
        "TK;TV;>;",
        "Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueSegment<",
        "TK;TV;>;>;"
    }
.end annotation


# instance fields
.field private final queueForKeys:Ljava/lang/ref/ReferenceQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/ReferenceQueue<",
            "TK;>;"
        }
    .end annotation
.end field

.field private final queueForValues:Ljava/lang/ref/ReferenceQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/ReferenceQueue<",
            "TV;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lcom/google/common/collect/MapMakerInternalMap;I)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "map",
            "initialCapacity"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/MapMakerInternalMap<",
            "TK;TV;",
            "Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueEntry<",
            "TK;TV;>;",
            "Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueSegment<",
            "TK;TV;>;>;I)V"
        }
    .end annotation

    .line 2175
    invoke-direct {p0, p1, p2}, Lcom/google/common/collect/MapMakerInternalMap$Segment;-><init>(Lcom/google/common/collect/MapMakerInternalMap;I)V

    .line 2169
    new-instance p1, Ljava/lang/ref/ReferenceQueue;

    invoke-direct {p1}, Ljava/lang/ref/ReferenceQueue;-><init>()V

    iput-object p1, p0, Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueSegment;->queueForKeys:Ljava/lang/ref/ReferenceQueue;

    .line 2170
    new-instance p1, Ljava/lang/ref/ReferenceQueue;

    invoke-direct {p1}, Ljava/lang/ref/ReferenceQueue;-><init>()V

    iput-object p1, p0, Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueSegment;->queueForValues:Ljava/lang/ref/ReferenceQueue;

    return-void
.end method

.method static synthetic access$1600(Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueSegment;)Ljava/lang/ref/ReferenceQueue;
    .registers 1

    .line 2167
    iget-object p0, p0, Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueSegment;->queueForValues:Ljava/lang/ref/ReferenceQueue;

    return-object p0
.end method

.method static synthetic access$1700(Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueSegment;)Ljava/lang/ref/ReferenceQueue;
    .registers 1

    .line 2167
    iget-object p0, p0, Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueSegment;->queueForKeys:Ljava/lang/ref/ReferenceQueue;

    return-object p0
.end method


# virtual methods
.method bridge synthetic castForTesting(Lcom/google/common/collect/MapMakerInternalMap$InternalEntry;)Lcom/google/common/collect/MapMakerInternalMap$InternalEntry;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "entry"
        }
    .end annotation

    .line 2167
    invoke-virtual {p0, p1}, Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueSegment;->castForTesting(Lcom/google/common/collect/MapMakerInternalMap$InternalEntry;)Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueEntry;

    move-result-object p0

    return-object p0
.end method

.method castForTesting(Lcom/google/common/collect/MapMakerInternalMap$InternalEntry;)Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueEntry;
    .registers 2
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
            "Lcom/google/common/collect/MapMakerInternalMap$InternalEntry<",
            "TK;TV;*>;)",
            "Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueEntry<",
            "TK;TV;>;"
        }
    .end annotation

    .line 2196
    check-cast p1, Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueEntry;

    return-object p1
.end method

.method getKeyReferenceQueueForTesting()Ljava/lang/ref/ReferenceQueue;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/ref/ReferenceQueue<",
            "TK;>;"
        }
    .end annotation

    .line 2185
    iget-object p0, p0, Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueSegment;->queueForKeys:Ljava/lang/ref/ReferenceQueue;

    return-object p0
.end method

.method getValueReferenceQueueForTesting()Ljava/lang/ref/ReferenceQueue;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/ref/ReferenceQueue<",
            "TV;>;"
        }
    .end annotation

    .line 2190
    iget-object p0, p0, Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueSegment;->queueForValues:Ljava/lang/ref/ReferenceQueue;

    return-object p0
.end method

.method getWeakValueReferenceForTesting(Lcom/google/common/collect/MapMakerInternalMap$InternalEntry;)Lcom/google/common/collect/MapMakerInternalMap$WeakValueReference;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "e"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/MapMakerInternalMap$InternalEntry<",
            "TK;TV;*>;)",
            "Lcom/google/common/collect/MapMakerInternalMap$WeakValueReference<",
            "TK;TV;",
            "Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueEntry<",
            "TK;TV;>;>;"
        }
    .end annotation

    .line 2202
    invoke-virtual {p0, p1}, Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueSegment;->castForTesting(Lcom/google/common/collect/MapMakerInternalMap$InternalEntry;)Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueEntry;

    move-result-object p0

    invoke-virtual {p0}, Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueEntry;->getValueReference()Lcom/google/common/collect/MapMakerInternalMap$WeakValueReference;

    move-result-object p0

    return-object p0
.end method

.method maybeClearReferenceQueues()V
    .registers 2

    .line 2232
    iget-object v0, p0, Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueSegment;->queueForKeys:Ljava/lang/ref/ReferenceQueue;

    invoke-virtual {p0, v0}, Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueSegment;->clearReferenceQueue(Ljava/lang/ref/ReferenceQueue;)V

    return-void
.end method

.method maybeDrainReferenceQueues()V
    .registers 2

    .line 2226
    iget-object v0, p0, Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueSegment;->queueForKeys:Ljava/lang/ref/ReferenceQueue;

    invoke-virtual {p0, v0}, Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueSegment;->drainKeyReferenceQueue(Ljava/lang/ref/ReferenceQueue;)V

    .line 2227
    iget-object v0, p0, Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueSegment;->queueForValues:Ljava/lang/ref/ReferenceQueue;

    invoke-virtual {p0, v0}, Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueSegment;->drainValueReferenceQueue(Ljava/lang/ref/ReferenceQueue;)V

    return-void
.end method

.method newWeakValueReferenceForTesting(Lcom/google/common/collect/MapMakerInternalMap$InternalEntry;Ljava/lang/Object;)Lcom/google/common/collect/MapMakerInternalMap$WeakValueReference;
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "e",
            "value"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/MapMakerInternalMap$InternalEntry<",
            "TK;TV;*>;TV;)",
            "Lcom/google/common/collect/MapMakerInternalMap$WeakValueReference<",
            "TK;TV;",
            "Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueEntry<",
            "TK;TV;>;>;"
        }
    .end annotation

    .line 2208
    new-instance v0, Lcom/google/common/collect/MapMakerInternalMap$WeakValueReferenceImpl;

    iget-object v1, p0, Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueSegment;->queueForValues:Ljava/lang/ref/ReferenceQueue;

    invoke-virtual {p0, p1}, Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueSegment;->castForTesting(Lcom/google/common/collect/MapMakerInternalMap$InternalEntry;)Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueEntry;

    move-result-object p0

    invoke-direct {v0, v1, p2, p0}, Lcom/google/common/collect/MapMakerInternalMap$WeakValueReferenceImpl;-><init>(Ljava/lang/ref/ReferenceQueue;Ljava/lang/Object;Lcom/google/common/collect/MapMakerInternalMap$InternalEntry;)V

    return-object v0
.end method

.method bridge synthetic self()Lcom/google/common/collect/MapMakerInternalMap$Segment;
    .registers 1

    .line 2167
    invoke-virtual {p0}, Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueSegment;->self()Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueSegment;

    move-result-object p0

    return-object p0
.end method

.method self()Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueSegment;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueSegment<",
            "TK;TV;>;"
        }
    .end annotation

    return-object p0
.end method

.method setWeakValueReferenceForTesting(Lcom/google/common/collect/MapMakerInternalMap$InternalEntry;Lcom/google/common/collect/MapMakerInternalMap$WeakValueReference;)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "e",
            "valueReference"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/MapMakerInternalMap$InternalEntry<",
            "TK;TV;*>;",
            "Lcom/google/common/collect/MapMakerInternalMap$WeakValueReference<",
            "TK;TV;+",
            "Lcom/google/common/collect/MapMakerInternalMap$InternalEntry<",
            "TK;TV;*>;>;)V"
        }
    .end annotation

    .line 2215
    invoke-virtual {p0, p1}, Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueSegment;->castForTesting(Lcom/google/common/collect/MapMakerInternalMap$InternalEntry;)Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueEntry;

    move-result-object p0

    .line 2219
    # getter for: Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueEntry;->valueReference:Lcom/google/common/collect/MapMakerInternalMap$WeakValueReference;
    invoke-static {p0}, Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueEntry;->access$1500(Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueEntry;)Lcom/google/common/collect/MapMakerInternalMap$WeakValueReference;

    move-result-object p1

    .line 2220
    # setter for: Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueEntry;->valueReference:Lcom/google/common/collect/MapMakerInternalMap$WeakValueReference;
    invoke-static {p0, p2}, Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueEntry;->access$1502(Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueEntry;Lcom/google/common/collect/MapMakerInternalMap$WeakValueReference;)Lcom/google/common/collect/MapMakerInternalMap$WeakValueReference;

    .line 2221
    invoke-interface {p1}, Lcom/google/common/collect/MapMakerInternalMap$WeakValueReference;->clear()V

    return-void
.end method
