.class final Lcom/google/common/collect/MapMakerInternalMap$StrongKeyWeakValueEntry$Helper;
.super Ljava/lang/Object;
.source "MapMakerInternalMap.java"

# interfaces
.implements Lcom/google/common/collect/MapMakerInternalMap$InternalEntryHelper;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/MapMakerInternalMap$StrongKeyWeakValueEntry;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Helper"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/google/common/collect/MapMakerInternalMap$InternalEntryHelper<",
        "TK;TV;",
        "Lcom/google/common/collect/MapMakerInternalMap$StrongKeyWeakValueEntry<",
        "TK;TV;>;",
        "Lcom/google/common/collect/MapMakerInternalMap$StrongKeyWeakValueSegment<",
        "TK;TV;>;>;"
    }
.end annotation


# static fields
.field private static final INSTANCE:Lcom/google/common/collect/MapMakerInternalMap$StrongKeyWeakValueEntry$Helper;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/MapMakerInternalMap$StrongKeyWeakValueEntry$Helper<",
            "**>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 518
    new-instance v0, Lcom/google/common/collect/MapMakerInternalMap$StrongKeyWeakValueEntry$Helper;

    invoke-direct {v0}, Lcom/google/common/collect/MapMakerInternalMap$StrongKeyWeakValueEntry$Helper;-><init>()V

    sput-object v0, Lcom/google/common/collect/MapMakerInternalMap$StrongKeyWeakValueEntry$Helper;->INSTANCE:Lcom/google/common/collect/MapMakerInternalMap$StrongKeyWeakValueEntry$Helper;

    return-void
.end method

.method constructor <init>()V
    .registers 1

    .line 515
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static instance()Lcom/google/common/collect/MapMakerInternalMap$StrongKeyWeakValueEntry$Helper;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">()",
            "Lcom/google/common/collect/MapMakerInternalMap$StrongKeyWeakValueEntry$Helper<",
            "TK;TV;>;"
        }
    .end annotation

    .line 522
    sget-object v0, Lcom/google/common/collect/MapMakerInternalMap$StrongKeyWeakValueEntry$Helper;->INSTANCE:Lcom/google/common/collect/MapMakerInternalMap$StrongKeyWeakValueEntry$Helper;

    return-object v0
.end method


# virtual methods
.method public bridge synthetic copy(Lcom/google/common/collect/MapMakerInternalMap$Segment;Lcom/google/common/collect/MapMakerInternalMap$InternalEntry;Lcom/google/common/collect/MapMakerInternalMap$InternalEntry;)Lcom/google/common/collect/MapMakerInternalMap$InternalEntry;
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000,
            0x1000,
            0x1000
        }
        names = {
            "segment",
            "entry",
            "newNext"
        }
    .end annotation

    .line 515
    check-cast p1, Lcom/google/common/collect/MapMakerInternalMap$StrongKeyWeakValueSegment;

    check-cast p2, Lcom/google/common/collect/MapMakerInternalMap$StrongKeyWeakValueEntry;

    check-cast p3, Lcom/google/common/collect/MapMakerInternalMap$StrongKeyWeakValueEntry;

    invoke-virtual {p0, p1, p2, p3}, Lcom/google/common/collect/MapMakerInternalMap$StrongKeyWeakValueEntry$Helper;->copy(Lcom/google/common/collect/MapMakerInternalMap$StrongKeyWeakValueSegment;Lcom/google/common/collect/MapMakerInternalMap$StrongKeyWeakValueEntry;Lcom/google/common/collect/MapMakerInternalMap$StrongKeyWeakValueEntry;)Lcom/google/common/collect/MapMakerInternalMap$StrongKeyWeakValueEntry;

    move-result-object p0

    return-object p0
.end method

