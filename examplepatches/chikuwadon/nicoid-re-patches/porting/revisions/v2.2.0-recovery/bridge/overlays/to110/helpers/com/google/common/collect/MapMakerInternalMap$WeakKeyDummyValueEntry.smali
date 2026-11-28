.class Lcom/google/common/collect/MapMakerInternalMap$WeakKeyDummyValueEntry;
.super Lcom/google/common/collect/MapMakerInternalMap$AbstractWeakKeyEntry;
.source "MapMakerInternalMap.java"

# interfaces
.implements Lcom/google/common/collect/MapMakerInternalMap$StrongValueEntry;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/MapMakerInternalMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "WeakKeyDummyValueEntry"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/common/collect/MapMakerInternalMap$WeakKeyDummyValueEntry$Helper;,
        Lcom/google/common/collect/MapMakerInternalMap$WeakKeyDummyValueEntry$LinkedWeakKeyDummyValueEntry;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/common/collect/MapMakerInternalMap$AbstractWeakKeyEntry<",
        "TK;",
        "Lcom/google/common/collect/MapMaker$Dummy;",
        "Lcom/google/common/collect/MapMakerInternalMap$WeakKeyDummyValueEntry<",
        "TK;>;>;",
        "Lcom/google/common/collect/MapMakerInternalMap$StrongValueEntry<",
        "TK;",
        "Lcom/google/common/collect/MapMaker$Dummy;",
        "Lcom/google/common/collect/MapMakerInternalMap$WeakKeyDummyValueEntry<",
        "TK;>;>;"
    }
.end annotation


# direct methods
.method private constructor <init>(Ljava/lang/ref/ReferenceQueue;Ljava/lang/Object;I)V
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "queue",
            "key",
            "hash"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/ref/ReferenceQueue<",
            "TK;>;TK;I)V"
        }
    .end annotation

    .line 695
    invoke-direct {p0, p1, p2, p3}, Lcom/google/common/collect/MapMakerInternalMap$AbstractWeakKeyEntry;-><init>(Ljava/lang/ref/ReferenceQueue;Ljava/lang/Object;I)V

    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/ref/ReferenceQueue;Ljava/lang/Object;ILcom/google/common/collect/MapMakerInternalMap$1;)V
    .registers 5

    .line 690
    invoke-direct {p0, p1, p2, p3}, Lcom/google/common/collect/MapMakerInternalMap$WeakKeyDummyValueEntry;-><init>(Ljava/lang/ref/ReferenceQueue;Ljava/lang/Object;I)V

    return-void
.end method


# virtual methods
.method public final getValue()Lcom/google/common/collect/MapMaker$Dummy;
    .registers 1

    .line 700
    sget-object p0, Lcom/google/common/collect/MapMaker$Dummy;->VALUE:Lcom/google/common/collect/MapMaker$Dummy;

    return-object p0
.end method

.method public bridge synthetic getValue()Ljava/lang/Object;
    .registers 1

    .line 690
    invoke-virtual {p0}, Lcom/google/common/collect/MapMakerInternalMap$WeakKeyDummyValueEntry;->getValue()Lcom/google/common/collect/MapMaker$Dummy;

    move-result-object p0

    return-object p0
.end method
