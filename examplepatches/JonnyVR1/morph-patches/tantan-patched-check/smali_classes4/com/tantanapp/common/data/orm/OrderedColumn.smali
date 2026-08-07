.class public abstract Lcom/tantanapp/common/data/orm/OrderedColumn;
.super Lcom/tantanapp/common/data/orm/ValueColumn;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "C::",
        "Ljava/lang/Comparable<",
        "TC;>;>",
        "Lcom/tantanapp/common/data/orm/ValueColumn<",
        "TT;TC;>;"
    }
.end annotation


# instance fields
.field public final ASC:Lcom/tantanapp/common/data/orm/Order;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Order<",
            "TT;>;"
        }
    .end annotation
.end field

.field public final DESC:Lcom/tantanapp/common/data/orm/Order;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Order<",
            "TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/tantanapp/common/data/orm/ValueColumn;-><init>(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Lcom/tantanapp/common/data/orm/OrderedColumn$1;

    .line 5
    .line 6
    invoke-direct {p1, p0}, Lcom/tantanapp/common/data/orm/OrderedColumn$1;-><init>(Lcom/tantanapp/common/data/orm/OrderedColumn;)V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/tantanapp/common/data/orm/OrderedColumn;->DESC:Lcom/tantanapp/common/data/orm/Order;

    .line 10
    .line 11
    new-instance p1, Lcom/tantanapp/common/data/orm/OrderedColumn$2;

    .line 12
    .line 13
    invoke-direct {p1, p0}, Lcom/tantanapp/common/data/orm/OrderedColumn$2;-><init>(Lcom/tantanapp/common/data/orm/OrderedColumn;)V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Lcom/tantanapp/common/data/orm/OrderedColumn;->ASC:Lcom/tantanapp/common/data/orm/Order;

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public LEQ(Ljava/lang/Comparable;)Lcom/tantanapp/common/data/orm/Filter;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TC;)",
            "Lcom/tantanapp/common/data/orm/Filter<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/tantanapp/common/data/orm/OrderedColumn$3;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/tantanapp/common/data/orm/OrderedColumn$3;-><init>(Lcom/tantanapp/common/data/orm/OrderedColumn;Ljava/lang/Comparable;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public REQ(Ljava/lang/Comparable;)Lcom/tantanapp/common/data/orm/Filter;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TC;)",
            "Lcom/tantanapp/common/data/orm/Filter<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/tantanapp/common/data/orm/OrderedColumn$4;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/tantanapp/common/data/orm/OrderedColumn$4;-><init>(Lcom/tantanapp/common/data/orm/OrderedColumn;Ljava/lang/Comparable;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method
