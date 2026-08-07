.class public Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tantanapp/common/data/orm/DatabaseStore$Table;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "UiQuery"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;
    }
.end annotation


# instance fields
.field private bs:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Lcom/tantanapp/common/data/orm/DatabaseStore$Table<",
            "TT;>.UiQuery.UiQueryResult;>;"
        }
    .end annotation
.end field

.field private changed:Z

.field public groups:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field final query:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/DatabaseStore$Table<",
            "TT;>.Query;"
        }
    .end annotation
.end field

.field public status:Ljava/util/concurrent/atomic/AtomicInteger;

.field private tempItems:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/DatabaseStore$Table<",
            "TT;>.UiQuery.UiQueryResult;"
        }
    .end annotation
.end field

.field final synthetic this$1:Lcom/tantanapp/common/data/orm/DatabaseStore$Table;


# direct methods
.method public constructor <init>(Lcom/tantanapp/common/data/orm/DatabaseStore$Table;Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/tantanapp/common/data/orm/DatabaseStore$Table<",
            "TT;>.Query;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->this$1:Lcom/tantanapp/common/data/orm/DatabaseStore$Table;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    iput-object v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->tempItems:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput-boolean v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->changed:Z

    .line 11
    .line 12
    new-instance v1, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 13
    .line 14
    invoke-direct {v1, v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    .line 15
    .line 16
    .line 17
    iput-object v1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->status:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 18
    .line 19
    iput-object p2, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->query:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;

    .line 20
    .line 21
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iput-object v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->bs:Lrx/subjects/a;

    .line 26
    .line 27
    iget-object v0, p2, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;->orderBy:Lcom/tantanapp/common/data/orm/Order;

    .line 28
    .line 29
    instance-of v0, v0, Lcom/tantanapp/common/data/orm/DoubleOrder;

    .line 30
    .line 31
    if-eqz v0, :cond_0

    .line 32
    .line 33
    iget-object p1, p1, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->this$0:Lcom/tantanapp/common/data/orm/DatabaseStore;

    .line 34
    .line 35
    invoke-virtual {p1}, Lcom/tantanapp/common/data/orm/DatabaseStore;->ensureMainThreadDeferredTransactionStarted()V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p2}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;->gruops()Ljava/util/Map;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    iput-object p1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->groups:Ljava/util/Map;

    .line 43
    .line 44
    :cond_0
    return-void
.end method

.method public static synthetic a(Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;Ll/bkj0;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->status:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p1, Ll/bkj0;->b:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast v0, Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    check-cast v1, Lcom/tantanapp/common/data/DbObject;

    .line 26
    .line 27
    iget-object v2, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->this$1:Lcom/tantanapp/common/data/orm/DatabaseStore$Table;

    .line 28
    .line 29
    iget-object v3, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {v2, v3, v1}, Lcom/tantanapp/common/data/orm/LruCache2;->cache(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    iget-object v0, p1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 36
    .line 37
    check-cast v0, Ljava/util/List;

    .line 38
    .line 39
    invoke-direct {p0, v0}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->tryCacheOuterJoin(Ljava/util/List;)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->bs:Lrx/subjects/a;

    .line 43
    .line 44
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    if-nez v0, :cond_2

    .line 49
    .line 50
    new-instance v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;

    .line 51
    .line 52
    invoke-direct {v0, p0}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;-><init>(Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;)V

    .line 53
    .line 54
    .line 55
    iget-object v1, p1, Ll/bkj0;->b:Ljava/lang/Object;

    .line 56
    .line 57
    check-cast v1, Ljava/util/List;

    .line 58
    .line 59
    iput-object v1, v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->base:Ljava/util/List;

    .line 60
    .line 61
    iget-object p1, p1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 62
    .line 63
    check-cast p1, Ljava/lang/Integer;

    .line 64
    .line 65
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    iput p1, v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->size:I

    .line 70
    .line 71
    iget-object p1, v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->base:Ljava/util/List;

    .line 72
    .line 73
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 74
    .line 75
    .line 76
    move-result p1

    .line 77
    iget v1, v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->size:I

    .line 78
    .line 79
    if-ne p1, v1, :cond_1

    .line 80
    .line 81
    const/4 p1, 0x1

    .line 82
    goto :goto_1

    .line 83
    :cond_1
    const/4 p1, 0x0

    .line 84
    :goto_1
    iput-boolean p1, v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->full:Z

    .line 85
    .line 86
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->bs:Lrx/subjects/a;

    .line 87
    .line 88
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 89
    .line 90
    .line 91
    :cond_2
    return-void
.end method

.method public static synthetic access$400(Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->tryCacheOuterJoin(Ljava/util/List;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$500(Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;Ljava/util/List;)Ll/pf60;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->queryJoinData(Ljava/util/List;)Ll/pf60;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic access$700(Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;)Lrx/subjects/a;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->bs:Lrx/subjects/a;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic b(Lcom/tantanapp/common/data/orm/JoinFilter;Lcom/tantanapp/common/data/DbObject;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/tantanapp/common/data/orm/JoinFilter;->foreignC()Lcom/tantanapp/common/data/orm/StringColumn;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Lcom/tantanapp/common/data/orm/Column;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Ljava/lang/String;

    .line 10
    .line 11
    return-object p0
.end method

.method public static synthetic c(Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;)Ll/bkj0;
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->query:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;

    .line 2
    .line 3
    iget v1, v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;->initPageSize:I

    .line 4
    .line 5
    if-lez v1, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget v1, v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;->pageSize:I

    .line 9
    .line 10
    :goto_0
    if-lez v1, :cond_1

    .line 11
    .line 12
    const/4 v0, 0x1

    .line 13
    goto :goto_1

    .line 14
    :cond_1
    const/4 v0, 0x0

    .line 15
    :goto_1
    invoke-static {v0}, Ll/u11;->h(Z)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->this$1:Lcom/tantanapp/common/data/orm/DatabaseStore$Table;

    .line 19
    .line 20
    iget-object v2, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->query:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;

    .line 21
    .line 22
    iget-object v3, v2, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;->where:Lcom/tantanapp/common/data/orm/Filter;

    .line 23
    .line 24
    iget-object v2, v2, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;->orderBy:Lcom/tantanapp/common/data/orm/Order;

    .line 25
    .line 26
    invoke-virtual {v0, v3, v2, v1}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->query(Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/Order;I)Ljava/util/List;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    if-ge v2, v1, :cond_2

    .line 35
    .line 36
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    goto :goto_2

    .line 41
    :cond_2
    iget-object v1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->query:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;

    .line 42
    .line 43
    invoke-virtual {v1}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;->count()I

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    :goto_2
    if-nez v1, :cond_3

    .line 48
    .line 49
    new-instance p0, Ljava/util/ArrayList;

    .line 50
    .line 51
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 52
    .line 53
    .line 54
    goto :goto_3

    .line 55
    :cond_3
    new-instance v2, Ljava/util/ArrayList;

    .line 56
    .line 57
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 58
    .line 59
    .line 60
    iget-object v3, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->this$1:Lcom/tantanapp/common/data/orm/DatabaseStore$Table;

    .line 61
    .line 62
    iget-object v3, v3, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->outerJoin:Ll/pf60;

    .line 63
    .line 64
    if-eqz v3, :cond_4

    .line 65
    .line 66
    iget-object v4, v3, Ll/pf60;->a:Ljava/lang/Object;

    .line 67
    .line 68
    check-cast v4, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;

    .line 69
    .line 70
    iget-object v3, v3, Ll/pf60;->b:Ljava/lang/Object;

    .line 71
    .line 72
    check-cast v3, Ll/bkj0;

    .line 73
    .line 74
    iget-object v3, v3, Ll/bkj0;->a:Ljava/lang/Object;

    .line 75
    .line 76
    check-cast v3, Ll/qcj;

    .line 77
    .line 78
    invoke-interface {v3, v0}, Ll/qcj;->call(Ljava/lang/Object;)Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object v3

    .line 82
    check-cast v3, Lcom/tantanapp/common/data/orm/Filter;

    .line 83
    .line 84
    iget-object v5, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->this$1:Lcom/tantanapp/common/data/orm/DatabaseStore$Table;

    .line 85
    .line 86
    iget-object v5, v5, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->outerJoin:Ll/pf60;

    .line 87
    .line 88
    iget-object v5, v5, Ll/pf60;->b:Ljava/lang/Object;

    .line 89
    .line 90
    check-cast v5, Ll/bkj0;

    .line 91
    .line 92
    iget-object v5, v5, Ll/bkj0;->b:Ljava/lang/Object;

    .line 93
    .line 94
    check-cast v5, Ll/pcj;

    .line 95
    .line 96
    invoke-interface {v5}, Ll/pcj;->call()Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    move-result-object v5

    .line 100
    check-cast v5, Lcom/tantanapp/common/data/orm/Order;

    .line 101
    .line 102
    iget-object v6, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->this$1:Lcom/tantanapp/common/data/orm/DatabaseStore$Table;

    .line 103
    .line 104
    iget-object v6, v6, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->outerJoin:Ll/pf60;

    .line 105
    .line 106
    iget-object v6, v6, Ll/pf60;->b:Ljava/lang/Object;

    .line 107
    .line 108
    check-cast v6, Ll/bkj0;

    .line 109
    .line 110
    iget-object v6, v6, Ll/bkj0;->c:Ljava/lang/Object;

    .line 111
    .line 112
    check-cast v6, Ljava/lang/Integer;

    .line 113
    .line 114
    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    .line 115
    .line 116
    .line 117
    move-result v6

    .line 118
    invoke-virtual {v4, v3, v5, v6}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->query(Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/Order;I)Ljava/util/List;

    .line 119
    .line 120
    .line 121
    move-result-object v3

    .line 122
    iget-object v4, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->this$1:Lcom/tantanapp/common/data/orm/DatabaseStore$Table;

    .line 123
    .line 124
    iget-object v4, v4, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->outerJoin:Ll/pf60;

    .line 125
    .line 126
    iget-object v4, v4, Ll/pf60;->a:Ljava/lang/Object;

    .line 127
    .line 128
    check-cast v4, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;

    .line 129
    .line 130
    invoke-static {v4, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 131
    .line 132
    .line 133
    move-result-object v3

    .line 134
    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 135
    .line 136
    .line 137
    :cond_4
    invoke-direct {p0, v0}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->queryJoinData(Ljava/util/List;)Ll/pf60;

    .line 138
    .line 139
    .line 140
    move-result-object p0

    .line 141
    if-eqz p0, :cond_5

    .line 142
    .line 143
    invoke-interface {v2, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 144
    .line 145
    .line 146
    :cond_5
    move-object p0, v2

    .line 147
    :goto_3
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 148
    .line 149
    .line 150
    move-result-object v1

    .line 151
    invoke-static {v1, v0, p0}, Ll/bkj0;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ll/bkj0;

    .line 152
    .line 153
    .line 154
    move-result-object p0

    .line 155
    return-object p0
.end method

.method public static synthetic d(Lcom/tantanapp/common/data/orm/JoinFilter;Lcom/tantanapp/common/data/DbObject;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/tantanapp/common/data/orm/JoinFilter;->foreignC()Lcom/tantanapp/common/data/orm/StringColumn;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Lcom/tantanapp/common/data/orm/Column;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    xor-int/lit8 p0, p0, 0x1

    .line 16
    .line 17
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method private filter(Lcom/tantanapp/common/data/DbObject;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->query:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;->where:Lcom/tantanapp/common/data/orm/Filter;

    .line 4
    .line 5
    instance-of v0, p0, Lcom/tantanapp/common/data/orm/JoinFilter;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_2

    .line 9
    .line 10
    check-cast p0, Lcom/tantanapp/common/data/orm/JoinFilter;

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/tantanapp/common/data/orm/JoinFilter;->foreignC()Lcom/tantanapp/common/data/orm/StringColumn;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0, p1}, Lcom/tantanapp/common/data/orm/Column;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    if-eqz v2, :cond_0

    .line 27
    .line 28
    return v1

    .line 29
    :cond_0
    invoke-virtual {p0}, Lcom/tantanapp/common/data/orm/JoinFilter;->joinTable()Lcom/tantanapp/common/data/orm/DatabaseStore$Table;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-virtual {v2, v0}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->queryCache(Ljava/lang/String;)Lcom/tantanapp/common/data/DbObject;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    if-nez v0, :cond_1

    .line 38
    .line 39
    return v1

    .line 40
    :cond_1
    invoke-virtual {p0, p1, v0}, Lcom/tantanapp/common/data/orm/JoinFilter;->filter(Ljava/lang/Object;Lcom/tantanapp/common/data/DbObject;)Z

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    return p0

    .line 45
    :cond_2
    if-eqz p0, :cond_4

    .line 46
    .line 47
    invoke-virtual {p0, p1}, Lcom/tantanapp/common/data/orm/Filter;->filter(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    if-eqz p0, :cond_3

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_3
    return v1

    .line 55
    :cond_4
    :goto_0
    const/4 p0, 0x1

    .line 56
    return p0
.end method

.method private queryJoinData(Ljava/util/List;)Ll/pf60;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "TT;>;)",
            "Ll/pf60<",
            "Lcom/tantanapp/common/data/orm/DatabaseStore$Table;",
            "Ljava/util/List;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->query:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;->where:Lcom/tantanapp/common/data/orm/Filter;

    .line 4
    .line 5
    instance-of v1, v0, Lcom/tantanapp/common/data/orm/JoinFilter;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-eqz v1, :cond_1

    .line 9
    .line 10
    check-cast v0, Lcom/tantanapp/common/data/orm/JoinFilter;

    .line 11
    .line 12
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->this$1:Lcom/tantanapp/common/data/orm/DatabaseStore$Table;

    .line 13
    .line 14
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->outerJoin:Ll/pf60;

    .line 15
    .line 16
    if-eqz p0, :cond_0

    .line 17
    .line 18
    iget-object p0, p0, Ll/pf60;->a:Ljava/lang/Object;

    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/tantanapp/common/data/orm/JoinFilter;->joinTable()Lcom/tantanapp/common/data/orm/DatabaseStore$Table;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    if-eq p0, v1, :cond_1

    .line 25
    .line 26
    :cond_0
    new-instance p0, Ll/x7c;

    .line 27
    .line 28
    invoke-direct {p0, v0}, Ll/x7c;-><init>(Lcom/tantanapp/common/data/orm/JoinFilter;)V

    .line 29
    .line 30
    .line 31
    invoke-static {p1, p0}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    new-instance p1, Ll/y7c;

    .line 36
    .line 37
    invoke-direct {p1, v0}, Ll/y7c;-><init>(Lcom/tantanapp/common/data/orm/JoinFilter;)V

    .line 38
    .line 39
    .line 40
    invoke-static {p0, p1}, Ll/jyb;->T(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    new-instance p1, Ljava/lang/StringBuilder;

    .line 45
    .line 46
    const-string v1, "cache join ids -> ids= "

    .line 47
    .line 48
    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    const-string v1, ","

    .line 52
    .line 53
    invoke-static {v1, p0}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    invoke-static {p1}, Lcom/tantanapp/common/data/orm/DatabaseStore;->d(Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {v0}, Lcom/tantanapp/common/data/orm/JoinFilter;->joinTable()Lcom/tantanapp/common/data/orm/DatabaseStore$Table;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    sget-object v1, Lcom/tantanapp/common/data/DbObject;->ID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 72
    .line 73
    invoke-virtual {v1, p0}, Lcom/tantanapp/common/data/orm/StringColumn;->IN(Ljava/util/List;)Lcom/tantanapp/common/data/orm/Filter;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    const/4 v1, -0x1

    .line 78
    invoke-virtual {p1, p0, v2, v1}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->query(Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/Order;I)Ljava/util/List;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    new-instance p1, Ljava/lang/StringBuilder;

    .line 83
    .line 84
    const-string v1, "cache join data size -> size "

    .line 85
    .line 86
    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 90
    .line 91
    .line 92
    move-result v1

    .line 93
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    invoke-static {p1}, Lcom/tantanapp/common/data/orm/DatabaseStore;->d(Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    invoke-virtual {v0}, Lcom/tantanapp/common/data/orm/JoinFilter;->joinTable()Lcom/tantanapp/common/data/orm/DatabaseStore$Table;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    invoke-static {p1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    return-object p0

    .line 112
    :cond_1
    return-object v2
.end method

.method private tryCacheOuterJoin(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/pf60<",
            "Lcom/tantanapp/common/data/orm/DatabaseStore$Table;",
            "Ljava/util/List;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-lez p0, :cond_3

    .line 6
    .line 7
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_3

    .line 16
    .line 17
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    check-cast p1, Ll/pf60;

    .line 22
    .line 23
    iget-object v0, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 24
    .line 25
    check-cast v0, Ljava/util/List;

    .line 26
    .line 27
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-eqz v1, :cond_0

    .line 36
    .line 37
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    check-cast v1, Lcom/tantanapp/common/data/DbObject;

    .line 42
    .line 43
    if-eqz v1, :cond_1

    .line 44
    .line 45
    iget-object v2, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 46
    .line 47
    if-nez v2, :cond_2

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_2
    iget-object v3, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 51
    .line 52
    check-cast v3, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;

    .line 53
    .line 54
    invoke-virtual {v3, v2, v1}, Lcom/tantanapp/common/data/orm/LruCache2;->cache(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_3
    return-void
.end method


# virtual methods
.method public debug_result()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->bs:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/util/List;

    .line 8
    .line 9
    return-object p0
.end method

.method public itemsRead()Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/tantanapp/common/data/orm/DatabaseStore$Table<",
            "TT;>.UiQuery.UiQueryResult;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->tempItems:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->bs:Lrx/subjects/a;

    .line 6
    .line 7
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    return-object v0
.end method

.method public itemsWrite()Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/tantanapp/common/data/orm/DatabaseStore$Table<",
            "TT;>.UiQuery.UiQueryResult;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->tempItems:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->bs:Lrx/subjects/a;

    .line 6
    .line 7
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    new-instance v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;

    .line 14
    .line 15
    iget-object v1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->bs:Lrx/subjects/a;

    .line 16
    .line 17
    invoke-virtual {v1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    check-cast v1, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;

    .line 22
    .line 23
    invoke-direct {v0, p0, v1}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;-><init>(Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;)V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->tempItems:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;

    .line 27
    .line 28
    sget-boolean v0, Lcom/tantanapp/common/data/orm/DatabaseStore;->DETAILED_LOGGING:Z

    .line 29
    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    new-instance v0, Ljava/lang/StringBuilder;

    .line 33
    .line 34
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 35
    .line 36
    .line 37
    iget-object v1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->query:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;

    .line 38
    .line 39
    invoke-static {v1}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;->access$300(Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    const-string v1, " temp items created for write"

    .line 47
    .line 48
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-static {v0}, Lcom/tantanapp/common/data/orm/DatabaseStore;->d(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    :cond_0
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->tempItems:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;

    .line 59
    .line 60
    return-object p0
.end method

.method public syncCacheDelete(Lcom/tantanapp/common/data/DbObject;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->itemsRead()Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-boolean v1, Lcom/tantanapp/common/data/orm/DatabaseStore;->DETAILED_LOGGING:Z

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    new-instance v2, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 12
    .line 13
    .line 14
    iget-object v3, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->query:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;

    .line 15
    .line 16
    invoke-static {v3}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;->access$300(Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v3, " sync cache delete"

    .line 24
    .line 25
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    invoke-static {v2}, Lcom/tantanapp/common/data/orm/DatabaseStore;->d(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    :cond_0
    if-eqz v0, :cond_a

    .line 36
    .line 37
    invoke-direct {p0, p1}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->filter(Lcom/tantanapp/common/data/DbObject;)Z

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    if-eqz v2, :cond_a

    .line 42
    .line 43
    if-eqz v1, :cond_1

    .line 44
    .line 45
    const-string v2, "sync cache delete inside"

    .line 46
    .line 47
    invoke-virtual {v0, v2}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->dd(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    :cond_1
    iget-object v2, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->groups:Ljava/util/Map;

    .line 51
    .line 52
    const/4 v3, 0x1

    .line 53
    if-eqz v2, :cond_6

    .line 54
    .line 55
    iget-object v2, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->query:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;

    .line 56
    .line 57
    iget-object v2, v2, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;->orderBy:Lcom/tantanapp/common/data/orm/Order;

    .line 58
    .line 59
    check-cast v2, Lcom/tantanapp/common/data/orm/DoubleOrder;

    .line 60
    .line 61
    invoke-virtual {v2}, Lcom/tantanapp/common/data/orm/DoubleOrder;->getFirst()Lcom/tantanapp/common/data/orm/Order;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    invoke-virtual {v2}, Lcom/tantanapp/common/data/orm/Order;->column()Lcom/tantanapp/common/data/orm/Column;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    invoke-virtual {v2, p1}, Lcom/tantanapp/common/data/orm/Column;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v2

    .line 77
    iget-object v4, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->groups:Ljava/util/Map;

    .line 78
    .line 79
    invoke-interface {v4, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    move-result-object v4

    .line 83
    check-cast v4, Ljava/lang/Integer;

    .line 84
    .line 85
    if-eqz v4, :cond_4

    .line 86
    .line 87
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    .line 88
    .line 89
    .line 90
    move-result v5

    .line 91
    if-nez v5, :cond_2

    .line 92
    .line 93
    goto :goto_0

    .line 94
    :cond_2
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    .line 95
    .line 96
    .line 97
    move-result v5

    .line 98
    iget-object v6, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->groups:Ljava/util/Map;

    .line 99
    .line 100
    if-ne v5, v3, :cond_3

    .line 101
    .line 102
    invoke-interface {v6, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 103
    .line 104
    .line 105
    goto :goto_1

    .line 106
    :cond_3
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    .line 107
    .line 108
    .line 109
    move-result v4

    .line 110
    sub-int/2addr v4, v3

    .line 111
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 112
    .line 113
    .line 114
    move-result-object v4

    .line 115
    invoke-interface {v6, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    goto :goto_1

    .line 119
    :cond_4
    :goto_0
    sget-boolean v2, Ll/kmk0;->b:Z

    .line 120
    .line 121
    if-nez v2, :cond_5

    .line 122
    .line 123
    goto :goto_1

    .line 124
    :cond_5
    const-string p0, "there should be a value"

    .line 125
    .line 126
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 127
    .line 128
    .line 129
    return-void

    .line 130
    :cond_6
    :goto_1
    iput-boolean v3, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->changed:Z

    .line 131
    .line 132
    iget-object v2, v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->base:Ljava/util/List;

    .line 133
    .line 134
    if-eqz v2, :cond_8

    .line 135
    .line 136
    iget-object v4, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->this$1:Lcom/tantanapp/common/data/orm/DatabaseStore$Table;

    .line 137
    .line 138
    iget-object v5, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->query:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;

    .line 139
    .line 140
    iget-object v5, v5, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;->orderBy:Lcom/tantanapp/common/data/orm/Order;

    .line 141
    .line 142
    invoke-static {v4, v2, p1, v5}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->access$200(Lcom/tantanapp/common/data/orm/DatabaseStore$Table;Ljava/util/List;Lcom/tantanapp/common/data/DbObject;Lcom/tantanapp/common/data/orm/Order;)I

    .line 143
    .line 144
    .line 145
    move-result p1

    .line 146
    if-ltz p1, :cond_7

    .line 147
    .line 148
    invoke-virtual {p0}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->itemsWrite()Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    iget-object v2, v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->base:Ljava/util/List;

    .line 153
    .line 154
    invoke-interface {v2, p1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 155
    .line 156
    .line 157
    iget-object p1, v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->base:Ljava/util/List;

    .line 158
    .line 159
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 160
    .line 161
    .line 162
    move-result p1

    .line 163
    if-eqz p1, :cond_7

    .line 164
    .line 165
    iget-boolean p1, v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->full:Z

    .line 166
    .line 167
    if-nez p1, :cond_7

    .line 168
    .line 169
    iput-boolean v3, v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->full:Z

    .line 170
    .line 171
    :cond_7
    if-eqz v1, :cond_8

    .line 172
    .line 173
    const-string p1, "item removed"

    .line 174
    .line 175
    invoke-virtual {v0, p1}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->dd(Ljava/lang/String;)V

    .line 176
    .line 177
    .line 178
    :cond_8
    iget p1, v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->size:I

    .line 179
    .line 180
    if-ltz p1, :cond_a

    .line 181
    .line 182
    invoke-virtual {p0}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->itemsWrite()Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;

    .line 183
    .line 184
    .line 185
    move-result-object p0

    .line 186
    iget p1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->size:I

    .line 187
    .line 188
    sub-int/2addr p1, v3

    .line 189
    iput p1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->size:I

    .line 190
    .line 191
    const/4 v0, -0x1

    .line 192
    if-ne p1, v0, :cond_9

    .line 193
    .line 194
    const/4 p1, 0x0

    .line 195
    iput-boolean p1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->full:Z

    .line 196
    .line 197
    :cond_9
    if-eqz v1, :cond_a

    .line 198
    .line 199
    const-string p1, "size changed"

    .line 200
    .line 201
    invoke-virtual {p0, p1}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->dd(Ljava/lang/String;)V

    .line 202
    .line 203
    .line 204
    :cond_a
    return-void
.end method

.method public syncCacheInsert(Lcom/tantanapp/common/data/DbObject;)Z
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->itemsRead()Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-boolean v1, Lcom/tantanapp/common/data/orm/DatabaseStore;->DETAILED_LOGGING:Z

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    new-instance v2, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 12
    .line 13
    .line 14
    iget-object v3, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->query:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;

    .line 15
    .line 16
    invoke-static {v3}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;->access$300(Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v3, " sync cache insert"

    .line 24
    .line 25
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    invoke-static {v2}, Lcom/tantanapp/common/data/orm/DatabaseStore;->d(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    :cond_0
    const/4 v2, 0x0

    .line 36
    if-eqz v0, :cond_17

    .line 37
    .line 38
    invoke-direct {p0, p1}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->filter(Lcom/tantanapp/common/data/DbObject;)Z

    .line 39
    .line 40
    .line 41
    move-result v3

    .line 42
    if-eqz v3, :cond_17

    .line 43
    .line 44
    iget-object v3, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->groups:Ljava/util/Map;

    .line 45
    .line 46
    const/4 v4, 0x1

    .line 47
    if-eqz v3, :cond_2

    .line 48
    .line 49
    iget-object v3, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->query:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;

    .line 50
    .line 51
    iget-object v3, v3, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;->orderBy:Lcom/tantanapp/common/data/orm/Order;

    .line 52
    .line 53
    check-cast v3, Lcom/tantanapp/common/data/orm/DoubleOrder;

    .line 54
    .line 55
    invoke-virtual {v3}, Lcom/tantanapp/common/data/orm/DoubleOrder;->getFirst()Lcom/tantanapp/common/data/orm/Order;

    .line 56
    .line 57
    .line 58
    move-result-object v3

    .line 59
    invoke-virtual {v3}, Lcom/tantanapp/common/data/orm/Order;->column()Lcom/tantanapp/common/data/orm/Column;

    .line 60
    .line 61
    .line 62
    move-result-object v3

    .line 63
    invoke-virtual {v3, p1}, Lcom/tantanapp/common/data/orm/Column;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v3

    .line 67
    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v3

    .line 71
    iget-object v5, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->groups:Ljava/util/Map;

    .line 72
    .line 73
    invoke-interface {v5, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object v5

    .line 77
    check-cast v5, Ljava/lang/Integer;

    .line 78
    .line 79
    iget-object v6, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->groups:Ljava/util/Map;

    .line 80
    .line 81
    if-nez v5, :cond_1

    .line 82
    .line 83
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 84
    .line 85
    .line 86
    move-result-object v5

    .line 87
    invoke-interface {v6, v3, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    goto :goto_0

    .line 91
    :cond_1
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    .line 92
    .line 93
    .line 94
    move-result v5

    .line 95
    add-int/2addr v5, v4

    .line 96
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 97
    .line 98
    .line 99
    move-result-object v5

    .line 100
    invoke-interface {v6, v3, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    :cond_2
    :goto_0
    iput-boolean v4, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->changed:Z

    .line 104
    .line 105
    iget-object v3, v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->base:Ljava/util/List;

    .line 106
    .line 107
    if-nez v3, :cond_4

    .line 108
    .line 109
    iget v5, v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->size:I

    .line 110
    .line 111
    if-gtz v5, :cond_4

    .line 112
    .line 113
    iget-boolean v5, v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->full:Z

    .line 114
    .line 115
    if-nez v5, :cond_4

    .line 116
    .line 117
    if-eqz v1, :cond_3

    .line 118
    .line 119
    const-string p0, "sync cache insert nothing"

    .line 120
    .line 121
    invoke-virtual {v0, p0}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->dd(Ljava/lang/String;)V

    .line 122
    .line 123
    .line 124
    :cond_3
    return v2

    .line 125
    :cond_4
    const-string v5, "size updated"

    .line 126
    .line 127
    const-string v6, "\n\n"

    .line 128
    .line 129
    if-eqz v3, :cond_b

    .line 130
    .line 131
    iget-boolean v7, v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->full:Z

    .line 132
    .line 133
    if-nez v7, :cond_b

    .line 134
    .line 135
    if-eqz v1, :cond_5

    .line 136
    .line 137
    const-string v3, "sync cache insert partial"

    .line 138
    .line 139
    invoke-virtual {v0, v3}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->dd(Ljava/lang/String;)V

    .line 140
    .line 141
    .line 142
    :cond_5
    iget-object v3, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->this$1:Lcom/tantanapp/common/data/orm/DatabaseStore$Table;

    .line 143
    .line 144
    iget-object v7, v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->base:Ljava/util/List;

    .line 145
    .line 146
    iget-object v8, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->query:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;

    .line 147
    .line 148
    iget-object v8, v8, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;->orderBy:Lcom/tantanapp/common/data/orm/Order;

    .line 149
    .line 150
    invoke-static {v3, v7, p1, v8}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->access$200(Lcom/tantanapp/common/data/orm/DatabaseStore$Table;Ljava/util/List;Lcom/tantanapp/common/data/DbObject;Lcom/tantanapp/common/data/orm/Order;)I

    .line 151
    .line 152
    .line 153
    move-result v3

    .line 154
    if-gez v3, :cond_6

    .line 155
    .line 156
    neg-int v3, v3

    .line 157
    sub-int/2addr v3, v4

    .line 158
    goto :goto_1

    .line 159
    :cond_6
    sget-boolean v7, Ll/kmk0;->c:Z

    .line 160
    .line 161
    if-nez v7, :cond_a

    .line 162
    .line 163
    :goto_1
    iget v6, v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->size:I

    .line 164
    .line 165
    if-ltz v6, :cond_7

    .line 166
    .line 167
    invoke-virtual {p0}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->itemsWrite()Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;

    .line 168
    .line 169
    .line 170
    move-result-object v0

    .line 171
    iget v6, v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->size:I

    .line 172
    .line 173
    add-int/2addr v6, v4

    .line 174
    iput v6, v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->size:I

    .line 175
    .line 176
    if-eqz v1, :cond_7

    .line 177
    .line 178
    invoke-virtual {v0, v5}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->dd(Ljava/lang/String;)V

    .line 179
    .line 180
    .line 181
    :cond_7
    iget-object v0, v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->base:Ljava/util/List;

    .line 182
    .line 183
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 184
    .line 185
    .line 186
    move-result v0

    .line 187
    if-ge v3, v0, :cond_9

    .line 188
    .line 189
    invoke-virtual {p0}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->itemsWrite()Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;

    .line 190
    .line 191
    .line 192
    move-result-object p0

    .line 193
    iget-object v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->base:Ljava/util/List;

    .line 194
    .line 195
    invoke-interface {v0, v3, p1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 196
    .line 197
    .line 198
    if-eqz v1, :cond_8

    .line 199
    .line 200
    const-string p1, "item inserted"

    .line 201
    .line 202
    invoke-virtual {p0, p1}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->dd(Ljava/lang/String;)V

    .line 203
    .line 204
    .line 205
    :cond_8
    return v4

    .line 206
    :cond_9
    return v2

    .line 207
    :cond_a
    new-instance p0, Ljava/lang/StringBuilder;

    .line 208
    .line 209
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 210
    .line 211
    .line 212
    iget-object v0, v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->base:Ljava/util/List;

    .line 213
    .line 214
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 215
    .line 216
    .line 217
    move-result-object v0

    .line 218
    check-cast v0, Lcom/tantanapp/common/data/DbObject;

    .line 219
    .line 220
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ValueObject;->toJson()Ljava/lang/String;

    .line 221
    .line 222
    .line 223
    move-result-object v0

    .line 224
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 225
    .line 226
    .line 227
    invoke-virtual {p0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 228
    .line 229
    .line 230
    invoke-virtual {p1}, Lcom/tantanapp/common/data/ValueObject;->toJson()Ljava/lang/String;

    .line 231
    .line 232
    .line 233
    move-result-object p1

    .line 234
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 235
    .line 236
    .line 237
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 238
    .line 239
    .line 240
    move-result-object p0

    .line 241
    invoke-static {p0}, Lcom/tantanapp/common/data/orm/DatabaseStore;->d(Ljava/lang/String;)V

    .line 242
    .line 243
    .line 244
    invoke-static {}, Ll/wpg0;->a()V

    .line 245
    .line 246
    .line 247
    return v2

    .line 248
    :cond_b
    if-nez v3, :cond_e

    .line 249
    .line 250
    iget v7, v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->size:I

    .line 251
    .line 252
    if-ltz v7, :cond_e

    .line 253
    .line 254
    iget-boolean v7, v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->full:Z

    .line 255
    .line 256
    if-nez v7, :cond_e

    .line 257
    .line 258
    if-eqz v1, :cond_c

    .line 259
    .line 260
    const-string p1, "sync cache insert size"

    .line 261
    .line 262
    invoke-virtual {v0, p1}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->dd(Ljava/lang/String;)V

    .line 263
    .line 264
    .line 265
    :cond_c
    invoke-virtual {p0}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->itemsWrite()Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;

    .line 266
    .line 267
    .line 268
    move-result-object p0

    .line 269
    iget p1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->size:I

    .line 270
    .line 271
    add-int/2addr p1, v4

    .line 272
    iput p1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->size:I

    .line 273
    .line 274
    if-eqz v1, :cond_d

    .line 275
    .line 276
    invoke-virtual {p0, v5}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->dd(Ljava/lang/String;)V

    .line 277
    .line 278
    .line 279
    :cond_d
    return v2

    .line 280
    :cond_e
    if-eqz v3, :cond_15

    .line 281
    .line 282
    iget v3, v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->size:I

    .line 283
    .line 284
    if-ltz v3, :cond_15

    .line 285
    .line 286
    iget-boolean v3, v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->full:Z

    .line 287
    .line 288
    if-eqz v3, :cond_15

    .line 289
    .line 290
    if-eqz v1, :cond_f

    .line 291
    .line 292
    const-string v3, "sync cache insert full"

    .line 293
    .line 294
    invoke-virtual {v0, v3}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->dd(Ljava/lang/String;)V

    .line 295
    .line 296
    .line 297
    :cond_f
    iget-object v3, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->this$1:Lcom/tantanapp/common/data/orm/DatabaseStore$Table;

    .line 298
    .line 299
    iget-object v5, v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->base:Ljava/util/List;

    .line 300
    .line 301
    iget-object v7, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->query:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;

    .line 302
    .line 303
    iget-object v7, v7, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;->orderBy:Lcom/tantanapp/common/data/orm/Order;

    .line 304
    .line 305
    invoke-static {v3, v5, p1, v7}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->access$200(Lcom/tantanapp/common/data/orm/DatabaseStore$Table;Ljava/util/List;Lcom/tantanapp/common/data/DbObject;Lcom/tantanapp/common/data/orm/Order;)I

    .line 306
    .line 307
    .line 308
    move-result v3

    .line 309
    if-gez v3, :cond_10

    .line 310
    .line 311
    neg-int v0, v3

    .line 312
    add-int/lit8 v3, v0, -0x1

    .line 313
    .line 314
    goto :goto_2

    .line 315
    :cond_10
    sget-boolean v5, Ll/kmk0;->c:Z

    .line 316
    .line 317
    if-nez v5, :cond_14

    .line 318
    .line 319
    :goto_2
    invoke-virtual {p0}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->itemsWrite()Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;

    .line 320
    .line 321
    .line 322
    move-result-object v0

    .line 323
    iget-object v5, v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->base:Ljava/util/List;

    .line 324
    .line 325
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 326
    .line 327
    .line 328
    move-result v5

    .line 329
    if-ne v3, v5, :cond_11

    .line 330
    .line 331
    move v5, v4

    .line 332
    goto :goto_3

    .line 333
    :cond_11
    move v5, v2

    .line 334
    :goto_3
    iget v6, v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->size:I

    .line 335
    .line 336
    add-int/2addr v6, v4

    .line 337
    iput v6, v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->size:I

    .line 338
    .line 339
    if-eqz v5, :cond_12

    .line 340
    .line 341
    iget v5, v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->getTop:I

    .line 342
    .line 343
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->query:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;

    .line 344
    .line 345
    iget p0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;->pageSize:I

    .line 346
    .line 347
    mul-int/lit8 p0, p0, 0x2

    .line 348
    .line 349
    add-int/2addr v5, p0

    .line 350
    iget-object p0, v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->base:Ljava/util/List;

    .line 351
    .line 352
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 353
    .line 354
    .line 355
    move-result p0

    .line 356
    if-gt v5, p0, :cond_12

    .line 357
    .line 358
    iput-boolean v2, v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->full:Z

    .line 359
    .line 360
    goto :goto_4

    .line 361
    :cond_12
    iget-object p0, v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->base:Ljava/util/List;

    .line 362
    .line 363
    invoke-interface {p0, v3, p1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 364
    .line 365
    .line 366
    :goto_4
    if-eqz v1, :cond_13

    .line 367
    .line 368
    const-string p0, "sync cache insert full end"

    .line 369
    .line 370
    invoke-virtual {v0, p0}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->dd(Ljava/lang/String;)V

    .line 371
    .line 372
    .line 373
    :cond_13
    return v4

    .line 374
    :cond_14
    new-instance p0, Ljava/lang/StringBuilder;

    .line 375
    .line 376
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 377
    .line 378
    .line 379
    iget-object v0, v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->base:Ljava/util/List;

    .line 380
    .line 381
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 382
    .line 383
    .line 384
    move-result-object v0

    .line 385
    check-cast v0, Lcom/tantanapp/common/data/DbObject;

    .line 386
    .line 387
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ValueObject;->toJson()Ljava/lang/String;

    .line 388
    .line 389
    .line 390
    move-result-object v0

    .line 391
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 392
    .line 393
    .line 394
    invoke-virtual {p0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 395
    .line 396
    .line 397
    invoke-virtual {p1}, Lcom/tantanapp/common/data/ValueObject;->toJson()Ljava/lang/String;

    .line 398
    .line 399
    .line 400
    move-result-object p1

    .line 401
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 402
    .line 403
    .line 404
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 405
    .line 406
    .line 407
    move-result-object p0

    .line 408
    invoke-static {p0}, Lcom/tantanapp/common/data/orm/DatabaseStore;->d(Ljava/lang/String;)V

    .line 409
    .line 410
    .line 411
    invoke-static {}, Ll/wpg0;->a()V

    .line 412
    .line 413
    .line 414
    return v2

    .line 415
    :cond_15
    if-eqz v1, :cond_16

    .line 416
    .line 417
    const-string p0, "what??"

    .line 418
    .line 419
    invoke-virtual {v0, p0}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->dd(Ljava/lang/String;)V

    .line 420
    .line 421
    .line 422
    :cond_16
    invoke-static {}, Ll/wpg0;->a()V

    .line 423
    .line 424
    .line 425
    :cond_17
    return v2
.end method

.method public syncCacheUpdate(Lcom/tantanapp/common/data/DbObject;Lcom/tantanapp/common/data/DbObject;)Z
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TT;)Z"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->itemsRead()Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    iget-object v1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->query:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;

    .line 8
    .line 9
    iget-object v1, v1, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;->where:Lcom/tantanapp/common/data/orm/Filter;

    .line 10
    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    invoke-direct {p0, p1}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->filter(Lcom/tantanapp/common/data/DbObject;)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_2

    .line 18
    .line 19
    invoke-direct {p0, p2}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->filter(Lcom/tantanapp/common/data/DbObject;)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_2

    .line 24
    .line 25
    :cond_0
    iget-object v1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->query:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;

    .line 26
    .line 27
    iget-object v1, v1, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;->orderBy:Lcom/tantanapp/common/data/orm/Order;

    .line 28
    .line 29
    if-eqz v1, :cond_2

    .line 30
    .line 31
    invoke-interface {v1, p1, p2}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-nez v1, :cond_2

    .line 36
    .line 37
    const/4 v1, 0x1

    .line 38
    iput-boolean v1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->changed:Z

    .line 39
    .line 40
    iget-object v0, v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->base:Ljava/util/List;

    .line 41
    .line 42
    const/4 v2, 0x0

    .line 43
    if-eqz v0, :cond_1

    .line 44
    .line 45
    iget-object v3, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->this$1:Lcom/tantanapp/common/data/orm/DatabaseStore$Table;

    .line 46
    .line 47
    iget-object v4, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->query:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;

    .line 48
    .line 49
    iget-object v4, v4, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;->orderBy:Lcom/tantanapp/common/data/orm/Order;

    .line 50
    .line 51
    invoke-static {v3, v0, p1, v4}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->access$200(Lcom/tantanapp/common/data/orm/DatabaseStore$Table;Ljava/util/List;Lcom/tantanapp/common/data/DbObject;Lcom/tantanapp/common/data/orm/Order;)I

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    if-ltz p1, :cond_1

    .line 56
    .line 57
    invoke-virtual {p0}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->itemsWrite()Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->base:Ljava/util/List;

    .line 62
    .line 63
    invoke-interface {p0, p1, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    return v1

    .line 67
    :cond_1
    return v2

    .line 68
    :cond_2
    invoke-virtual {p0, p1}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->syncCacheDelete(Lcom/tantanapp/common/data/DbObject;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p0, p2}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->syncCacheInsert(Lcom/tantanapp/common/data/DbObject;)Z

    .line 72
    .line 73
    .line 74
    move-result p0

    .line 75
    return p0
.end method

.method public triggerIfChanged()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->changed:Z

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->itemsRead()Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->bs:Lrx/subjects/a;

    .line 12
    .line 13
    invoke-virtual {v1, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    sget-boolean v0, Lcom/tantanapp/common/data/orm/DatabaseStore;->DETAILED_LOGGING:Z

    .line 17
    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    new-instance v0, Ljava/lang/StringBuilder;

    .line 21
    .line 22
    const-string v1, "triggered query "

    .line 23
    .line 24
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    iget-object v1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->query:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;

    .line 28
    .line 29
    invoke-static {v1}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;->access$300(Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-static {v0}, Lcom/tantanapp/common/data/orm/DatabaseStore;->d(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    :cond_1
    const/4 v0, 0x0

    .line 44
    iput-object v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->tempItems:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;

    .line 45
    .line 46
    const/4 v0, 0x0

    .line 47
    iput-boolean v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->changed:Z

    .line 48
    .line 49
    :cond_2
    return-void
.end method

.method public tryInitiate(Z)V
    .locals 6

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    sget-boolean p1, Lcom/tantanapp/common/data/orm/DatabaseStore;->debug_delayTransaction10Seconds:Z

    .line 4
    .line 5
    if-nez p1, :cond_1

    .line 6
    .line 7
    iget-object p1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->status:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    const/4 v1, 0x1

    .line 11
    invoke-virtual {p1, v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->compareAndSet(II)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    iget-object p1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->this$1:Lcom/tantanapp/common/data/orm/DatabaseStore$Table;

    .line 18
    .line 19
    iget-object v0, p1, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->this$0:Lcom/tantanapp/common/data/orm/DatabaseStore;

    .line 20
    .line 21
    new-instance v2, Ll/v7c;

    .line 22
    .line 23
    invoke-direct {v2, p0}, Ll/v7c;-><init>(Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;)V

    .line 24
    .line 25
    .line 26
    new-instance v3, Ll/w7c;

    .line 27
    .line 28
    invoke-direct {v3, p0}, Ll/w7c;-><init>(Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;)V

    .line 29
    .line 30
    .line 31
    const/4 v4, 0x0

    .line 32
    const/4 v5, 0x1

    .line 33
    const/4 v1, 0x0

    .line 34
    invoke-virtual/range {v0 .. v5}, Lcom/tantanapp/common/data/orm/DatabaseStore;->asyncFetch(ZLl/pcj;Ll/y20;Ll/x20;Z)V

    .line 35
    .line 36
    .line 37
    :cond_0
    return-void

    .line 38
    :cond_1
    iget-object p1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->status:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 39
    .line 40
    const/4 v0, 0x2

    .line 41
    invoke-virtual {p1, v0}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 42
    .line 43
    .line 44
    iget-object p1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->bs:Lrx/subjects/a;

    .line 45
    .line 46
    new-instance v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;

    .line 47
    .line 48
    invoke-direct {v0, p0}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;-><init>(Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p1, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method
