.class public abstract Lcom/tantanapp/common/data/orm/StringColumn;
.super Lcom/tantanapp/common/data/orm/OrderedColumn;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/tantanapp/common/data/orm/OrderedColumn<",
        "TT;",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/tantanapp/common/data/orm/OrderedColumn;-><init>(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public CONTAINS(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lcom/tantanapp/common/data/orm/Filter<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/tantanapp/common/data/orm/StringColumn$3;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/tantanapp/common/data/orm/StringColumn$3;-><init>(Lcom/tantanapp/common/data/orm/StringColumn;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public IN(Ljava/util/List;)Lcom/tantanapp/common/data/orm/Filter;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/tantanapp/common/data/orm/Filter<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/tantanapp/common/data/orm/StringColumn$4;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/tantanapp/common/data/orm/StringColumn$4;-><init>(Lcom/tantanapp/common/data/orm/StringColumn;Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public NOT_IN(Ljava/util/List;)Lcom/tantanapp/common/data/orm/Filter;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/tantanapp/common/data/orm/Filter<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/tantanapp/common/data/orm/StringColumn$5;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/tantanapp/common/data/orm/StringColumn$5;-><init>(Lcom/tantanapp/common/data/orm/StringColumn;Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public NOT_STARTS_WITH(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lcom/tantanapp/common/data/orm/Filter<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/tantanapp/common/data/orm/StringColumn$1;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/tantanapp/common/data/orm/StringColumn$1;-><init>(Lcom/tantanapp/common/data/orm/StringColumn;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public STARTS_WITH(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lcom/tantanapp/common/data/orm/Filter<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/tantanapp/common/data/orm/StringColumn$2;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/tantanapp/common/data/orm/StringColumn$2;-><init>(Lcom/tantanapp/common/data/orm/StringColumn;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public bridge synthetic put(Landroid/content/ContentValues;Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p2, Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/tantanapp/common/data/orm/StringColumn;->put(Landroid/content/ContentValues;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public put(Landroid/content/ContentValues;Ljava/lang/String;)V
    .locals 0

    .line 7
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/Column;->NAME:Ljava/lang/String;

    invoke-static {p1, p0, p2}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
