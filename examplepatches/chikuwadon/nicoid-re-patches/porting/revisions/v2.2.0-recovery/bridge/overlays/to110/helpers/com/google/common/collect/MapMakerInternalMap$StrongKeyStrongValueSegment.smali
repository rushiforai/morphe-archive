.class final Lcom/google/common/collect/MapMakerInternalMap$StrongKeyStrongValueSegment;
.super Lcom/google/common/collect/MapMakerInternalMap$Segment;
.source "MapMakerInternalMap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/MapMakerInternalMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "StrongKeyStrongValueSegment"
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
        "Lcom/google/common/collect/MapMakerInternalMap$StrongKeyStrongValueEntry<",
        "TK;TV;>;",
        "Lcom/google/common/collect/MapMakerInternalMap$StrongKeyStrongValueSegment<",
        "TK;TV;>;>;"
    }
.end annotation


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
            "Lcom/google/common/collect/MapMakerInternalMap$StrongKeyStrongValueEntry<",
            "TK;TV;>;",
            "Lcom/google/common/collect/MapMakerInternalMap$StrongKeyStrongValueSegment<",
            "TK;TV;>;>;I)V"
        }
    .end annotation

    .line 2025
    invoke-direct {p0, p1, p2}, Lcom/google/common/collect/MapMakerInternalMap$Segment;-><init>(Lcom/google/common/collect/MapMakerInternalMap;I)V

    return-void
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

    .line 2018
    invoke-virtual {p0, p1}, Lcom/google/common/collect/MapMakerInternalMap$StrongKeyStrongValueSegment;->castForTesting(Lcom/google/common/collect/MapMakerInternalMap$InternalEntry;)Lcom/google/common/collect/MapMakerInternalMap$StrongKeyStrongValueEntry;

    move-result-object p0

    return-object p0
.end method

.method castForTesting(Lcom/google/common/collect/MapMakerInternalMap$InternalEntry;)Lcom/google/common/collect/MapMakerInternalMap$StrongKeyStrongValueEntry;
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
            "Lcom/google/common/collect/MapMakerInternalMap$StrongKeyStrongValueEntry<",
            "TK;TV;>;"
        }
    .end annotation

    .line 2037
    check-cast p1, Lcom/google/common/collect/MapMakerInternalMap$StrongKeyStrongValueEntry;

    return-object p1
.end method

.method bridge synthetic self()Lcom/google/common/collect/MapMakerInternalMap$Segment;
    .registers 1

    .line 2018
    invoke-virtual {p0}, Lcom/google/common/collect/MapMakerInternalMap$StrongKeyStrongValueSegment;->self()Lcom/google/common/collect/MapMakerInternalMap$StrongKeyStrongValueSegment;

    move-result-object p0

    return-object p0
.end method

.method self()Lcom/google/common/collect/MapMakerInternalMap$StrongKeyStrongValueSegment;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/MapMakerInternalMap$StrongKeyStrongValueSegment<",
            "TK;TV;>;"
        }
    .end annotation

    return-object p0
.end method
