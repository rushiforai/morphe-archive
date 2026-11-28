.class final Lcom/google/common/collect/ArrayTable$Row;
.super Lcom/google/common/collect/ArrayTable$ArrayMap;
.source "ArrayTable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/ArrayTable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "Row"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/common/collect/ArrayTable$ArrayMap<",
        "TC;TV;>;"
    }
.end annotation


# instance fields
.field final rowIndex:I

.field final synthetic this$0:Lcom/google/common/collect/ArrayTable;


# direct methods
.method constructor <init>(Lcom/google/common/collect/ArrayTable;I)V
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1010,
            0x0
        }
        names = {
            "this$0",
            "rowIndex"
        }
    .end annotation

    .line 695
    iput-object p1, p0, Lcom/google/common/collect/ArrayTable$Row;->this$0:Lcom/google/common/collect/ArrayTable;

    .line 696
    # getter for: Lcom/google/common/collect/ArrayTable;->columnKeyToIndex:Lcom/google/common/collect/ImmutableMap;
    invoke-static {p1}, Lcom/google/common/collect/ArrayTable;->access$600(Lcom/google/common/collect/ArrayTable;)Lcom/google/common/collect/ImmutableMap;

    move-result-object p1

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/google/common/collect/ArrayTable$ArrayMap;-><init>(Lcom/google/common/collect/ImmutableMap;Lcom/google/common/collect/ArrayTable$1;)V

    .line 697
    iput p2, p0, Lcom/google/common/collect/ArrayTable$Row;->rowIndex:I

    return-void
.end method


# virtual methods
.method getKeyRole()Ljava/lang/String;
    .registers 1

    .line 702
    const-string p0, "Column"

    return-object p0
.end method

.method getValue(I)Ljava/lang/Object;
    .registers 3
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
            "(I)TV;"
        }
    .end annotation

    .line 707
    iget-object v0, p0, Lcom/google/common/collect/ArrayTable$Row;->this$0:Lcom/google/common/collect/ArrayTable;

    iget p0, p0, Lcom/google/common/collect/ArrayTable$Row;->rowIndex:I

    invoke-virtual {v0, p0, p1}, Lcom/google/common/collect/ArrayTable;->at(II)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method setValue(ILjava/lang/Object;)Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "index",
            "newValue"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITV;)TV;"
        }
    .end annotation

    .line 712
    iget-object v0, p0, Lcom/google/common/collect/ArrayTable$Row;->this$0:Lcom/google/common/collect/ArrayTable;

    iget p0, p0, Lcom/google/common/collect/ArrayTable$Row;->rowIndex:I

    invoke-virtual {v0, p0, p1, p2}, Lcom/google/common/collect/ArrayTable;->set(IILjava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
