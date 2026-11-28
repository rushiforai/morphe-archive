.class final Lcom/google/common/collect/MapMakerInternalMap$WeakKeyDummyValueEntry$Helper;
.super Ljava/lang/Object;
.source "MapMakerInternalMap.java"

# interfaces
.implements Lcom/google/common/collect/MapMakerInternalMap$InternalEntryHelper;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/MapMakerInternalMap$WeakKeyDummyValueEntry;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Helper"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/google/common/collect/MapMakerInternalMap$InternalEntryHelper<",
        "TK;",
        "Lcom/google/common/collect/MapMaker$Dummy;",
        "Lcom/google/common/collect/MapMakerInternalMap$WeakKeyDummyValueEntry<",
        "TK;>;",
        "Lcom/google/common/collect/MapMakerInternalMap$WeakKeyDummyValueSegment<",
        "TK;>;>;"
    }
.end annotation


# static fields
.field private static final INSTANCE:Lcom/google/common/collect/MapMakerInternalMap$WeakKeyDummyValueEntry$Helper;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/MapMakerInternalMap$WeakKeyDummyValueEntry$Helper<",
            "*>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 725
    new-instance v0, Lcom/google/common/collect/MapMakerInternalMap$WeakKeyDummyValueEntry$Helper;

    invoke-direct {v0}, Lcom/google/common/collect/MapMakerInternalMap$WeakKeyDummyValueEntry$Helper;-><init>()V

    sput-object v0, Lcom/google/common/collect/MapMakerInternalMap$WeakKeyDummyValueEntry$Helper;->INSTANCE:Lcom/google/common/collect/MapMakerInternalMap$WeakKeyDummyValueEntry$Helper;

    return-void
.end method

.method constructor <init>()V
    .registers 1

    .line 722
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static instance()Lcom/google/common/collect/MapMakerInternalMap$WeakKeyDummyValueEntry$Helper;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            ">()",
            "Lcom/google/common/collect/MapMakerInternalMap$WeakKeyDummyValueEntry$Helper<",
            "TK;>;"
        }
    .end annotation

    .line 729
    sget-object v0, Lcom/google/common/collect/MapMakerInternalMap$WeakKeyDummyValueEntry$Helper;->INSTANCE:Lcom/google/common/collect/MapMakerInternalMap$WeakKeyDummyValueEntry$Helper;

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

    .line 722
    check-cast p1, Lcom/google/common/collect/MapMakerInternalMap$WeakKeyDummyValueSegment;

    check-cast p2, Lcom/google/common/collect/MapMakerInternalMap$WeakKeyDummyValueEntry;

    check-cast p3, Lcom/google/common/collect/MapMakerInternalMap$WeakKeyDummyValueEntry;

    invoke-virtual {p0, p1, p2, p3}, Lcom/google/common/collect/MapMakerInternalMap$WeakKeyDummyValueEntry$Helper;->copy(Lcom/google/common/collect/MapMakerInternalMap$WeakKeyDummyValueSegment;Lcom/google/common/collect/MapMakerInternalMap$WeakKeyDummyValueEntry;Lcom/google/common/collect/MapMakerInternalMap$WeakKeyDummyValueEntry;)Lcom/google/common/collect/MapMakerInternalMap$WeakKeyDummyValueEntry;

    move-result-object p0

    return-object p0
.end method

