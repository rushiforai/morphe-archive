.class public Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tantanapp/common/data/orm/DatabaseStore$Table;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "Query"
.end annotation


# instance fields
.field protected final initPageSize:I

.field private final key:Ljava/lang/String;

.field protected final orderBy:Lcom/tantanapp/common/data/orm/Order;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Order<",
            "TT;>;"
        }
    .end annotation
.end field

.field protected final pageSize:I

.field final synthetic this$1:Lcom/tantanapp/common/data/orm/DatabaseStore$Table;

.field protected final where:Lcom/tantanapp/common/data/orm/Filter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Filter<",
            "TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/tantanapp/common/data/orm/DatabaseStore$Table;Ljava/lang/String;Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/Order;II)V
    .locals 0
    .param p3    # Lcom/tantanapp/common/data/orm/Filter;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/tantanapp/common/data/orm/Filter<",
            "TT;>;",
            "Lcom/tantanapp/common/data/orm/Order<",
            "TT;>;II)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;->this$1:Lcom/tantanapp/common/data/orm/DatabaseStore$Table;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p4}, Ll/u11;->d(Ljava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    iput-object p2, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;->key:Ljava/lang/String;

    .line 10
    .line 11
    iput-object p3, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;->where:Lcom/tantanapp/common/data/orm/Filter;

    .line 12
    .line 13
    iput-object p4, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;->orderBy:Lcom/tantanapp/common/data/orm/Order;

    .line 14
    .line 15
    iput p5, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;->initPageSize:I

    .line 16
    .line 17
    iput p6, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;->pageSize:I

    .line 18
    .line 19
    return-void
.end method

