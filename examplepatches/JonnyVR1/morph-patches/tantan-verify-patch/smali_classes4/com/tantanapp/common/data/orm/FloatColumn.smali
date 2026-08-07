.class public abstract Lcom/tantanapp/common/data/orm/FloatColumn;
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
        "Ljava/lang/Float;",
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
.method public put(Landroid/content/ContentValues;Ljava/lang/Float;)V
    .locals 0

    .line 7
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/Column;->NAME:Ljava/lang/String;

    invoke-static {p1, p0, p2}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Float;)V

    return-void
.end method

.method public bridge synthetic put(Landroid/content/ContentValues;Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p2, Ljava/lang/Float;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/tantanapp/common/data/orm/FloatColumn;->put(Landroid/content/ContentValues;Ljava/lang/Float;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
