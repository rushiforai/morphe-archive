.class public Lcom/tantanapp/common/data/orm/DoubleOrder;
.super Lcom/tantanapp/common/data/orm/Order;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/tantanapp/common/data/orm/Order<",
        "TT;>;"
    }
.end annotation


# instance fields
.field private first:Lcom/tantanapp/common/data/orm/Order;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Order<",
            "TT;>;"
        }
    .end annotation
.end field

.field private second:Lcom/tantanapp/common/data/orm/Order;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Order<",
            "TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/tantanapp/common/data/orm/Order;Lcom/tantanapp/common/data/orm/Order;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/tantanapp/common/data/orm/Order<",
            "TT;>;",
            "Lcom/tantanapp/common/data/orm/Order<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/tantanapp/common/data/orm/Order;-><init>()V

    .line 2
    .line 3
    .line 4
    instance-of v0, p1, Lcom/tantanapp/common/data/orm/DoubleOrder;

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    instance-of v0, p2, Lcom/tantanapp/common/data/orm/DoubleOrder;

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    iput-object p1, p0, Lcom/tantanapp/common/data/orm/DoubleOrder;->first:Lcom/tantanapp/common/data/orm/Order;

    .line 13
    .line 14
    iput-object p2, p0, Lcom/tantanapp/common/data/orm/DoubleOrder;->second:Lcom/tantanapp/common/data/orm/Order;

    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    const-string p0, "only can use single order in DoubleOrder now!!"

    .line 18
    .line 19
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    const/4 p0, 0x0

    .line 23
    throw p0
.end method

.method public static synthetic access$000(Lcom/tantanapp/common/data/orm/DoubleOrder;)Lcom/tantanapp/common/data/orm/Order;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/DoubleOrder;->second:Lcom/tantanapp/common/data/orm/Order;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$100(Lcom/tantanapp/common/data/orm/DoubleOrder;)Lcom/tantanapp/common/data/orm/Order;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/DoubleOrder;->first:Lcom/tantanapp/common/data/orm/Order;

    .line 2
    .line 3
    return-object p0
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
    new-instance v0, Lcom/tantanapp/common/data/orm/DoubleOrder$3;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/tantanapp/common/data/orm/DoubleOrder$3;-><init>(Lcom/tantanapp/common/data/orm/DoubleOrder;Ljava/lang/Object;)V

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
    new-instance v0, Lcom/tantanapp/common/data/orm/DoubleOrder$1;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/tantanapp/common/data/orm/DoubleOrder$1;-><init>(Lcom/tantanapp/common/data/orm/DoubleOrder;Ljava/lang/Object;)V

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
    new-instance v0, Lcom/tantanapp/common/data/orm/DoubleOrder$2;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/tantanapp/common/data/orm/DoubleOrder$2;-><init>(Lcom/tantanapp/common/data/orm/DoubleOrder;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public column()Lcom/tantanapp/common/data/orm/Column;
    .locals 0

    const/4 p0, 0x0

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
    sget-boolean v0, Ll/kmk0;->c:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {p1}, Ll/u11;->d(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    invoke-static {p2}, Ll/u11;->d(Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Lcom/tantanapp/common/data/orm/DoubleOrder;->first:Lcom/tantanapp/common/data/orm/Order;

    .line 12
    .line 13
    invoke-interface {v0, p1, p2}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/DoubleOrder;->second:Lcom/tantanapp/common/data/orm/Order;

    .line 20
    .line 21
    invoke-interface {p0, p1, p2}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    return p0

    .line 26
    :cond_1
    return v0
.end method

.method public emit()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tantanapp/common/data/orm/DoubleOrder;->first:Lcom/tantanapp/common/data/orm/Order;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/tantanapp/common/data/orm/Order;->emit()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/DoubleOrder;->second:Lcom/tantanapp/common/data/orm/Order;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/tantanapp/common/data/orm/Order;->emit()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    filled-new-array {v0, p0}, [Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const-string v0, ","

    .line 22
    .line 23
    invoke-static {v0, p0}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method

.method public getFirst()Lcom/tantanapp/common/data/orm/Order;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/tantanapp/common/data/orm/Order<",
            "TT;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/DoubleOrder;->first:Lcom/tantanapp/common/data/orm/Order;

    .line 2
    .line 3
    return-object p0
.end method