.method public copy(Lcom/google/common/collect/MapMakerInternalMap$WeakKeyDummyValueSegment;Lcom/google/common/collect/MapMakerInternalMap$WeakKeyDummyValueEntry;Lcom/google/common/collect/MapMakerInternalMap$WeakKeyDummyValueEntry;)Lcom/google/common/collect/MapMakerInternalMap$WeakKeyDummyValueEntry;
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
            "newNext"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/MapMakerInternalMap$WeakKeyDummyValueSegment<",
            "TK;>;",
            "Lcom/google/common/collect/MapMakerInternalMap$WeakKeyDummyValueEntry<",
            "TK;>;",
            "Lcom/google/common/collect/MapMakerInternalMap$WeakKeyDummyValueEntry<",
            "TK;>;)",
            "Lcom/google/common/collect/MapMakerInternalMap$WeakKeyDummyValueEntry<",
            "TK;>;"
        }
    .end annotation

    .line 754
    invoke-virtual {p2}, Lcom/google/common/collect/MapMakerInternalMap$WeakKeyDummyValueEntry;->getKey()Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 759
    :cond_0
    iget p2, p2, Lcom/google/common/collect/MapMakerInternalMap$WeakKeyDummyValueEntry;->hash:I

    invoke-virtual {p0, p1, v0, p2, p3}, Lcom/google/common/collect/MapMakerInternalMap$WeakKeyDummyValueEntry$Helper;->newEntry(Lcom/google/common/collect/MapMakerInternalMap$WeakKeyDummyValueSegment;Ljava/lang/Object;ILcom/google/common/collect/MapMakerInternalMap$WeakKeyDummyValueEntry;)Lcom/google/common/collect/MapMakerInternalMap$WeakKeyDummyValueEntry;

    move-result-object p0

    return-object p0
.end method

.method public keyStrength()Lcom/google/common/collect/MapMakerInternalMap$Strength;
    .registers 1

    .line 734
    sget-object p0, Lcom/google/common/collect/MapMakerInternalMap$Strength;->WEAK:Lcom/google/common/collect/MapMakerInternalMap$Strength;

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

    .line 722
    check-cast p1, Lcom/google/common/collect/MapMakerInternalMap$WeakKeyDummyValueSegment;

    check-cast p4, Lcom/google/common/collect/MapMakerInternalMap$WeakKeyDummyValueEntry;

    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/google/common/collect/MapMakerInternalMap$WeakKeyDummyValueEntry$Helper;->newEntry(Lcom/google/common/collect/MapMakerInternalMap$WeakKeyDummyValueSegment;Ljava/lang/Object;ILcom/google/common/collect/MapMakerInternalMap$WeakKeyDummyValueEntry;)Lcom/google/common/collect/MapMakerInternalMap$WeakKeyDummyValueEntry;

    move-result-object p0

    return-object p0
.end method

.method public newEntry(Lcom/google/common/collect/MapMakerInternalMap$WeakKeyDummyValueSegment;Ljava/lang/Object;ILcom/google/common/collect/MapMakerInternalMap$WeakKeyDummyValueEntry;)Lcom/google/common/collect/MapMakerInternalMap$WeakKeyDummyValueEntry;
    .registers 11
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
            "Lcom/google/common/collect/MapMakerInternalMap$WeakKeyDummyValueSegment<",
            "TK;>;TK;I",
            "Lcom/google/common/collect/MapMakerInternalMap$WeakKeyDummyValueEntry<",
            "TK;>;)",
            "Lcom/google/common/collect/MapMakerInternalMap$WeakKeyDummyValueEntry<",
            "TK;>;"
        }
    .end annotation

    if-nez p4, :cond_0

    .line 773
    new-instance p0, Lcom/google/common/collect/MapMakerInternalMap$WeakKeyDummyValueEntry;

    # getter for: Lcom/google/common/collect/MapMakerInternalMap$WeakKeyDummyValueSegment;->queueForKeys:Ljava/lang/ref/ReferenceQueue;
    invoke-static {p1}, Lcom/google/common/collect/MapMakerInternalMap$WeakKeyDummyValueSegment;->access$900(Lcom/google/common/collect/MapMakerInternalMap$WeakKeyDummyValueSegment;)Ljava/lang/ref/ReferenceQueue;

    move-result-object p1

    const/4 p4, 0x0

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/google/common/collect/MapMakerInternalMap$WeakKeyDummyValueEntry;-><init>(Ljava/lang/ref/ReferenceQueue;Ljava/lang/Object;ILcom/google/common/collect/MapMakerInternalMap$1;)V

    return-object p0

    .line 774
    :cond_0
    new-instance v0, Lcom/google/common/collect/MapMakerInternalMap$WeakKeyDummyValueEntry$LinkedWeakKeyDummyValueEntry;

    # getter for: Lcom/google/common/collect/MapMakerInternalMap$WeakKeyDummyValueSegment;->queueForKeys:Ljava/lang/ref/ReferenceQueue;
    invoke-static {p1}, Lcom/google/common/collect/MapMakerInternalMap$WeakKeyDummyValueSegment;->access$900(Lcom/google/common/collect/MapMakerInternalMap$WeakKeyDummyValueSegment;)Ljava/lang/ref/ReferenceQueue;

    move-result-object v1

    const/4 v5, 0x0

    move-object v2, p2

    move v3, p3

    move-object v4, p4

    invoke-direct/range {v0 .. v5}, Lcom/google/common/collect/MapMakerInternalMap$WeakKeyDummyValueEntry$LinkedWeakKeyDummyValueEntry;-><init>(Ljava/lang/ref/ReferenceQueue;Ljava/lang/Object;ILcom/google/common/collect/MapMakerInternalMap$WeakKeyDummyValueEntry;Lcom/google/common/collect/MapMakerInternalMap$1;)V

    return-object v0
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

    .line 722
    invoke-virtual {p0, p1, p2}, Lcom/google/common/collect/MapMakerInternalMap$WeakKeyDummyValueEntry$Helper;->newSegment(Lcom/google/common/collect/MapMakerInternalMap;I)Lcom/google/common/collect/MapMakerInternalMap$WeakKeyDummyValueSegment;

    move-result-object p0

    return-object p0
