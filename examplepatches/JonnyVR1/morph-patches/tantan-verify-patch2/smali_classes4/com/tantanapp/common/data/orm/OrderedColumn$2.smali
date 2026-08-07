.class Lcom/tantanapp/common/data/orm/OrderedColumn$2;
.super Lcom/tantanapp/common/data/orm/Order;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tantanapp/common/data/orm/OrderedColumn;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/orm/Order<",
        "TT;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tantanapp/common/data/orm/OrderedColumn;


# direct methods
.method public constructor <init>(Lcom/tantanapp/common/data/orm/OrderedColumn;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/common/data/orm/OrderedColumn$2;->this$0:Lcom/tantanapp/common/data/orm/OrderedColumn;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/tantanapp/common/data/orm/Order;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)",
            "Lcom/tantanapp/common/data/orm/Filter<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/tantanapp/common/data/orm/OrderedColumn$2$3;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/tantanapp/common/data/orm/OrderedColumn$2$3;-><init>(Lcom/tantanapp/common/data/orm/OrderedColumn$2;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public GT(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)",
            "Lcom/tantanapp/common/data/orm/Filter<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/tantanapp/common/data/orm/OrderedColumn$2$1;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/tantanapp/common/data/orm/OrderedColumn$2$1;-><init>(Lcom/tantanapp/common/data/orm/OrderedColumn$2;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public GT_EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)",
            "Lcom/tantanapp/common/data/orm/Filter<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/tantanapp/common/data/orm/OrderedColumn$2$2;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/tantanapp/common/data/orm/OrderedColumn$2$2;-><init>(Lcom/tantanapp/common/data/orm/OrderedColumn$2;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public column()Lcom/tantanapp/common/data/orm/Column;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/OrderedColumn$2;->this$0:Lcom/tantanapp/common/data/orm/OrderedColumn;

    .line 2
    .line 3
    return-object p0
.end method

.method public compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TT;)I"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/tantanapp/common/data/orm/OrderedColumn$2;->this$0:Lcom/tantanapp/common/data/orm/OrderedColumn;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/tantanapp/common/data/orm/Column;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Ljava/lang/Comparable;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/OrderedColumn$2;->this$0:Lcom/tantanapp/common/data/orm/OrderedColumn;

    .line 10
    .line 11
    invoke-virtual {p0, p2}, Lcom/tantanapp/common/data/orm/Column;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Ljava/lang/Comparable;

    .line 16
    .line 17
    invoke-interface {p1, p0}, Ljava/lang/Comparable;->compareTo(Ljava/lang/Object;)I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0
.end method

.method public emit()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/OrderedColumn$2;->this$0:Lcom/tantanapp/common/data/orm/OrderedColumn;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/Column;->NAME:Ljava/lang/String;

    .line 4
    .line 5
    return-object p0
.end method
