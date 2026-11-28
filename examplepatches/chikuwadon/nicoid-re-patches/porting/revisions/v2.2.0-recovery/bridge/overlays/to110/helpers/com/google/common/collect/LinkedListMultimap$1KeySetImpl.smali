.class final Lcom/google/common/collect/LinkedListMultimap$1KeySetImpl;
.super Lcom/google/common/collect/Sets$ImprovedAbstractSet;
.source "LinkedListMultimap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/common/collect/LinkedListMultimap;->keySet()Ljava/util/Set;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "KeySetImpl"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/common/collect/Sets$ImprovedAbstractSet<",
        "TK;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/common/collect/LinkedListMultimap;


# direct methods
.method constructor <init>(Lcom/google/common/collect/LinkedListMultimap;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            "this$0"
        }
    .end annotation

    .line 709
    iput-object p1, p0, Lcom/google/common/collect/LinkedListMultimap$1KeySetImpl;->this$0:Lcom/google/common/collect/LinkedListMultimap;

    invoke-direct {p0}, Lcom/google/common/collect/Sets$ImprovedAbstractSet;-><init>()V

    return-void
.end method


# virtual methods
.method public contains(Ljava/lang/Object;)Z
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "key"
        }
    .end annotation

    .line 722
    iget-object p0, p0, Lcom/google/common/collect/LinkedListMultimap$1KeySetImpl;->this$0:Lcom/google/common/collect/LinkedListMultimap;

    invoke-virtual {p0, p1}, Lcom/google/common/collect/LinkedListMultimap;->containsKey(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public iterator()Ljava/util/Iterator;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "TK;>;"
        }
    .end annotation

    .line 717
    new-instance v0, Lcom/google/common/collect/LinkedListMultimap$DistinctKeyIterator;

    iget-object p0, p0, Lcom/google/common/collect/LinkedListMultimap$1KeySetImpl;->this$0:Lcom/google/common/collect/LinkedListMultimap;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/google/common/collect/LinkedListMultimap$DistinctKeyIterator;-><init>(Lcom/google/common/collect/LinkedListMultimap;Lcom/google/common/collect/LinkedListMultimap$1;)V

    return-object v0
.end method

.method public remove(Ljava/lang/Object;)Z
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "o"
        }
    .end annotation

    .line 727
    iget-object p0, p0, Lcom/google/common/collect/LinkedListMultimap$1KeySetImpl;->this$0:Lcom/google/common/collect/LinkedListMultimap;

    invoke-virtual {p0, p1}, Lcom/google/common/collect/LinkedListMultimap;->removeAll(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result p0

    xor-int/lit8 p0, p0, 0x1

    return p0
.end method

.method public size()I
    .registers 1

    .line 712
    iget-object p0, p0, Lcom/google/common/collect/LinkedListMultimap$1KeySetImpl;->this$0:Lcom/google/common/collect/LinkedListMultimap;

    # getter for: Lcom/google/common/collect/LinkedListMultimap;->keyToKeyList:Ljava/util/Map;
    invoke-static {p0}, Lcom/google/common/collect/LinkedListMultimap;->access$500(Lcom/google/common/collect/LinkedListMultimap;)Ljava/util/Map;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Map;->size()I

    move-result p0

    return p0
.end method
