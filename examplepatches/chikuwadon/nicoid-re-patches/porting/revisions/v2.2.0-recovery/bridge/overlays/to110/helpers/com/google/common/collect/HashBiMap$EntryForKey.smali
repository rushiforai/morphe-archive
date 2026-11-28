.class final Lcom/google/common/collect/HashBiMap$EntryForKey;
.super Lcom/google/common/collect/AbstractMapEntry;
.source "HashBiMap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/HashBiMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "EntryForKey"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/common/collect/AbstractMapEntry<",
        "TK;TV;>;"
    }
.end annotation


# instance fields
.field index:I

.field final key:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TK;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/google/common/collect/HashBiMap;


# direct methods
.method constructor <init>(Lcom/google/common/collect/HashBiMap;I)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1010,
            0x0
        }
        names = {
            "this$0",
            "index"
        }
    .end annotation

    .line 907
    iput-object p1, p0, Lcom/google/common/collect/HashBiMap$EntryForKey;->this$0:Lcom/google/common/collect/HashBiMap;

    invoke-direct {p0}, Lcom/google/common/collect/AbstractMapEntry;-><init>()V

    .line 909
    # getter for: Lcom/google/common/collect/HashBiMap;->keys:[Ljava/lang/Object;
    invoke-static {p1}, Lcom/google/common/collect/HashBiMap;->access$500(Lcom/google/common/collect/HashBiMap;)[Ljava/lang/Object;

    move-result-object p1

    aget-object p1, p1, p2

    invoke-static {p1}, Lcom/google/common/collect/NullnessCasts;->uncheckedCastNullableTToT(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    iput-object p1, p0, Lcom/google/common/collect/HashBiMap$EntryForKey;->key:Ljava/lang/Object;

    .line 910
    iput p2, p0, Lcom/google/common/collect/HashBiMap$EntryForKey;->index:I

    return-void
.end method


# virtual methods
.method public getKey()Ljava/lang/Object;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TK;"
        }
    .end annotation

    .line 922
    iget-object p0, p0, Lcom/google/common/collect/HashBiMap$EntryForKey;->key:Ljava/lang/Object;

    return-object p0
.end method

.method public getValue()Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TV;"
        }
    .end annotation

    .line 928
    invoke-virtual {p0}, Lcom/google/common/collect/HashBiMap$EntryForKey;->updateIndex()V

    .line 940
    iget v0, p0, Lcom/google/common/collect/HashBiMap$EntryForKey;->index:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    invoke-static {}, Lcom/google/common/collect/NullnessCasts;->unsafeNull()Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :cond_0
    iget-object v0, p0, Lcom/google/common/collect/HashBiMap$EntryForKey;->this$0:Lcom/google/common/collect/HashBiMap;

    # getter for: Lcom/google/common/collect/HashBiMap;->values:[Ljava/lang/Object;
    invoke-static {v0}, Lcom/google/common/collect/HashBiMap;->access$800(Lcom/google/common/collect/HashBiMap;)[Ljava/lang/Object;

    move-result-object v0

    iget p0, p0, Lcom/google/common/collect/HashBiMap$EntryForKey;->index:I

    aget-object p0, v0, p0

    invoke-static {p0}, Lcom/google/common/collect/NullnessCasts;->uncheckedCastNullableTToT(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public setValue(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "value"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TV;)TV;"
        }
    .end annotation

    .line 946
    invoke-virtual {p0}, Lcom/google/common/collect/HashBiMap$EntryForKey;->updateIndex()V

    .line 947
    iget v0, p0, Lcom/google/common/collect/HashBiMap$EntryForKey;->index:I

    .line 956
    iget-object v1, p0, Lcom/google/common/collect/HashBiMap$EntryForKey;->this$0:Lcom/google/common/collect/HashBiMap;

    const/4 v2, -0x1

    if-ne v0, v2, :cond_0

    .line 948
    iget-object p0, p0, Lcom/google/common/collect/HashBiMap$EntryForKey;->key:Ljava/lang/Object;

    invoke-virtual {v1, p0, p1}, Lcom/google/common/collect/HashBiMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 949
    invoke-static {}, Lcom/google/common/collect/NullnessCasts;->unsafeNull()Ljava/lang/Object;

    move-result-object p0

    return-object p0

    .line 956
    :cond_0
    # getter for: Lcom/google/common/collect/HashBiMap;->values:[Ljava/lang/Object;
    invoke-static {v1}, Lcom/google/common/collect/HashBiMap;->access$800(Lcom/google/common/collect/HashBiMap;)[Ljava/lang/Object;

    move-result-object v0

    iget v1, p0, Lcom/google/common/collect/HashBiMap$EntryForKey;->index:I

    aget-object v0, v0, v1

    invoke-static {v0}, Lcom/google/common/collect/NullnessCasts;->uncheckedCastNullableTToT(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 957
    invoke-static {v0, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    return-object p1

    .line 960
    :cond_1
    iget-object v1, p0, Lcom/google/common/collect/HashBiMap$EntryForKey;->this$0:Lcom/google/common/collect/HashBiMap;

    iget p0, p0, Lcom/google/common/collect/HashBiMap$EntryForKey;->index:I

    const/4 v2, 0x0

    # invokes: Lcom/google/common/collect/HashBiMap;->replaceValueInEntry(ILjava/lang/Object;Z)V
    invoke-static {v1, p0, p1, v2}, Lcom/google/common/collect/HashBiMap;->access$1200(Lcom/google/common/collect/HashBiMap;ILjava/lang/Object;Z)V

    return-object v0
.end method

.method updateIndex()V
    .registers 3

    .line 914
    iget v0, p0, Lcom/google/common/collect/HashBiMap$EntryForKey;->index:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    iget-object v1, p0, Lcom/google/common/collect/HashBiMap$EntryForKey;->this$0:Lcom/google/common/collect/HashBiMap;

    # getter for: Lcom/google/common/collect/HashBiMap;->size:I
    invoke-static {v1}, Lcom/google/common/collect/HashBiMap;->access$200(Lcom/google/common/collect/HashBiMap;)I

    move-result v1

    if-ge v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/common/collect/HashBiMap$EntryForKey;->this$0:Lcom/google/common/collect/HashBiMap;

    # getter for: Lcom/google/common/collect/HashBiMap;->keys:[Ljava/lang/Object;
    invoke-static {v0}, Lcom/google/common/collect/HashBiMap;->access$500(Lcom/google/common/collect/HashBiMap;)[Ljava/lang/Object;

    move-result-object v0

    iget v1, p0, Lcom/google/common/collect/HashBiMap$EntryForKey;->index:I

    aget-object v0, v0, v1

    iget-object v1, p0, Lcom/google/common/collect/HashBiMap$EntryForKey;->key:Ljava/lang/Object;

    invoke-static {v0, v1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 915
    :cond_0
    iget-object v0, p0, Lcom/google/common/collect/HashBiMap$EntryForKey;->this$0:Lcom/google/common/collect/HashBiMap;

    iget-object v1, p0, Lcom/google/common/collect/HashBiMap$EntryForKey;->key:Ljava/lang/Object;

    # invokes: Lcom/google/common/collect/HashBiMap;->findEntryByKey(Ljava/lang/Object;)I
    invoke-static {v0, v1}, Lcom/google/common/collect/HashBiMap;->access$1100(Lcom/google/common/collect/HashBiMap;Ljava/lang/Object;)I

    move-result v0

    iput v0, p0, Lcom/google/common/collect/HashBiMap$EntryForKey;->index:I

    return-void
.end method
