.class final Lcom/google/common/collect/MapMakerInternalMap$StrongKeyDummyValueEntry$LinkedStrongKeyDummyValueEntry;
.super Lcom/google/common/collect/MapMakerInternalMap$StrongKeyDummyValueEntry;
.source "MapMakerInternalMap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/MapMakerInternalMap$StrongKeyDummyValueEntry;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "LinkedStrongKeyDummyValueEntry"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/common/collect/MapMakerInternalMap$StrongKeyDummyValueEntry<",
        "TK;>;"
    }
.end annotation


# instance fields
.field private final next:Lcom/google/common/collect/MapMakerInternalMap$StrongKeyDummyValueEntry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/MapMakerInternalMap$StrongKeyDummyValueEntry<",
            "TK;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/lang/Object;ILcom/google/common/collect/MapMakerInternalMap$StrongKeyDummyValueEntry;)V
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "key",
            "hash",
            "next"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;I",
            "Lcom/google/common/collect/MapMakerInternalMap$StrongKeyDummyValueEntry<",
            "TK;>;)V"
        }
    .end annotation

    const/4 v0, 0x0

    .line 596
    invoke-direct {p0, p1, p2, v0}, Lcom/google/common/collect/MapMakerInternalMap$StrongKeyDummyValueEntry;-><init>(Ljava/lang/Object;ILcom/google/common/collect/MapMakerInternalMap$1;)V

    .line 597
    iput-object p3, p0, Lcom/google/common/collect/MapMakerInternalMap$StrongKeyDummyValueEntry$LinkedStrongKeyDummyValueEntry;->next:Lcom/google/common/collect/MapMakerInternalMap$StrongKeyDummyValueEntry;

    return-void
.end method


# virtual methods
.method public bridge synthetic getNext()Lcom/google/common/collect/MapMakerInternalMap$InternalEntry;
    .registers 1

    .line 591
    invoke-virtual {p0}, Lcom/google/common/collect/MapMakerInternalMap$StrongKeyDummyValueEntry$LinkedStrongKeyDummyValueEntry;->getNext()Lcom/google/common/collect/MapMakerInternalMap$StrongKeyDummyValueEntry;

    move-result-object p0

    return-object p0
.end method

.method public getNext()Lcom/google/common/collect/MapMakerInternalMap$StrongKeyDummyValueEntry;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/MapMakerInternalMap$StrongKeyDummyValueEntry<",
            "TK;>;"
        }
    .end annotation

    .line 602
    iget-object p0, p0, Lcom/google/common/collect/MapMakerInternalMap$StrongKeyDummyValueEntry$LinkedStrongKeyDummyValueEntry;->next:Lcom/google/common/collect/MapMakerInternalMap$StrongKeyDummyValueEntry;

    return-object p0
.end method

.method public bridge synthetic getValue()Ljava/lang/Object;
    .registers 1

    .line 591
    invoke-super {p0}, Lcom/google/common/collect/MapMakerInternalMap$StrongKeyDummyValueEntry;->getValue()Lcom/google/common/collect/MapMaker$Dummy;

    move-result-object p0

    return-object p0
.end method
