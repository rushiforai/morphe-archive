.class final Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueEntry$Helper;
.super Ljava/lang/Object;
.source "MapMakerInternalMap.java"

# interfaces
.implements Lcom/google/common/collect/MapMakerInternalMap$InternalEntryHelper;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueEntry;
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
        "Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueEntry<",
        "TK;TV;>;",
        "Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueSegment<",
        "TK;TV;>;>;"
    }
.end annotation


# static fields
.field private static final INSTANCE:Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueEntry$Helper;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueEntry$Helper<",
            "**>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 914
    new-instance v0, Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueEntry$Helper;

    invoke-direct {v0}, Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueEntry$Helper;-><init>()V

    sput-object v0, Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueEntry$Helper;->INSTANCE:Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueEntry$Helper;

    return-void
.end method

.method constructor <init>()V
    .registers 1

    .line 911
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static instance()Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueEntry$Helper;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">()",
            "Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueEntry$Helper<",
            "TK;TV;>;"
        }
    .end annotation

    .line 918
    sget-object v0, Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueEntry$Helper;->INSTANCE:Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueEntry$Helper;

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

    .line 911
    check-cast p1, Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueSegment;

    check-cast p2, Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueEntry;

    check-cast p3, Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueEntry;

    invoke-virtual {p0, p1, p2, p3}, Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueEntry$Helper;->copy(Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueSegment;Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueEntry;Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueEntry;)Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueEntry;

    move-result-object p0

    return-object p0
.end method

.method public copy(Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueSegment;Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueEntry;Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueEntry;)Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueEntry;
    .registers 7
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
            "Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueSegment<",
            "TK;TV;>;",
            "Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueEntry<",
            "TK;TV;>;",
            "Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueEntry<",
            "TK;TV;>;)",
            "Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueEntry<",
            "TK;TV;>;"
        }
    .end annotation

    .line 943
    invoke-virtual {p2}, Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueEntry;->getKey()Ljava/lang/Object;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return-object v1

    .line 948
    :cond_0
    invoke-static {p2}, Lcom/google/common/collect/MapMakerInternalMap$Segment;->isCollected(Lcom/google/common/collect/MapMakerInternalMap$InternalEntry;)Z

    move-result v2

    if-eqz v2, :cond_1

    return-object v1

    .line 951
    :cond_1
    iget v1, p2, Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueEntry;->hash:I

    invoke-virtual {p0, p1, v0, v1, p3}, Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueEntry$Helper;->newEntry(Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueSegment;Ljava/lang/Object;ILcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueEntry;)Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueEntry;

    move-result-object p0

    .line 952
    # getter for: Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueEntry;->valueReference:Lcom/google/common/collect/MapMakerInternalMap$WeakValueReference;
    invoke-static {p2}, Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueEntry;->access$1500(Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueEntry;)Lcom/google/common/collect/MapMakerInternalMap$WeakValueReference;

    move-result-object p2

    # getter for: Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueSegment;->queueForValues:Ljava/lang/ref/ReferenceQueue;
    invoke-static {p1}, Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueSegment;->access$1600(Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueSegment;)Ljava/lang/ref/ReferenceQueue;

    move-result-object p1

    invoke-interface {p2, p1, p0}, Lcom/google/common/collect/MapMakerInternalMap$WeakValueReference;->copyFor(Ljava/lang/ref/ReferenceQueue;Lcom/google/common/collect/MapMakerInternalMap$InternalEntry;)Lcom/google/common/collect/MapMakerInternalMap$WeakValueReference;

    move-result-object p1

    # setter for: Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueEntry;->valueReference:Lcom/google/common/collect/MapMakerInternalMap$WeakValueReference;
    invoke-static {p0, p1}, Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueEntry;->access$1502(Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueEntry;Lcom/google/common/collect/MapMakerInternalMap$WeakValueReference;)Lcom/google/common/collect/MapMakerInternalMap$WeakValueReference;

    return-object p0
.end method

.method public keyStrength()Lcom/google/common/collect/MapMakerInternalMap$Strength;
    .registers 1

    .line 923
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

    .line 911
    check-cast p1, Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueSegment;

    check-cast p4, Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueEntry;

    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueEntry$Helper;->newEntry(Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueSegment;Ljava/lang/Object;ILcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueEntry;)Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueEntry;

    move-result-object p0

    return-object p0
.end method