.method public copy(Lcom/google/common/collect/MapMakerInternalMap$StrongKeyWeakValueSegment;Lcom/google/common/collect/MapMakerInternalMap$StrongKeyWeakValueEntry;Lcom/google/common/collect/MapMakerInternalMap$StrongKeyWeakValueEntry;)Lcom/google/common/collect/MapMakerInternalMap$StrongKeyWeakValueEntry;
    .registers 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "segment",
            "entry",
            "newNext"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/MapMakerInternalMap$StrongKeyWeakValueSegment<",
            "TK;TV;>;",
            "Lcom/google/common/collect/MapMakerInternalMap$StrongKeyWeakValueEntry<",
            "TK;TV;>;",
            "Lcom/google/common/collect/MapMakerInternalMap$StrongKeyWeakValueEntry<",
            "TK;TV;>;)",
            "Lcom/google/common/collect/MapMakerInternalMap$StrongKeyWeakValueEntry<",
            "TK;TV;>;"
        }
    .end annotation

    .line 548
    invoke-static {p2}, Lcom/google/common/collect/MapMakerInternalMap$Segment;->isCollected(Lcom/google/common/collect/MapMakerInternalMap$InternalEntry;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 551
    :cond_0
    iget-object v0, p2, Lcom/google/common/collect/MapMakerInternalMap$StrongKeyWeakValueEntry;->key:Ljava/lang/Object;

    iget v1, p2, Lcom/google/common/collect/MapMakerInternalMap$StrongKeyWeakValueEntry;->hash:I

    invoke-virtual {p0, p1, v0, v1, p3}, Lcom/google/common/collect/MapMakerInternalMap$StrongKeyWeakValueEntry$Helper;->newEntry(Lcom/google/common/collect/MapMakerInternalMap$StrongKeyWeakValueSegment;Ljava/lang/Object;ILcom/google/common/collect/MapMakerInternalMap$StrongKeyWeakValueEntry;)Lcom/google/common/collect/MapMakerInternalMap$StrongKeyWeakValueEntry;

    move-result-object p0

    .line 552
    # getter for: Lcom/google/common/collect/MapMakerInternalMap$StrongKeyWeakValueEntry;->valueReference:Lcom/google/common/collect/MapMakerInternalMap$WeakValueReference;
    invoke-static {p2}, Lcom/google/common/collect/MapMakerInternalMap$StrongKeyWeakValueEntry;->access$400(Lcom/google/common/collect/MapMakerInternalMap$StrongKeyWeakValueEntry;)Lcom/google/common/collect/MapMakerInternalMap$WeakValueReference;

    move-result-object p2

    # getter for: Lcom/google/common/collect/MapMakerInternalMap$StrongKeyWeakValueSegment;->queueForValues:Ljava/lang/ref/ReferenceQueue;
    invoke-static {p1}, Lcom/google/common/collect/MapMakerInternalMap$StrongKeyWeakValueSegment;->access$500(Lcom/google/common/collect/MapMakerInternalMap$StrongKeyWeakValueSegment;)Ljava/lang/ref/ReferenceQueue;

    move-result-object p1

    invoke-interface {p2, p1, p0}, Lcom/google/common/collect/MapMakerInternalMap$WeakValueReference;->copyFor(Ljava/lang/ref/ReferenceQueue;Lcom/google/common/collect/MapMakerInternalMap$InternalEntry;)Lcom/google/common/collect/MapMakerInternalMap$WeakValueReference;

    move-result-object p1

    # setter for: Lcom/google/common/collect/MapMakerInternalMap$StrongKeyWeakValueEntry;->valueReference:Lcom/google/common/collect/MapMakerInternalMap$WeakValueReference;
    invoke-static {p0, p1}, Lcom/google/common/collect/MapMakerInternalMap$StrongKeyWeakValueEntry;->access$402(Lcom/google/common/collect/MapMakerInternalMap$StrongKeyWeakValueEntry;Lcom/google/common/collect/MapMakerInternalMap$WeakValueReference;)Lcom/google/common/collect/MapMakerInternalMap$WeakValueReference;

    return-object p0
.end method

.method public keyStrength()Lcom/google/common/collect/MapMakerInternalMap$Strength;
    .registers 1

    .line 527
    sget-object p0, Lcom/google/common/collect/MapMakerInternalMap$Strength;->STRONG:Lcom/google/common/collect/MapMakerInternalMap$Strength;

    return-object p0
.end method

.method public bridge synthetic newEntry(Lcom/google/common/collect/MapMakerInternalMap$Segment;Ljava/lang/Object;ILcom/google/common/collect/MapMakerInternalMap$InternalEntry;)Lcom/google/common/collect/MapMakerInternalMap$InternalEntry;
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000,
            0x1000,
            0x1000,
            0x1000
        }
        names = {
            "segment",
            "key",
            "hash",
            "next"
        }
    .end annotation

    .line 515
    check-cast p1, Lcom/google/common/collect/MapMakerInternalMap$StrongKeyWeakValueSegment;

    check-cast p4, Lcom/google/common/collect/MapMakerInternalMap$StrongKeyWeakValueEntry;

    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/google/common/collect/MapMakerInternalMap$StrongKeyWeakValueEntry$Helper;->newEntry(Lcom/google/common/collect/MapMakerInternalMap$StrongKeyWeakValueSegment;Ljava/lang/Object;ILcom/google/common/collect/MapMakerInternalMap$StrongKeyWeakValueEntry;)Lcom/google/common/collect/MapMakerInternalMap$StrongKeyWeakValueEntry;

    move-result-object p0

    return-object p0
