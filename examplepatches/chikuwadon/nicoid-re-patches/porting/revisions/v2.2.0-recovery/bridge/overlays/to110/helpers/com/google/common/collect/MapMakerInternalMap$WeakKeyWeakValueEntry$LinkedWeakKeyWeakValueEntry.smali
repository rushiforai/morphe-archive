.class final Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueEntry$LinkedWeakKeyWeakValueEntry;
.super Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueEntry;
.source "MapMakerInternalMap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueEntry;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "LinkedWeakKeyWeakValueEntry"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueEntry<",
        "TK;TV;>;"
    }
.end annotation


# instance fields
.field private final next:Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueEntry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueEntry<",
            "TK;TV;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/lang/ref/ReferenceQueue;Ljava/lang/Object;ILcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueEntry;)V
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
            "key",
            "hash",
            "next"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/ref/ReferenceQueue<",
            "TK;>;TK;I",
            "Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueEntry<",
            "TK;TV;>;)V"
        }
    .end annotation

    .line 900
    invoke-direct {p0, p1, p2, p3}, Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueEntry;-><init>(Ljava/lang/ref/ReferenceQueue;Ljava/lang/Object;I)V

    .line 901
    iput-object p4, p0, Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueEntry$LinkedWeakKeyWeakValueEntry;->next:Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueEntry;

    return-void
.end method


# virtual methods
.method public bridge synthetic getNext()Lcom/google/common/collect/MapMakerInternalMap$InternalEntry;
    .registers 1

    .line 894
    invoke-virtual {p0}, Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueEntry$LinkedWeakKeyWeakValueEntry;->getNext()Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueEntry;

    move-result-object p0

    return-object p0
.end method

.method public getNext()Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueEntry;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueEntry<",
            "TK;TV;>;"
        }
    .end annotation

    .line 906
    iget-object p0, p0, Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueEntry$LinkedWeakKeyWeakValueEntry;->next:Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueEntry;

    return-object p0
.end method
