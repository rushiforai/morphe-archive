.class public Lcom/tantanapp/common/data/orm/DatabaseStore$Table;
.super Lcom/tantanapp/common/data/orm/LruCache2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tantanapp/common/data/orm/DatabaseStore;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "Table"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;,
        Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiGet;,
        Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lcom/tantanapp/common/data/DbObject;",
        ">",
        "Lcom/tantanapp/common/data/orm/LruCache2<",
        "Ljava/lang/String;",
        "TT;>;"
    }
.end annotation


# static fields
.field public static final STATUS_HAS_FETCHER:I = 0x1

.field public static final STATUS_NONE:I = 0x0

.field public static final STATUS_NO_FETCHER:I = 0x2


# instance fields
.field final adapter:Lcom/tantanapp/common/data/orm/SqlDatabaseAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/SqlDatabaseAdapter<",
            "TT;>;"
        }
    .end annotation
.end field

.field final indexes:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/tantanapp/common/data/orm/Index;",
            ">;"
        }
    .end annotation
.end field

.field public joinFilterQueries:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap<",
            "Ljava/lang/String;",
            "Lcom/tantanapp/common/data/orm/JoinFilter;",
            ">;"
        }
    .end annotation
.end field

.field protected outerJoin:Ll/pf60;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/pf60<",
            "Lcom/tantanapp/common/data/orm/DatabaseStore$Table;",
            "Ll/bkj0<",
            "Ll/qcj<",
            "Ljava/util/List<",
            "TT;>;",
            "Lcom/tantanapp/common/data/orm/Filter;",
            ">;",
            "Ll/pcj<",
            "Lcom/tantanapp/common/data/orm/Order;",
            ">;",
            "Ljava/lang/Integer;",
            ">;>;"
        }
    .end annotation
.end field

.field public final tableName:Ljava/lang/String;

.field final synthetic this$0:Lcom/tantanapp/common/data/orm/DatabaseStore;

.field protected triggers:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/tantanapp/common/data/orm/DatabaseStore$TableTrigger;",
            ">;"
        }
    .end annotation
.end field

.field public uiGets:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap<",
            "Ljava/lang/String;",
            "Lcom/tantanapp/common/data/orm/DatabaseStore$Table<",
            "TT;>.UiGet;>;"
        }
    .end annotation
.end field