.end method

.method public newSegment(Lcom/google/common/collect/MapMakerInternalMap;I)Lcom/google/common/collect/MapMakerInternalMap$WeakKeyDummyValueSegment;
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
            "TK;",
            "Lcom/google/common/collect/MapMaker$Dummy;",
            "Lcom/google/common/collect/MapMakerInternalMap$WeakKeyDummyValueEntry<",
            "TK;>;",
            "Lcom/google/common/collect/MapMakerInternalMap$WeakKeyDummyValueSegment<",
            "TK;>;>;I)",
            "Lcom/google/common/collect/MapMakerInternalMap$WeakKeyDummyValueSegment<",
            "TK;>;"
        }
    .end annotation

    .line 746
    new-instance p0, Lcom/google/common/collect/MapMakerInternalMap$WeakKeyDummyValueSegment;

    invoke-direct {p0, p1, p2}, Lcom/google/common/collect/MapMakerInternalMap$WeakKeyDummyValueSegment;-><init>(Lcom/google/common/collect/MapMakerInternalMap;I)V

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

    .line 722
    check-cast p1, Lcom/google/common/collect/MapMakerInternalMap$WeakKeyDummyValueSegment;

    check-cast p2, Lcom/google/common/collect/MapMakerInternalMap$WeakKeyDummyValueEntry;

    check-cast p3, Lcom/google/common/collect/MapMaker$Dummy;

    invoke-virtual {p0, p1, p2, p3}, Lcom/google/common/collect/MapMakerInternalMap$WeakKeyDummyValueEntry$Helper;->setValue(Lcom/google/common/collect/MapMakerInternalMap$WeakKeyDummyValueSegment;Lcom/google/common/collect/MapMakerInternalMap$WeakKeyDummyValueEntry;Lcom/google/common/collect/MapMaker$Dummy;)V

    return-void
.end method

.method public setValue(Lcom/google/common/collect/MapMakerInternalMap$WeakKeyDummyValueSegment;Lcom/google/common/collect/MapMakerInternalMap$WeakKeyDummyValueEntry;Lcom/google/common/collect/MapMaker$Dummy;)V
    .registers 4
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
            "Lcom/google/common/collect/MapMakerInternalMap$WeakKeyDummyValueSegment<",
            "TK;>;",
            "Lcom/google/common/collect/MapMakerInternalMap$WeakKeyDummyValueEntry<",
            "TK;>;",
            "Lcom/google/common/collect/MapMaker$Dummy;",
            ")V"
        }
    .end annotation

    return-void
.end method

.method public valueStrength()Lcom/google/common/collect/MapMakerInternalMap$Strength;
    .registers 1

    .line 739
    sget-object p0, Lcom/google/common/collect/MapMakerInternalMap$Strength;->STRONG:Lcom/google/common/collect/MapMakerInternalMap$Strength;

    return-object p0
.end method