.end method

.method public newEntry(Lcom/google/common/collect/MapMakerInternalMap$StrongKeyWeakValueSegment;Ljava/lang/Object;ILcom/google/common/collect/MapMakerInternalMap$StrongKeyWeakValueEntry;)Lcom/google/common/collect/MapMakerInternalMap$StrongKeyWeakValueEntry;
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "segment",
            "key",
            "hash",
            "next"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/MapMakerInternalMap$StrongKeyWeakValueSegment<",
            "TK;TV;>;TK;I",
            "Lcom/google/common/collect/MapMakerInternalMap$StrongKeyWeakValueEntry<",
            "TK;TV;>;)",
            "Lcom/google/common/collect/MapMakerInternalMap$StrongKeyWeakValueEntry<",
            "TK;TV;>;"
        }
    .end annotation

    if-nez p4, :cond_0

    .line 571
    new-instance p0, Lcom/google/common/collect/MapMakerInternalMap$StrongKeyWeakValueEntry;

    const/4 p1, 0x0

    invoke-direct {p0, p2, p3, p1}, Lcom/google/common/collect/MapMakerInternalMap$StrongKeyWeakValueEntry;-><init>(Ljava/lang/Object;ILcom/google/common/collect/MapMakerInternalMap$1;)V

    return-object p0

    .line 572
    :cond_0
    new-instance p0, Lcom/google/common/collect/MapMakerInternalMap$StrongKeyWeakValueEntry$LinkedStrongKeyWeakValueEntry;

    invoke-direct {p0, p2, p3, p4}, Lcom/google/common/collect/MapMakerInternalMap$StrongKeyWeakValueEntry$LinkedStrongKeyWeakValueEntry;-><init>(Ljava/lang/Object;ILcom/google/common/collect/MapMakerInternalMap$StrongKeyWeakValueEntry;)V

    return-object p0
.end method

.method public bridge synthetic newSegment(Lcom/google/common/collect/MapMakerInternalMap;I)Lcom/google/common/collect/MapMakerInternalMap$Segment;
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000,
            0x1000
        }
        names = {
            "map",
            "initialCapacity"
        }
    .end annotation

    .line 515
    invoke-virtual {p0, p1, p2}, Lcom/google/common/collect/MapMakerInternalMap$StrongKeyWeakValueEntry$Helper;->newSegment(Lcom/google/common/collect/MapMakerInternalMap;I)Lcom/google/common/collect/MapMakerInternalMap$StrongKeyWeakValueSegment;

    move-result-object p0

    return-object p0
.end method

.method public newSegment(Lcom/google/common/collect/MapMakerInternalMap;I)Lcom/google/common/collect/MapMakerInternalMap$StrongKeyWeakValueSegment;
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
            "Lcom/google/common/collect/MapMakerInternalMap$StrongKeyWeakValueEntry<",
            "TK;TV;>;",
            "Lcom/google/common/collect/MapMakerInternalMap$StrongKeyWeakValueSegment<",
            "TK;TV;>;>;I)",
            "Lcom/google/common/collect/MapMakerInternalMap$StrongKeyWeakValueSegment<",
            "TK;TV;>;"
        }
    .end annotation

    .line 540
    new-instance p0, Lcom/google/common/collect/MapMakerInternalMap$StrongKeyWeakValueSegment;

    invoke-direct {p0, p1, p2}, Lcom/google/common/collect/MapMakerInternalMap$StrongKeyWeakValueSegment;-><init>(Lcom/google/common/collect/MapMakerInternalMap;I)V

    return-object p0
