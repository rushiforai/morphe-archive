.class final Lcom/google/common/collect/HashBiMap$ValueSet;
.super Lcom/google/common/collect/HashBiMap$View;
.source "HashBiMap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/HashBiMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "ValueSet"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/common/collect/HashBiMap$View<",
        "TK;TV;TV;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/common/collect/HashBiMap;


# direct methods
.method constructor <init>(Lcom/google/common/collect/HashBiMap;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1010
        }
        names = {
            "this$0"
        }
    .end annotation

    .line 816
    iput-object p1, p0, Lcom/google/common/collect/HashBiMap$ValueSet;->this$0:Lcom/google/common/collect/HashBiMap;

    .line 817
    invoke-direct {p0, p1}, Lcom/google/common/collect/HashBiMap$View;-><init>(Lcom/google/common/collect/HashBiMap;)V

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
            "o"
        }
    .end annotation

    .line 829
    iget-object p0, p0, Lcom/google/common/collect/HashBiMap$ValueSet;->this$0:Lcom/google/common/collect/HashBiMap;

    invoke-virtual {p0, p1}, Lcom/google/common/collect/HashBiMap;->containsValue(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method forEntry(I)Ljava/lang/Object;
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
            "(I)TV;"
        }
    .end annotation

    .line 824
    iget-object p0, p0, Lcom/google/common/collect/HashBiMap$ValueSet;->this$0:Lcom/google/common/collect/HashBiMap;

    # getter for: Lcom/google/common/collect/HashBiMap;->values:[Ljava/lang/Object;
    invoke-static {p0}, Lcom/google/common/collect/HashBiMap;->access$800(Lcom/google/common/collect/HashBiMap;)[Ljava/lang/Object;

    move-result-object p0

    aget-object p0, p0, p1

    invoke-static {p0}, Lcom/google/common/collect/NullnessCasts;->uncheckedCastNullableTToT(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public remove(Ljava/lang/Object;)Z
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "o"
        }
    .end annotation

    .line 834
    invoke-static {p1}, Lcom/google/common/collect/Hashing;->smearedHash(Ljava/lang/Object;)I

    move-result v0

    .line 835
    iget-object v1, p0, Lcom/google/common/collect/HashBiMap$ValueSet;->this$0:Lcom/google/common/collect/HashBiMap;

    # invokes: Lcom/google/common/collect/HashBiMap;->findEntryByValue(Ljava/lang/Object;I)I
    invoke-static {v1, p1, v0}, Lcom/google/common/collect/HashBiMap;->access$900(Lcom/google/common/collect/HashBiMap;Ljava/lang/Object;I)I

    move-result p1

    const/4 v1, -0x1

    if-eq p1, v1, :cond_0

    .line 837
    iget-object p0, p0, Lcom/google/common/collect/HashBiMap$ValueSet;->this$0:Lcom/google/common/collect/HashBiMap;

    # invokes: Lcom/google/common/collect/HashBiMap;->removeEntryValueHashKnown(II)V
    invoke-static {p0, p1, v0}, Lcom/google/common/collect/HashBiMap;->access$1000(Lcom/google/common/collect/HashBiMap;II)V

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method
