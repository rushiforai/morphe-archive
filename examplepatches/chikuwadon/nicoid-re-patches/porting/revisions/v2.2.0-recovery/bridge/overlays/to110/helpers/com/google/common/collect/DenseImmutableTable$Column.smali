.class final Lcom/google/common/collect/DenseImmutableTable$Column;
.super Lcom/google/common/collect/DenseImmutableTable$ImmutableArrayMap;
.source "DenseImmutableTable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/DenseImmutableTable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "Column"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/common/collect/DenseImmutableTable$ImmutableArrayMap<",
        "TR;TV;>;"
    }
.end annotation


# instance fields
.field private final columnIndex:I

.field final synthetic this$0:Lcom/google/common/collect/DenseImmutableTable;


# direct methods
.method constructor <init>(Lcom/google/common/collect/DenseImmutableTable;I)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1010,
            0x0
        }
        names = {
            "this$0",
            "columnIndex"
        }
    .end annotation

    .line 192
    iput-object p1, p0, Lcom/google/common/collect/DenseImmutableTable$Column;->this$0:Lcom/google/common/collect/DenseImmutableTable;

    .line 193
    # getter for: Lcom/google/common/collect/DenseImmutableTable;->columnCounts:[I
    invoke-static {p1}, Lcom/google/common/collect/DenseImmutableTable;->access$500(Lcom/google/common/collect/DenseImmutableTable;)[I

    move-result-object p1

    aget p1, p1, p2

    invoke-direct {p0, p1}, Lcom/google/common/collect/DenseImmutableTable$ImmutableArrayMap;-><init>(I)V

    .line 194
    iput p2, p0, Lcom/google/common/collect/DenseImmutableTable$Column;->columnIndex:I

    return-void
.end method


# virtual methods
.method getValue(I)Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "keyIndex"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TV;"
        }
    .end annotation

    .line 204
    iget-object v0, p0, Lcom/google/common/collect/DenseImmutableTable$Column;->this$0:Lcom/google/common/collect/DenseImmutableTable;

    # getter for: Lcom/google/common/collect/DenseImmutableTable;->values:[[Ljava/lang/Object;
    invoke-static {v0}, Lcom/google/common/collect/DenseImmutableTable;->access$400(Lcom/google/common/collect/DenseImmutableTable;)[[Ljava/lang/Object;

    move-result-object v0

    aget-object p1, v0, p1

    iget p0, p0, Lcom/google/common/collect/DenseImmutableTable$Column;->columnIndex:I

    aget-object p0, p1, p0

    return-object p0
.end method

.method isPartialView()Z
    .registers 1

    const/4 p0, 0x1

    return p0
.end method

.method keyToIndex()Lcom/google/common/collect/ImmutableMap;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/ImmutableMap<",
            "TR;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 199
    iget-object p0, p0, Lcom/google/common/collect/DenseImmutableTable$Column;->this$0:Lcom/google/common/collect/DenseImmutableTable;

    # getter for: Lcom/google/common/collect/DenseImmutableTable;->rowKeyToIndex:Lcom/google/common/collect/ImmutableMap;
    invoke-static {p0}, Lcom/google/common/collect/DenseImmutableTable;->access$600(Lcom/google/common/collect/DenseImmutableTable;)Lcom/google/common/collect/ImmutableMap;

    move-result-object p0

    return-object p0
.end method

.method writeReplace()Ljava/lang/Object;
    .registers 1

    .line 218
    invoke-super {p0}, Lcom/google/common/collect/DenseImmutableTable$ImmutableArrayMap;->writeReplace()Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
