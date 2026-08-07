.class Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query$1;
.super Ljava/util/AbstractList;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;->query()Ljava/util/List;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/AbstractList<",
        "TT;>;"
    }
.end annotation


# instance fields
.field base:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation
.end field

.field size:I

.field final synthetic this$2:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;


# direct methods
.method public constructor <init>(Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query$1;->this$2:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/AbstractList;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance p1, Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query$1;->base:Ljava/util/List;

    .line 12
    .line 13
    const/4 p1, -0x1

    .line 14
    iput p1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query$1;->size:I

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public get(I)Lcom/tantanapp/common/data/DbObject;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query$1;->base:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-gt v0, p1, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query$1;->base:Ljava/util/List;

    .line 10
    .line 11
    iget-object v1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query$1;->this$2:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;

    .line 12
    .line 13
    iget-object v2, v1, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;->this$1:Lcom/tantanapp/common/data/orm/DatabaseStore$Table;

    .line 14
    .line 15
    invoke-virtual {v1, v0}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;->queryFilter(Ljava/util/List;)Lcom/tantanapp/common/data/orm/Filter;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    iget-object v3, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query$1;->this$2:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;

    .line 20
    .line 21
    iget-object v4, v3, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;->orderBy:Lcom/tantanapp/common/data/orm/Order;

    .line 22
    .line 23
    iget-object v5, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query$1;->base:Ljava/util/List;

    .line 24
    .line 25
    if-nez p1, :cond_0

    .line 26
    .line 27
    const/4 v6, 0x1

    .line 28
    goto :goto_0

    .line 29
    :cond_0
    const/16 v6, 0x14

    .line 30
    .line 31
    :goto_0
    invoke-virtual {v3, v5, p1, v6}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;->queryLimit(Ljava/util/List;II)I

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    invoke-virtual {v2, v1, v4, v3}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->query(Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/Order;I)Ljava/util/List;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 40
    .line 41
    .line 42
    :cond_1
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query$1;->base:Ljava/util/List;

    .line 43
    .line 44
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    check-cast p0, Lcom/tantanapp/common/data/DbObject;

    .line 49
    .line 50
    return-object p0
.end method

.method public bridge synthetic get(I)Ljava/lang/Object;
    .locals 0

    .line 51
    invoke-virtual {p0, p1}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query$1;->get(I)Lcom/tantanapp/common/data/DbObject;

    move-result-object p0

    return-object p0
.end method

.method public size()I
    .locals 2

    .line 1
    iget v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query$1;->size:I

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    iget-object v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query$1;->this$2:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;->count()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query$1;->size:I

    .line 13
    .line 14
    :cond_0
    iget p0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query$1;->size:I

    .line 15
    .line 16
    return p0
.end method
