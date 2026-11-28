.class final Lcom/google/common/collect/CompactHashMap$KeySetView;
.super Ljava/util/AbstractSet;
.source "CompactHashMap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/CompactHashMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "KeySetView"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/AbstractSet<",
        "TK;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/common/collect/CompactHashMap;


# direct methods
.method private constructor <init>(Lcom/google/common/collect/CompactHashMap;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1010
        }
        names = {
            "this$0"
        }
    .end annotation

    .line 692
    iput-object p1, p0, Lcom/google/common/collect/CompactHashMap$KeySetView;->this$0:Lcom/google/common/collect/CompactHashMap;

    invoke-direct {p0}, Ljava/util/AbstractSet;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/common/collect/CompactHashMap;Lcom/google/common/collect/CompactHashMap$1;)V
    .registers 3

    .line 692
    invoke-direct {p0, p1}, Lcom/google/common/collect/CompactHashMap$KeySetView;-><init>(Lcom/google/common/collect/CompactHashMap;)V

    return-void
.end method


# virtual methods
.method public clear()V
    .registers 1

    .line 718
    iget-object p0, p0, Lcom/google/common/collect/CompactHashMap$KeySetView;->this$0:Lcom/google/common/collect/CompactHashMap;

    invoke-virtual {p0}, Lcom/google/common/collect/CompactHashMap;->clear()V

    return-void
.end method

.method public contains(Ljava/lang/Object;)Z
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "o"
        }
    .end annotation

    .line 700
    iget-object p0, p0, Lcom/google/common/collect/CompactHashMap$KeySetView;->this$0:Lcom/google/common/collect/CompactHashMap;

    invoke-virtual {p0, p1}, Lcom/google/common/collect/CompactHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public final iterator()Ljava/util/Iterator;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "TK;>;"
        }
    .end annotation

    .line 713
    iget-object p0, p0, Lcom/google/common/collect/CompactHashMap$KeySetView;->this$0:Lcom/google/common/collect/CompactHashMap;

    invoke-virtual {p0}, Lcom/google/common/collect/CompactHashMap;->keySetIterator()Ljava/util/Iterator;

    move-result-object p0

    return-object p0
.end method

.method public final remove(Ljava/lang/Object;)Z
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "o"
        }
    .end annotation

    .line 705
    iget-object v0, p0, Lcom/google/common/collect/CompactHashMap$KeySetView;->this$0:Lcom/google/common/collect/CompactHashMap;

    invoke-virtual {v0}, Lcom/google/common/collect/CompactHashMap;->delegateOrNull()Ljava/util/Map;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 707
    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    move-result p0

    return p0

    .line 708
    :cond_0
    iget-object p0, p0, Lcom/google/common/collect/CompactHashMap$KeySetView;->this$0:Lcom/google/common/collect/CompactHashMap;

    # invokes: Lcom/google/common/collect/CompactHashMap;->removeHelper(Ljava/lang/Object;)Ljava/lang/Object;
    invoke-static {p0, p1}, Lcom/google/common/collect/CompactHashMap;->access$300(Lcom/google/common/collect/CompactHashMap;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    # getter for: Lcom/google/common/collect/CompactHashMap;->NOT_FOUND:Ljava/lang/Object;
    invoke-static {}, Lcom/google/common/collect/CompactHashMap;->access$400()Ljava/lang/Object;

    move-result-object p1

    if-eq p0, p1, :cond_1

    const/4 p0, 0x1

    return p0

    :cond_1
    const/4 p0, 0x0

    return p0
.end method

.method public size()I
    .registers 1

    .line 695
    iget-object p0, p0, Lcom/google/common/collect/CompactHashMap$KeySetView;->this$0:Lcom/google/common/collect/CompactHashMap;

    invoke-virtual {p0}, Lcom/google/common/collect/CompactHashMap;->size()I

    move-result p0

    return p0
.end method