.method public newEntry(Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueSegment;Ljava/lang/Object;ILcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueEntry;)Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueEntry;
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
            "Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueSegment<",
            "TK;TV;>;TK;I",
            "Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueEntry<",
            "TK;TV;>;)",
            "Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueEntry<",
            "TK;TV;>;"
        }
    .end annotation

    if-nez p4, :cond_0

    .line 971
    new-instance p0, Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueEntry;

    # getter for: Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueSegment;->queueForKeys:Ljava/lang/ref/ReferenceQueue;
    invoke-static {p1}, Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueSegment;->access$1700(Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueSegment;)Ljava/lang/ref/ReferenceQueue;

    move-result-object p1

    invoke-direct {p0, p1, p2, p3}, Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueEntry;-><init>(Ljava/lang/ref/ReferenceQueue;Ljava/lang/Object;I)V

    return-object p0

    .line 972
    :cond_0
    new-instance p0, Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueEntry$LinkedWeakKeyWeakValueEntry;

    # getter for: Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueSegment;->queueForKeys:Ljava/lang/ref/ReferenceQueue;
    invoke-static {p1}, Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueSegment;->access$1700(Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueSegment;)Ljava/lang/ref/ReferenceQueue;

    move-result-object p1

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueEntry$LinkedWeakKeyWeakValueEntry;-><init>(Ljava/lang/ref/ReferenceQueue;Ljava/lang/Object;ILcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueEntry;)V

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

    .line 911
    invoke-virtual {p0, p1, p2}, Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueEntry$Helper;->newSegment(Lcom/google/common/collect/MapMakerInternalMap;I)Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueSegment;

    move-result-object p0

    return-object p0
.end method

.method public newSegment(Lcom/google/common/collect/MapMakerInternalMap;I)Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueSegment;
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
            "TK;TV;>;>;I)",
            "Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueSegment<",
            "TK;TV;>;"
        }
    .end annotation

    .line 935
    new-instance p0, Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueSegment;

    invoke-direct {p0, p1, p2}, Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueSegment;-><init>(Lcom/google/common/collect/MapMakerInternalMap;I)V

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

    .line 911
    check-cast p1, Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueSegment;

    check-cast p2, Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueEntry;

    invoke-virtual {p0, p1, p2, p3}, Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueEntry$Helper;->setValue(Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueSegment;Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueEntry;Ljava/lang/Object;)V

    return-void
.end method

.method public setValue(Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueSegment;Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueEntry;Ljava/lang/Object;)V
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
            "Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueSegment<",
            "TK;TV;>;",
            "Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueEntry<",
            "TK;TV;>;TV;)V"
        }
    .end annotation

    .line 959
    # getter for: Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueEntry;->valueReference:Lcom/google/common/collect/MapMakerInternalMap$WeakValueReference;
    invoke-static {p2}, Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueEntry;->access$1500(Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueEntry;)Lcom/google/common/collect/MapMakerInternalMap$WeakValueReference;

    move-result-object p0

    .line 960
    new-instance v0, Lcom/google/common/collect/MapMakerInternalMap$WeakValueReferenceImpl;

    # getter for: Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueSegment;->queueForValues:Ljava/lang/ref/ReferenceQueue;
    invoke-static {p1}, Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueSegment;->access$1600(Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueSegment;)Ljava/lang/ref/ReferenceQueue;

    move-result-object p1

    invoke-direct {v0, p1, p3, p2}, Lcom/google/common/collect/MapMakerInternalMap$WeakValueReferenceImpl;-><init>(Ljava/lang/ref/ReferenceQueue;Ljava/lang/Object;Lcom/google/common/collect/MapMakerInternalMap$InternalEntry;)V

    # setter for: Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueEntry;->valueReference:Lcom/google/common/collect/MapMakerInternalMap$WeakValueReference;
    invoke-static {p2, v0}, Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueEntry;->access$1502(Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueEntry;Lcom/google/common/collect/MapMakerInternalMap$WeakValueReference;)Lcom/google/common/collect/MapMakerInternalMap$WeakValueReference;

    .line 961
    invoke-interface {p0}, Lcom/google/common/collect/MapMakerInternalMap$WeakValueReference;->clear()V

    return-void
.end method

.method public valueStrength()Lcom/google/common/collect/MapMakerInternalMap$Strength;
    .registers 1

    .line 928
    sget-object p0, Lcom/google/common/collect/MapMakerInternalMap$Strength;->WEAK:Lcom/google/common/collect/MapMakerInternalMap$Strength;

    return-object p0
.end method