.method public static synthetic a(Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;->this$1:Lcom/tantanapp/common/data/orm/DatabaseStore$Table;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->uiQueries:Ljava/util/concurrent/ConcurrentHashMap;

    .line 4
    .line 5
    iget-object v1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;->key:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-static {v0}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->access$700(Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;)Lrx/subjects/a;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Lrx/subjects/a;->h()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_1

    .line 24
    .line 25
    sget-boolean v0, Lcom/tantanapp/common/data/orm/DatabaseStore;->DETAILED_LOGGING:Z

    .line 26
    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    sget-object v0, Ll/kmk0;->a:Ljava/lang/String;

    .line 30
    .line 31
    :cond_0
    iget-object v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;->this$1:Lcom/tantanapp/common/data/orm/DatabaseStore$Table;

    .line 32
    .line 33
    iget-object v0, v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->uiQueries:Ljava/util/concurrent/ConcurrentHashMap;

    .line 34
    .line 35
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;->key:Ljava/lang/String;

    .line 36
    .line 37
    invoke-virtual {v0, p0}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    :cond_1
    return-void
.end method

.method public static synthetic access$300(Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;->key:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic b(Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/n7c;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/n7c;-><init>(Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;)V

    .line 7
    .line 8
    .line 9
    const-wide/16 v1, 0x3e8

    .line 10
    .line 11
    invoke-static {v0, v1, v2}, Lcom/tantanapp/common/utils/ThreadUtil;->h(Ljava/lang/Runnable;J)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic c(Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;->this$1:Lcom/tantanapp/common/data/orm/DatabaseStore$Table;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->uiQueries:Ljava/util/concurrent/ConcurrentHashMap;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;->key:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, p0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x1

    .line 11
    invoke-virtual {p1, p0}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->tryInitiate(Z)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic d(Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;->this$1:Lcom/tantanapp/common/data/orm/DatabaseStore$Table;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->uiQueries:Ljava/util/concurrent/ConcurrentHashMap;

    .line 4
    .line 5
    iget-object v1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;->key:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-static {v0}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->access$700(Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;)Lrx/subjects/a;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Lrx/subjects/a;->h()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_1

    .line 24
    .line 25
    sget-boolean v0, Lcom/tantanapp/common/data/orm/DatabaseStore;->DETAILED_LOGGING:Z

    .line 26
    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    sget-object v0, Ll/kmk0;->a:Ljava/lang/String;

    .line 30
    .line 31
    :cond_0
    iget-object v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;->this$1:Lcom/tantanapp/common/data/orm/DatabaseStore$Table;

    .line 32
    .line 33
    iget-object v0, v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->uiQueries:Ljava/util/concurrent/ConcurrentHashMap;

    .line 34
    .line 35
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;->key:Ljava/lang/String;

    .line 36
    .line 37
    invoke-virtual {v0, p0}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    :cond_1
    return-void
.end method

.method public static synthetic e(Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/o7c;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/o7c;-><init>(Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;)V

    .line 7
    .line 8
    .line 9
    const-wide/16 v1, 0x3e8

    .line 10
    .line 11
    invoke-static {v0, v1, v2}, Lcom/tantanapp/common/utils/ThreadUtil;->h(Ljava/lang/Runnable;J)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic f(Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;)Lrx/c;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->groups:Ljava/util/Map;

    .line 2
    .line 3
    invoke-static {p1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic g(Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;->this$1:Lcom/tantanapp/common/data/orm/DatabaseStore$Table;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->uiQueries:Ljava/util/concurrent/ConcurrentHashMap;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;->key:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, p0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1, p2}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->tryInitiate(Z)V

    .line 11
    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public count()I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;->this$1:Lcom/tantanapp/common/data/orm/DatabaseStore$Table;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;->where:Lcom/tantanapp/common/data/orm/Filter;

    .line 4
    .line 5
    const/4 v1, -0x1

    .line 6
    invoke-virtual {v0, p0, v1}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->count(Lcom/tantanapp/common/data/orm/Filter;I)I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method

.method public gruops()Ljava/util/Map;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1
    sget-boolean v0, Ll/kmk0;->c:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;->orderBy:Lcom/tantanapp/common/data/orm/Order;

    .line 6
    .line 7
    instance-of v0, v0, Lcom/tantanapp/common/data/orm/DoubleOrder;

    .line 8
    .line 9
    invoke-static {v0}, Ll/u11;->h(Z)V

    .line 10
    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;->this$1:Lcom/tantanapp/common/data/orm/DatabaseStore$Table;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;->where:Lcom/tantanapp/common/data/orm/Filter;

    .line 15
    .line 16
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;->orderBy:Lcom/tantanapp/common/data/orm/Order;

    .line 17
    .line 18
    check-cast p0, Lcom/tantanapp/common/data/orm/DoubleOrder;

    .line 19
    .line 20
    invoke-virtual {v0, v1, p0}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->groups(Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/DoubleOrder;)Ljava/util/Map;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method public isEmpty()Z
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;->this$1:Lcom/tantanapp/common/data/orm/DatabaseStore$Table;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;->where:Lcom/tantanapp/common/data/orm/Filter;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;->orderBy:Lcom/tantanapp/common/data/orm/Order;

    .line 6
    .line 7
    const/4 v2, 0x1

    .line 8
    invoke-virtual {v0, v1, p0, v2}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->query(Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/Order;I)Ljava/util/List;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    if-nez p0, :cond_0

    .line 17
    .line 18
    return v2

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public query()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query$1;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query$1;-><init>(Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public queryFilter(Ljava/util/List;)Lcom/tantanapp/common/data/orm/Filter;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "TT;>;)",
            "Lcom/tantanapp/common/data/orm/Filter<",
            "TT;>;"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;->where:Lcom/tantanapp/common/data/orm/Filter;

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    add-int/lit8 v0, v0, -0x1

    .line 15
    .line 16
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lcom/tantanapp/common/data/DbObject;

    .line 21
    .line 22
    iget-object v1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;->where:Lcom/tantanapp/common/data/orm/Filter;

    .line 23
    .line 24
    instance-of v2, v1, Lcom/tantanapp/common/data/orm/JoinFilter;

    .line 25
    .line 26
    if-eqz v2, :cond_1

    .line 27
    .line 28
    check-cast v1, Lcom/tantanapp/common/data/orm/JoinFilter;

    .line 29
    .line 30
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;->orderBy:Lcom/tantanapp/common/data/orm/Order;

    .line 31
    .line 32
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    add-int/lit8 v2, v2, -0x1

    .line 37
    .line 38
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    check-cast p1, Lcom/tantanapp/common/data/DbObject;

    .line 43
    .line 44
    invoke-virtual {p0, p1}, Lcom/tantanapp/common/data/orm/Order;->GT_EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    sget-object p1, Lcom/tantanapp/common/data/DbObject;->_ID:Lcom/tantanapp/common/data/orm/LongColumn;

    .line 49
    .line 50
    iget-wide v2, v0, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 51
    .line 52
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-virtual {p1, v0}, Lcom/tantanapp/common/data/orm/ValueColumn;->NEQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    filled-new-array {p0, p1}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-static {p0}, Lcom/tantanapp/common/data/orm/Filter;->AND([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-static {v1, p0}, Lcom/tantanapp/common/data/orm/JoinFilter;->AND(Lcom/tantanapp/common/data/orm/JoinFilter;Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/JoinFilter;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    return-object p0

    .line 73
    :cond_1
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;->orderBy:Lcom/tantanapp/common/data/orm/Order;

    .line 74
    .line 75
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 76
    .line 77
    .line 78
    move-result v2

    .line 79
    add-int/lit8 v2, v2, -0x1

    .line 80
    .line 81
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    check-cast p1, Lcom/tantanapp/common/data/DbObject;

    .line 86
    .line 87
    invoke-virtual {p0, p1}, Lcom/tantanapp/common/data/orm/Order;->GT_EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    sget-object p1, Lcom/tantanapp/common/data/DbObject;->_ID:Lcom/tantanapp/common/data/orm/LongColumn;

    .line 92
    .line 93
    iget-wide v2, v0, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 94
    .line 95
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    invoke-virtual {p1, v0}, Lcom/tantanapp/common/data/orm/ValueColumn;->NEQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    filled-new-array {v1, p0, p1}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    invoke-static {p0}, Lcom/tantanapp/common/data/orm/Filter;->AND([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    return-object p0
.end method

.method public queryLimit(Ljava/util/List;II)I
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "TT;>;II)I"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    sub-int/2addr p2, p0

    .line 6
    add-int/lit8 p2, p2, 0x1

    .line 7
    .line 8
    invoke-static {p3, p2}, Ljava/lang/Math;->max(II)I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method public uiQuery()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/util/List<",
            "TT;>;>;"
        }
    .end annotation

    const/4 v0, 0x1

    .line 71
    invoke-virtual {p0, v0}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;->uiQuery(Z)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public uiQuery(Z)Lrx/c;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Lrx/c<",
            "Ljava/util/List<",
            "TT;>;>;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;->this$1:Lcom/tantanapp/common/data/orm/DatabaseStore$Table;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->uiQueries:Ljava/util/concurrent/ConcurrentHashMap;

    .line 4
    .line 5
    iget-object v1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;->key:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    new-instance v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;

    .line 16
    .line 17
    iget-object v1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;->this$1:Lcom/tantanapp/common/data/orm/DatabaseStore$Table;

    .line 18
    .line 19
    invoke-direct {v0, v1, p0}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;-><init>(Lcom/tantanapp/common/data/orm/DatabaseStore$Table;Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;)V

    .line 20
    .line 21
    .line 22
    iget-object v1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;->this$1:Lcom/tantanapp/common/data/orm/DatabaseStore$Table;

    .line 23
    .line 24
    iget-object v1, v1, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->uiQueries:Ljava/util/concurrent/ConcurrentHashMap;

    .line 25
    .line 26
    iget-object v2, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;->key:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {v1, v2, v0}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    iget-object v1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;->where:Lcom/tantanapp/common/data/orm/Filter;

    .line 32
    .line 33
    instance-of v2, v1, Lcom/tantanapp/common/data/orm/JoinFilter;

    .line 34
    .line 35
    if-eqz v2, :cond_0

    .line 36
    .line 37
    iget-object v2, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;->this$1:Lcom/tantanapp/common/data/orm/DatabaseStore$Table;

    .line 38
    .line 39
    iget-object v2, v2, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->joinFilterQueries:Ljava/util/concurrent/ConcurrentHashMap;

    .line 40
    .line 41
    iget-object v3, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;->key:Ljava/lang/String;

    .line 42
    .line 43
    check-cast v1, Lcom/tantanapp/common/data/orm/JoinFilter;

    .line 44
    .line 45
    invoke-virtual {v2, v3, v1}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    :cond_0
    invoke-static {v0}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->access$700(Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;)Lrx/subjects/a;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    new-instance v2, Ll/r7c;

    .line 53
    .line 54
    invoke-direct {v2, p0, v0, p1}, Ll/r7c;-><init>(Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;Z)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v1, v2}, Lrx/c;->doOnSubscribe(Ll/x20;)Lrx/c;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    new-instance v0, Ll/s7c;

    .line 62
    .line 63
    invoke-direct {v0, p0}, Ll/s7c;-><init>(Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p1, v0}, Lrx/c;->doOnUnsubscribe(Ll/x20;)Lrx/c;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    return-object p0
.end method

.method public uiQueryWithGruops()Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/pf60<",
            "Ljava/util/List<",
            "TT;>;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;>;>;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;->this$1:Lcom/tantanapp/common/data/orm/DatabaseStore$Table;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->uiQueries:Ljava/util/concurrent/ConcurrentHashMap;

    .line 4
    .line 5
    iget-object v1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;->key:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    new-instance v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;

    .line 16
    .line 17
    iget-object v1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;->this$1:Lcom/tantanapp/common/data/orm/DatabaseStore$Table;

    .line 18
    .line 19
    invoke-direct {v0, v1, p0}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;-><init>(Lcom/tantanapp/common/data/orm/DatabaseStore$Table;Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;)V

    .line 20
    .line 21
    .line 22
    iget-object v1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;->this$1:Lcom/tantanapp/common/data/orm/DatabaseStore$Table;

    .line 23
    .line 24
    iget-object v1, v1, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->uiQueries:Ljava/util/concurrent/ConcurrentHashMap;

    .line 25
    .line 26
    iget-object v2, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;->key:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {v1, v2, v0}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    :cond_0
    invoke-static {v0}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->access$700(Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;)Lrx/subjects/a;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    new-instance v2, Lcom/tantanapp/common/data/orm/a;

    .line 36
    .line 37
    invoke-direct {v2, v0}, Lcom/tantanapp/common/data/orm/a;-><init>(Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v1, v2}, Lrx/c;->switchMap(Ll/qcj;)Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    new-instance v2, Ll/p7c;

    .line 45
    .line 46
    invoke-direct {v2, p0, v0}, Ll/p7c;-><init>(Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v1, v2}, Lrx/c;->doOnSubscribe(Ll/x20;)Lrx/c;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    new-instance v1, Ll/q7c;

    .line 54
    .line 55
    invoke-direct {v1, p0}, Ll/q7c;-><init>(Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0, v1}, Lrx/c;->doOnUnsubscribe(Ll/x20;)Lrx/c;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    return-object p0
.end method
