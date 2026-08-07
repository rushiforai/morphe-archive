.class public abstract Lcom/tantanapp/common/data/orm/BooleanColumn;
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
        "Ljava/lang/Boolean;",
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
.method public F()Lcom/tantanapp/common/data/orm/Filter;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/tantanapp/common/data/orm/Filter<",
            "TT;>;"
        }
    .end annotation

    .line 1
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ_CONSTANT(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public T()Lcom/tantanapp/common/data/orm/Filter;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/tantanapp/common/data/orm/Filter<",
            "TT;>;"
        }
    .end annotation

    .line 1
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ_CONSTANT(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public asString(Ljava/lang/Boolean;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const-string p0, "1"

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    const-string p0, "0"

    .line 11
    .line 12
    return-object p0
.end method

.method public bridge synthetic asString(Ljava/lang/Object;)Ljava/lang/String;
    .locals 0

    .line 13
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p0, p1}, Lcom/tantanapp/common/data/orm/BooleanColumn;->asString(Ljava/lang/Boolean;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public put(Landroid/content/ContentValues;Ljava/lang/Boolean;)V
    .locals 0

    .line 7
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/Column;->NAME:Ljava/lang/String;

    invoke-static {p1, p0, p2}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Boolean;)V

    return-void
.end method

.method public bridge synthetic put(Landroid/content/ContentValues;Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p2, Ljava/lang/Boolean;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/tantanapp/common/data/orm/BooleanColumn;->put(Landroid/content/ContentValues;Ljava/lang/Boolean;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
