.class public final synthetic Lcom/google/common/collect/Tables$TransformedTable$0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/google/common/base/Function;


# instance fields
.field public final synthetic f$0:Lcom/google/common/collect/Tables$TransformedTable;


# direct methods
.method public synthetic constructor <init>(Lcom/google/common/collect/Tables$TransformedTable;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/common/collect/Tables$TransformedTable$0;->f$0:Lcom/google/common/collect/Tables$TransformedTable;

    return-void
.end method


# virtual methods
.method public final apply(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2

    .line 0
    iget-object p0, p0, Lcom/google/common/collect/Tables$TransformedTable$0;->f$0:Lcom/google/common/collect/Tables$TransformedTable;

    check-cast p1, Lcom/google/common/collect/Table$Cell;

    invoke-virtual {p0, p1}, Lcom/google/common/collect/Tables$TransformedTable;->applyToValue(Lcom/google/common/collect/Table$Cell;)Lcom/google/common/collect/Table$Cell;

    move-result-object p0

    return-object p0
.end method
