.class final Lcom/google/common/collect/MapMakerInternalMap$WeakValueReferenceImpl;
.super Ljava/lang/ref/WeakReference;
.source "MapMakerInternalMap.java"

# interfaces
.implements Lcom/google/common/collect/MapMakerInternalMap$WeakValueReference;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/MapMakerInternalMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "WeakValueReferenceImpl"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        "E::",
        "Lcom/google/common/collect/MapMakerInternalMap$InternalEntry<",
        "TK;TV;TE;>;>",
        "Ljava/lang/ref/WeakReference<",
        "TV;>;",
        "Lcom/google/common/collect/MapMakerInternalMap$WeakValueReference<",
        "TK;TV;TE;>;"
    }
.end annotation


# instance fields
.field final entry:Lcom/google/common/collect/MapMakerInternalMap$InternalEntry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TE;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/lang/ref/ReferenceQueue;Ljava/lang/Object;Lcom/google/common/collect/MapMakerInternalMap$InternalEntry;)V
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "queue",
            "referent",
            "entry"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/ref/ReferenceQueue<",
            "TV;>;TV;TE;)V"
        }
    .end annotation

    .line 1061
    # invokes: Lcom/google/common/collect/MapMakerInternalMap;->checkNotValueType(Ljava/lang/Object;)Ljava/lang/Object;
    invoke-static {p2}, Lcom/google/common/collect/MapMakerInternalMap;->access$700(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    invoke-direct {p0, p2, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;Ljava/lang/ref/ReferenceQueue;)V

    .line 1062
    iput-object p3, p0, Lcom/google/common/collect/MapMakerInternalMap$WeakValueReferenceImpl;->entry:Lcom/google/common/collect/MapMakerInternalMap$InternalEntry;

    return-void
.end method


# virtual methods
.method public copyFor(Ljava/lang/ref/ReferenceQueue;Lcom/google/common/collect/MapMakerInternalMap$InternalEntry;)Lcom/google/common/collect/MapMakerInternalMap$WeakValueReference;
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "queue",
            "entry"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/ref/ReferenceQueue<",
            "TV;>;TE;)",
            "Lcom/google/common/collect/MapMakerInternalMap$WeakValueReference<",
            "TK;TV;TE;>;"
        }
    .end annotation

    .line 1072
    new-instance v0, Lcom/google/common/collect/MapMakerInternalMap$WeakValueReferenceImpl;

    invoke-virtual {p0}, Lcom/google/common/collect/MapMakerInternalMap$WeakValueReferenceImpl;->get()Ljava/lang/Object;

    move-result-object p0

    invoke-direct {v0, p1, p0, p2}, Lcom/google/common/collect/MapMakerInternalMap$WeakValueReferenceImpl;-><init>(Ljava/lang/ref/ReferenceQueue;Ljava/lang/Object;Lcom/google/common/collect/MapMakerInternalMap$InternalEntry;)V

    return-object v0
.end method

.method public getEntry()Lcom/google/common/collect/MapMakerInternalMap$InternalEntry;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    .line 1067
    iget-object p0, p0, Lcom/google/common/collect/MapMakerInternalMap$WeakValueReferenceImpl;->entry:Lcom/google/common/collect/MapMakerInternalMap$InternalEntry;

    return-object p0
.end method