.end method

.method public bridge synthetic setValue(Lcom/google/common/collect/MapMakerInternalMap$Segment;Lcom/google/common/collect/MapMakerInternalMap$InternalEntry;Ljava/lang/Object;)V
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000,
            0x1000,
            0x1000
        }
        names = {
            "segment",
            "entry",
            "value"
        }
    .end annotation

    .line 515
    check-cast p1, Lcom/google/common/collect/MapMakerInternalMap$StrongKeyWeakValueSegment;

    check-cast p2, Lcom/google/common/collect/MapMakerInternalMap$StrongKeyWeakValueEntry;

    invoke-virtual {p0, p1, p2, p3}, Lcom/google/common/collect/MapMakerInternalMap$StrongKeyWeakValueEntry$Helper;->setValue(Lcom/google/common/collect/MapMakerInternalMap$StrongKeyWeakValueSegment;Lcom/google/common/collect/MapMakerInternalMap$StrongKeyWeakValueEntry;Ljava/lang/Object;)V

    return-void
.end method

.method public setValue(Lcom/google/common/collect/MapMakerInternalMap$StrongKeyWeakValueSegment;Lcom/google/common/collect/MapMakerInternalMap$StrongKeyWeakValueEntry;Ljava/lang/Object;)V
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "segment",
            "entry",
            "value"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/MapMakerInternalMap$StrongKeyWeakValueSegment<",
            "TK;TV;>;",
            "Lcom/google/common/collect/MapMakerInternalMap$StrongKeyWeakValueEntry<",
            "TK;TV;>;TV;)V"
        }
    .end annotation

    .line 559
    # getter for: Lcom/google/common/collect/MapMakerInternalMap$StrongKeyWeakValueEntry;->valueReference:Lcom/google/common/collect/MapMakerInternalMap$WeakValueReference;
    invoke-static {p2}, Lcom/google/common/collect/MapMakerInternalMap$StrongKeyWeakValueEntry;->access$400(Lcom/google/common/collect/MapMakerInternalMap$StrongKeyWeakValueEntry;)Lcom/google/common/collect/MapMakerInternalMap$WeakValueReference;

    move-result-object p0

    .line 560
    new-instance v0, Lcom/google/common/collect/MapMakerInternalMap$WeakValueReferenceImpl;

    # getter for: Lcom/google/common/collect/MapMakerInternalMap$StrongKeyWeakValueSegment;->queueForValues:Ljava/lang/ref/ReferenceQueue;
    invoke-static {p1}, Lcom/google/common/collect/MapMakerInternalMap$StrongKeyWeakValueSegment;->access$500(Lcom/google/common/collect/MapMakerInternalMap$StrongKeyWeakValueSegment;)Ljava/lang/ref/ReferenceQueue;

    move-result-object p1

    invoke-direct {v0, p1, p3, p2}, Lcom/google/common/collect/MapMakerInternalMap$WeakValueReferenceImpl;-><init>(Ljava/lang/ref/ReferenceQueue;Ljava/lang/Object;Lcom/google/common/collect/MapMakerInternalMap$InternalEntry;)V

    # setter for: Lcom/google/common/collect/MapMakerInternalMap$StrongKeyWeakValueEntry;->valueReference:Lcom/google/common/collect/MapMakerInternalMap$WeakValueReference;
    invoke-static {p2, v0}, Lcom/google/common/collect/MapMakerInternalMap$StrongKeyWeakValueEntry;->access$402(Lcom/google/common/collect/MapMakerInternalMap$StrongKeyWeakValueEntry;Lcom/google/common/collect/MapMakerInternalMap$WeakValueReference;)Lcom/google/common/collect/MapMakerInternalMap$WeakValueReference;

    .line 561
    invoke-interface {p0}, Lcom/google/common/collect/MapMakerInternalMap$WeakValueReference;->clear()V

    return-void
.end method

.method public valueStrength()Lcom/google/common/collect/MapMakerInternalMap$Strength;
    .registers 1

    .line 532
    sget-object p0, Lcom/google/common/collect/MapMakerInternalMap$Strength;->WEAK:Lcom/google/common/collect/MapMakerInternalMap$Strength;

    return-object p0
.end method
