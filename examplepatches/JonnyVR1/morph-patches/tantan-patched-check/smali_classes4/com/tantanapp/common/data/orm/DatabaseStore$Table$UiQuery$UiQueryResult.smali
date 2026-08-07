.class Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;
.super Ljava/util/AbstractList;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "UiQueryResult"
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

.field full:Z

.field getTop:I

.field previousPreloadTime:J

.field size:I

.field final synthetic this$2:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;


# direct methods
.method public constructor <init>(Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;)V
    .locals 2

    .line 48
    iput-object p1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->this$2:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;

    invoke-direct {p0}, Ljava/util/AbstractList;-><init>()V

    const/4 p1, 0x0

    .line 49
    iput-object p1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->base:Ljava/util/List;

    const/4 p1, 0x0

    .line 50
    iput-boolean p1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->full:Z

    const/4 p1, -0x1

    .line 51
    iput p1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->getTop:I

    const-wide/16 v0, -0x1

    .line 52
    iput-wide v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->previousPreloadTime:J

    .line 53
    iput p1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->size:I

    return-void
.end method

.method public constructor <init>(Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/tantanapp/common/data/orm/DatabaseStore$Table<",
            "TT;>.UiQuery.UiQueryResult;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->this$2:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/AbstractList;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 p1, -0x1

    .line 7
    iput p1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->size:I

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput-object v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->base:Ljava/util/List;

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    iput-boolean v1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->full:Z

    .line 14
    .line 15
    iput p1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->getTop:I

    .line 16
    .line 17
    const-wide/16 v1, -0x1

    .line 18
    .line 19
    iput-wide v1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->previousPreloadTime:J

    .line 20
    .line 21
    iget p1, p2, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->size:I

    .line 22
    .line 23
    iput p1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->size:I

    .line 24
    .line 25
    iget-object p1, p2, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->base:Ljava/util/List;

    .line 26
    .line 27
    if-nez p1, :cond_0

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    .line 31
    .line 32
    iget-object p1, p2, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->base:Ljava/util/List;

    .line 33
    .line 34
    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 35
    .line 36
    .line 37
    :goto_0
    iput-object v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->base:Ljava/util/List;

    .line 38
    .line 39
    iget-boolean p1, p2, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->full:Z

    .line 40
    .line 41
    iput-boolean p1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->full:Z

    .line 42
    .line 43
    iget p1, p2, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->getTop:I

    .line 44
    .line 45
    iput p1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->getTop:I

    .line 46
    .line 47
    return-void
.end method

.method public static synthetic a(Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;IILl/pf60;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->this$2:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->status:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 4
    .line 5
    const/4 v1, 0x2

    .line 6
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p4, Ll/pf60;->a:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast v0, Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    check-cast v1, Lcom/tantanapp/common/data/DbObject;

    .line 28
    .line 29
    iget-object v2, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->this$2:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;

    .line 30
    .line 31
    iget-object v2, v2, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->this$1:Lcom/tantanapp/common/data/orm/DatabaseStore$Table;

    .line 32
    .line 33
    iget-object v3, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {v2, v3, v1}, Lcom/tantanapp/common/data/orm/LruCache2;->cache(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    iget-object v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->this$2:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;

    .line 40
    .line 41
    iget-object v1, p4, Ll/pf60;->b:Ljava/lang/Object;

    .line 42
    .line 43
    check-cast v1, Ljava/util/List;

    .line 44
    .line 45
    invoke-static {v0, v1}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->access$400(Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;Ljava/util/List;)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->this$2:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;

    .line 49
    .line 50
    invoke-virtual {v0}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->itemsRead()Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    if-eqz v0, :cond_1

    .line 55
    .line 56
    if-ne v0, p1, :cond_1

    .line 57
    .line 58
    invoke-virtual {v0}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->size()I

    .line 59
    .line 60
    .line 61
    move-result p1

    .line 62
    if-ne p1, p2, :cond_2

    .line 63
    .line 64
    iget-object p1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->base:Ljava/util/List;

    .line 65
    .line 66
    iget-object p2, p4, Ll/pf60;->a:Ljava/lang/Object;

    .line 67
    .line 68
    check-cast p2, Ljava/util/Collection;

    .line 69
    .line 70
    invoke-interface {p1, p2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 71
    .line 72
    .line 73
    iget-object p1, p4, Ll/pf60;->a:Ljava/lang/Object;

    .line 74
    .line 75
    check-cast p1, Ljava/util/List;

    .line 76
    .line 77
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 78
    .line 79
    .line 80
    move-result p1

    .line 81
    if-eq p1, p3, :cond_2

    .line 82
    .line 83
    iget-object p1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->base:Ljava/util/List;

    .line 84
    .line 85
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 86
    .line 87
    .line 88
    move-result p1

    .line 89
    iput p1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->size:I

    .line 90
    .line 91
    const/4 p1, 0x1

    .line 92
    iput-boolean p1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->full:Z

    .line 93
    .line 94
    return-void

    .line 95
    :cond_1
    sget-boolean p0, Ll/kmk0;->b:Z

    .line 96
    .line 97
    if-eqz p0, :cond_2

    .line 98
    .line 99
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 100
    .line 101
    const-string p1, "what"

    .line 102
    .line 103
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    :cond_2
    return-void
.end method

.method public static synthetic c(Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;Lcom/tantanapp/common/data/orm/Filter;I)Ll/pf60;
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->this$2:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;

    .line 2
    .line 3
    iget-object v1, v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->this$1:Lcom/tantanapp/common/data/orm/DatabaseStore$Table;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->query:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;->orderBy:Lcom/tantanapp/common/data/orm/Order;

    .line 8
    .line 9
    invoke-virtual {v1, p1, v0, p2}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->query(Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/Order;I)Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    new-instance p2, Ljava/util/ArrayList;

    .line 14
    .line 15
    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->this$2:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;

    .line 19
    .line 20
    iget-object v0, v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->this$1:Lcom/tantanapp/common/data/orm/DatabaseStore$Table;

    .line 21
    .line 22
    iget-object v0, v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->outerJoin:Ll/pf60;

    .line 23
    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    iget-object v1, v0, Ll/pf60;->a:Ljava/lang/Object;

    .line 27
    .line 28
    check-cast v1, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;

    .line 29
    .line 30
    iget-object v0, v0, Ll/pf60;->b:Ljava/lang/Object;

    .line 31
    .line 32
    check-cast v0, Ll/bkj0;

    .line 33
    .line 34
    iget-object v0, v0, Ll/bkj0;->a:Ljava/lang/Object;

    .line 35
    .line 36
    check-cast v0, Ll/qcj;

    .line 37
    .line 38
    invoke-interface {v0, p1}, Ll/qcj;->call(Ljava/lang/Object;)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    check-cast v0, Lcom/tantanapp/common/data/orm/Filter;

    .line 43
    .line 44
    iget-object v2, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->this$2:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;

    .line 45
    .line 46
    iget-object v2, v2, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->this$1:Lcom/tantanapp/common/data/orm/DatabaseStore$Table;

    .line 47
    .line 48
    iget-object v2, v2, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->outerJoin:Ll/pf60;

    .line 49
    .line 50
    iget-object v2, v2, Ll/pf60;->b:Ljava/lang/Object;

    .line 51
    .line 52
    check-cast v2, Ll/bkj0;

    .line 53
    .line 54
    iget-object v2, v2, Ll/bkj0;->b:Ljava/lang/Object;

    .line 55
    .line 56
    check-cast v2, Ll/pcj;

    .line 57
    .line 58
    invoke-interface {v2}, Ll/pcj;->call()Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    check-cast v2, Lcom/tantanapp/common/data/orm/Order;

    .line 63
    .line 64
    iget-object v3, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->this$2:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;

    .line 65
    .line 66
    iget-object v3, v3, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->this$1:Lcom/tantanapp/common/data/orm/DatabaseStore$Table;

    .line 67
    .line 68
    iget-object v3, v3, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->outerJoin:Ll/pf60;

    .line 69
    .line 70
    iget-object v3, v3, Ll/pf60;->b:Ljava/lang/Object;

    .line 71
    .line 72
    check-cast v3, Ll/bkj0;

    .line 73
    .line 74
    iget-object v3, v3, Ll/bkj0;->c:Ljava/lang/Object;

    .line 75
    .line 76
    check-cast v3, Ljava/lang/Integer;

    .line 77
    .line 78
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 79
    .line 80
    .line 81
    move-result v3

    .line 82
    invoke-virtual {v1, v0, v2, v3}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->query(Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/Order;I)Ljava/util/List;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    iget-object v1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->this$2:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;

    .line 87
    .line 88
    iget-object v1, v1, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->this$1:Lcom/tantanapp/common/data/orm/DatabaseStore$Table;

    .line 89
    .line 90
    iget-object v1, v1, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->outerJoin:Ll/pf60;

    .line 91
    .line 92
    iget-object v1, v1, Ll/pf60;->a:Ljava/lang/Object;

    .line 93
    .line 94
    check-cast v1, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;

    .line 95
    .line 96
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    invoke-interface {p2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 101
    .line 102
    .line 103
    :cond_0
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->this$2:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;

    .line 104
    .line 105
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->access$500(Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;Ljava/util/List;)Ll/pf60;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    if-eqz p0, :cond_1

    .line 110
    .line 111
    invoke-interface {p2, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 112
    .line 113
    .line 114
    :cond_1
    invoke-static {p1, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    return-object p0
.end method

.method public static synthetic f(Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->this$2:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->status:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 4
    .line 5
    const/4 v0, 0x2

    .line 6
    invoke-virtual {p0, v0}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private tryPreload(I)V
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->base:Ljava/util/List;

    .line 2
    .line 3
    if-eqz v0, :cond_3

    .line 4
    .line 5
    iget-object v1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->this$2:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;

    .line 6
    .line 7
    iget-object v1, v1, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->query:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;

    .line 8
    .line 9
    iget v1, v1, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;->initPageSize:I

    .line 10
    .line 11
    if-lt p1, v1, :cond_3

    .line 12
    .line 13
    iget-boolean v1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->full:Z

    .line 14
    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    goto/16 :goto_1

    .line 18
    .line 19
    :cond_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    sub-int/2addr v0, p1

    .line 24
    iget-object v1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->this$2:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;

    .line 25
    .line 26
    iget-object v1, v1, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->query:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;

    .line 27
    .line 28
    iget v1, v1, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;->pageSize:I

    .line 29
    .line 30
    const/4 v2, 0x2

    .line 31
    div-int/2addr v1, v2

    .line 32
    if-gt v0, v1, :cond_3

    .line 33
    .line 34
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 35
    .line 36
    .line 37
    move-result-wide v0

    .line 38
    iget-wide v3, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->previousPreloadTime:J

    .line 39
    .line 40
    sub-long/2addr v0, v3

    .line 41
    const-wide/16 v3, 0x1

    .line 42
    .line 43
    cmp-long v0, v0, v3

    .line 44
    .line 45
    if-lez v0, :cond_3

    .line 46
    .line 47
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 48
    .line 49
    .line 50
    move-result-wide v0

    .line 51
    iput-wide v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->previousPreloadTime:J

    .line 52
    .line 53
    iget-object v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->base:Ljava/util/List;

    .line 54
    .line 55
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    iget-object v1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->this$2:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;

    .line 60
    .line 61
    iget-object v1, v1, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->query:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;

    .line 62
    .line 63
    iget v3, v1, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;->initPageSize:I

    .line 64
    .line 65
    if-ge p1, v3, :cond_1

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_1
    iget v3, v1, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;->pageSize:I

    .line 69
    .line 70
    :goto_0
    iget-object v4, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->base:Ljava/util/List;

    .line 71
    .line 72
    invoke-virtual {v1, v4}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;->queryFilter(Ljava/util/List;)Lcom/tantanapp/common/data/orm/Filter;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    iget-object v4, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->this$2:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;

    .line 77
    .line 78
    iget-object v4, v4, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->query:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;

    .line 79
    .line 80
    iget-object v5, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->base:Ljava/util/List;

    .line 81
    .line 82
    invoke-virtual {v4, v5, p1, v3}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;->queryLimit(Ljava/util/List;II)I

    .line 83
    .line 84
    .line 85
    move-result p1

    .line 86
    iget-object v3, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->this$2:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;

    .line 87
    .line 88
    iget-object v3, v3, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->status:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 89
    .line 90
    const/4 v4, 0x1

    .line 91
    invoke-virtual {v3, v2, v4}, Ljava/util/concurrent/atomic/AtomicInteger;->compareAndSet(II)Z

    .line 92
    .line 93
    .line 94
    move-result v2

    .line 95
    if-eqz v2, :cond_3

    .line 96
    .line 97
    sget-boolean v2, Lcom/tantanapp/common/data/orm/DatabaseStore;->debug_delayTransaction10Seconds:Z

    .line 98
    .line 99
    if-nez v2, :cond_3

    .line 100
    .line 101
    sget-boolean v2, Lcom/tantanapp/common/data/orm/DatabaseStore;->DETAILED_LOGGING:Z

    .line 102
    .line 103
    if-eqz v2, :cond_2

    .line 104
    .line 105
    const-string v2, "preloading"

    .line 106
    .line 107
    invoke-virtual {p0, v2}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->ii(Ljava/lang/String;)V

    .line 108
    .line 109
    .line 110
    :cond_2
    iget-object v2, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->this$2:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;

    .line 111
    .line 112
    iget-object v2, v2, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->this$1:Lcom/tantanapp/common/data/orm/DatabaseStore$Table;

    .line 113
    .line 114
    iget-object v3, v2, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->this$0:Lcom/tantanapp/common/data/orm/DatabaseStore;

    .line 115
    .line 116
    new-instance v5, Lcom/tantanapp/common/data/orm/b;

    .line 117
    .line 118
    invoke-direct {v5, p0, v1, p1}, Lcom/tantanapp/common/data/orm/b;-><init>(Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;Lcom/tantanapp/common/data/orm/Filter;I)V

    .line 119
    .line 120
    .line 121
    new-instance v6, Lcom/tantanapp/common/data/orm/c;

    .line 122
    .line 123
    invoke-direct {v6, p0, p0, v0, p1}, Lcom/tantanapp/common/data/orm/c;-><init>(Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;II)V

    .line 124
    .line 125
    .line 126
    new-instance v7, Lcom/tantanapp/common/data/orm/d;

    .line 127
    .line 128
    invoke-direct {v7, p0}, Lcom/tantanapp/common/data/orm/d;-><init>(Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;)V

    .line 129
    .line 130
    .line 131
    const/4 v8, 0x0

    .line 132
    const/4 v4, 0x1

    .line 133
    invoke-virtual/range {v3 .. v8}, Lcom/tantanapp/common/data/orm/DatabaseStore;->asyncFetch(ZLl/pcj;Ll/y20;Ll/x20;Z)V

    .line 134
    .line 135
    .line 136
    :cond_3
    :goto_1
    return-void
.end method


# virtual methods
.method public checkBigGap(I)V
    .locals 0

    .line 1
    sget-boolean p1, Ll/kmk0;->b:Z

    .line 2
    .line 3
    if-eqz p1, :cond_1

    .line 4
    .line 5
    iget-object p1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->base:Ljava/util/List;

    .line 6
    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 11
    .line 12
    .line 13
    :goto_0
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->this$2:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->query:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;

    .line 16
    .line 17
    iget p0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;->pageSize:I

    .line 18
    .line 19
    :cond_1
    return-void
.end method

.method public dd(Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->this$2:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;

    .line 7
    .line 8
    iget-object v1, v1, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->this$1:Lcom/tantanapp/common/data/orm/DatabaseStore$Table;

    .line 9
    .line 10
    iget-object v1, v1, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->tableName:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v1, "/"

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    iget-object v1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->this$2:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;

    .line 21
    .line 22
    iget-object v1, v1, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->query:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;

    .line 23
    .line 24
    invoke-static {v1}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;->access$300(Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    const-string v1, " "

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    const-string p1, "\n\t\t\t\tbase:"

    .line 40
    .line 41
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    iget-object p1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->base:Ljava/util/List;

    .line 45
    .line 46
    if-nez p1, :cond_0

    .line 47
    .line 48
    const-string p1, "null"

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    :goto_0
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    const-string p1, ", size: "

    .line 63
    .line 64
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    iget p1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->size:I

    .line 68
    .line 69
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    const-string p1, ", full: "

    .line 73
    .line 74
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    iget-boolean p0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->full:Z

    .line 78
    .line 79
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-static {p0}, Lcom/tantanapp/common/data/orm/DatabaseStore;->d(Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    return-void
.end method

.method public get(I)Lcom/tantanapp/common/data/DbObject;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    .line 1
    iget v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->getTop:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, -0x1

    .line 4
    .line 5
    invoke-static {p1, v0}, Ljava/lang/Math;->min(II)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iput v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->getTop:I

    .line 10
    .line 11
    const/4 v1, -0x1

    .line 12
    if-ge v0, v1, :cond_0

    .line 13
    .line 14
    iput v1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->getTop:I

    .line 15
    .line 16
    :cond_0
    invoke-virtual {p0, p1}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->tryFillAt(I)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->this$2:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->query:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;

    .line 22
    .line 23
    iget v0, v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;->initPageSize:I

    .line 24
    .line 25
    if-lt p1, v0, :cond_1

    .line 26
    .line 27
    invoke-direct {p0, p1}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->tryPreload(I)V

    .line 28
    .line 29
    .line 30
    :cond_1
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->base:Ljava/util/List;

    .line 31
    .line 32
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    check-cast p0, Lcom/tantanapp/common/data/DbObject;

    .line 37
    .line 38
    return-object p0
.end method

.method public bridge synthetic get(I)Ljava/lang/Object;
    .locals 0

    .line 39
    invoke-virtual {p0, p1}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->get(I)Lcom/tantanapp/common/data/DbObject;

    move-result-object p0

    return-object p0
.end method

.method public ii(Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->this$2:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;

    .line 7
    .line 8
    iget-object v1, v1, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->this$1:Lcom/tantanapp/common/data/orm/DatabaseStore$Table;

    .line 9
    .line 10
    iget-object v1, v1, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->tableName:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v1, "/"

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    iget-object v1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->this$2:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;

    .line 21
    .line 22
    iget-object v1, v1, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->query:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;

    .line 23
    .line 24
    invoke-static {v1}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;->access$300(Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    const-string v1, " "

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    const-string p1, "\n\t\t\t\tbase:"

    .line 40
    .line 41
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    iget-object p1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->base:Ljava/util/List;

    .line 45
    .line 46
    if-nez p1, :cond_0

    .line 47
    .line 48
    const-string p1, "null"

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    :goto_0
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    const-string p1, ", size: "

    .line 63
    .line 64
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    iget p1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->size:I

    .line 68
    .line 69
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    const-string p1, ", full: "

    .line 73
    .line 74
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    iget-boolean p0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->full:Z

    .line 78
    .line 79
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-static {p0}, Lcom/tantanapp/common/data/orm/DatabaseStore;->i(Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    return-void
.end method

.method public isEmpty()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->base:Ljava/util/List;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0, v1}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->tryFillAt(I)V

    .line 7
    .line 8
    .line 9
    :cond_0
    invoke-virtual {p0}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->size()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-gtz p0, :cond_1

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_1
    return v1
.end method

.method public querySize()V
    .locals 4

    .line 1
    sget-boolean v0, Lcom/tantanapp/common/data/orm/DatabaseStore;->DETAILED_LOGGING:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/tantanapp/common/utils/ThreadUtil;->f()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const-string v0, "query size called"

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->dd(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    iget-object v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->this$2:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;

    .line 17
    .line 18
    iget-object v0, v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->this$1:Lcom/tantanapp/common/data/orm/DatabaseStore$Table;

    .line 19
    .line 20
    iget-object v0, v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->this$0:Lcom/tantanapp/common/data/orm/DatabaseStore;

    .line 21
    .line 22
    invoke-virtual {v0}, Lcom/tantanapp/common/data/orm/DatabaseStore;->ensureMainThreadDeferredTransactionStarted()V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->this$2:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;

    .line 26
    .line 27
    iget-object v0, v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->query:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;

    .line 28
    .line 29
    invoke-virtual {v0}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;->count()I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    iput v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->size:I

    .line 34
    .line 35
    iget-object v1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->base:Ljava/util/List;

    .line 36
    .line 37
    const/4 v2, 0x0

    .line 38
    const/4 v3, 0x1

    .line 39
    if-eqz v1, :cond_2

    .line 40
    .line 41
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    if-ne v0, v1, :cond_1

    .line 46
    .line 47
    move v2, v3

    .line 48
    :cond_1
    iput-boolean v2, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->full:Z

    .line 49
    .line 50
    return-void

    .line 51
    :cond_2
    if-nez v0, :cond_3

    .line 52
    .line 53
    new-instance v0, Ljava/util/ArrayList;

    .line 54
    .line 55
    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 56
    .line 57
    .line 58
    iput-object v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->base:Ljava/util/List;

    .line 59
    .line 60
    iput-boolean v3, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->full:Z

    .line 61
    .line 62
    :cond_3
    return-void
.end method

.method public size()I
    .locals 2

    .line 1
    sget-boolean v0, Lcom/tantanapp/common/data/orm/DatabaseStore;->DETAILED_LOGGING:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v1, "size called with "

    .line 8
    .line 9
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget v1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->size:I

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-static {v0}, Lcom/tantanapp/common/data/orm/DatabaseStore;->d(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    iget v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->size:I

    .line 25
    .line 26
    const/4 v1, -0x1

    .line 27
    if-ne v0, v1, :cond_1

    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->querySize()V

    .line 30
    .line 31
    .line 32
    :cond_1
    iget p0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->size:I

    .line 33
    .line 34
    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "size: "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget v1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->size:I

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, "\nfull: "

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-boolean v1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->full:Z

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, "\nbase: "

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget-object v1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->base:Ljava/util/List;

    .line 29
    .line 30
    if-nez v1, :cond_0

    .line 31
    .line 32
    const-string p0, "null"

    .line 33
    .line 34
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    const-string v1, "size "

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    iget-object v1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->base:Ljava/util/List;

    .line 44
    .line 45
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    const-string v1, "\n["

    .line 53
    .line 54
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->base:Ljava/util/List;

    .line 58
    .line 59
    const-string v1, "; "

    .line 60
    .line 61
    invoke-static {p0, v1}, Ll/jyb;->U(Ljava/util/Collection;Ljava/lang/String;)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    const-string p0, "]"

    .line 69
    .line 70
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    :goto_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    return-object p0
.end method

.method public tryFillAt(I)V
    .locals 6

    .line 1
    sget-boolean v0, Ll/kmk0;->c:Z

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eqz v0, :cond_2

    .line 5
    .line 6
    iget-object v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->base:Ljava/util/List;

    .line 7
    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    if-eqz p1, :cond_1

    .line 11
    .line 12
    iget v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->size:I

    .line 13
    .line 14
    if-lez v0, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const/4 v0, 0x0

    .line 18
    goto :goto_1

    .line 19
    :cond_1
    :goto_0
    move v0, v1

    .line 20
    :goto_1
    invoke-static {v0}, Ll/u11;->h(Z)V

    .line 21
    .line 22
    .line 23
    :cond_2
    iget-object v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->base:Ljava/util/List;

    .line 24
    .line 25
    if-nez v0, :cond_3

    .line 26
    .line 27
    new-instance v0, Ljava/util/ArrayList;

    .line 28
    .line 29
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 30
    .line 31
    .line 32
    iput-object v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->base:Ljava/util/List;

    .line 33
    .line 34
    :cond_3
    iget-object v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->base:Ljava/util/List;

    .line 35
    .line 36
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-lt p1, v0, :cond_7

    .line 41
    .line 42
    invoke-virtual {p0, p1}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->checkBigGap(I)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->base:Ljava/util/List;

    .line 46
    .line 47
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    iget-object v2, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->this$2:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;

    .line 52
    .line 53
    iget-object v2, v2, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->query:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;

    .line 54
    .line 55
    iget v3, v2, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;->initPageSize:I

    .line 56
    .line 57
    if-ge p1, v3, :cond_4

    .line 58
    .line 59
    goto :goto_2

    .line 60
    :cond_4
    iget v3, v2, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;->pageSize:I

    .line 61
    .line 62
    :goto_2
    iget-object v4, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->base:Ljava/util/List;

    .line 63
    .line 64
    invoke-virtual {v2, v4}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;->queryFilter(Ljava/util/List;)Lcom/tantanapp/common/data/orm/Filter;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    iget-object v4, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->this$2:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;

    .line 69
    .line 70
    iget-object v4, v4, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->query:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;

    .line 71
    .line 72
    iget-object v5, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->base:Ljava/util/List;

    .line 73
    .line 74
    invoke-virtual {v4, v5, p1, v3}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;->queryLimit(Ljava/util/List;II)I

    .line 75
    .line 76
    .line 77
    move-result p1

    .line 78
    sget-boolean v3, Lcom/tantanapp/common/data/orm/DatabaseStore;->DETAILED_LOGGING:Z

    .line 79
    .line 80
    if-eqz v3, :cond_5

    .line 81
    .line 82
    new-instance v4, Ljava/lang/StringBuilder;

    .line 83
    .line 84
    const-string v5, "query cache called "

    .line 85
    .line 86
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v4

    .line 96
    invoke-virtual {p0, v4}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->dd(Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    :cond_5
    iget-object v4, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->this$2:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;

    .line 100
    .line 101
    iget-object v5, v4, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->this$1:Lcom/tantanapp/common/data/orm/DatabaseStore$Table;

    .line 102
    .line 103
    iget-object v4, v4, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->query:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;

    .line 104
    .line 105
    iget-object v4, v4, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;->orderBy:Lcom/tantanapp/common/data/orm/Order;

    .line 106
    .line 107
    invoke-virtual {v5, v2, v4, p1}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->queryCache(Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/Order;I)Ljava/util/List;

    .line 108
    .line 109
    .line 110
    move-result-object v2

    .line 111
    iget-object v4, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->base:Ljava/util/List;

    .line 112
    .line 113
    invoke-interface {v4, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 114
    .line 115
    .line 116
    iget-object v2, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->base:Ljava/util/List;

    .line 117
    .line 118
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 119
    .line 120
    .line 121
    move-result v2

    .line 122
    add-int/2addr p1, v0

    .line 123
    if-ge v2, p1, :cond_6

    .line 124
    .line 125
    iput-boolean v1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->full:Z

    .line 126
    .line 127
    iget-object p1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->base:Ljava/util/List;

    .line 128
    .line 129
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 130
    .line 131
    .line 132
    move-result p1

    .line 133
    iput p1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->size:I

    .line 134
    .line 135
    :cond_6
    if-eqz v3, :cond_7

    .line 136
    .line 137
    invoke-static {}, Lcom/tantanapp/common/utils/ThreadUtil;->f()Z

    .line 138
    .line 139
    .line 140
    move-result p1

    .line 141
    if-eqz p1, :cond_7

    .line 142
    .line 143
    const-string p1, "status updated"

    .line 144
    .line 145
    invoke-virtual {p0, p1}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->dd(Ljava/lang/String;)V

    .line 146
    .line 147
    .line 148
    :cond_7
    return-void
.end method