.field public uiQueries:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap<",
            "Ljava/lang/String;",
            "Lcom/tantanapp/common/data/orm/DatabaseStore$Table<",
            "TT;>.UiQuery;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/tantanapp/common/data/orm/DatabaseStore;Ljava/lang/String;Lcom/tantanapp/common/data/orm/SqlDatabaseAdapter;Ljava/util/List;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/tantanapp/common/data/orm/SqlDatabaseAdapter<",
            "TT;>;",
            "Ljava/util/List<",
            "Lcom/tantanapp/common/data/orm/Index;",
            ">;I)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->this$0:Lcom/tantanapp/common/data/orm/DatabaseStore;

    .line 2
    .line 3
    invoke-direct {p0, p5}, Lcom/tantanapp/common/data/orm/LruCache2;-><init>(I)V

    .line 4
    .line 5
    .line 6
    const/4 p5, 0x0

    .line 7
    iput-object p5, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->outerJoin:Ll/pf60;

    .line 8
    .line 9
    iput-object p5, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->triggers:Ljava/util/Map;

    .line 10
    .line 11
    new-instance p5, Ljava/util/concurrent/ConcurrentHashMap;

    .line 12
    .line 13
    invoke-direct {p5}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p5, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->uiQueries:Ljava/util/concurrent/ConcurrentHashMap;

    .line 17
    .line 18
    new-instance p5, Ljava/util/concurrent/ConcurrentHashMap;

    .line 19
    .line 20
    invoke-direct {p5}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object p5, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->joinFilterQueries:Ljava/util/concurrent/ConcurrentHashMap;

    .line 24
    .line 25
    new-instance p5, Ljava/util/concurrent/ConcurrentHashMap;

    .line 26
    .line 27
    invoke-direct {p5}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object p5, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->uiGets:Ljava/util/concurrent/ConcurrentHashMap;

    .line 31
    .line 32
    iput-object p2, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->tableName:Ljava/lang/String;

    .line 33
    .line 34
    iput-object p3, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->adapter:Lcom/tantanapp/common/data/orm/SqlDatabaseAdapter;

    .line 35
    .line 36
    if-nez p4, :cond_0

    .line 37
    .line 38
    new-instance p4, Ljava/util/ArrayList;

    .line 39
    .line 40
    invoke-direct {p4}, Ljava/util/ArrayList;-><init>()V

    .line 41
    .line 42
    .line 43
    :cond_0
    iput-object p4, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->indexes:Ljava/util/List;

    .line 44
    .line 45
    new-instance p2, Lcom/tantanapp/common/data/orm/Index;

    .line 46
    .line 47
    const/4 p3, 0x1

    .line 48
    new-array p3, p3, [Lcom/tantanapp/common/data/orm/Column;

    .line 49
    .line 50
    sget-object p5, Lcom/tantanapp/common/data/DbObject;->ID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 51
    .line 52
    const/4 v0, 0x0

    .line 53
    aput-object p5, p3, v0

    .line 54
    .line 55
    invoke-direct {p2, p3}, Lcom/tantanapp/common/data/orm/Index;-><init>([Lcom/tantanapp/common/data/orm/Column;)V

    .line 56
    .line 57
    .line 58
    invoke-interface {p4, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    invoke-static {p1}, Lcom/tantanapp/common/data/orm/DatabaseStore;->access$100(Lcom/tantanapp/common/data/orm/DatabaseStore;)Ljava/util/List;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    invoke-interface {p1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public static synthetic a(Lcom/tantanapp/common/data/orm/DatabaseStore$Table;Ljava/lang/String;Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiGet;Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->uiGets:Ljava/util/concurrent/ConcurrentHashMap;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    invoke-virtual {p2, p3}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiGet;->tryInitiate(Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic access$200(Lcom/tantanapp/common/data/orm/DatabaseStore$Table;Ljava/util/List;Lcom/tantanapp/common/data/DbObject;Lcom/tantanapp/common/data/orm/Order;)I
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->binarySearchUsingLocalId(Ljava/util/List;Lcom/tantanapp/common/data/DbObject;Lcom/tantanapp/common/data/orm/Order;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic b(Lcom/tantanapp/common/data/orm/DatabaseStore$Table;I)Ljava/util/List;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0, v0, p1}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->query(Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/Order;I)Ljava/util/List;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method private binarySearchUsingLocalId(Ljava/util/List;Lcom/tantanapp/common/data/DbObject;Lcom/tantanapp/common/data/orm/Order;)I
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Lcom/tantanapp/common/data/DbObject;",
            ">(",
            "Ljava/util/List<",
            "TK;>;TK;",
            "Lcom/tantanapp/common/data/orm/Order<",
            "TK;>;)I"
        }
    .end annotation

    .line 1
    invoke-static {p1, p2, p3}, Ljava/util/Collections;->binarySearch(Ljava/util/List;Ljava/lang/Object;Ljava/util/Comparator;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-gez p0, :cond_0

    .line 6
    .line 7
    return p0

    .line 8
    :cond_0
    move v0, p0

    .line 9
    :goto_0
    if-ltz v0, :cond_3

    .line 10
    .line 11
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    check-cast v1, Lcom/tantanapp/common/data/DbObject;

    .line 16
    .line 17
    if-eqz v1, :cond_1

    .line 18
    .line 19
    iget-wide v2, v1, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 20
    .line 21
    iget-wide v4, p2, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 22
    .line 23
    cmp-long v2, v2, v4

    .line 24
    .line 25
    if-nez v2, :cond_1

    .line 26
    .line 27
    return v0

    .line 28
    :cond_1
    invoke-interface {p3, v1, p2}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-eqz v1, :cond_2

    .line 33
    .line 34
    goto :goto_1

    .line 35
    :cond_2
    add-int/lit8 v0, v0, -0x1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_3
    :goto_1
    add-int/lit8 v0, p0, 0x1

    .line 39
    .line 40
    :goto_2
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    if-ge v0, v1, :cond_6

    .line 45
    .line 46
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    check-cast v1, Lcom/tantanapp/common/data/DbObject;

    .line 51
    .line 52
    if-eqz v1, :cond_4

    .line 53
    .line 54
    iget-wide v2, v1, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 55
    .line 56
    iget-wide v4, p2, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 57
    .line 58
    cmp-long v2, v2, v4

    .line 59
    .line 60
    if-nez v2, :cond_4

    .line 61
    .line 62
    return v0

    .line 63
    :cond_4
    invoke-interface {p3, v1, p2}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    if-eqz v1, :cond_5

    .line 68
    .line 69
    goto :goto_3

    .line 70
    :cond_5
    add-int/lit8 v0, v0, 0x1

    .line 71
    .line 72
    goto :goto_2

    .line 73
    :cond_6
    :goto_3
    neg-int p0, p0

    .line 74
    add-int/lit8 p0, p0, -0x1

    .line 75
    .line 76
    return p0
.end method

.method public static synthetic c(Lcom/tantanapp/common/data/orm/DatabaseStore$Table;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/h7c;

    .line 5
    .line 6
    invoke-direct {v0, p0, p1}, Ll/h7c;-><init>(Lcom/tantanapp/common/data/orm/DatabaseStore$Table;Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    const-wide/16 p0, 0x3e8

    .line 10
    .line 11
    invoke-static {v0, p0, p1}, Lcom/tantanapp/common/utils/ThreadUtil;->h(Ljava/lang/Runnable;J)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method private cacheQueryJoinData(Lcom/tantanapp/common/data/DbObject;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->joinFilterQueries:Ljava/util/concurrent/ConcurrentHashMap;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentHashMap;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-lez v0, :cond_3

    .line 8
    .line 9
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->joinFilterQueries:Ljava/util/concurrent/ConcurrentHashMap;

    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/util/concurrent/ConcurrentHashMap;->values()Ljava/util/Collection;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_3

    .line 24
    .line 25
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    check-cast v0, Lcom/tantanapp/common/data/orm/JoinFilter;

    .line 30
    .line 31
    invoke-virtual {v0}, Lcom/tantanapp/common/data/orm/JoinFilter;->baseFilter()Lcom/tantanapp/common/data/orm/Filter;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v1, p1}, Lcom/tantanapp/common/data/orm/Filter;->filter(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    if-eqz v1, :cond_0

    .line 40
    .line 41
    invoke-virtual {v0}, Lcom/tantanapp/common/data/orm/JoinFilter;->foreignC()Lcom/tantanapp/common/data/orm/StringColumn;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-virtual {v1, p1}, Lcom/tantanapp/common/data/orm/Column;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    check-cast v1, Ljava/lang/String;

    .line 50
    .line 51
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    if-eqz v1, :cond_1

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_1
    invoke-virtual {v0}, Lcom/tantanapp/common/data/orm/JoinFilter;->joinTable()Lcom/tantanapp/common/data/orm/DatabaseStore$Table;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    invoke-virtual {v0}, Lcom/tantanapp/common/data/orm/JoinFilter;->foreignC()Lcom/tantanapp/common/data/orm/StringColumn;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    invoke-virtual {v2, p1}, Lcom/tantanapp/common/data/orm/Column;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object v2

    .line 70
    check-cast v2, Ljava/lang/String;

    .line 71
    .line 72
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->query(Ljava/lang/String;)Lcom/tantanapp/common/data/DbObject;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    sget-boolean v2, Ll/kmk0;->b:Z

    .line 77
    .line 78
    if-eqz v2, :cond_2

    .line 79
    .line 80
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ValueObject;->toJson()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    :cond_2
    if-eqz v1, :cond_0

    .line 84
    .line 85
    invoke-virtual {v0}, Lcom/tantanapp/common/data/orm/JoinFilter;->joinTable()Lcom/tantanapp/common/data/orm/DatabaseStore$Table;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    iget-object v2, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 90
    .line 91
    invoke-virtual {v0, v2, v1}, Lcom/tantanapp/common/data/orm/LruCache2;->cache(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    goto :goto_0

    .line 95
    :cond_3
    return-void
.end method

.method public static synthetic d(Lcom/tantanapp/common/data/orm/DatabaseStore$Table;Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->uiGets:Ljava/util/concurrent/ConcurrentHashMap;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiGet;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-static {v0}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiGet;->access$600(Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiGet;)Lrx/subjects/a;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Lrx/subjects/a;->h()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->uiGets:Ljava/util/concurrent/ConcurrentHashMap;

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public static synthetic e(Lcom/tantanapp/common/data/orm/DatabaseStore$Table;Ljava/util/List;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    sget-boolean v0, Ll/kmk0;->c:Z

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/tantanapp/common/data/orm/LruCache2;->size()I

    .line 9
    .line 10
    .line 11
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Lcom/tantanapp/common/data/DbObject;

    .line 26
    .line 27
    iget-object v1, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {p0, v1, v0}, Lcom/tantanapp/common/data/orm/LruCache2;->cache(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    return-void
.end method

.method public static synthetic f(Lcom/tantanapp/common/data/orm/DatabaseStore$Table;I)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->this$0:Lcom/tantanapp/common/data/orm/DatabaseStore;

    .line 2
    .line 3
    new-instance v2, Ll/i7c;

    .line 4
    .line 5
    invoke-direct {v2, p0, p1}, Ll/i7c;-><init>(Lcom/tantanapp/common/data/orm/DatabaseStore$Table;I)V

    .line 6
    .line 7
    .line 8
    new-instance v3, Ll/j7c;

    .line 9
    .line 10
    invoke-direct {v3, p0}, Ll/j7c;-><init>(Lcom/tantanapp/common/data/orm/DatabaseStore$Table;)V

    .line 11
    .line 12
    .line 13
    const/4 v4, 0x0

    .line 14
    const/4 v5, 0x0

    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-virtual/range {v0 .. v5}, Lcom/tantanapp/common/data/orm/DatabaseStore;->asyncFetch(ZLl/pcj;Ll/y20;Ll/x20;Z)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method private traceMeLog(Ljava/lang/String;J)V
    .locals 2

    .line 1
    const-string v0, "users"

    .line 2
    .line 3
    iget-object v1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->tableName:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->this$0:Lcom/tantanapp/common/data/orm/DatabaseStore;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore;->dbName:Ljava/lang/String;

    .line 14
    .line 15
    const-string v0, "core_v2_"

    .line 16
    .line 17
    const-string v1, ""

    .line 18
    .line 19
    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-eqz p0, :cond_0

    .line 28
    .line 29
    new-instance p0, Ljava/lang/StringBuilder;

    .line 30
    .line 31
    const-string v0, "me insert :"

    .line 32
    .line 33
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    const-string p1, " result:"

    .line 40
    .line 41
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    const-string p1, "[common][DatabaseStore]"

    .line 52
    .line 53
    invoke-static {p1, p0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    :cond_0
    return-void
.end method


# virtual methods
.method public allIds()Ljava/util/Set;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-object v2, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->this$0:Lcom/tantanapp/common/data/orm/DatabaseStore;

    .line 6
    .line 7
    invoke-virtual {v2}, Lcom/tantanapp/common/data/orm/DatabaseStore;->db()Lio/requery/android/database/sqlite/SQLiteDatabase;

    .line 8
    .line 9
    .line 10
    move-result-object v3

    .line 11
    iget-object v4, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->tableName:Ljava/lang/String;

    .line 12
    .line 13
    sget-object v2, Lcom/tantanapp/common/data/DbObject;->ID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 14
    .line 15
    iget-object v2, v2, Lcom/tantanapp/common/data/orm/Column;->NAME:Ljava/lang/String;

    .line 16
    .line 17
    filled-new-array {v2}, [Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v5

    .line 21
    const/4 v9, 0x0

    .line 22
    const/4 v10, 0x0

    .line 23
    const/4 v6, 0x0

    .line 24
    const/4 v7, 0x0

    .line 25
    const/4 v8, 0x0

    .line 26
    invoke-virtual/range {v3 .. v10}, Lio/requery/android/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    new-instance v3, Ljava/util/HashSet;

    .line 31
    .line 32
    invoke-direct {v3}, Ljava/util/HashSet;-><init>()V

    .line 33
    .line 34
    .line 35
    :goto_0
    :try_start_0
    invoke-interface {v2}, Landroid/database/Cursor;->moveToNext()Z

    .line 36
    .line 37
    .line 38
    move-result v4

    .line 39
    if-eqz v4, :cond_0

    .line 40
    .line 41
    const/4 v4, 0x0

    .line 42
    invoke-interface {v2, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v4

    .line 46
    invoke-interface {v3, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 47
    .line 48
    .line 49
    goto :goto_0

    .line 50
    :catchall_0
    move-exception v0

    .line 51
    move-object p0, v0

    .line 52
    goto :goto_1

    .line 53
    :cond_0
    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    .line 54
    .line 55
    .line 56
    sget-boolean v2, Ll/kmk0;->b:Z

    .line 57
    .line 58
    if-eqz v2, :cond_1

    .line 59
    .line 60
    const-string v2, "all ids"

    .line 61
    .line 62
    invoke-virtual {p0, v0, v1, v2}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->log(JLjava/lang/String;)V

    .line 63
    .line 64
    .line 65
    :cond_1
    return-object v3

    .line 66
    :goto_1
    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    .line 67
    .line 68
    .line 69
    throw p0
.end method

.method public count(Lcom/tantanapp/common/data/orm/Filter;I)I
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/tantanapp/common/data/orm/Filter<",
            "TT;>;I)I"
        }
    .end annotation

    .line 1
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    sget-object v2, Lcom/tantanapp/common/data/orm/SqlSegment;->NULL:Lcom/tantanapp/common/data/orm/SqlSegment;

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-virtual {p1}, Lcom/tantanapp/common/data/orm/Filter;->emit()Lcom/tantanapp/common/data/orm/SqlSegment;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    :goto_0
    instance-of v3, p1, Lcom/tantanapp/common/data/orm/JoinFilter;

    .line 15
    .line 16
    iget-object v4, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->this$0:Lcom/tantanapp/common/data/orm/DatabaseStore;

    .line 17
    .line 18
    if-eqz v3, :cond_1

    .line 19
    .line 20
    invoke-virtual {v4}, Lcom/tantanapp/common/data/orm/DatabaseStore;->db()Lio/requery/android/database/sqlite/SQLiteDatabase;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    check-cast p1, Lcom/tantanapp/common/data/orm/JoinFilter;

    .line 25
    .line 26
    invoke-virtual {p1}, Lcom/tantanapp/common/data/orm/JoinFilter;->countSql()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    iget-object v4, v2, Lcom/tantanapp/common/data/orm/SqlSegment;->args:[Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {v3, p1, v4}, Lio/requery/android/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    goto :goto_2

    .line 37
    :cond_1
    invoke-virtual {v4}, Lcom/tantanapp/common/data/orm/DatabaseStore;->db()Lio/requery/android/database/sqlite/SQLiteDatabase;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    new-instance v3, Ljava/lang/StringBuilder;

    .line 42
    .line 43
    const-string v4, "select count(_id) from "

    .line 44
    .line 45
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    iget-object v4, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->tableName:Ljava/lang/String;

    .line 49
    .line 50
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string v4, " "

    .line 54
    .line 55
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    iget-object v4, v2, Lcom/tantanapp/common/data/orm/SqlSegment;->part:Ljava/lang/String;

    .line 59
    .line 60
    if-nez v4, :cond_2

    .line 61
    .line 62
    const-string v4, ""

    .line 63
    .line 64
    goto :goto_1

    .line 65
    :cond_2
    new-instance v4, Ljava/lang/StringBuilder;

    .line 66
    .line 67
    const-string v5, " WHERE "

    .line 68
    .line 69
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    iget-object v5, v2, Lcom/tantanapp/common/data/orm/SqlSegment;->part:Ljava/lang/String;

    .line 73
    .line 74
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v4

    .line 81
    :goto_1
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v3

    .line 88
    iget-object v4, v2, Lcom/tantanapp/common/data/orm/SqlSegment;->args:[Ljava/lang/String;

    .line 89
    .line 90
    invoke-virtual {p1, v3, v4}, Lio/requery/android/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    :goto_2
    :try_start_0
    invoke-interface {p1}, Landroid/database/Cursor;->moveToFirst()Z

    .line 95
    .line 96
    .line 97
    move-result v3

    .line 98
    if-eqz v3, :cond_3

    .line 99
    .line 100
    const/4 v3, 0x0

    .line 101
    invoke-interface {p1, v3}, Landroid/database/Cursor;->getInt(I)I

    .line 102
    .line 103
    .line 104
    move-result v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 105
    goto :goto_3

    .line 106
    :catchall_0
    move-exception p0

    .line 107
    goto :goto_5

    .line 108
    :cond_3
    const/4 v3, -0x1

    .line 109
    :goto_3
    if-lez p2, :cond_4

    .line 110
    .line 111
    if-le v3, p2, :cond_4

    .line 112
    .line 113
    goto :goto_4

    .line 114
    :cond_4
    move p2, v3

    .line 115
    :goto_4
    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    .line 116
    .line 117
    .line 118
    sget-boolean p1, Ll/kmk0;->b:Z

    .line 119
    .line 120
    if-eqz p1, :cond_5

    .line 121
    .line 122
    new-instance p1, Ljava/lang/StringBuilder;

    .line 123
    .line 124
    const-string v3, "count "

    .line 125
    .line 126
    invoke-direct {p1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 127
    .line 128
    .line 129
    iget-object v3, v2, Lcom/tantanapp/common/data/orm/SqlSegment;->part:Ljava/lang/String;

    .line 130
    .line 131
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 132
    .line 133
    .line 134
    const-string v3, "\n\t\t"

    .line 135
    .line 136
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 137
    .line 138
    .line 139
    iget-object v2, v2, Lcom/tantanapp/common/data/orm/SqlSegment;->args:[Ljava/lang/String;

    .line 140
    .line 141
    invoke-static {v2}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    .line 142
    .line 143
    .line 144
    move-result-object v2

    .line 145
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 146
    .line 147
    .line 148
    const-string v2, "\n\t\tres: "

    .line 149
    .line 150
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 151
    .line 152
    .line 153
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 154
    .line 155
    .line 156
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 157
    .line 158
    .line 159
    move-result-object p1

    .line 160
    invoke-virtual {p0, v0, v1, p1}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->log(JLjava/lang/String;)V

    .line 161
    .line 162
    .line 163
    :cond_5
    return p2

    .line 164
    :goto_5
    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    .line 165
    .line 166
    .line 167
    throw p0
.end method

.method public delete(J)V
    .locals 1

    .line 209
    sget-object v0, Lcom/tantanapp/common/data/DbObject;->_ID:Lcom/tantanapp/common/data/orm/LongColumn;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->delete(Lcom/tantanapp/common/data/orm/Filter;)V

    return-void
.end method

.method public delete(Lcom/tantanapp/common/data/orm/Filter;)V
    .locals 13

    .line 1
    sget-boolean v0, Ll/kmk0;->c:Z

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const/4 v2, 0x0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-static {}, Ll/u11;->f()V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->this$0:Lcom/tantanapp/common/data/orm/DatabaseStore;

    .line 11
    .line 12
    invoke-static {v0}, Lcom/tantanapp/common/data/orm/DatabaseStore;->access$000(Lcom/tantanapp/common/data/orm/DatabaseStore;)Lcom/tantanapp/common/data/orm/DatabaseStore$Transaction;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    move v0, v1

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    move v0, v2

    .line 21
    :goto_0
    invoke-static {v0}, Ll/u11;->h(Z)V

    .line 22
    .line 23
    .line 24
    :cond_1
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 25
    .line 26
    .line 27
    move-result-wide v3

    .line 28
    if-nez p1, :cond_2

    .line 29
    .line 30
    sget-object v0, Lcom/tantanapp/common/data/orm/SqlSegment;->NULL:Lcom/tantanapp/common/data/orm/SqlSegment;

    .line 31
    .line 32
    goto :goto_1

    .line 33
    :cond_2
    invoke-virtual {p1}, Lcom/tantanapp/common/data/orm/Filter;->emit()Lcom/tantanapp/common/data/orm/SqlSegment;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    :goto_1
    instance-of v5, p1, Lcom/tantanapp/common/data/orm/JoinFilter;

    .line 38
    .line 39
    iget-object v6, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->this$0:Lcom/tantanapp/common/data/orm/DatabaseStore;

    .line 40
    .line 41
    if-eqz v5, :cond_3

    .line 42
    .line 43
    invoke-virtual {v6}, Lcom/tantanapp/common/data/orm/DatabaseStore;->db()Lio/requery/android/database/sqlite/SQLiteDatabase;

    .line 44
    .line 45
    .line 46
    move-result-object v5

    .line 47
    check-cast p1, Lcom/tantanapp/common/data/orm/JoinFilter;

    .line 48
    .line 49
    const/4 v6, 0x0

    .line 50
    const/4 v7, -0x1

    .line 51
    invoke-virtual {p1, v6, v7}, Lcom/tantanapp/common/data/orm/JoinFilter;->querySql(Lcom/tantanapp/common/data/orm/Order;I)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    iget-object v6, v0, Lcom/tantanapp/common/data/orm/SqlSegment;->args:[Ljava/lang/String;

    .line 56
    .line 57
    invoke-virtual {v5, p1, v6}, Lio/requery/android/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    goto :goto_2

    .line 62
    :cond_3
    invoke-virtual {v6}, Lcom/tantanapp/common/data/orm/DatabaseStore;->db()Lio/requery/android/database/sqlite/SQLiteDatabase;

    .line 63
    .line 64
    .line 65
    move-result-object v5

    .line 66
    iget-object v6, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->tableName:Ljava/lang/String;

    .line 67
    .line 68
    iget-object v8, v0, Lcom/tantanapp/common/data/orm/SqlSegment;->part:Ljava/lang/String;

    .line 69
    .line 70
    iget-object v9, v0, Lcom/tantanapp/common/data/orm/SqlSegment;->args:[Ljava/lang/String;

    .line 71
    .line 72
    const/4 v11, 0x0

    .line 73
    const/4 v12, 0x0

    .line 74
    const/4 v7, 0x0

    .line 75
    const/4 v10, 0x0

    .line 76
    invoke-virtual/range {v5 .. v12}, Lio/requery/android/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    :goto_2
    new-instance v5, Ljava/util/ArrayList;

    .line 81
    .line 82
    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 83
    .line 84
    .line 85
    :goto_3
    :try_start_0
    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z

    .line 86
    .line 87
    .line 88
    move-result v6

    .line 89
    if-eqz v6, :cond_4

    .line 90
    .line 91
    iget-object v6, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->adapter:Lcom/tantanapp/common/data/orm/SqlDatabaseAdapter;

    .line 92
    .line 93
    invoke-virtual {v6, p1, v2}, Lcom/tantanapp/common/data/orm/SqlDatabaseAdapter;->read(Landroid/database/Cursor;I)Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    move-result-object v6

    .line 97
    check-cast v6, Lcom/tantanapp/common/data/DbObject;

    .line 98
    .line 99
    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 100
    .line 101
    .line 102
    goto :goto_3

    .line 103
    :catchall_0
    move-exception v0

    .line 104
    move-object p0, v0

    .line 105
    goto :goto_6

    .line 106
    :cond_4
    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    .line 107
    .line 108
    .line 109
    iget-object p1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->this$0:Lcom/tantanapp/common/data/orm/DatabaseStore;

    .line 110
    .line 111
    invoke-virtual {p1}, Lcom/tantanapp/common/data/orm/DatabaseStore;->db()Lio/requery/android/database/sqlite/SQLiteDatabase;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    iget-object v6, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->tableName:Ljava/lang/String;

    .line 116
    .line 117
    iget-object v7, v0, Lcom/tantanapp/common/data/orm/SqlSegment;->part:Ljava/lang/String;

    .line 118
    .line 119
    iget-object v8, v0, Lcom/tantanapp/common/data/orm/SqlSegment;->args:[Ljava/lang/String;

    .line 120
    .line 121
    invoke-virtual {p1, v6, v7, v8}, Lio/requery/android/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 122
    .line 123
    .line 124
    move-result p1

    .line 125
    sget-boolean v6, Ll/kmk0;->c:Z

    .line 126
    .line 127
    if-eqz v6, :cond_6

    .line 128
    .line 129
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    .line 130
    .line 131
    .line 132
    move-result v6

    .line 133
    if-ne p1, v6, :cond_5

    .line 134
    .line 135
    goto :goto_4

    .line 136
    :cond_5
    move v1, v2

    .line 137
    :goto_4
    invoke-static {v1}, Ll/u11;->h(Z)V

    .line 138
    .line 139
    .line 140
    :cond_6
    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 141
    .line 142
    .line 143
    move-result-object p1

    .line 144
    :goto_5
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 145
    .line 146
    .line 147
    move-result v1

    .line 148
    if-eqz v1, :cond_7

    .line 149
    .line 150
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 151
    .line 152
    .line 153
    move-result-object v1

    .line 154
    check-cast v1, Lcom/tantanapp/common/data/DbObject;

    .line 155
    .line 156
    iget-object v2, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->this$0:Lcom/tantanapp/common/data/orm/DatabaseStore;

    .line 157
    .line 158
    invoke-static {v2}, Lcom/tantanapp/common/data/orm/DatabaseStore;->access$000(Lcom/tantanapp/common/data/orm/DatabaseStore;)Lcom/tantanapp/common/data/orm/DatabaseStore$Transaction;

    .line 159
    .line 160
    .line 161
    move-result-object v2

    .line 162
    invoke-virtual {v2, p0, v1}, Lcom/tantanapp/common/data/orm/DatabaseStore$Transaction;->delete(Lcom/tantanapp/common/data/orm/DatabaseStore$Table;Lcom/tantanapp/common/data/DbObject;)V

    .line 163
    .line 164
    .line 165
    goto :goto_5

    .line 166
    :cond_7
    sget-boolean p1, Ll/kmk0;->b:Z

    .line 167
    .line 168
    if-eqz p1, :cond_8

    .line 169
    .line 170
    new-instance p1, Ljava/lang/StringBuilder;

    .line 171
    .line 172
    const-string v1, "delete by where "

    .line 173
    .line 174
    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 175
    .line 176
    .line 177
    iget-object v1, v0, Lcom/tantanapp/common/data/orm/SqlSegment;->part:Ljava/lang/String;

    .line 178
    .line 179
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 180
    .line 181
    .line 182
    const-string v1, "\n\t\t"

    .line 183
    .line 184
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 185
    .line 186
    .line 187
    iget-object v0, v0, Lcom/tantanapp/common/data/orm/SqlSegment;->args:[Ljava/lang/String;

    .line 188
    .line 189
    invoke-static {v0}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    .line 190
    .line 191
    .line 192
    move-result-object v0

    .line 193
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 194
    .line 195
    .line 196
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 197
    .line 198
    .line 199
    move-result-object p1

    .line 200
    invoke-virtual {p0, v3, v4, p1}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->log(JLjava/lang/String;)V

    .line 201
    .line 202
    .line 203
    :cond_8
    return-void

    .line 204
    :goto_6
    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    .line 205
    .line 206
    .line 207
    throw p0
.end method

.method public delete(Ljava/lang/String;)V
    .locals 1

    .line 208
    sget-object v0, Lcom/tantanapp/common/data/DbObject;->ID:Lcom/tantanapp/common/data/orm/StringColumn;

    invoke-virtual {v0, p1}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->delete(Lcom/tantanapp/common/data/orm/Filter;)V

    return-void
.end method

.method public deleteAll()V
    .locals 1

    .line 1
    sget-object v0, Lcom/tantanapp/common/data/orm/Filter;->TRUE:Lcom/tantanapp/common/data/orm/Filter;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->delete(Lcom/tantanapp/common/data/orm/Filter;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public groups(Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/DoubleOrder;)Ljava/util/Map;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/tantanapp/common/data/orm/Filter<",
            "TT;>;",
            "Lcom/tantanapp/common/data/orm/DoubleOrder<",
            "TT;>;)",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1
    instance-of v0, p1, Lcom/tantanapp/common/data/orm/JoinFilter;

    .line 2
    .line 3
    invoke-static {v0}, Ll/u11;->b(Z)V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 7
    .line 8
    .line 9
    move-result-wide v0

    .line 10
    if-nez p1, :cond_0

    .line 11
    .line 12
    sget-object p1, Lcom/tantanapp/common/data/orm/SqlSegment;->NULL:Lcom/tantanapp/common/data/orm/SqlSegment;

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    invoke-virtual {p1}, Lcom/tantanapp/common/data/orm/Filter;->emit()Lcom/tantanapp/common/data/orm/SqlSegment;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    :goto_0
    iget-object v2, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->this$0:Lcom/tantanapp/common/data/orm/DatabaseStore;

    .line 20
    .line 21
    invoke-virtual {v2}, Lcom/tantanapp/common/data/orm/DatabaseStore;->db()Lio/requery/android/database/sqlite/SQLiteDatabase;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    iget-object v4, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->tableName:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {p2}, Lcom/tantanapp/common/data/orm/DoubleOrder;->getFirst()Lcom/tantanapp/common/data/orm/Order;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-virtual {v2}, Lcom/tantanapp/common/data/orm/Order;->column()Lcom/tantanapp/common/data/orm/Column;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    iget-object v2, v2, Lcom/tantanapp/common/data/orm/Column;->NAME:Ljava/lang/String;

    .line 36
    .line 37
    new-instance v5, Ljava/lang/StringBuilder;

    .line 38
    .line 39
    const-string v6, "count("

    .line 40
    .line 41
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p2}, Lcom/tantanapp/common/data/orm/DoubleOrder;->getFirst()Lcom/tantanapp/common/data/orm/Order;

    .line 45
    .line 46
    .line 47
    move-result-object v6

    .line 48
    invoke-virtual {v6}, Lcom/tantanapp/common/data/orm/Order;->column()Lcom/tantanapp/common/data/orm/Column;

    .line 49
    .line 50
    .line 51
    move-result-object v6

    .line 52
    iget-object v6, v6, Lcom/tantanapp/common/data/orm/Column;->NAME:Ljava/lang/String;

    .line 53
    .line 54
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    const-string v6, ")"

    .line 58
    .line 59
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v5

    .line 66
    filled-new-array {v2, v5}, [Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v5

    .line 70
    iget-object v6, p1, Lcom/tantanapp/common/data/orm/SqlSegment;->part:Ljava/lang/String;

    .line 71
    .line 72
    iget-object v7, p1, Lcom/tantanapp/common/data/orm/SqlSegment;->args:[Ljava/lang/String;

    .line 73
    .line 74
    invoke-virtual {p2}, Lcom/tantanapp/common/data/orm/DoubleOrder;->getFirst()Lcom/tantanapp/common/data/orm/Order;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    invoke-virtual {p1}, Lcom/tantanapp/common/data/orm/Order;->column()Lcom/tantanapp/common/data/orm/Column;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    iget-object v8, p1, Lcom/tantanapp/common/data/orm/Column;->NAME:Ljava/lang/String;

    .line 83
    .line 84
    invoke-virtual {p2}, Lcom/tantanapp/common/data/orm/DoubleOrder;->getFirst()Lcom/tantanapp/common/data/orm/Order;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    invoke-virtual {p1}, Lcom/tantanapp/common/data/orm/Order;->emit()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v10

    .line 92
    const/4 v9, 0x0

    .line 93
    invoke-virtual/range {v3 .. v10}, Lio/requery/android/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    new-instance v2, Ll/l01;

    .line 98
    .line 99
    invoke-direct {v2}, Ll/l01;-><init>()V

    .line 100
    .line 101
    .line 102
    :goto_1
    :try_start_0
    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z

    .line 103
    .line 104
    .line 105
    move-result v3

    .line 106
    if-eqz v3, :cond_7

    .line 107
    .line 108
    invoke-virtual {p2}, Lcom/tantanapp/common/data/orm/DoubleOrder;->getFirst()Lcom/tantanapp/common/data/orm/Order;

    .line 109
    .line 110
    .line 111
    move-result-object v3

    .line 112
    invoke-virtual {v3}, Lcom/tantanapp/common/data/orm/Order;->column()Lcom/tantanapp/common/data/orm/Column;

    .line 113
    .line 114
    .line 115
    move-result-object v3

    .line 116
    instance-of v3, v3, Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 117
    .line 118
    const/4 v4, 0x0

    .line 119
    if-eqz v3, :cond_1

    .line 120
    .line 121
    invoke-interface {p1, v4}, Landroid/database/Cursor;->getDouble(I)D

    .line 122
    .line 123
    .line 124
    move-result-wide v3

    .line 125
    invoke-static {v3, v4}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object v3

    .line 129
    goto :goto_2

    .line 130
    :catchall_0
    move-exception v0

    .line 131
    move-object p0, v0

    .line 132
    goto/16 :goto_3

    .line 133
    .line 134
    :cond_1
    invoke-virtual {p2}, Lcom/tantanapp/common/data/orm/DoubleOrder;->getFirst()Lcom/tantanapp/common/data/orm/Order;

    .line 135
    .line 136
    .line 137
    move-result-object v3

    .line 138
    invoke-virtual {v3}, Lcom/tantanapp/common/data/orm/Order;->column()Lcom/tantanapp/common/data/orm/Column;

    .line 139
    .line 140
    .line 141
    move-result-object v3

    .line 142
    instance-of v3, v3, Lcom/tantanapp/common/data/orm/IntegerColumn;

    .line 143
    .line 144
    if-eqz v3, :cond_2

    .line 145
    .line 146
    invoke-interface {p1, v4}, Landroid/database/Cursor;->getInt(I)I

    .line 147
    .line 148
    .line 149
    move-result v3

    .line 150
    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 151
    .line 152
    .line 153
    move-result-object v3

    .line 154
    goto :goto_2

    .line 155
    :cond_2
    invoke-virtual {p2}, Lcom/tantanapp/common/data/orm/DoubleOrder;->getFirst()Lcom/tantanapp/common/data/orm/Order;

    .line 156
    .line 157
    .line 158
    move-result-object v3

    .line 159
    invoke-virtual {v3}, Lcom/tantanapp/common/data/orm/Order;->column()Lcom/tantanapp/common/data/orm/Column;

    .line 160
    .line 161
    .line 162
    move-result-object v3

    .line 163
    instance-of v3, v3, Lcom/tantanapp/common/data/orm/FloatColumn;

    .line 164
    .line 165
    if-eqz v3, :cond_3

    .line 166
    .line 167
    invoke-interface {p1, v4}, Landroid/database/Cursor;->getFloat(I)F

    .line 168
    .line 169
    .line 170
    move-result v3

    .line 171
    invoke-static {v3}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    .line 172
    .line 173
    .line 174
    move-result-object v3

    .line 175
    goto :goto_2

    .line 176
    :cond_3
    invoke-virtual {p2}, Lcom/tantanapp/common/data/orm/DoubleOrder;->getFirst()Lcom/tantanapp/common/data/orm/Order;

    .line 177
    .line 178
    .line 179
    move-result-object v3

    .line 180
    invoke-virtual {v3}, Lcom/tantanapp/common/data/orm/Order;->column()Lcom/tantanapp/common/data/orm/Column;

    .line 181
    .line 182
    .line 183
    move-result-object v3

    .line 184
    instance-of v3, v3, Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 185
    .line 186
    if-eqz v3, :cond_4

    .line 187
    .line 188
    invoke-interface {p1, v4}, Landroid/database/Cursor;->getInt(I)I

    .line 189
    .line 190
    .line 191
    move-result v3

    .line 192
    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 193
    .line 194
    .line 195
    move-result-object v3

    .line 196
    goto :goto_2

    .line 197
    :cond_4
    invoke-virtual {p2}, Lcom/tantanapp/common/data/orm/DoubleOrder;->getFirst()Lcom/tantanapp/common/data/orm/Order;

    .line 198
    .line 199
    .line 200
    move-result-object v3

    .line 201
    invoke-virtual {v3}, Lcom/tantanapp/common/data/orm/Order;->column()Lcom/tantanapp/common/data/orm/Column;

    .line 202
    .line 203
    .line 204
    move-result-object v3

    .line 205
    instance-of v3, v3, Lcom/tantanapp/common/data/orm/StringColumn;

    .line 206
    .line 207
    if-eqz v3, :cond_5

    .line 208
    .line 209
    invoke-interface {p1, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 210
    .line 211
    .line 212
    move-result-object v3

    .line 213
    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 214
    .line 215
    .line 216
    move-result-object v3

    .line 217
    goto :goto_2

    .line 218
    :cond_5
    invoke-virtual {p2}, Lcom/tantanapp/common/data/orm/DoubleOrder;->getFirst()Lcom/tantanapp/common/data/orm/Order;

    .line 219
    .line 220
    .line 221
    move-result-object v3

    .line 222
    invoke-virtual {v3}, Lcom/tantanapp/common/data/orm/Order;->column()Lcom/tantanapp/common/data/orm/Column;

    .line 223
    .line 224
    .line 225
    move-result-object v3

    .line 226
    instance-of v3, v3, Lcom/tantanapp/common/data/orm/EnumColumn;

    .line 227
    .line 228
    if-eqz v3, :cond_6

    .line 229
    .line 230
    invoke-interface {p1, v4}, Landroid/database/Cursor;->getInt(I)I

    .line 231
    .line 232
    .line 233
    move-result v3

    .line 234
    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 235
    .line 236
    .line 237
    move-result-object v3

    .line 238
    :goto_2
    const/4 v4, 0x1

    .line 239
    invoke-interface {p1, v4}, Landroid/database/Cursor;->getInt(I)I

    .line 240
    .line 241
    .line 242
    move-result v4

    .line 243
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 244
    .line 245
    .line 246
    move-result-object v4

    .line 247
    invoke-interface {v2, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 248
    .line 249
    .line 250
    goto/16 :goto_1

    .line 251
    .line 252
    :cond_6
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 253
    .line 254
    const-string p2, "check order column should "

    .line 255
    .line 256
    invoke-direct {p0, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 257
    .line 258
    .line 259
    throw p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 260
    :cond_7
    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    .line 261
    .line 262
    .line 263
    sget-boolean p1, Ll/kmk0;->b:Z

    .line 264
    .line 265
    if-eqz p1, :cond_8

    .line 266
    .line 267
    new-instance p1, Ljava/lang/StringBuilder;

    .line 268
    .line 269
    const-string v3, "groups "

    .line 270
    .line 271
    invoke-direct {p1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 272
    .line 273
    .line 274
    invoke-virtual {p2}, Lcom/tantanapp/common/data/orm/DoubleOrder;->getFirst()Lcom/tantanapp/common/data/orm/Order;

    .line 275
    .line 276
    .line 277
    move-result-object p2

    .line 278
    invoke-virtual {p2}, Lcom/tantanapp/common/data/orm/Order;->column()Lcom/tantanapp/common/data/orm/Column;

    .line 279
    .line 280
    .line 281
    move-result-object p2

    .line 282
    iget-object p2, p2, Lcom/tantanapp/common/data/orm/Column;->NAME:Ljava/lang/String;

    .line 283
    .line 284
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 285
    .line 286
    .line 287
    const-string p2, "\n\t\t"

    .line 288
    .line 289
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 290
    .line 291
    .line 292
    invoke-interface {v2}, Ljava/util/Map;->size()I

    .line 293
    .line 294
    .line 295
    move-result p2

    .line 296
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 297
    .line 298
    .line 299
    const-string p2, "\n\t\t: "

    .line 300
    .line 301
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 302
    .line 303
    .line 304
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 305
    .line 306
    .line 307
    move-result-object p2

    .line 308
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 309
    .line 310
    .line 311
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 312
    .line 313
    .line 314
    move-result-object p1

    .line 315
    invoke-virtual {p0, v0, v1, p1}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->log(JLjava/lang/String;)V

    .line 316
    .line 317
    .line 318
    :cond_8
    return-object v2

    .line 319
    :goto_3
    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    .line 320
    .line 321
    .line 322
    throw p0
.end method

.method public insert(Lcom/tantanapp/common/data/DbObject;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    sget-boolean v0, Ll/kmk0;->c:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-static {}, Ll/u11;->f()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->this$0:Lcom/tantanapp/common/data/orm/DatabaseStore;

    .line 9
    .line 10
    invoke-static {v0}, Lcom/tantanapp/common/data/orm/DatabaseStore;->access$000(Lcom/tantanapp/common/data/orm/DatabaseStore;)Lcom/tantanapp/common/data/orm/DatabaseStore$Transaction;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    const/4 v0, 0x1

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 v0, 0x0

    .line 19
    :goto_0
    invoke-static {v0}, Ll/u11;->h(Z)V

    .line 20
    .line 21
    .line 22
    :cond_1
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 23
    .line 24
    .line 25
    move-result-wide v0

    .line 26
    new-instance v2, Landroid/content/ContentValues;

    .line 27
    .line 28
    invoke-direct {v2}, Landroid/content/ContentValues;-><init>()V

    .line 29
    .line 30
    .line 31
    iget-object v3, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->adapter:Lcom/tantanapp/common/data/orm/SqlDatabaseAdapter;

    .line 32
    .line 33
    invoke-virtual {v3, p1, v2}, Lcom/tantanapp/common/data/orm/SqlDatabaseAdapter;->write(Ljava/lang/Object;Landroid/content/ContentValues;)V

    .line 34
    .line 35
    .line 36
    iget-object v3, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->this$0:Lcom/tantanapp/common/data/orm/DatabaseStore;

    .line 37
    .line 38
    invoke-virtual {v3}, Lcom/tantanapp/common/data/orm/DatabaseStore;->db()Lio/requery/android/database/sqlite/SQLiteDatabase;

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    iget-object v4, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->tableName:Ljava/lang/String;

    .line 43
    .line 44
    const/4 v5, 0x0

    .line 45
    invoke-virtual {v3, v4, v5, v2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    .line 46
    .line 47
    .line 48
    move-result-wide v2

    .line 49
    iput-wide v2, p1, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 50
    .line 51
    sget-boolean v2, Ll/kmk0;->b:Z

    .line 52
    .line 53
    if-eqz v2, :cond_2

    .line 54
    .line 55
    new-instance v2, Ljava/lang/StringBuilder;

    .line 56
    .line 57
    const-string v3, "insert "

    .line 58
    .line 59
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    iget-object v3, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 63
    .line 64
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    invoke-virtual {p0, v0, v1, v2}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->log(JLjava/lang/String;)V

    .line 72
    .line 73
    .line 74
    :cond_2
    iget-object v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->this$0:Lcom/tantanapp/common/data/orm/DatabaseStore;

    .line 75
    .line 76
    invoke-static {v0}, Lcom/tantanapp/common/data/orm/DatabaseStore;->access$000(Lcom/tantanapp/common/data/orm/DatabaseStore;)Lcom/tantanapp/common/data/orm/DatabaseStore$Transaction;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    invoke-virtual {v0, p0, p1}, Lcom/tantanapp/common/data/orm/DatabaseStore$Transaction;->insert(Lcom/tantanapp/common/data/orm/DatabaseStore$Table;Lcom/tantanapp/common/data/DbObject;)V

    .line 81
    .line 82
    .line 83
    invoke-direct {p0, p1}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->cacheQueryJoinData(Lcom/tantanapp/common/data/DbObject;)V

    .line 84
    .line 85
    .line 86
    return-void
.end method

.method public log(JLjava/lang/String;)V
    .locals 1

    const/4 v0, 0x0

    .line 104
    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->log(JLjava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public log(JLjava/lang/String;Ljava/lang/String;)V
    .locals 4

    .line 1
    sget-boolean p4, Ll/kmk0;->b:Z

    .line 2
    .line 3
    if-eqz p4, :cond_4

    .line 4
    .line 5
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    sub-long/2addr v0, p1

    .line 10
    const-wide/32 p1, 0xf4240

    .line 11
    .line 12
    .line 13
    div-long p1, v0, p1

    .line 14
    .line 15
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 16
    .line 17
    .line 18
    move-result-object p4

    .line 19
    invoke-virtual {p4}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p4

    .line 23
    new-instance v2, Ljava/lang/StringBuilder;

    .line 24
    .line 25
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    const-string v3, " "

    .line 32
    .line 33
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->tableName:Ljava/lang/String;

    .line 37
    .line 38
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    const-string p0, "\n"

    .line 48
    .line 49
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {v2, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    const-string p0, "\t\t"

    .line 56
    .line 57
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const-wide/16 v0, 0x0

    .line 64
    .line 65
    cmp-long p0, p1, v0

    .line 66
    .line 67
    if-gtz p0, :cond_0

    .line 68
    .line 69
    sget-object p0, Ll/kmk0;->a:Ljava/lang/String;

    .line 70
    .line 71
    return-void

    .line 72
    :cond_0
    const-wide/16 v0, 0xa

    .line 73
    .line 74
    cmp-long p0, p1, v0

    .line 75
    .line 76
    const-string p1, "main"

    .line 77
    .line 78
    if-gtz p0, :cond_2

    .line 79
    .line 80
    invoke-virtual {p4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    move-result p0

    .line 84
    if-eqz p0, :cond_1

    .line 85
    .line 86
    sget-object p0, Ll/kmk0;->a:Ljava/lang/String;

    .line 87
    .line 88
    return-void

    .line 89
    :cond_1
    sget-object p0, Ll/kmk0;->a:Ljava/lang/String;

    .line 90
    .line 91
    return-void

    .line 92
    :cond_2
    invoke-virtual {p4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 93
    .line 94
    .line 95
    move-result p0

    .line 96
    if-nez p0, :cond_3

    .line 97
    .line 98
    sget-object p0, Ll/kmk0;->a:Ljava/lang/String;

    .line 99
    .line 100
    return-void

    .line 101
    :cond_3
    sget-object p0, Ll/kmk0;->a:Ljava/lang/String;

    .line 102
    .line 103
    :cond_4
    return-void
.end method

.method public query(J)Lcom/tantanapp/common/data/DbObject;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)TT;"
        }
    .end annotation

    .line 274
    sget-object v0, Lcom/tantanapp/common/data/DbObject;->_ID:Lcom/tantanapp/common/data/orm/LongColumn;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    move-result-object p1

    const/4 p2, 0x1

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, p2}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->query(Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/Order;I)Ljava/util/List;

    move-result-object p0

    .line 275
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_0

    return-object v0

    :cond_0
    const/4 p1, 0x0

    .line 276
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/tantanapp/common/data/DbObject;

    return-object p0
.end method

.method public query(Ljava/lang/String;)Lcom/tantanapp/common/data/DbObject;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-eqz p1, :cond_0

    move v2, v1

    goto :goto_0

    :cond_0
    move v2, v0

    .line 277
    :goto_0
    invoke-static {v2}, Ll/u11;->h(Z)V

    .line 278
    sget-object v2, Lcom/tantanapp/common/data/DbObject;->ID:Lcom/tantanapp/common/data/orm/StringColumn;

    invoke-virtual {v2, p1}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    move-result-object p1

    const/4 v2, 0x0

    invoke-virtual {p0, p1, v2, v1}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->query(Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/Order;I)Ljava/util/List;

    move-result-object p0

    .line 279
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_1

    return-object v2

    .line 280
    :cond_1
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/tantanapp/common/data/DbObject;

    return-object p0
.end method

.method public query(Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/Order;I)Ljava/util/List;
    .locals 19
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/tantanapp/common/data/orm/Filter<",
            "TT;>;",
            "Lcom/tantanapp/common/data/orm/Order<",
            "TT;>;I)",
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v2, p2

    .line 6
    .line 7
    move/from16 v3, p3

    .line 8
    .line 9
    sget-boolean v4, Ll/kmk0;->c:Z

    .line 10
    .line 11
    if-eqz v4, :cond_0

    .line 12
    .line 13
    invoke-static {}, Ll/u11;->f()V

    .line 14
    .line 15
    .line 16
    :cond_0
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 17
    .line 18
    .line 19
    move-result-wide v4

    .line 20
    if-nez v1, :cond_1

    .line 21
    .line 22
    sget-object v6, Lcom/tantanapp/common/data/orm/SqlSegment;->NULL:Lcom/tantanapp/common/data/orm/SqlSegment;

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    invoke-virtual {v1}, Lcom/tantanapp/common/data/orm/Filter;->emit()Lcom/tantanapp/common/data/orm/SqlSegment;

    .line 26
    .line 27
    .line 28
    move-result-object v6

    .line 29
    :goto_0
    const/4 v7, 0x0

    .line 30
    const-string v8, ""

    .line 31
    .line 32
    if-lez v3, :cond_2

    .line 33
    .line 34
    new-instance v9, Ljava/lang/StringBuilder;

    .line 35
    .line 36
    invoke-direct {v9, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v9

    .line 46
    move-object/from16 v18, v9

    .line 47
    .line 48
    goto :goto_1

    .line 49
    :cond_2
    move-object/from16 v18, v7

    .line 50
    .line 51
    :goto_1
    instance-of v9, v1, Lcom/tantanapp/common/data/orm/JoinFilter;

    .line 52
    .line 53
    iget-object v10, v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->this$0:Lcom/tantanapp/common/data/orm/DatabaseStore;

    .line 54
    .line 55
    if-eqz v9, :cond_3

    .line 56
    .line 57
    invoke-virtual {v10}, Lcom/tantanapp/common/data/orm/DatabaseStore;->db()Lio/requery/android/database/sqlite/SQLiteDatabase;

    .line 58
    .line 59
    .line 60
    move-result-object v10

    .line 61
    move-object v11, v1

    .line 62
    check-cast v11, Lcom/tantanapp/common/data/orm/JoinFilter;

    .line 63
    .line 64
    invoke-virtual {v11, v2, v3}, Lcom/tantanapp/common/data/orm/JoinFilter;->querySql(Lcom/tantanapp/common/data/orm/Order;I)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v11

    .line 68
    iget-object v12, v6, Lcom/tantanapp/common/data/orm/SqlSegment;->args:[Ljava/lang/String;

    .line 69
    .line 70
    invoke-virtual {v10, v11, v12}, Lio/requery/android/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    .line 71
    .line 72
    .line 73
    move-result-object v10

    .line 74
    goto :goto_3

    .line 75
    :cond_3
    invoke-virtual {v10}, Lcom/tantanapp/common/data/orm/DatabaseStore;->db()Lio/requery/android/database/sqlite/SQLiteDatabase;

    .line 76
    .line 77
    .line 78
    move-result-object v10

    .line 79
    iget-object v11, v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->tableName:Ljava/lang/String;

    .line 80
    .line 81
    iget-object v13, v6, Lcom/tantanapp/common/data/orm/SqlSegment;->part:Ljava/lang/String;

    .line 82
    .line 83
    iget-object v14, v6, Lcom/tantanapp/common/data/orm/SqlSegment;->args:[Ljava/lang/String;

    .line 84
    .line 85
    if-nez v2, :cond_4

    .line 86
    .line 87
    move-object/from16 v17, v7

    .line 88
    .line 89
    goto :goto_2

    .line 90
    :cond_4
    invoke-virtual {v2}, Lcom/tantanapp/common/data/orm/Order;->emit()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v12

    .line 94
    move-object/from16 v17, v12

    .line 95
    .line 96
    :goto_2
    const/4 v12, 0x0

    .line 97
    const/4 v15, 0x0

    .line 98
    const/16 v16, 0x0

    .line 99
    .line 100
    invoke-virtual/range {v10 .. v18}, Lio/requery/android/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    .line 101
    .line 102
    .line 103
    move-result-object v10

    .line 104
    :goto_3
    new-instance v11, Ljava/util/ArrayList;

    .line 105
    .line 106
    invoke-interface {v10}, Landroid/database/Cursor;->getCount()I

    .line 107
    .line 108
    .line 109
    move-result v12

    .line 110
    invoke-direct {v11, v12}, Ljava/util/ArrayList;-><init>(I)V

    .line 111
    .line 112
    .line 113
    sget-boolean v12, Lcom/tantanapp/common/data/orm/DatabaseStore;->DETAILED_LOGGING:Z

    .line 114
    .line 115
    if-eqz v12, :cond_8

    .line 116
    .line 117
    if-eqz v9, :cond_5

    .line 118
    .line 119
    check-cast v1, Lcom/tantanapp/common/data/orm/JoinFilter;

    .line 120
    .line 121
    invoke-virtual {v1, v2, v3}, Lcom/tantanapp/common/data/orm/JoinFilter;->querySql(Lcom/tantanapp/common/data/orm/Order;I)Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object v7

    .line 125
    goto :goto_6

    .line 126
    :cond_5
    iget-object v1, v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->this$0:Lcom/tantanapp/common/data/orm/DatabaseStore;

    .line 127
    .line 128
    invoke-virtual {v1}, Lcom/tantanapp/common/data/orm/DatabaseStore;->db()Lio/requery/android/database/sqlite/SQLiteDatabase;

    .line 129
    .line 130
    .line 131
    move-result-object v1

    .line 132
    new-instance v3, Ljava/lang/StringBuilder;

    .line 133
    .line 134
    const-string v7, "SELECT * FROM "

    .line 135
    .line 136
    invoke-direct {v3, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 137
    .line 138
    .line 139
    iget-object v7, v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->tableName:Ljava/lang/String;

    .line 140
    .line 141
    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 142
    .line 143
    .line 144
    iget-object v7, v6, Lcom/tantanapp/common/data/orm/SqlSegment;->part:Ljava/lang/String;

    .line 145
    .line 146
    if-nez v7, :cond_6

    .line 147
    .line 148
    move-object v7, v8

    .line 149
    goto :goto_4

    .line 150
    :cond_6
    new-instance v7, Ljava/lang/StringBuilder;

    .line 151
    .line 152
    const-string v9, " WHERE "

    .line 153
    .line 154
    invoke-direct {v7, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 155
    .line 156
    .line 157
    iget-object v9, v6, Lcom/tantanapp/common/data/orm/SqlSegment;->part:Ljava/lang/String;

    .line 158
    .line 159
    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 160
    .line 161
    .line 162
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 163
    .line 164
    .line 165
    move-result-object v7

    .line 166
    :goto_4
    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 167
    .line 168
    .line 169
    if-nez v2, :cond_7

    .line 170
    .line 171
    goto :goto_5

    .line 172
    :cond_7
    new-instance v7, Ljava/lang/StringBuilder;

    .line 173
    .line 174
    const-string v8, " ORDER BY "

    .line 175
    .line 176
    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 177
    .line 178
    .line 179
    invoke-virtual {v2}, Lcom/tantanapp/common/data/orm/Order;->emit()Ljava/lang/String;

    .line 180
    .line 181
    .line 182
    move-result-object v2

    .line 183
    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 184
    .line 185
    .line 186
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 187
    .line 188
    .line 189
    move-result-object v8

    .line 190
    :goto_5
    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 191
    .line 192
    .line 193
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 194
    .line 195
    .line 196
    move-result-object v2

    .line 197
    iget-object v3, v6, Lcom/tantanapp/common/data/orm/SqlSegment;->args:[Ljava/lang/String;

    .line 198
    .line 199
    invoke-static {v1, v2, v3}, Lcom/tantanapp/common/data/orm/DatabaseStore;->explainQuery(Lio/requery/android/database/sqlite/SQLiteDatabase;Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    .line 200
    .line 201
    .line 202
    move-result-object v7

    .line 203
    :cond_8
    :goto_6
    :try_start_0
    invoke-interface {v10}, Landroid/database/Cursor;->moveToNext()Z

    .line 204
    .line 205
    .line 206
    move-result v1

    .line 207
    if-eqz v1, :cond_9

    .line 208
    .line 209
    iget-object v1, v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->adapter:Lcom/tantanapp/common/data/orm/SqlDatabaseAdapter;

    .line 210
    .line 211
    const/4 v2, 0x0

    .line 212
    invoke-virtual {v1, v10, v2}, Lcom/tantanapp/common/data/orm/SqlDatabaseAdapter;->read(Landroid/database/Cursor;I)Ljava/lang/Object;

    .line 213
    .line 214
    .line 215
    move-result-object v1

    .line 216
    check-cast v1, Lcom/tantanapp/common/data/DbObject;

    .line 217
    .line 218
    invoke-interface {v11, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 219
    .line 220
    .line 221
    goto :goto_6

    .line 222
    :catchall_0
    move-exception v0

    .line 223
    goto :goto_7

    .line 224
    :cond_9
    invoke-interface {v10}, Landroid/database/Cursor;->close()V

    .line 225
    .line 226
    .line 227
    sget-boolean v1, Ll/kmk0;->b:Z

    .line 228
    .line 229
    if-eqz v1, :cond_a

    .line 230
    .line 231
    new-instance v1, Ljava/lang/StringBuilder;

    .line 232
    .line 233
    const-string v2, "query "

    .line 234
    .line 235
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 236
    .line 237
    .line 238
    iget-object v2, v6, Lcom/tantanapp/common/data/orm/SqlSegment;->part:Ljava/lang/String;

    .line 239
    .line 240
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 241
    .line 242
    .line 243
    const-string v2, "\n\t\t"

    .line 244
    .line 245
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 246
    .line 247
    .line 248
    iget-object v2, v6, Lcom/tantanapp/common/data/orm/SqlSegment;->args:[Ljava/lang/String;

    .line 249
    .line 250
    invoke-static {v2}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    .line 251
    .line 252
    .line 253
    move-result-object v2

    .line 254
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 255
    .line 256
    .line 257
    const-string v2, "\n\t\tres: "

    .line 258
    .line 259
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 260
    .line 261
    .line 262
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 263
    .line 264
    .line 265
    move-result-object v1

    .line 266
    invoke-virtual {v0, v4, v5, v1, v7}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->log(JLjava/lang/String;Ljava/lang/String;)V

    .line 267
    .line 268
    .line 269
    :cond_a
    return-object v11

    .line 270
    :goto_7
    invoke-interface {v10}, Landroid/database/Cursor;->close()V

    .line 271
    .line 272
    .line 273
    throw v0
.end method

.method public queryCache(Ljava/lang/String;)Lcom/tantanapp/common/data/DbObject;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation

    .line 208
    sget-boolean v0, Ll/kmk0;->c:Z

    if-eqz v0, :cond_0

    invoke-static {}, Ll/u11;->c()V

    :cond_0
    const/4 v0, 0x0

    const/4 v1, 0x1

    if-eqz p1, :cond_1

    move v2, v1

    goto :goto_0

    :cond_1
    move v2, v0

    .line 209
    :goto_0
    invoke-static {v2}, Ll/u11;->h(Z)V

    .line 210
    invoke-virtual {p0, p1}, Lcom/tantanapp/common/data/orm/LruCache2;->cached(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/tantanapp/common/data/DbObject;

    if-nez v2, :cond_4

    .line 211
    sget-boolean v2, Ll/kmk0;->b:Z

    if-eqz v2, :cond_2

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "miss cache  -> tablename: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->tableName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " ;  id : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/tantanapp/common/data/orm/DatabaseStore;->d(Ljava/lang/String;)V

    .line 212
    :cond_2
    iget-object v2, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->this$0:Lcom/tantanapp/common/data/orm/DatabaseStore;

    invoke-virtual {v2}, Lcom/tantanapp/common/data/orm/DatabaseStore;->ensureMainThreadDeferredTransactionStarted()V

    .line 213
    sget-object v2, Lcom/tantanapp/common/data/DbObject;->ID:Lcom/tantanapp/common/data/orm/StringColumn;

    invoke-virtual {v2, p1}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    move-result-object p1

    const/4 v2, 0x0

    invoke-virtual {p0, p1, v2, v1}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->queryCache(Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/Order;I)Ljava/util/List;

    move-result-object p0

    if-eqz p0, :cond_4

    .line 214
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p1

    if-nez p1, :cond_3

    goto :goto_1

    .line 215
    :cond_3
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/tantanapp/common/data/DbObject;

    return-object p0

    :cond_4
    :goto_1
    return-object v2
.end method

.method public queryCache(Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/Order;I)Ljava/util/List;
    .locals 18
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/tantanapp/common/data/orm/Filter<",
            "TT;>;",
            "Lcom/tantanapp/common/data/orm/Order<",
            "TT;>;I)",
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v2, p2

    .line 6
    .line 7
    move/from16 v3, p3

    .line 8
    .line 9
    sget-boolean v4, Ll/kmk0;->c:Z

    .line 10
    .line 11
    if-eqz v4, :cond_0

    .line 12
    .line 13
    invoke-static {}, Ll/u11;->c()V

    .line 14
    .line 15
    .line 16
    :cond_0
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 17
    .line 18
    .line 19
    move-result-wide v4

    .line 20
    if-nez v1, :cond_1

    .line 21
    .line 22
    sget-object v6, Lcom/tantanapp/common/data/orm/SqlSegment;->NULL:Lcom/tantanapp/common/data/orm/SqlSegment;

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    invoke-virtual {v1}, Lcom/tantanapp/common/data/orm/Filter;->emit()Lcom/tantanapp/common/data/orm/SqlSegment;

    .line 26
    .line 27
    .line 28
    move-result-object v6

    .line 29
    :goto_0
    const/4 v7, 0x0

    .line 30
    if-lez v3, :cond_2

    .line 31
    .line 32
    new-instance v8, Ljava/lang/StringBuilder;

    .line 33
    .line 34
    const-string v9, ""

    .line 35
    .line 36
    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v8

    .line 46
    move-object/from16 v17, v8

    .line 47
    .line 48
    goto :goto_1

    .line 49
    :cond_2
    move-object/from16 v17, v7

    .line 50
    .line 51
    :goto_1
    iget-object v8, v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->this$0:Lcom/tantanapp/common/data/orm/DatabaseStore;

    .line 52
    .line 53
    invoke-virtual {v8}, Lcom/tantanapp/common/data/orm/DatabaseStore;->ensureMainThreadDeferredTransactionStarted()V

    .line 54
    .line 55
    .line 56
    instance-of v8, v1, Lcom/tantanapp/common/data/orm/JoinFilter;

    .line 57
    .line 58
    iget-object v9, v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->this$0:Lcom/tantanapp/common/data/orm/DatabaseStore;

    .line 59
    .line 60
    if-eqz v8, :cond_3

    .line 61
    .line 62
    invoke-virtual {v9}, Lcom/tantanapp/common/data/orm/DatabaseStore;->db()Lio/requery/android/database/sqlite/SQLiteDatabase;

    .line 63
    .line 64
    .line 65
    move-result-object v7

    .line 66
    check-cast v1, Lcom/tantanapp/common/data/orm/JoinFilter;

    .line 67
    .line 68
    invoke-virtual {v1, v2, v3}, Lcom/tantanapp/common/data/orm/JoinFilter;->querySql(Lcom/tantanapp/common/data/orm/Order;I)Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    iget-object v2, v6, Lcom/tantanapp/common/data/orm/SqlSegment;->args:[Ljava/lang/String;

    .line 73
    .line 74
    invoke-virtual {v7, v1, v2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    goto :goto_4

    .line 79
    :cond_3
    invoke-virtual {v9}, Lcom/tantanapp/common/data/orm/DatabaseStore;->db()Lio/requery/android/database/sqlite/SQLiteDatabase;

    .line 80
    .line 81
    .line 82
    move-result-object v9

    .line 83
    iget-object v10, v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->tableName:Ljava/lang/String;

    .line 84
    .line 85
    iget-object v12, v6, Lcom/tantanapp/common/data/orm/SqlSegment;->part:Ljava/lang/String;

    .line 86
    .line 87
    iget-object v13, v6, Lcom/tantanapp/common/data/orm/SqlSegment;->args:[Ljava/lang/String;

    .line 88
    .line 89
    if-nez v2, :cond_4

    .line 90
    .line 91
    :goto_2
    move-object/from16 v16, v7

    .line 92
    .line 93
    goto :goto_3

    .line 94
    :cond_4
    invoke-virtual {v2}, Lcom/tantanapp/common/data/orm/Order;->emit()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v7

    .line 98
    goto :goto_2

    .line 99
    :goto_3
    const/4 v11, 0x0

    .line 100
    const/4 v14, 0x0

    .line 101
    const/4 v15, 0x0

    .line 102
    invoke-virtual/range {v9 .. v17}, Lio/requery/android/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    :goto_4
    new-instance v2, Ljava/util/ArrayList;

    .line 107
    .line 108
    const/16 v3, 0xa

    .line 109
    .line 110
    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 111
    .line 112
    .line 113
    :try_start_0
    sget-object v3, Lcom/tantanapp/common/data/DbObject;->ID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 114
    .line 115
    iget-object v3, v3, Lcom/tantanapp/common/data/orm/Column;->NAME:Ljava/lang/String;

    .line 116
    .line 117
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    .line 118
    .line 119
    .line 120
    move-result v3

    .line 121
    :goto_5
    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z

    .line 122
    .line 123
    .line 124
    move-result v7

    .line 125
    if-eqz v7, :cond_6

    .line 126
    .line 127
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object v7

    .line 131
    invoke-virtual {v0, v7}, Lcom/tantanapp/common/data/orm/LruCache2;->cached(Ljava/lang/Object;)Ljava/lang/Object;

    .line 132
    .line 133
    .line 134
    move-result-object v8

    .line 135
    check-cast v8, Lcom/tantanapp/common/data/DbObject;

    .line 136
    .line 137
    if-nez v8, :cond_5

    .line 138
    .line 139
    iget-object v8, v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->adapter:Lcom/tantanapp/common/data/orm/SqlDatabaseAdapter;

    .line 140
    .line 141
    const/4 v9, 0x0

    .line 142
    invoke-virtual {v8, v1, v9}, Lcom/tantanapp/common/data/orm/SqlDatabaseAdapter;->read(Landroid/database/Cursor;I)Ljava/lang/Object;

    .line 143
    .line 144
    .line 145
    move-result-object v8

    .line 146
    check-cast v8, Lcom/tantanapp/common/data/DbObject;

    .line 147
    .line 148
    invoke-virtual {v0, v7, v8}, Lcom/tantanapp/common/data/orm/LruCache2;->cache(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 149
    .line 150
    .line 151
    goto :goto_6

    .line 152
    :catchall_0
    move-exception v0

    .line 153
    goto :goto_7

    .line 154
    :cond_5
    :goto_6
    invoke-interface {v2, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 155
    .line 156
    .line 157
    goto :goto_5

    .line 158
    :cond_6
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 159
    .line 160
    .line 161
    sget-boolean v1, Ll/kmk0;->b:Z

    .line 162
    .line 163
    if-eqz v1, :cond_7

    .line 164
    .line 165
    new-instance v1, Ljava/lang/StringBuilder;

    .line 166
    .line 167
    const-string v3, "query cache "

    .line 168
    .line 169
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 170
    .line 171
    .line 172
    iget-object v3, v6, Lcom/tantanapp/common/data/orm/SqlSegment;->part:Ljava/lang/String;

    .line 173
    .line 174
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 175
    .line 176
    .line 177
    const-string v3, "\n\t\t"

    .line 178
    .line 179
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 180
    .line 181
    .line 182
    iget-object v3, v6, Lcom/tantanapp/common/data/orm/SqlSegment;->args:[Ljava/lang/String;

    .line 183
    .line 184
    invoke-static {v3}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    .line 185
    .line 186
    .line 187
    move-result-object v3

    .line 188
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 189
    .line 190
    .line 191
    const-string v3, "\n\t\tres: "

    .line 192
    .line 193
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 194
    .line 195
    .line 196
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 197
    .line 198
    .line 199
    move-result-object v1

    .line 200
    invoke-virtual {v0, v4, v5, v1}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->log(JLjava/lang/String;)V

    .line 201
    .line 202
    .line 203
    :cond_7
    return-object v2

    .line 204
    :goto_7
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 205
    .line 206
    .line 207
    throw v0
.end method

.method public sum(Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/OrderedColumn;)I
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E::",
            "Ljava/lang/Comparable<",
            "TE;>;>(",
            "Lcom/tantanapp/common/data/orm/Filter<",
            "TT;>;",
            "Lcom/tantanapp/common/data/orm/OrderedColumn<",
            "TT;TE;>;)I"
        }
    .end annotation

    .line 1
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    sget-object p1, Lcom/tantanapp/common/data/orm/SqlSegment;->NULL:Lcom/tantanapp/common/data/orm/SqlSegment;

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-virtual {p1}, Lcom/tantanapp/common/data/orm/Filter;->emit()Lcom/tantanapp/common/data/orm/SqlSegment;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    :goto_0
    iget-object v2, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->this$0:Lcom/tantanapp/common/data/orm/DatabaseStore;

    .line 15
    .line 16
    invoke-virtual {v2}, Lcom/tantanapp/common/data/orm/DatabaseStore;->db()Lio/requery/android/database/sqlite/SQLiteDatabase;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    new-instance v3, Ljava/lang/StringBuilder;

    .line 21
    .line 22
    const-string v4, "SELECT SUM("

    .line 23
    .line 24
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    iget-object p2, p2, Lcom/tantanapp/common/data/orm/Column;->NAME:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    const-string p2, ") FROM "

    .line 33
    .line 34
    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    iget-object p2, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->tableName:Ljava/lang/String;

    .line 38
    .line 39
    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    const-string p2, " "

    .line 43
    .line 44
    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    iget-object p2, p1, Lcom/tantanapp/common/data/orm/SqlSegment;->part:Ljava/lang/String;

    .line 48
    .line 49
    if-nez p2, :cond_1

    .line 50
    .line 51
    const-string p2, ""

    .line 52
    .line 53
    goto :goto_1

    .line 54
    :cond_1
    new-instance p2, Ljava/lang/StringBuilder;

    .line 55
    .line 56
    const-string v4, " WHERE "

    .line 57
    .line 58
    invoke-direct {p2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    iget-object v4, p1, Lcom/tantanapp/common/data/orm/SqlSegment;->part:Ljava/lang/String;

    .line 62
    .line 63
    invoke-virtual {p2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p2

    .line 70
    :goto_1
    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object p2

    .line 77
    iget-object v3, p1, Lcom/tantanapp/common/data/orm/SqlSegment;->args:[Ljava/lang/String;

    .line 78
    .line 79
    invoke-virtual {v2, p2, v3}, Lio/requery/android/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    .line 80
    .line 81
    .line 82
    move-result-object p2

    .line 83
    :try_start_0
    invoke-interface {p2}, Landroid/database/Cursor;->moveToFirst()Z

    .line 84
    .line 85
    .line 86
    move-result v2

    .line 87
    if-eqz v2, :cond_2

    .line 88
    .line 89
    const/4 v2, 0x0

    .line 90
    invoke-interface {p2, v2}, Landroid/database/Cursor;->getInt(I)I

    .line 91
    .line 92
    .line 93
    move-result v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 94
    goto :goto_2

    .line 95
    :catchall_0
    move-exception p0

    .line 96
    goto :goto_3

    .line 97
    :cond_2
    const/4 v2, -0x1

    .line 98
    :goto_2
    invoke-interface {p2}, Landroid/database/Cursor;->close()V

    .line 99
    .line 100
    .line 101
    sget-boolean p2, Ll/kmk0;->b:Z

    .line 102
    .line 103
    if-eqz p2, :cond_3

    .line 104
    .line 105
    new-instance p2, Ljava/lang/StringBuilder;

    .line 106
    .line 107
    const-string v3, "sum "

    .line 108
    .line 109
    invoke-direct {p2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    iget-object v3, p1, Lcom/tantanapp/common/data/orm/SqlSegment;->part:Ljava/lang/String;

    .line 113
    .line 114
    invoke-virtual {p2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 115
    .line 116
    .line 117
    const-string v3, "\n\t\t"

    .line 118
    .line 119
    invoke-virtual {p2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    iget-object p1, p1, Lcom/tantanapp/common/data/orm/SqlSegment;->args:[Ljava/lang/String;

    .line 123
    .line 124
    invoke-static {p1}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object p1

    .line 128
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 129
    .line 130
    .line 131
    const-string p1, "\n\t\tres: "

    .line 132
    .line 133
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 134
    .line 135
    .line 136
    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 137
    .line 138
    .line 139
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object p1

    .line 143
    invoke-virtual {p0, v0, v1, p1}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->log(JLjava/lang/String;)V

    .line 144
    .line 145
    .line 146
    :cond_3
    return v2

    .line 147
    :goto_3
    invoke-interface {p2}, Landroid/database/Cursor;->close()V

    .line 148
    .line 149
    .line 150
    throw p0
.end method

.method public syncUiCache(Ljava/util/List;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/tantanapp/common/data/orm/DatabaseStore$Change;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_e

    .line 2
    .line 3
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_e

    .line 12
    .line 13
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Change;

    .line 18
    .line 19
    sget-boolean v1, Lcom/tantanapp/common/data/orm/DatabaseStore;->DETAILED_LOGGING:Z

    .line 20
    .line 21
    if-eqz v1, :cond_1

    .line 22
    .line 23
    new-instance v1, Ljava/lang/StringBuilder;

    .line 24
    .line 25
    const-string v2, "syncing "

    .line 26
    .line 27
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    iget-object v2, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->tableName:Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    const-string v2, " "

    .line 36
    .line 37
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    iget v2, v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Change;->type:I

    .line 41
    .line 42
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-static {v1}, Lcom/tantanapp/common/data/orm/DatabaseStore;->d(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    :cond_1
    iget v1, v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Change;->type:I

    .line 53
    .line 54
    const/4 v2, 0x1

    .line 55
    if-eqz v1, :cond_8

    .line 56
    .line 57
    if-eq v1, v2, :cond_6

    .line 58
    .line 59
    const/4 v3, 0x2

    .line 60
    if-eq v1, v3, :cond_2

    .line 61
    .line 62
    goto/16 :goto_4

    .line 63
    .line 64
    :cond_2
    iget-object v1, v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Change;->item:Lcom/tantanapp/common/data/DbObject;

    .line 65
    .line 66
    iget-object v3, v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Change;->item2:Lcom/tantanapp/common/data/DbObject;

    .line 67
    .line 68
    iget-object v4, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->uiQueries:Ljava/util/concurrent/ConcurrentHashMap;

    .line 69
    .line 70
    invoke-virtual {v4}, Ljava/util/concurrent/ConcurrentHashMap;->values()Ljava/util/Collection;

    .line 71
    .line 72
    .line 73
    move-result-object v4

    .line 74
    invoke-interface {v4}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 75
    .line 76
    .line 77
    move-result-object v4

    .line 78
    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 79
    .line 80
    .line 81
    move-result v5

    .line 82
    if-eqz v5, :cond_3

    .line 83
    .line 84
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object v5

    .line 88
    check-cast v5, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;

    .line 89
    .line 90
    invoke-virtual {v5, v1, v3}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->syncCacheUpdate(Lcom/tantanapp/common/data/DbObject;Lcom/tantanapp/common/data/DbObject;)Z

    .line 91
    .line 92
    .line 93
    goto :goto_1

    .line 94
    :cond_3
    iget-object v4, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 95
    .line 96
    if-eqz v4, :cond_5

    .line 97
    .line 98
    iget-object v5, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 99
    .line 100
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 101
    .line 102
    .line 103
    move-result v4

    .line 104
    if-nez v4, :cond_4

    .line 105
    .line 106
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 107
    .line 108
    invoke-virtual {p0, v1}, Lcom/tantanapp/common/data/orm/LruCache2;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 109
    .line 110
    .line 111
    goto :goto_4

    .line 112
    :cond_4
    iget-object v1, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 113
    .line 114
    invoke-virtual {p0, v1, v3}, Lcom/tantanapp/common/data/orm/LruCache2;->cache(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 115
    .line 116
    .line 117
    goto :goto_4

    .line 118
    :cond_5
    new-instance p1, Lcom/tantanapp/common/utils/UpDateException;

    .line 119
    .line 120
    iget-object v0, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 121
    .line 122
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->this$0:Lcom/tantanapp/common/data/orm/DatabaseStore;

    .line 123
    .line 124
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore;->dbPath:Ljava/io/File;

    .line 125
    .line 126
    invoke-virtual {p0}, Ljava/io/File;->length()J

    .line 127
    .line 128
    .line 129
    move-result-wide v1

    .line 130
    new-instance p0, Ljava/lang/StringBuilder;

    .line 131
    .line 132
    const-string v3, "to.id  = "

    .line 133
    .line 134
    invoke-direct {p0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 135
    .line 136
    .line 137
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 138
    .line 139
    .line 140
    const-string v0, "db size:"

    .line 141
    .line 142
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 143
    .line 144
    .line 145
    invoke-virtual {p0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 146
    .line 147
    .line 148
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object p0

    .line 152
    invoke-direct {p1, p0}, Lcom/tantanapp/common/utils/UpDateException;-><init>(Ljava/lang/String;)V

    .line 153
    .line 154
    .line 155
    throw p1

    .line 156
    :cond_6
    iget-object v1, v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Change;->item:Lcom/tantanapp/common/data/DbObject;

    .line 157
    .line 158
    iget-object v3, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->uiQueries:Ljava/util/concurrent/ConcurrentHashMap;

    .line 159
    .line 160
    invoke-virtual {v3}, Ljava/util/concurrent/ConcurrentHashMap;->values()Ljava/util/Collection;

    .line 161
    .line 162
    .line 163
    move-result-object v3

    .line 164
    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 165
    .line 166
    .line 167
    move-result-object v3

    .line 168
    :goto_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 169
    .line 170
    .line 171
    move-result v4

    .line 172
    if-eqz v4, :cond_7

    .line 173
    .line 174
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 175
    .line 176
    .line 177
    move-result-object v4

    .line 178
    check-cast v4, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;

    .line 179
    .line 180
    invoke-virtual {v4, v1}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->syncCacheInsert(Lcom/tantanapp/common/data/DbObject;)Z

    .line 181
    .line 182
    .line 183
    goto :goto_2

    .line 184
    :cond_7
    iget-object v3, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 185
    .line 186
    invoke-virtual {p0, v3, v1}, Lcom/tantanapp/common/data/orm/LruCache2;->cache(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 187
    .line 188
    .line 189
    goto :goto_4

    .line 190
    :cond_8
    iget-object v1, v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Change;->item:Lcom/tantanapp/common/data/DbObject;

    .line 191
    .line 192
    iget-object v3, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->uiQueries:Ljava/util/concurrent/ConcurrentHashMap;

    .line 193
    .line 194
    invoke-virtual {v3}, Ljava/util/concurrent/ConcurrentHashMap;->values()Ljava/util/Collection;

    .line 195
    .line 196
    .line 197
    move-result-object v3

    .line 198
    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 199
    .line 200
    .line 201
    move-result-object v3

    .line 202
    :goto_3
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 203
    .line 204
    .line 205
    move-result v4

    .line 206
    if-eqz v4, :cond_9

    .line 207
    .line 208
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 209
    .line 210
    .line 211
    move-result-object v4

    .line 212
    check-cast v4, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;

    .line 213
    .line 214
    invoke-virtual {v4, v1}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->syncCacheDelete(Lcom/tantanapp/common/data/DbObject;)V

    .line 215
    .line 216
    .line 217
    goto :goto_3

    .line 218
    :cond_9
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 219
    .line 220
    invoke-virtual {p0, v1}, Lcom/tantanapp/common/data/orm/LruCache2;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 221
    .line 222
    .line 223
    :goto_4
    iget-object v1, v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Change;->item:Lcom/tantanapp/common/data/DbObject;

    .line 224
    .line 225
    if-eqz v1, :cond_b

    .line 226
    .line 227
    iget-object v3, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->uiGets:Ljava/util/concurrent/ConcurrentHashMap;

    .line 228
    .line 229
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 230
    .line 231
    invoke-virtual {v3, v1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 232
    .line 233
    .line 234
    move-result-object v1

    .line 235
    check-cast v1, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiGet;

    .line 236
    .line 237
    if-eqz v1, :cond_b

    .line 238
    .line 239
    iget-object v3, v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Change;->item2:Lcom/tantanapp/common/data/DbObject;

    .line 240
    .line 241
    if-eqz v3, :cond_a

    .line 242
    .line 243
    iget-object v4, v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Change;->item:Lcom/tantanapp/common/data/DbObject;

    .line 244
    .line 245
    invoke-virtual {v4, v3}, Lcom/tantanapp/common/data/DbObject;->equals(Ljava/lang/Object;)Z

    .line 246
    .line 247
    .line 248
    move-result v3

    .line 249
    if-nez v3, :cond_b

    .line 250
    .line 251
    iput-boolean v2, v1, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiGet;->changed:Z

    .line 252
    .line 253
    goto :goto_5

    .line 254
    :cond_a
    iput-boolean v2, v1, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiGet;->changed:Z

    .line 255
    .line 256
    :cond_b
    :goto_5
    iget-object v1, v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Change;->item2:Lcom/tantanapp/common/data/DbObject;

    .line 257
    .line 258
    if-eqz v1, :cond_0

    .line 259
    .line 260
    iget-object v3, v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Change;->item:Lcom/tantanapp/common/data/DbObject;

    .line 261
    .line 262
    if-eqz v3, :cond_c

    .line 263
    .line 264
    iget-object v3, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 265
    .line 266
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 267
    .line 268
    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 269
    .line 270
    .line 271
    move-result v1

    .line 272
    if-eqz v1, :cond_c

    .line 273
    .line 274
    goto/16 :goto_0

    .line 275
    .line 276
    :cond_c
    iget-object v1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->uiGets:Ljava/util/concurrent/ConcurrentHashMap;

    .line 277
    .line 278
    iget-object v3, v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Change;->item2:Lcom/tantanapp/common/data/DbObject;

    .line 279
    .line 280
    iget-object v3, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 281
    .line 282
    invoke-virtual {v1, v3}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 283
    .line 284
    .line 285
    move-result-object v1

    .line 286
    check-cast v1, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiGet;

    .line 287
    .line 288
    if-eqz v1, :cond_0

    .line 289
    .line 290
    iget-object v3, v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Change;->item:Lcom/tantanapp/common/data/DbObject;

    .line 291
    .line 292
    if-eqz v3, :cond_d

    .line 293
    .line 294
    iget-object v0, v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Change;->item2:Lcom/tantanapp/common/data/DbObject;

    .line 295
    .line 296
    invoke-virtual {v0, v3}, Lcom/tantanapp/common/data/DbObject;->equals(Ljava/lang/Object;)Z

    .line 297
    .line 298
    .line 299
    move-result v0

    .line 300
    if-nez v0, :cond_0

    .line 301
    .line 302
    iput-boolean v2, v1, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiGet;->changed:Z

    .line 303
    .line 304
    goto/16 :goto_0

    .line 305
    .line 306
    :cond_d
    iput-boolean v2, v1, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiGet;->changed:Z

    .line 307
    .line 308
    goto/16 :goto_0

    .line 309
    .line 310
    :cond_e
    return-void
.end method

.method public triggerMergeUpdates()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->uiQueries:Ljava/util/concurrent/ConcurrentHashMap;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentHashMap;->values()Ljava/util/Collection;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    check-cast v1, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;

    .line 22
    .line 23
    invoke-virtual {v1}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->triggerIfChanged()V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->uiGets:Ljava/util/concurrent/ConcurrentHashMap;

    .line 28
    .line 29
    invoke-virtual {p0}, Ljava/util/concurrent/ConcurrentHashMap;->values()Ljava/util/Collection;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_1

    .line 42
    .line 43
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    check-cast v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiGet;

    .line 48
    .line 49
    invoke-virtual {v0}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiGet;->triggerIfChanged()V

    .line 50
    .line 51
    .line 52
    goto :goto_1

    .line 53
    :cond_1
    return-void
.end method

.method public uiGet(Ljava/lang/String;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    const/4 v0, 0x1

    .line 52
    invoke-virtual {p0, p1, v0}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->uiGet(Ljava/lang/String;Z)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public uiGet(Ljava/lang/String;Z)Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Z)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    goto :goto_0

    .line 5
    :cond_0
    const/4 v0, 0x0

    .line 6
    :goto_0
    invoke-static {v0}, Ll/u11;->h(Z)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->uiGets:Ljava/util/concurrent/ConcurrentHashMap;

    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiGet;

    .line 16
    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    new-instance v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiGet;

    .line 20
    .line 21
    invoke-direct {v0, p0, p1}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiGet;-><init>(Lcom/tantanapp/common/data/orm/DatabaseStore$Table;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    iget-object v1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->uiGets:Ljava/util/concurrent/ConcurrentHashMap;

    .line 25
    .line 26
    invoke-virtual {v1, p1, v0}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    :cond_1
    invoke-static {v0}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiGet;->access$600(Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiGet;)Lrx/subjects/a;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    new-instance v2, Ll/l7c;

    .line 34
    .line 35
    invoke-direct {v2, p0, p1, v0, p2}, Ll/l7c;-><init>(Lcom/tantanapp/common/data/orm/DatabaseStore$Table;Ljava/lang/String;Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiGet;Z)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v1, v2}, Lrx/c;->doOnSubscribe(Ll/x20;)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object p2

    .line 42
    new-instance v0, Ll/m7c;

    .line 43
    .line 44
    invoke-direct {v0, p0, p1}, Ll/m7c;-><init>(Lcom/tantanapp/common/data/orm/DatabaseStore$Table;Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p2, v0}, Lrx/c;->doOnUnsubscribe(Ll/x20;)Lrx/c;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    return-object p0
.end method

.method public update(Ljava/util/List;Lcom/tantanapp/common/data/orm/Filter;)V
    .locals 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/pf60<",
            "Lcom/tantanapp/common/data/orm/Column;",
            "Ljava/lang/Object;",
            ">;>;",
            "Lcom/tantanapp/common/data/orm/Filter;",
            ")V"
        }
    .end annotation

    .line 1
    sget-boolean v0, Ll/kmk0;->c:Z

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const/4 v2, 0x0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-static {}, Ll/u11;->f()V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->this$0:Lcom/tantanapp/common/data/orm/DatabaseStore;

    .line 11
    .line 12
    invoke-static {v0}, Lcom/tantanapp/common/data/orm/DatabaseStore;->access$000(Lcom/tantanapp/common/data/orm/DatabaseStore;)Lcom/tantanapp/common/data/orm/DatabaseStore$Transaction;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    move v0, v1

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    move v0, v2

    .line 21
    :goto_0
    invoke-static {v0}, Ll/u11;->h(Z)V

    .line 22
    .line 23
    .line 24
    :cond_1
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 25
    .line 26
    .line 27
    move-result-wide v3

    .line 28
    if-nez p2, :cond_2

    .line 29
    .line 30
    sget-object v0, Lcom/tantanapp/common/data/orm/SqlSegment;->NULL:Lcom/tantanapp/common/data/orm/SqlSegment;

    .line 31
    .line 32
    goto :goto_1

    .line 33
    :cond_2
    invoke-virtual {p2}, Lcom/tantanapp/common/data/orm/Filter;->emit()Lcom/tantanapp/common/data/orm/SqlSegment;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    :goto_1
    instance-of v5, p2, Lcom/tantanapp/common/data/orm/JoinFilter;

    .line 38
    .line 39
    iget-object v6, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->this$0:Lcom/tantanapp/common/data/orm/DatabaseStore;

    .line 40
    .line 41
    if-eqz v5, :cond_3

    .line 42
    .line 43
    invoke-virtual {v6}, Lcom/tantanapp/common/data/orm/DatabaseStore;->db()Lio/requery/android/database/sqlite/SQLiteDatabase;

    .line 44
    .line 45
    .line 46
    move-result-object v5

    .line 47
    check-cast p2, Lcom/tantanapp/common/data/orm/JoinFilter;

    .line 48
    .line 49
    const/4 v6, 0x0

    .line 50
    const/4 v7, -0x1

    .line 51
    invoke-virtual {p2, v6, v7}, Lcom/tantanapp/common/data/orm/JoinFilter;->querySql(Lcom/tantanapp/common/data/orm/Order;I)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p2

    .line 55
    iget-object v6, v0, Lcom/tantanapp/common/data/orm/SqlSegment;->args:[Ljava/lang/String;

    .line 56
    .line 57
    invoke-virtual {v5, p2, v6}, Lio/requery/android/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    .line 58
    .line 59
    .line 60
    move-result-object p2

    .line 61
    goto :goto_2

    .line 62
    :cond_3
    invoke-virtual {v6}, Lcom/tantanapp/common/data/orm/DatabaseStore;->db()Lio/requery/android/database/sqlite/SQLiteDatabase;

    .line 63
    .line 64
    .line 65
    move-result-object v5

    .line 66
    iget-object v6, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->tableName:Ljava/lang/String;

    .line 67
    .line 68
    iget-object v8, v0, Lcom/tantanapp/common/data/orm/SqlSegment;->part:Ljava/lang/String;

    .line 69
    .line 70
    iget-object v9, v0, Lcom/tantanapp/common/data/orm/SqlSegment;->args:[Ljava/lang/String;

    .line 71
    .line 72
    const/4 v11, 0x0

    .line 73
    const/4 v12, 0x0

    .line 74
    const/4 v7, 0x0

    .line 75
    const/4 v10, 0x0

    .line 76
    invoke-virtual/range {v5 .. v12}, Lio/requery/android/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    .line 77
    .line 78
    .line 79
    move-result-object p2

    .line 80
    :goto_2
    new-instance v5, Ljava/util/ArrayList;

    .line 81
    .line 82
    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 83
    .line 84
    .line 85
    :goto_3
    :try_start_0
    invoke-interface {p2}, Landroid/database/Cursor;->moveToNext()Z

    .line 86
    .line 87
    .line 88
    move-result v6

    .line 89
    if-eqz v6, :cond_4

    .line 90
    .line 91
    iget-object v6, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->adapter:Lcom/tantanapp/common/data/orm/SqlDatabaseAdapter;

    .line 92
    .line 93
    invoke-virtual {v6, p2, v2}, Lcom/tantanapp/common/data/orm/SqlDatabaseAdapter;->read(Landroid/database/Cursor;I)Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    move-result-object v6

    .line 97
    check-cast v6, Lcom/tantanapp/common/data/DbObject;

    .line 98
    .line 99
    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 100
    .line 101
    .line 102
    goto :goto_3

    .line 103
    :catchall_0
    move-exception v0

    .line 104
    move-object p0, v0

    .line 105
    goto/16 :goto_9

    .line 106
    .line 107
    :cond_4
    invoke-interface {p2}, Landroid/database/Cursor;->close()V

    .line 108
    .line 109
    .line 110
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    .line 111
    .line 112
    .line 113
    move-result p2

    .line 114
    const-string v6, "\n\t\t"

    .line 115
    .line 116
    if-lez p2, :cond_a

    .line 117
    .line 118
    new-instance p2, Landroid/content/ContentValues;

    .line 119
    .line 120
    invoke-direct {p2}, Landroid/content/ContentValues;-><init>()V

    .line 121
    .line 122
    .line 123
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 124
    .line 125
    .line 126
    move-result-object v7

    .line 127
    :goto_4
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    .line 128
    .line 129
    .line 130
    move-result v8

    .line 131
    if-eqz v8, :cond_5

    .line 132
    .line 133
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 134
    .line 135
    .line 136
    move-result-object v8

    .line 137
    check-cast v8, Ll/pf60;

    .line 138
    .line 139
    iget-object v9, v8, Ll/pf60;->a:Ljava/lang/Object;

    .line 140
    .line 141
    check-cast v9, Lcom/tantanapp/common/data/orm/Column;

    .line 142
    .line 143
    iget-object v8, v8, Ll/pf60;->b:Ljava/lang/Object;

    .line 144
    .line 145
    invoke-virtual {v9, p2, v8}, Lcom/tantanapp/common/data/orm/Column;->put(Landroid/content/ContentValues;Ljava/lang/Object;)V

    .line 146
    .line 147
    .line 148
    goto :goto_4

    .line 149
    :cond_5
    iget-object v7, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->this$0:Lcom/tantanapp/common/data/orm/DatabaseStore;

    .line 150
    .line 151
    invoke-virtual {v7}, Lcom/tantanapp/common/data/orm/DatabaseStore;->db()Lio/requery/android/database/sqlite/SQLiteDatabase;

    .line 152
    .line 153
    .line 154
    move-result-object v7

    .line 155
    iget-object v8, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->tableName:Ljava/lang/String;

    .line 156
    .line 157
    iget-object v9, v0, Lcom/tantanapp/common/data/orm/SqlSegment;->part:Ljava/lang/String;

    .line 158
    .line 159
    iget-object v10, v0, Lcom/tantanapp/common/data/orm/SqlSegment;->args:[Ljava/lang/String;

    .line 160
    .line 161
    invoke-virtual {v7, v8, p2, v9, v10}, Lio/requery/android/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 162
    .line 163
    .line 164
    move-result p2

    .line 165
    sget-boolean v7, Ll/kmk0;->c:Z

    .line 166
    .line 167
    if-eqz v7, :cond_7

    .line 168
    .line 169
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    .line 170
    .line 171
    .line 172
    move-result v7

    .line 173
    if-ne p2, v7, :cond_6

    .line 174
    .line 175
    goto :goto_5

    .line 176
    :cond_6
    move v1, v2

    .line 177
    :goto_5
    invoke-static {v1}, Ll/u11;->h(Z)V

    .line 178
    .line 179
    .line 180
    :cond_7
    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 181
    .line 182
    .line 183
    move-result-object p2

    .line 184
    :catch_0
    :goto_6
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 185
    .line 186
    .line 187
    move-result v1

    .line 188
    if-eqz v1, :cond_9

    .line 189
    .line 190
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 191
    .line 192
    .line 193
    move-result-object v1

    .line 194
    check-cast v1, Lcom/tantanapp/common/data/DbObject;

    .line 195
    .line 196
    :try_start_1
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ValueObject;->clone()Lcom/google/protobuf/nano/MessageNano;

    .line 197
    .line 198
    .line 199
    move-result-object v2

    .line 200
    check-cast v2, Lcom/tantanapp/common/data/DbObject;

    .line 201
    .line 202
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 203
    .line 204
    .line 205
    move-result-object v5

    .line 206
    :goto_7
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    .line 207
    .line 208
    .line 209
    move-result v7

    .line 210
    if-eqz v7, :cond_8

    .line 211
    .line 212
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 213
    .line 214
    .line 215
    move-result-object v7

    .line 216
    check-cast v7, Ll/pf60;

    .line 217
    .line 218
    iget-object v8, v7, Ll/pf60;->a:Ljava/lang/Object;

    .line 219
    .line 220
    check-cast v8, Lcom/tantanapp/common/data/orm/Column;

    .line 221
    .line 222
    iget-object v7, v7, Ll/pf60;->b:Ljava/lang/Object;

    .line 223
    .line 224
    invoke-virtual {v8, v2, v7}, Lcom/tantanapp/common/data/orm/Column;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 225
    .line 226
    .line 227
    goto :goto_7

    .line 228
    :cond_8
    iget-object v5, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->this$0:Lcom/tantanapp/common/data/orm/DatabaseStore;

    .line 229
    .line 230
    invoke-static {v5}, Lcom/tantanapp/common/data/orm/DatabaseStore;->access$000(Lcom/tantanapp/common/data/orm/DatabaseStore;)Lcom/tantanapp/common/data/orm/DatabaseStore$Transaction;

    .line 231
    .line 232
    .line 233
    move-result-object v5

    .line 234
    invoke-virtual {v5, p0, v1, v2}, Lcom/tantanapp/common/data/orm/DatabaseStore$Transaction;->update(Lcom/tantanapp/common/data/orm/DatabaseStore$Table;Lcom/tantanapp/common/data/DbObject;Lcom/tantanapp/common/data/DbObject;)V
    :try_end_1
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_1 .. :try_end_1} :catch_0

    .line 235
    .line 236
    .line 237
    goto :goto_6

    .line 238
    :cond_9
    sget-boolean p1, Ll/kmk0;->b:Z

    .line 239
    .line 240
    if-eqz p1, :cond_b

    .line 241
    .line 242
    new-instance p1, Ljava/lang/StringBuilder;

    .line 243
    .line 244
    const-string p2, "update by where "

    .line 245
    .line 246
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 247
    .line 248
    .line 249
    iget-object p2, v0, Lcom/tantanapp/common/data/orm/SqlSegment;->part:Ljava/lang/String;

    .line 250
    .line 251
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 252
    .line 253
    .line 254
    invoke-virtual {p1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 255
    .line 256
    .line 257
    iget-object p2, v0, Lcom/tantanapp/common/data/orm/SqlSegment;->args:[Ljava/lang/String;

    .line 258
    .line 259
    invoke-static {p2}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    .line 260
    .line 261
    .line 262
    move-result-object p2

    .line 263
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 264
    .line 265
    .line 266
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 267
    .line 268
    .line 269
    move-result-object p1

    .line 270
    invoke-virtual {p0, v3, v4, p1}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->log(JLjava/lang/String;)V

    .line 271
    .line 272
    .line 273
    goto :goto_8

    .line 274
    :cond_a
    sget-boolean p1, Ll/kmk0;->b:Z

    .line 275
    .line 276
    if-eqz p1, :cond_b

    .line 277
    .line 278
    new-instance p1, Ljava/lang/StringBuilder;

    .line 279
    .line 280
    const-string p2, "update by where no result "

    .line 281
    .line 282
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 283
    .line 284
    .line 285
    iget-object p2, v0, Lcom/tantanapp/common/data/orm/SqlSegment;->part:Ljava/lang/String;

    .line 286
    .line 287
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 288
    .line 289
    .line 290
    invoke-virtual {p1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 291
    .line 292
    .line 293
    iget-object p2, v0, Lcom/tantanapp/common/data/orm/SqlSegment;->args:[Ljava/lang/String;

    .line 294
    .line 295
    invoke-static {p2}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    .line 296
    .line 297
    .line 298
    move-result-object p2

    .line 299
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 300
    .line 301
    .line 302
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 303
    .line 304
    .line 305
    move-result-object p1

    .line 306
    invoke-virtual {p0, v3, v4, p1}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->log(JLjava/lang/String;)V

    .line 307
    .line 308
    .line 309
    :cond_b
    :goto_8
    return-void

    .line 310
    :goto_9
    invoke-interface {p2}, Landroid/database/Cursor;->close()V

    .line 311
    .line 312
    .line 313
    throw p0
.end method

.method public updateBy_id(Lcom/tantanapp/common/data/DbObject;)V
    .locals 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    sget-boolean v0, Ll/kmk0;->c:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_1

    .line 5
    .line 6
    invoke-static {}, Ll/u11;->f()V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->this$0:Lcom/tantanapp/common/data/orm/DatabaseStore;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/tantanapp/common/data/orm/DatabaseStore;->access$000(Lcom/tantanapp/common/data/orm/DatabaseStore;)Lcom/tantanapp/common/data/orm/DatabaseStore$Transaction;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    const/4 v0, 0x1

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    move v0, v1

    .line 20
    :goto_0
    invoke-static {v0}, Ll/u11;->h(Z)V

    .line 21
    .line 22
    .line 23
    :cond_1
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 24
    .line 25
    .line 26
    move-result-wide v2

    .line 27
    iget-object v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->this$0:Lcom/tantanapp/common/data/orm/DatabaseStore;

    .line 28
    .line 29
    invoke-virtual {v0}, Lcom/tantanapp/common/data/orm/DatabaseStore;->db()Lio/requery/android/database/sqlite/SQLiteDatabase;

    .line 30
    .line 31
    .line 32
    move-result-object v4

    .line 33
    iget-object v5, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->tableName:Ljava/lang/String;

    .line 34
    .line 35
    new-instance v0, Ljava/lang/StringBuilder;

    .line 36
    .line 37
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 38
    .line 39
    .line 40
    sget-object v12, Lcom/tantanapp/common/data/DbObject;->_ID:Lcom/tantanapp/common/data/orm/LongColumn;

    .line 41
    .line 42
    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    const-string v13, " = ?"

    .line 46
    .line 47
    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v7

    .line 54
    iget-wide v8, p1, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 55
    .line 56
    invoke-static {v8, v9}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    filled-new-array {v0}, [Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v8

    .line 64
    const/4 v10, 0x0

    .line 65
    const/4 v11, 0x0

    .line 66
    const/4 v6, 0x0

    .line 67
    const/4 v9, 0x0

    .line 68
    invoke-virtual/range {v4 .. v11}, Lio/requery/android/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    .line 69
    .line 70
    .line 71
    move-result-object v4

    .line 72
    :try_start_0
    invoke-interface {v4}, Landroid/database/Cursor;->moveToNext()Z

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    if-eqz v0, :cond_2

    .line 77
    .line 78
    iget-object v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->adapter:Lcom/tantanapp/common/data/orm/SqlDatabaseAdapter;

    .line 79
    .line 80
    invoke-virtual {v0, v4, v1}, Lcom/tantanapp/common/data/orm/SqlDatabaseAdapter;->read(Landroid/database/Cursor;I)Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    check-cast v0, Lcom/tantanapp/common/data/DbObject;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 85
    .line 86
    goto :goto_1

    .line 87
    :catchall_0
    move-exception v0

    .line 88
    move-object p0, v0

    .line 89
    goto :goto_2

    .line 90
    :cond_2
    const/4 v0, 0x0

    .line 91
    :goto_1
    invoke-interface {v4}, Landroid/database/Cursor;->close()V

    .line 92
    .line 93
    .line 94
    if-eqz v0, :cond_3

    .line 95
    .line 96
    new-instance v1, Landroid/content/ContentValues;

    .line 97
    .line 98
    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    .line 99
    .line 100
    .line 101
    iget-object v4, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->adapter:Lcom/tantanapp/common/data/orm/SqlDatabaseAdapter;

    .line 102
    .line 103
    invoke-virtual {v4, p1, v1}, Lcom/tantanapp/common/data/orm/SqlDatabaseAdapter;->write(Ljava/lang/Object;Landroid/content/ContentValues;)V

    .line 104
    .line 105
    .line 106
    iget-object v4, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->this$0:Lcom/tantanapp/common/data/orm/DatabaseStore;

    .line 107
    .line 108
    invoke-virtual {v4}, Lcom/tantanapp/common/data/orm/DatabaseStore;->db()Lio/requery/android/database/sqlite/SQLiteDatabase;

    .line 109
    .line 110
    .line 111
    move-result-object v4

    .line 112
    iget-object v5, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->tableName:Ljava/lang/String;

    .line 113
    .line 114
    new-instance v6, Ljava/lang/StringBuilder;

    .line 115
    .line 116
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 117
    .line 118
    .line 119
    invoke-virtual {v6, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    invoke-virtual {v6, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 123
    .line 124
    .line 125
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object v6

    .line 129
    iget-wide v7, p1, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 130
    .line 131
    invoke-static {v7, v8}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object v7

    .line 135
    filled-new-array {v7}, [Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object v7

    .line 139
    invoke-virtual {v4, v5, v1, v6, v7}, Lio/requery/android/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 140
    .line 141
    .line 142
    iget-object v1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->this$0:Lcom/tantanapp/common/data/orm/DatabaseStore;

    .line 143
    .line 144
    invoke-static {v1}, Lcom/tantanapp/common/data/orm/DatabaseStore;->access$000(Lcom/tantanapp/common/data/orm/DatabaseStore;)Lcom/tantanapp/common/data/orm/DatabaseStore$Transaction;

    .line 145
    .line 146
    .line 147
    move-result-object v1

    .line 148
    invoke-virtual {v1, p0, v0, p1}, Lcom/tantanapp/common/data/orm/DatabaseStore$Transaction;->update(Lcom/tantanapp/common/data/orm/DatabaseStore$Table;Lcom/tantanapp/common/data/DbObject;Lcom/tantanapp/common/data/DbObject;)V

    .line 149
    .line 150
    .line 151
    sget-boolean v0, Ll/kmk0;->b:Z

    .line 152
    .line 153
    if-eqz v0, :cond_4

    .line 154
    .line 155
    new-instance v0, Ljava/lang/StringBuilder;

    .line 156
    .line 157
    const-string v1, "update by _id "

    .line 158
    .line 159
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 160
    .line 161
    .line 162
    iget-wide v4, p1, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 163
    .line 164
    invoke-virtual {v0, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 165
    .line 166
    .line 167
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 168
    .line 169
    .line 170
    move-result-object p1

    .line 171
    invoke-virtual {p0, v2, v3, p1}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->log(JLjava/lang/String;)V

    .line 172
    .line 173
    .line 174
    return-void

    .line 175
    :cond_3
    sget-boolean v0, Ll/kmk0;->b:Z

    .line 176
    .line 177
    if-eqz v0, :cond_4

    .line 178
    .line 179
    new-instance v0, Ljava/lang/StringBuilder;

    .line 180
    .line 181
    const-string v1, "update by _id no result "

    .line 182
    .line 183
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 184
    .line 185
    .line 186
    iget-wide v4, p1, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 187
    .line 188
    invoke-virtual {v0, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 189
    .line 190
    .line 191
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 192
    .line 193
    .line 194
    move-result-object p1

    .line 195
    invoke-virtual {p0, v2, v3, p1}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->log(JLjava/lang/String;)V

    .line 196
    .line 197
    .line 198
    :cond_4
    return-void

    .line 199
    :goto_2
    invoke-interface {v4}, Landroid/database/Cursor;->close()V

    .line 200
    .line 201
    .line 202
    throw p0
.end method

.method public upsert(Lcom/tantanapp/common/data/DbObject;Ll/z20;)Lcom/tantanapp/common/data/DbObject;
    .locals 17
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Ll/z20<",
            "TT;TT;>;)TT;"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v2, p2

    .line 6
    .line 7
    sget-boolean v3, Ll/kmk0;->c:Z

    .line 8
    .line 9
    const/4 v5, 0x0

    .line 10
    if-eqz v3, :cond_1

    .line 11
    .line 12
    invoke-static {}, Ll/u11;->f()V

    .line 13
    .line 14
    .line 15
    iget-object v3, v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->this$0:Lcom/tantanapp/common/data/orm/DatabaseStore;

    .line 16
    .line 17
    invoke-static {v3}, Lcom/tantanapp/common/data/orm/DatabaseStore;->access$000(Lcom/tantanapp/common/data/orm/DatabaseStore;)Lcom/tantanapp/common/data/orm/DatabaseStore$Transaction;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    if-eqz v3, :cond_0

    .line 22
    .line 23
    const/4 v3, 0x1

    .line 24
    goto :goto_0

    .line 25
    :cond_0
    move v3, v5

    .line 26
    :goto_0
    invoke-static {v3}, Ll/u11;->h(Z)V

    .line 27
    .line 28
    .line 29
    :cond_1
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 30
    .line 31
    .line 32
    move-result-wide v6

    .line 33
    iget-object v3, v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->this$0:Lcom/tantanapp/common/data/orm/DatabaseStore;

    .line 34
    .line 35
    invoke-virtual {v3}, Lcom/tantanapp/common/data/orm/DatabaseStore;->db()Lio/requery/android/database/sqlite/SQLiteDatabase;

    .line 36
    .line 37
    .line 38
    move-result-object v8

    .line 39
    iget-object v9, v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->tableName:Ljava/lang/String;

    .line 40
    .line 41
    new-instance v3, Ljava/lang/StringBuilder;

    .line 42
    .line 43
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 44
    .line 45
    .line 46
    sget-object v10, Lcom/tantanapp/common/data/DbObject;->ID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 47
    .line 48
    invoke-virtual {v3, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    const-string v11, " = ?"

    .line 52
    .line 53
    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v3

    .line 60
    iget-object v12, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 61
    .line 62
    filled-new-array {v12}, [Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v12

    .line 66
    const/4 v14, 0x0

    .line 67
    const/4 v15, 0x0

    .line 68
    move-object v13, v10

    .line 69
    const/4 v10, 0x0

    .line 70
    move-object/from16 v16, v13

    .line 71
    .line 72
    const/4 v13, 0x0

    .line 73
    move-object v4, v11

    .line 74
    move-object v11, v3

    .line 75
    move-object/from16 v3, v16

    .line 76
    .line 77
    invoke-virtual/range {v8 .. v15}, Lio/requery/android/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    .line 78
    .line 79
    .line 80
    move-result-object v8

    .line 81
    :try_start_0
    invoke-interface {v8}, Landroid/database/Cursor;->moveToNext()Z

    .line 82
    .line 83
    .line 84
    move-result v9

    .line 85
    const/4 v10, 0x0

    .line 86
    if-eqz v9, :cond_2

    .line 87
    .line 88
    iget-object v9, v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->adapter:Lcom/tantanapp/common/data/orm/SqlDatabaseAdapter;

    .line 89
    .line 90
    invoke-virtual {v9, v8, v5}, Lcom/tantanapp/common/data/orm/SqlDatabaseAdapter;->read(Landroid/database/Cursor;I)Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    move-result-object v9

    .line 94
    check-cast v9, Lcom/tantanapp/common/data/DbObject;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 95
    .line 96
    goto :goto_1

    .line 97
    :catchall_0
    move-exception v0

    .line 98
    goto/16 :goto_3

    .line 99
    .line 100
    :cond_2
    move-object v9, v10

    .line 101
    :goto_1
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    .line 102
    .line 103
    .line 104
    if-eqz v9, :cond_8

    .line 105
    .line 106
    iget-wide v10, v9, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 107
    .line 108
    iput-wide v10, v1, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 109
    .line 110
    if-eqz v2, :cond_3

    .line 111
    .line 112
    invoke-interface {v2, v1, v9}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 113
    .line 114
    .line 115
    :cond_3
    invoke-virtual {v1, v9}, Lcom/tantanapp/common/data/ValueObject;->mergeData(Lcom/tantanapp/common/data/ValueObject;)V

    .line 116
    .line 117
    .line 118
    invoke-virtual {v9, v1}, Lcom/tantanapp/common/data/DbObject;->equals(Ljava/lang/Object;)Z

    .line 119
    .line 120
    .line 121
    move-result v2

    .line 122
    if-nez v2, :cond_7

    .line 123
    .line 124
    new-instance v2, Landroid/content/ContentValues;

    .line 125
    .line 126
    invoke-direct {v2}, Landroid/content/ContentValues;-><init>()V

    .line 127
    .line 128
    .line 129
    iget-object v8, v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->adapter:Lcom/tantanapp/common/data/orm/SqlDatabaseAdapter;

    .line 130
    .line 131
    invoke-virtual {v8, v1, v2}, Lcom/tantanapp/common/data/orm/SqlDatabaseAdapter;->write(Ljava/lang/Object;Landroid/content/ContentValues;)V

    .line 132
    .line 133
    .line 134
    iget-object v8, v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->this$0:Lcom/tantanapp/common/data/orm/DatabaseStore;

    .line 135
    .line 136
    invoke-virtual {v8}, Lcom/tantanapp/common/data/orm/DatabaseStore;->db()Lio/requery/android/database/sqlite/SQLiteDatabase;

    .line 137
    .line 138
    .line 139
    move-result-object v8

    .line 140
    iget-object v10, v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->tableName:Ljava/lang/String;

    .line 141
    .line 142
    new-instance v11, Ljava/lang/StringBuilder;

    .line 143
    .line 144
    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    .line 145
    .line 146
    .line 147
    invoke-virtual {v11, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 148
    .line 149
    .line 150
    invoke-virtual {v11, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 151
    .line 152
    .line 153
    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object v3

    .line 157
    iget-object v4, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 158
    .line 159
    filled-new-array {v4}, [Ljava/lang/String;

    .line 160
    .line 161
    .line 162
    move-result-object v4

    .line 163
    invoke-virtual {v8, v10, v2, v3, v4}, Lio/requery/android/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 164
    .line 165
    .line 166
    move-result v2

    .line 167
    sget-boolean v3, Ll/kmk0;->b:Z

    .line 168
    .line 169
    if-eqz v3, :cond_4

    .line 170
    .line 171
    new-instance v3, Ljava/lang/StringBuilder;

    .line 172
    .line 173
    const-string v4, "update "

    .line 174
    .line 175
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 176
    .line 177
    .line 178
    iget-object v4, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 179
    .line 180
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 181
    .line 182
    .line 183
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 184
    .line 185
    .line 186
    move-result-object v3

    .line 187
    invoke-virtual {v0, v6, v7, v3}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->log(JLjava/lang/String;)V

    .line 188
    .line 189
    .line 190
    :cond_4
    sget-boolean v3, Ll/kmk0;->c:Z

    .line 191
    .line 192
    if-eqz v3, :cond_6

    .line 193
    .line 194
    if-lez v2, :cond_5

    .line 195
    .line 196
    const/4 v4, 0x1

    .line 197
    goto :goto_2

    .line 198
    :cond_5
    move v4, v5

    .line 199
    :goto_2
    invoke-static {v4}, Ll/u11;->h(Z)V

    .line 200
    .line 201
    .line 202
    :cond_6
    if-lez v2, :cond_7

    .line 203
    .line 204
    iget-object v2, v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->this$0:Lcom/tantanapp/common/data/orm/DatabaseStore;

    .line 205
    .line 206
    invoke-static {v2}, Lcom/tantanapp/common/data/orm/DatabaseStore;->access$000(Lcom/tantanapp/common/data/orm/DatabaseStore;)Lcom/tantanapp/common/data/orm/DatabaseStore$Transaction;

    .line 207
    .line 208
    .line 209
    move-result-object v2

    .line 210
    invoke-virtual {v2, v0, v9, v1}, Lcom/tantanapp/common/data/orm/DatabaseStore$Transaction;->update(Lcom/tantanapp/common/data/orm/DatabaseStore$Table;Lcom/tantanapp/common/data/DbObject;Lcom/tantanapp/common/data/DbObject;)V

    .line 211
    .line 212
    .line 213
    :cond_7
    return-object v1

    .line 214
    :cond_8
    if-eqz v2, :cond_9

    .line 215
    .line 216
    invoke-interface {v2, v1, v10}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 217
    .line 218
    .line 219
    :cond_9
    new-instance v2, Landroid/content/ContentValues;

    .line 220
    .line 221
    invoke-direct {v2}, Landroid/content/ContentValues;-><init>()V

    .line 222
    .line 223
    .line 224
    iget-object v3, v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->adapter:Lcom/tantanapp/common/data/orm/SqlDatabaseAdapter;

    .line 225
    .line 226
    invoke-virtual {v3, v1, v2}, Lcom/tantanapp/common/data/orm/SqlDatabaseAdapter;->write(Ljava/lang/Object;Landroid/content/ContentValues;)V

    .line 227
    .line 228
    .line 229
    iget-object v3, v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->this$0:Lcom/tantanapp/common/data/orm/DatabaseStore;

    .line 230
    .line 231
    invoke-virtual {v3}, Lcom/tantanapp/common/data/orm/DatabaseStore;->db()Lio/requery/android/database/sqlite/SQLiteDatabase;

    .line 232
    .line 233
    .line 234
    move-result-object v3

    .line 235
    iget-object v4, v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->tableName:Ljava/lang/String;

    .line 236
    .line 237
    invoke-virtual {v3, v4, v10, v2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    .line 238
    .line 239
    .line 240
    move-result-wide v2

    .line 241
    iput-wide v2, v1, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 242
    .line 243
    iget-object v4, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 244
    .line 245
    invoke-direct {v0, v4, v2, v3}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->traceMeLog(Ljava/lang/String;J)V

    .line 246
    .line 247
    .line 248
    sget-boolean v2, Ll/kmk0;->b:Z

    .line 249
    .line 250
    if-eqz v2, :cond_a

    .line 251
    .line 252
    new-instance v2, Ljava/lang/StringBuilder;

    .line 253
    .line 254
    const-string v3, "insert "

    .line 255
    .line 256
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 257
    .line 258
    .line 259
    iget-object v3, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 260
    .line 261
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 262
    .line 263
    .line 264
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 265
    .line 266
    .line 267
    move-result-object v2

    .line 268
    invoke-virtual {v0, v6, v7, v2}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->log(JLjava/lang/String;)V

    .line 269
    .line 270
    .line 271
    :cond_a
    iget-object v2, v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->this$0:Lcom/tantanapp/common/data/orm/DatabaseStore;

    .line 272
    .line 273
    invoke-static {v2}, Lcom/tantanapp/common/data/orm/DatabaseStore;->access$000(Lcom/tantanapp/common/data/orm/DatabaseStore;)Lcom/tantanapp/common/data/orm/DatabaseStore$Transaction;

    .line 274
    .line 275
    .line 276
    move-result-object v2

    .line 277
    invoke-virtual {v2, v0, v1}, Lcom/tantanapp/common/data/orm/DatabaseStore$Transaction;->insert(Lcom/tantanapp/common/data/orm/DatabaseStore$Table;Lcom/tantanapp/common/data/DbObject;)V

    .line 278
    .line 279
    .line 280
    invoke-direct/range {p0 .. p1}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->cacheQueryJoinData(Lcom/tantanapp/common/data/DbObject;)V

    .line 281
    .line 282
    .line 283
    return-object v1

    .line 284
    :goto_3
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    .line 285
    .line 286
    .line 287
    throw v0
.end method

.method public upsert(Lcom/tantanapp/common/data/DbObject;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    const/4 v0, 0x0

    .line 288
    invoke-virtual {p0, p1, v0}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->upsert(Lcom/tantanapp/common/data/DbObject;Ll/z20;)Lcom/tantanapp/common/data/DbObject;

    return-void
.end method

.method public warmUp(II)V
    .locals 1

    .line 1
    new-instance v0, Ll/k7c;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/k7c;-><init>(Lcom/tantanapp/common/data/orm/DatabaseStore$Table;I)V

    .line 4
    .line 5
    .line 6
    int-to-long p0, p2

    .line 7
    invoke-static {v0, p0, p1}, Lcom/tantanapp/common/utils/ThreadUtil;->h(Ljava/lang/Runnable;J)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
