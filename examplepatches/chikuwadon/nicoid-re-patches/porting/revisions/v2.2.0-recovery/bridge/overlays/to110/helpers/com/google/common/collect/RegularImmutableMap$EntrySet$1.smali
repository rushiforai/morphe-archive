.class Lcom/google/common/collect/RegularImmutableMap$EntrySet$1;
.super Lcom/google/common/collect/ImmutableList;
.source "RegularImmutableMap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/common/collect/RegularImmutableMap$EntrySet;->createAsList()Lcom/google/common/collect/ImmutableList;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/common/collect/ImmutableList<",
        "Ljava/util/Map$Entry<",
        "TK;TV;>;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/common/collect/RegularImmutableMap$EntrySet;


# direct methods
.method constructor <init>(Lcom/google/common/collect/RegularImmutableMap$EntrySet;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            "this$0"
        }
    .end annotation

    .line 409
    iput-object p1, p0, Lcom/google/common/collect/RegularImmutableMap$EntrySet$1;->this$0:Lcom/google/common/collect/RegularImmutableMap$EntrySet;

    invoke-direct {p0}, Lcom/google/common/collect/ImmutableList;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic get(I)Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "index"
        }
    .end annotation

    .line 409
    invoke-virtual {p0, p1}, Lcom/google/common/collect/RegularImmutableMap$EntrySet$1;->get(I)Ljava/util/Map$Entry;

    move-result-object p0

    return-object p0
.end method

.method public get(I)Ljava/util/Map$Entry;
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "index"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/Map$Entry<",
            "TK;TV;>;"
        }
    .end annotation

    .line 412
    iget-object v0, p0, Lcom/google/common/collect/RegularImmutableMap$EntrySet$1;->this$0:Lcom/google/common/collect/RegularImmutableMap$EntrySet;

    # getter for: Lcom/google/common/collect/RegularImmutableMap$EntrySet;->size:I
    invoke-static {v0}, Lcom/google/common/collect/RegularImmutableMap$EntrySet;->access$000(Lcom/google/common/collect/RegularImmutableMap$EntrySet;)I

    move-result v0

    invoke-static {p1, v0}, Lcom/google/common/base/Preconditions;->checkElementIndex(II)I

    .line 418
    iget-object v0, p0, Lcom/google/common/collect/RegularImmutableMap$EntrySet$1;->this$0:Lcom/google/common/collect/RegularImmutableMap$EntrySet;

    # getter for: Lcom/google/common/collect/RegularImmutableMap$EntrySet;->alternatingKeysAndValues:[Ljava/lang/Object;
    invoke-static {v0}, Lcom/google/common/collect/RegularImmutableMap$EntrySet;->access$100(Lcom/google/common/collect/RegularImmutableMap$EntrySet;)[Ljava/lang/Object;

    move-result-object v0

    shl-int/lit8 p1, p1, 0x1

    iget-object v1, p0, Lcom/google/common/collect/RegularImmutableMap$EntrySet$1;->this$0:Lcom/google/common/collect/RegularImmutableMap$EntrySet;

    # getter for: Lcom/google/common/collect/RegularImmutableMap$EntrySet;->keyOffset:I
    invoke-static {v1}, Lcom/google/common/collect/RegularImmutableMap$EntrySet;->access$200(Lcom/google/common/collect/RegularImmutableMap$EntrySet;)I

    move-result v1

    add-int/2addr v1, p1

    aget-object v0, v0, v1

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 420
    iget-object v1, p0, Lcom/google/common/collect/RegularImmutableMap$EntrySet$1;->this$0:Lcom/google/common/collect/RegularImmutableMap$EntrySet;

    # getter for: Lcom/google/common/collect/RegularImmutableMap$EntrySet;->alternatingKeysAndValues:[Ljava/lang/Object;
    invoke-static {v1}, Lcom/google/common/collect/RegularImmutableMap$EntrySet;->access$100(Lcom/google/common/collect/RegularImmutableMap$EntrySet;)[Ljava/lang/Object;

    move-result-object v1

    iget-object p0, p0, Lcom/google/common/collect/RegularImmutableMap$EntrySet$1;->this$0:Lcom/google/common/collect/RegularImmutableMap$EntrySet;

    # getter for: Lcom/google/common/collect/RegularImmutableMap$EntrySet;->keyOffset:I
    invoke-static {p0}, Lcom/google/common/collect/RegularImmutableMap$EntrySet;->access$200(Lcom/google/common/collect/RegularImmutableMap$EntrySet;)I

    move-result p0

    xor-int/lit8 p0, p0, 0x1

    add-int/2addr p1, p0

    aget-object p0, v1, p1

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    .line 421
    new-instance p1, Ljava/util/AbstractMap$SimpleImmutableEntry;

    invoke-direct {p1, v0, p0}, Ljava/util/AbstractMap$SimpleImmutableEntry;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    return-object p1
.end method

.method public isPartialView()Z
    .registers 1

    const/4 p0, 0x1

    return p0
.end method

.method public size()I
    .registers 1

    .line 426
    iget-object p0, p0, Lcom/google/common/collect/RegularImmutableMap$EntrySet$1;->this$0:Lcom/google/common/collect/RegularImmutableMap$EntrySet;

    # getter for: Lcom/google/common/collect/RegularImmutableMap$EntrySet;->size:I
    invoke-static {p0}, Lcom/google/common/collect/RegularImmutableMap$EntrySet;->access$000(Lcom/google/common/collect/RegularImmutableMap$EntrySet;)I

    move-result p0

    return p0
.end method

.method writeReplace()Ljava/lang/Object;
    .registers 1

    .line 439
    invoke-super {p0}, Lcom/google/common/collect/ImmutableList;->writeReplace()Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
