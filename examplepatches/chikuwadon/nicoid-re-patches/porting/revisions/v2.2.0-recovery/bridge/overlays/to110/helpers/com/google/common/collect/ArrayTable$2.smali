.class Lcom/google/common/collect/ArrayTable$2;
.super Lcom/google/common/collect/Tables$AbstractCell;
.source "ArrayTable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/common/collect/ArrayTable;->getCell(I)Lcom/google/common/collect/Table$Cell;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/common/collect/Tables$AbstractCell<",
        "TR;TC;TV;>;"
    }
.end annotation


# instance fields
.field final columnIndex:I

.field final rowIndex:I

.field final synthetic this$0:Lcom/google/common/collect/ArrayTable;

.field final synthetic val$index:I


# direct methods
.method constructor <init>(Lcom/google/common/collect/ArrayTable;I)V
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            "this$0",
            "val$index"
        }
    .end annotation

    .line 555
    iput p2, p0, Lcom/google/common/collect/ArrayTable$2;->val$index:I

    iput-object p1, p0, Lcom/google/common/collect/ArrayTable$2;->this$0:Lcom/google/common/collect/ArrayTable;

    invoke-direct {p0}, Lcom/google/common/collect/Tables$AbstractCell;-><init>()V

    .line 556
    # getter for: Lcom/google/common/collect/ArrayTable;->columnList:Lcom/google/common/collect/ImmutableList;
    invoke-static {p1}, Lcom/google/common/collect/ArrayTable;->access$100(Lcom/google/common/collect/ArrayTable;)Lcom/google/common/collect/ImmutableList;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableList;->size()I

    move-result v0

    div-int v0, p2, v0

    iput v0, p0, Lcom/google/common/collect/ArrayTable$2;->rowIndex:I

    .line 557
    # getter for: Lcom/google/common/collect/ArrayTable;->columnList:Lcom/google/common/collect/ImmutableList;
    invoke-static {p1}, Lcom/google/common/collect/ArrayTable;->access$100(Lcom/google/common/collect/ArrayTable;)Lcom/google/common/collect/ImmutableList;

    move-result-object p1

    invoke-virtual {p1}, Lcom/google/common/collect/ImmutableList;->size()I

    move-result p1

    rem-int/2addr p2, p1

    iput p2, p0, Lcom/google/common/collect/ArrayTable$2;->columnIndex:I

    return-void
.end method


# virtual methods
.method public getColumnKey()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TC;"
        }
    .end annotation

    .line 566
    iget-object v0, p0, Lcom/google/common/collect/ArrayTable$2;->this$0:Lcom/google/common/collect/ArrayTable;

    # getter for: Lcom/google/common/collect/ArrayTable;->columnList:Lcom/google/common/collect/ImmutableList;
    invoke-static {v0}, Lcom/google/common/collect/ArrayTable;->access$100(Lcom/google/common/collect/ArrayTable;)Lcom/google/common/collect/ImmutableList;

    move-result-object v0

    iget p0, p0, Lcom/google/common/collect/ArrayTable$2;->columnIndex:I

    invoke-virtual {v0, p0}, Lcom/google/common/collect/ImmutableList;->get(I)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public getRowKey()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TR;"
        }
    .end annotation

    .line 561
    iget-object v0, p0, Lcom/google/common/collect/ArrayTable$2;->this$0:Lcom/google/common/collect/ArrayTable;

    # getter for: Lcom/google/common/collect/ArrayTable;->rowList:Lcom/google/common/collect/ImmutableList;
    invoke-static {v0}, Lcom/google/common/collect/ArrayTable;->access$200(Lcom/google/common/collect/ArrayTable;)Lcom/google/common/collect/ImmutableList;

    move-result-object v0

    iget p0, p0, Lcom/google/common/collect/ArrayTable$2;->rowIndex:I

    invoke-virtual {v0, p0}, Lcom/google/common/collect/ImmutableList;->get(I)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public getValue()Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TV;"
        }
    .end annotation

    .line 571
    iget-object v0, p0, Lcom/google/common/collect/ArrayTable$2;->this$0:Lcom/google/common/collect/ArrayTable;

    iget v1, p0, Lcom/google/common/collect/ArrayTable$2;->rowIndex:I

    iget p0, p0, Lcom/google/common/collect/ArrayTable$2;->columnIndex:I

    invoke-virtual {v0, v1, p0}, Lcom/google/common/collect/ArrayTable;->at(II)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
