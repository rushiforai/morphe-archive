.class public Ll/wzh0;
.super Lcom/tantanapp/common/data/orm/LruCache2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/wzh0$d;,
        Ll/wzh0$b;,
        Ll/wzh0$c;,
        Ll/wzh0$a;
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
.field public static l:Z


# instance fields
.field public final a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/tantanapp/common/data/orm/Index;",
            ">;"
        }
    .end annotation
.end field

.field public final b:Ll/vzf0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/vzf0<",
            "TT;>;"
        }
    .end annotation
.end field

.field public c:Ll/pf60;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/pf60<",
            "Ll/wzh0;",
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

.field public final d:Ljava/lang/String;

.field public e:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ll/h0i0;",
            ">;"
        }
    .end annotation
.end field

.field public f:Z

.field public g:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap<",
            "Ljava/lang/String;",
            "Ll/wzh0<",
            "TT;>.d;>;"
        }
    .end annotation
.end field

.field public h:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap<",
            "Ljava/lang/String;",
            "Ll/spq;",
            ">;"
        }
    .end annotation
.end field

.field public i:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap<",
            "Ljava/lang/String;",
            "Ll/spq;",
            ">;"
        }
    .end annotation
.end field

.field public j:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap<",
            "Ljava/lang/String;",
            "Ll/wzh0<",
            "TT;>.c;>;"
        }
    .end annotation
.end field

.field public k:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap<",
            "Ljava/lang/String;",
            "Ll/wzh0<",
            "TT;>.b;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ll/vzf0;Ljava/util/List;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ll/vzf0<",
            "TT;>;",
            "Ljava/util/List<",
            "Lcom/tantanapp/common/data/orm/Index;",
            ">;I)V"
        }
    .end annotation

    .line 85
    invoke-direct {p0, p4}, Lcom/tantanapp/common/data/orm/LruCache2;-><init>(I)V

    const/4 p4, 0x0

    .line 86
    iput-object p4, p0, Ll/wzh0;->c:Ll/pf60;

    .line 87
    iput-object p4, p0, Ll/wzh0;->e:Ljava/util/Map;

    const/4 p4, 0x1

    .line 88
    iput-boolean p4, p0, Ll/wzh0;->f:Z

    .line 89
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Ll/wzh0;->g:Ljava/util/concurrent/ConcurrentHashMap;

    .line 90
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Ll/wzh0;->h:Ljava/util/concurrent/ConcurrentHashMap;

    .line 91
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Ll/wzh0;->i:Ljava/util/concurrent/ConcurrentHashMap;

    .line 92
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Ll/wzh0;->j:Ljava/util/concurrent/ConcurrentHashMap;

    .line 93
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Ll/wzh0;->k:Ljava/util/concurrent/ConcurrentHashMap;

    .line 94
    iput-object p1, p0, Ll/wzh0;->d:Ljava/lang/String;

    .line 95
    iput-object p2, p0, Ll/wzh0;->b:Ll/vzf0;

    if-nez p3, :cond_0

    .line 96
    new-instance p3, Ljava/util/ArrayList;

    invoke-direct {p3}, Ljava/util/ArrayList;-><init>()V

    :cond_0
    iput-object p3, p0, Ll/wzh0;->a:Ljava/util/List;

    .line 97
    new-instance p0, Lcom/tantanapp/common/data/orm/Index;

    new-array p1, p4, [Lcom/tantanapp/common/data/orm/Column;

    sget-object p2, Lcom/tantanapp/common/data/DbObject;->ID:Lcom/tantanapp/common/data/orm/StringColumn;

    const/4 p4, 0x0

    aput-object p2, p1, p4

    invoke-direct {p0, p1}, Lcom/tantanapp/common/data/orm/Index;-><init>([Lcom/tantanapp/common/data/orm/Column;)V

    invoke-interface {p3, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public constructor <init>(Ll/h9c;Ljava/lang/String;Ll/vzf0;Ljava/util/List;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/h9c;",
            "Ljava/lang/String;",
            "Ll/vzf0<",
            "TT;>;",
            "Ljava/util/List<",
            "Lcom/tantanapp/common/data/orm/Index;",
            ">;I)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p5}, Lcom/tantanapp/common/data/orm/LruCache2;-><init>(I)V

    .line 2
    .line 3
    .line 4
    const/4 p5, 0x0

    .line 5
    iput-object p5, p0, Ll/wzh0;->c:Ll/pf60;

    .line 6
    .line 7
    iput-object p5, p0, Ll/wzh0;->e:Ljava/util/Map;

    .line 8
    .line 9
    const/4 p5, 0x1

    .line 10
    iput-boolean p5, p0, Ll/wzh0;->f:Z

    .line 11
    .line 12
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    .line 13
    .line 14
    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Ll/wzh0;->g:Ljava/util/concurrent/ConcurrentHashMap;

    .line 18
    .line 19
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    .line 20
    .line 21
    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Ll/wzh0;->h:Ljava/util/concurrent/ConcurrentHashMap;

    .line 25
    .line 26
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    .line 27
    .line 28
    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 29
    .line 30
    .line 31
    iput-object v0, p0, Ll/wzh0;->i:Ljava/util/concurrent/ConcurrentHashMap;

    .line 32
    .line 33
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    .line 34
    .line 35
    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 36
    .line 37
    .line 38
    iput-object v0, p0, Ll/wzh0;->j:Ljava/util/concurrent/ConcurrentHashMap;

    .line 39
    .line 40
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    .line 41
    .line 42
    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 43
    .line 44
    .line 45
    iput-object v0, p0, Ll/wzh0;->k:Ljava/util/concurrent/ConcurrentHashMap;

    .line 46
    .line 47
    iput-object p2, p0, Ll/wzh0;->d:Ljava/lang/String;

    .line 48
    .line 49
    iput-object p3, p0, Ll/wzh0;->b:Ll/vzf0;

    .line 50
    .line 51
    if-nez p4, :cond_0

    .line 52
    .line 53
    new-instance p4, Ljava/util/ArrayList;

    .line 54
    .line 55
    invoke-direct {p4}, Ljava/util/ArrayList;-><init>()V

    .line 56
    .line 57
    .line 58
    :cond_0
    iput-object p4, p0, Ll/wzh0;->a:Ljava/util/List;

    .line 59
    .line 60
    new-instance p2, Lcom/tantanapp/common/data/orm/Index;

    .line 61
    .line 62
    new-array p3, p5, [Lcom/tantanapp/common/data/orm/Column;

    .line 63
    .line 64
    sget-object p5, Lcom/tantanapp/common/data/DbObject;->ID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 65
    .line 66
    const/4 v0, 0x0

    .line 67
    aput-object p5, p3, v0

    .line 68
    .line 69
    invoke-direct {p2, p3}, Lcom/tantanapp/common/data/orm/Index;-><init>([Lcom/tantanapp/common/data/orm/Column;)V

    .line 70
    .line 71
    .line 72
    invoke-interface {p4, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    if-eqz p1, :cond_1

    .line 76
    .line 77
    invoke-virtual {p1}, Ll/h9c;->f()Ljava/util/ArrayList;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    :cond_1
    return-void
.end method

.method public static synthetic a(Ll/wzh0;Ljava/lang/String;Ll/wzh0$c;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/wzh0;->t(Ljava/lang/String;Ll/wzh0$c;Z)V

    return-void
.end method

.method public static synthetic b(Ll/wzh0;I)Ljava/util/List;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/wzh0;->w(I)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic c(Ll/wzh0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/wzh0;->u(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic d(Ll/wzh0;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/wzh0;->x(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic e(Ll/wzh0;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/wzh0;->y(I)V

    return-void
.end method

.method public static synthetic f(Ll/wzh0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/wzh0;->v(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic g(Ll/wzh0;Ljava/util/List;Lcom/tantanapp/common/data/DbObject;Lcom/tantanapp/common/data/orm/Order;)I
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/wzh0;->binarySearchUsingLocalId(Ljava/util/List;Lcom/tantanapp/common/data/DbObject;Lcom/tantanapp/common/data/orm/Order;)I

    move-result p0

    return p0
.end method

.method public static bridge synthetic h(Ll/wzh0;Ljava/util/List;Lcom/tantanapp/common/data/DbObject;Lcom/tantanapp/common/data/orm/Order;)I
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/wzh0;->k(Ljava/util/List;Lcom/tantanapp/common/data/DbObject;Lcom/tantanapp/common/data/orm/Order;)I

    move-result p0

    return p0
.end method

.method public static n(Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static q(Lio/requery/android/database/sqlite/SQLiteDatabase;Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "EXPLAIN QUERY PLAN "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p0, p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-interface {p0}, Landroid/database/Cursor;->moveToFirst()Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-eqz p1, :cond_1

    .line 24
    .line 25
    new-instance p1, Ljava/lang/StringBuilder;

    .line 26
    .line 27
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 28
    .line 29
    .line 30
    const/4 p2, 0x0

    .line 31
    :goto_0
    invoke-interface {p0}, Landroid/database/Cursor;->getColumnCount()I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-ge p2, v0, :cond_0

    .line 36
    .line 37
    invoke-interface {p0, p2}, Landroid/database/Cursor;->getColumnName(I)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    const-string v0, ":"

    .line 45
    .line 46
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-interface {p0, p2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    const-string v0, ", "

    .line 57
    .line 58
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    add-int/lit8 p2, p2, 0x1

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_0
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    const-string p1, "EXPLAIN: \n\t"

    .line 69
    .line 70
    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    return-object p0

    .line 75
    :cond_1
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    .line 76
    .line 77
    .line 78
    const-string p0, ""

    .line 79
    .line 80
    return-object p0
.end method

.method public static r(Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method


# virtual methods
.method public A()Lcom/p1/mobile/putong/dbcenter/db/opt/TransactionOpt;
    .locals 0

    .line 1
    invoke-static {}, Ll/l9c;->o()Ll/l9c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/l9c;->q()Lcom/p1/mobile/putong/dbcenter/db/opt/TransactionOpt;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final B(Lcom/tantanapp/common/data/DbObject;Lcom/tantanapp/common/data/DbObject;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TT;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/wzh0;->h:Ljava/util/concurrent/ConcurrentHashMap;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentHashMap;->isEmpty()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_2

    .line 10
    .line 11
    iget-object p0, p0, Ll/wzh0;->h:Ljava/util/concurrent/ConcurrentHashMap;

    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/util/concurrent/ConcurrentHashMap;->entrySet()Ljava/util/Set;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_2

    .line 26
    .line 27
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    check-cast v0, Ljava/util/Map$Entry;

    .line 32
    .line 33
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Ll/spq;

    .line 38
    .line 39
    invoke-virtual {v0}, Ll/spq;->g()Ll/wzh0;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    iget-object v2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 44
    .line 45
    invoke-virtual {v1, v2}, Ll/wzh0;->query(Ljava/lang/String;)Lcom/tantanapp/common/data/DbObject;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    if-eqz v1, :cond_0

    .line 50
    .line 51
    invoke-virtual {v0}, Ll/spq;->g()Ll/wzh0;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    iget-object v2, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 56
    .line 57
    invoke-virtual {v0, v2, v1}, Lcom/tantanapp/common/data/orm/LruCache2;->cache(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    if-eqz p1, :cond_1

    .line 61
    .line 62
    invoke-virtual {p1, v1}, Lcom/tantanapp/common/data/ValueObject;->addExtraData(Lcom/tantanapp/common/data/ValueObject;)V

    .line 63
    .line 64
    .line 65
    :cond_1
    invoke-virtual {p2, v1}, Lcom/tantanapp/common/data/ValueObject;->addExtraData(Lcom/tantanapp/common/data/ValueObject;)V

    .line 66
    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_2
    return-void
.end method

.method public final C(Lcom/tantanapp/common/data/DbObject;Lcom/tantanapp/common/data/DbObject;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TT;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/wzh0;->i:Ljava/util/concurrent/ConcurrentHashMap;

    .line 2
    .line 3
    if-eqz v0, :cond_3

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentHashMap;->isEmpty()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_3

    .line 10
    .line 11
    iget-object v0, p0, Ll/wzh0;->i:Ljava/util/concurrent/ConcurrentHashMap;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentHashMap;->entrySet()Ljava/util/Set;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-eqz v1, :cond_3

    .line 26
    .line 27
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    check-cast v1, Ljava/util/Map$Entry;

    .line 32
    .line 33
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    check-cast v1, Ll/spq;

    .line 38
    .line 39
    invoke-virtual {v1}, Ll/spq;->d()Ll/wzh0;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    iget-object v3, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 44
    .line 45
    invoke-virtual {v2, v3}, Ll/wzh0;->query(Ljava/lang/String;)Lcom/tantanapp/common/data/DbObject;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    invoke-virtual {v1}, Ll/spq;->f()Lcom/tantanapp/common/data/orm/Filter;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    invoke-virtual {p0, v3, p1}, Ll/wzh0;->m(Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/DbObject;)Z

    .line 54
    .line 55
    .line 56
    move-result v3

    .line 57
    if-nez v3, :cond_1

    .line 58
    .line 59
    invoke-virtual {v1}, Ll/spq;->f()Lcom/tantanapp/common/data/orm/Filter;

    .line 60
    .line 61
    .line 62
    move-result-object v3

    .line 63
    invoke-virtual {p0, v3, p2}, Ll/wzh0;->m(Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/DbObject;)Z

    .line 64
    .line 65
    .line 66
    move-result v3

    .line 67
    if-eqz v3, :cond_0

    .line 68
    .line 69
    :cond_1
    if-eqz v2, :cond_0

    .line 70
    .line 71
    invoke-virtual {v1}, Ll/spq;->baseFilter()Lcom/tantanapp/common/data/orm/Filter;

    .line 72
    .line 73
    .line 74
    move-result-object v3

    .line 75
    if-eqz v3, :cond_2

    .line 76
    .line 77
    invoke-virtual {v1}, Ll/spq;->baseFilter()Lcom/tantanapp/common/data/orm/Filter;

    .line 78
    .line 79
    .line 80
    move-result-object v3

    .line 81
    invoke-virtual {v3, v2}, Lcom/tantanapp/common/data/orm/Filter;->filter(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    move-result v3

    .line 85
    if-eqz v3, :cond_0

    .line 86
    .line 87
    :cond_2
    :try_start_0
    invoke-virtual {v2}, Lcom/tantanapp/common/data/ValueObject;->clone()Lcom/google/protobuf/nano/MessageNano;

    .line 88
    .line 89
    .line 90
    move-result-object v3

    .line 91
    check-cast v3, Lcom/tantanapp/common/data/DbObject;

    .line 92
    .line 93
    invoke-virtual {v2, p2}, Lcom/tantanapp/common/data/ValueObject;->addExtraData(Lcom/tantanapp/common/data/ValueObject;)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {v3, p1}, Lcom/tantanapp/common/data/ValueObject;->addExtraData(Lcom/tantanapp/common/data/ValueObject;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {p0}, Ll/wzh0;->A()Lcom/p1/mobile/putong/dbcenter/db/opt/TransactionOpt;

    .line 100
    .line 101
    .line 102
    move-result-object v4

    .line 103
    invoke-virtual {v1}, Ll/spq;->d()Ll/wzh0;

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    invoke-virtual {v4, v1, v3, v2}, Lcom/p1/mobile/putong/dbcenter/db/opt/TransactionOpt;->update(Ll/wzh0;Lcom/tantanapp/common/data/DbObject;Lcom/tantanapp/common/data/DbObject;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 108
    .line 109
    .line 110
    goto :goto_0

    .line 111
    :catch_0
    move-exception v1

    .line 112
    invoke-static {v1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 113
    .line 114
    .line 115
    goto :goto_0

    .line 116
    :cond_3
    return-void
.end method

.method public final D(Lcom/tantanapp/common/data/DbObject;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/wzh0;->i:Ljava/util/concurrent/ConcurrentHashMap;

    .line 2
    .line 3
    if-eqz v0, :cond_3

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentHashMap;->isEmpty()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_3

    .line 10
    .line 11
    iget-object v0, p0, Ll/wzh0;->i:Ljava/util/concurrent/ConcurrentHashMap;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentHashMap;->entrySet()Ljava/util/Set;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-eqz v1, :cond_3

    .line 26
    .line 27
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    check-cast v1, Ljava/util/Map$Entry;

    .line 32
    .line 33
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    check-cast v1, Ll/spq;

    .line 38
    .line 39
    invoke-virtual {v1}, Ll/spq;->d()Ll/wzh0;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    iget-object v3, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 44
    .line 45
    invoke-virtual {v2, v3}, Lcom/tantanapp/common/data/orm/LruCache2;->cached(Ljava/lang/Object;)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    check-cast v2, Lcom/tantanapp/common/data/DbObject;

    .line 50
    .line 51
    if-nez v2, :cond_1

    .line 52
    .line 53
    invoke-virtual {v1}, Ll/spq;->d()Ll/wzh0;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    iget-object v3, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 58
    .line 59
    invoke-virtual {v2, v3}, Ll/wzh0;->query(Ljava/lang/String;)Lcom/tantanapp/common/data/DbObject;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    :cond_1
    if-eqz v2, :cond_0

    .line 64
    .line 65
    invoke-virtual {v1}, Ll/spq;->baseFilter()Lcom/tantanapp/common/data/orm/Filter;

    .line 66
    .line 67
    .line 68
    move-result-object v3

    .line 69
    if-eqz v3, :cond_2

    .line 70
    .line 71
    invoke-virtual {v1}, Ll/spq;->baseFilter()Lcom/tantanapp/common/data/orm/Filter;

    .line 72
    .line 73
    .line 74
    move-result-object v3

    .line 75
    invoke-virtual {v3, v2}, Lcom/tantanapp/common/data/orm/Filter;->filter(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    move-result v3

    .line 79
    if-eqz v3, :cond_0

    .line 80
    .line 81
    :cond_2
    :try_start_0
    invoke-virtual {v2}, Lcom/tantanapp/common/data/ValueObject;->clone()Lcom/google/protobuf/nano/MessageNano;

    .line 82
    .line 83
    .line 84
    move-result-object v3

    .line 85
    check-cast v3, Lcom/tantanapp/common/data/DbObject;

    .line 86
    .line 87
    invoke-virtual {v2}, Lcom/tantanapp/common/data/ValueObject;->clone()Lcom/google/protobuf/nano/MessageNano;

    .line 88
    .line 89
    .line 90
    move-result-object v4

    .line 91
    check-cast v4, Lcom/tantanapp/common/data/DbObject;

    .line 92
    .line 93
    invoke-virtual {v2}, Lcom/tantanapp/common/data/ValueObject;->getExtList()Ljava/util/ArrayList;

    .line 94
    .line 95
    .line 96
    move-result-object v5

    .line 97
    invoke-virtual {v3, v5}, Lcom/tantanapp/common/data/ValueObject;->setExtList(Ljava/util/ArrayList;)V

    .line 98
    .line 99
    .line 100
    invoke-virtual {v2}, Lcom/tantanapp/common/data/ValueObject;->getExtList()Ljava/util/ArrayList;

    .line 101
    .line 102
    .line 103
    move-result-object v2

    .line 104
    invoke-virtual {v4, v2}, Lcom/tantanapp/common/data/ValueObject;->setExtList(Ljava/util/ArrayList;)V

    .line 105
    .line 106
    .line 107
    invoke-virtual {v4, p1}, Lcom/tantanapp/common/data/ValueObject;->removeExtTable(Lcom/tantanapp/common/data/ValueObject;)V

    .line 108
    .line 109
    .line 110
    invoke-virtual {p0}, Ll/wzh0;->A()Lcom/p1/mobile/putong/dbcenter/db/opt/TransactionOpt;

    .line 111
    .line 112
    .line 113
    move-result-object v2

    .line 114
    invoke-virtual {v1}, Ll/spq;->d()Ll/wzh0;

    .line 115
    .line 116
    .line 117
    move-result-object v1

    .line 118
    invoke-virtual {v2, v1, v3, v4}, Lcom/p1/mobile/putong/dbcenter/db/opt/TransactionOpt;->joinUpdate(Ll/wzh0;Lcom/tantanapp/common/data/DbObject;Lcom/tantanapp/common/data/DbObject;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 119
    .line 120
    .line 121
    goto :goto_0

    .line 122
    :catch_0
    move-exception v1

    .line 123
    invoke-static {v1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 124
    .line 125
    .line 126
    goto :goto_0

    .line 127
    :cond_3
    return-void
.end method

.method public final E(Lcom/tantanapp/common/data/DbObject;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/wzh0;->h:Ljava/util/concurrent/ConcurrentHashMap;

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
    iget-object p0, p0, Ll/wzh0;->h:Ljava/util/concurrent/ConcurrentHashMap;

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
    check-cast v0, Ll/spq;

    .line 30
    .line 31
    invoke-virtual {v0}, Ll/spq;->baseFilter()Lcom/tantanapp/common/data/orm/Filter;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    if-eqz v1, :cond_1

    .line 36
    .line 37
    invoke-virtual {v0}, Ll/spq;->baseFilter()Lcom/tantanapp/common/data/orm/Filter;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {v1, p1}, Lcom/tantanapp/common/data/orm/Filter;->filter(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    if-eqz v1, :cond_0

    .line 46
    .line 47
    :cond_1
    invoke-virtual {v0}, Ll/spq;->foreignC()Lcom/tantanapp/common/data/orm/StringColumn;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-virtual {v1, p1}, Lcom/tantanapp/common/data/orm/Column;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    check-cast v1, Ljava/lang/String;

    .line 56
    .line 57
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    if-eqz v1, :cond_2

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_2
    invoke-virtual {v0}, Ll/spq;->d()Ll/wzh0;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 69
    .line 70
    invoke-virtual {v0, v1}, Lcom/tantanapp/common/data/orm/LruCache2;->cached(Ljava/lang/Object;)Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    check-cast v0, Lcom/tantanapp/common/data/DbObject;

    .line 75
    .line 76
    if-eqz v0, :cond_0

    .line 77
    .line 78
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ValueObject;->getExtList()Ljava/util/ArrayList;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-virtual {p1, v0}, Lcom/tantanapp/common/data/ValueObject;->setExtTabList(Ljava/util/ArrayList;)V

    .line 83
    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_3
    return-void
.end method

.method public final binarySearchUsingLocalId(Ljava/util/List;Lcom/tantanapp/common/data/DbObject;Lcom/tantanapp/common/data/orm/Order;)I
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

.method public final cacheQueryJoinData(Lcom/tantanapp/common/data/DbObject;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/wzh0;->h:Ljava/util/concurrent/ConcurrentHashMap;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentHashMap;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-lez v0, :cond_4

    .line 8
    .line 9
    iget-object v0, p0, Ll/wzh0;->h:Ljava/util/concurrent/ConcurrentHashMap;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentHashMap;->entrySet()Ljava/util/Set;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_3

    .line 24
    .line 25
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    check-cast v1, Ljava/util/Map$Entry;

    .line 30
    .line 31
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    check-cast v1, Ll/spq;

    .line 36
    .line 37
    invoke-virtual {v1}, Ll/spq;->baseFilter()Lcom/tantanapp/common/data/orm/Filter;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    if-eqz v2, :cond_1

    .line 42
    .line 43
    invoke-virtual {v1}, Ll/spq;->baseFilter()Lcom/tantanapp/common/data/orm/Filter;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    invoke-virtual {v2, p1}, Lcom/tantanapp/common/data/orm/Filter;->filter(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result v2

    .line 51
    if-eqz v2, :cond_0

    .line 52
    .line 53
    :cond_1
    invoke-virtual {v1}, Ll/spq;->foreignC()Lcom/tantanapp/common/data/orm/StringColumn;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    invoke-virtual {v2, p1}, Lcom/tantanapp/common/data/orm/Column;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    check-cast v2, Ljava/lang/String;

    .line 62
    .line 63
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 64
    .line 65
    .line 66
    move-result v2

    .line 67
    if-eqz v2, :cond_2

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_2
    invoke-virtual {v1}, Ll/spq;->g()Ll/wzh0;

    .line 71
    .line 72
    .line 73
    move-result-object v2

    .line 74
    invoke-virtual {v1}, Ll/spq;->foreignC()Lcom/tantanapp/common/data/orm/StringColumn;

    .line 75
    .line 76
    .line 77
    move-result-object v3

    .line 78
    invoke-virtual {v3, p1}, Lcom/tantanapp/common/data/orm/Column;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object v3

    .line 82
    check-cast v3, Ljava/lang/String;

    .line 83
    .line 84
    invoke-virtual {v2, v3}, Ll/wzh0;->query(Ljava/lang/String;)Lcom/tantanapp/common/data/DbObject;

    .line 85
    .line 86
    .line 87
    move-result-object v2

    .line 88
    if-eqz v2, :cond_0

    .line 89
    .line 90
    invoke-virtual {p1, v2}, Lcom/tantanapp/common/data/ValueObject;->addExtraData(Lcom/tantanapp/common/data/ValueObject;)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {v1}, Ll/spq;->g()Ll/wzh0;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    iget-object v3, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 98
    .line 99
    invoke-virtual {v1, v3, v2}, Lcom/tantanapp/common/data/orm/LruCache2;->cache(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 100
    .line 101
    .line 102
    goto :goto_0

    .line 103
    :cond_3
    iget-object p0, p0, Ll/wzh0;->h:Ljava/util/concurrent/ConcurrentHashMap;

    .line 104
    .line 105
    invoke-virtual {p0}, Ljava/util/concurrent/ConcurrentHashMap;->values()Ljava/util/Collection;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 114
    .line 115
    .line 116
    move-result p1

    .line 117
    if-eqz p1, :cond_4

    .line 118
    .line 119
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    check-cast p1, Ll/spq;

    .line 124
    .line 125
    goto :goto_1

    .line 126
    :cond_4
    return-void
.end method

.method public count(Lcom/tantanapp/common/data/orm/Filter;I)I
    .locals 3
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
    if-nez p1, :cond_0

    .line 5
    .line 6
    sget-object v0, Lcom/tantanapp/common/data/orm/SqlSegment;->NULL:Lcom/tantanapp/common/data/orm/SqlSegment;

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    invoke-virtual {p1}, Lcom/tantanapp/common/data/orm/Filter;->emit()Lcom/tantanapp/common/data/orm/SqlSegment;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    :goto_0
    instance-of v1, p1, Ll/spq;

    .line 14
    .line 15
    if-eqz v1, :cond_1

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/wzh0;->o()Lio/requery/android/database/sqlite/SQLiteDatabase;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p1, Ll/spq;

    .line 22
    .line 23
    invoke-virtual {p1}, Ll/spq;->countSql()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    iget-object v0, v0, Lcom/tantanapp/common/data/orm/SqlSegment;->args:[Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {p0, p1, v0}, Lio/requery/android/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    goto :goto_2

    .line 34
    :cond_1
    invoke-virtual {p0}, Ll/wzh0;->o()Lio/requery/android/database/sqlite/SQLiteDatabase;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    new-instance v1, Ljava/lang/StringBuilder;

    .line 39
    .line 40
    const-string v2, "select count(_id) from "

    .line 41
    .line 42
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    iget-object p0, p0, Ll/wzh0;->d:Ljava/lang/String;

    .line 46
    .line 47
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    const-string p0, " "

    .line 51
    .line 52
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    iget-object p0, v0, Lcom/tantanapp/common/data/orm/SqlSegment;->part:Ljava/lang/String;

    .line 56
    .line 57
    if-nez p0, :cond_2

    .line 58
    .line 59
    const-string p0, ""

    .line 60
    .line 61
    goto :goto_1

    .line 62
    :cond_2
    new-instance p0, Ljava/lang/StringBuilder;

    .line 63
    .line 64
    const-string v2, " WHERE "

    .line 65
    .line 66
    invoke-direct {p0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    iget-object v2, v0, Lcom/tantanapp/common/data/orm/SqlSegment;->part:Ljava/lang/String;

    .line 70
    .line 71
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    :goto_1
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    iget-object v0, v0, Lcom/tantanapp/common/data/orm/SqlSegment;->args:[Ljava/lang/String;

    .line 86
    .line 87
    invoke-virtual {p1, p0, v0}, Lio/requery/android/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    :goto_2
    :try_start_0
    invoke-interface {p0}, Landroid/database/Cursor;->moveToFirst()Z

    .line 92
    .line 93
    .line 94
    move-result p1

    .line 95
    if-eqz p1, :cond_3

    .line 96
    .line 97
    const/4 p1, 0x0

    .line 98
    invoke-interface {p0, p1}, Landroid/database/Cursor;->getInt(I)I

    .line 99
    .line 100
    .line 101
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 102
    goto :goto_3

    .line 103
    :catchall_0
    move-exception p1

    .line 104
    goto :goto_5

    .line 105
    :cond_3
    const/4 p1, -0x1

    .line 106
    :goto_3
    if-lez p2, :cond_4

    .line 107
    .line 108
    if-le p1, p2, :cond_4

    .line 109
    .line 110
    goto :goto_4

    .line 111
    :cond_4
    move p2, p1

    .line 112
    :goto_4
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    .line 113
    .line 114
    .line 115
    return p2

    .line 116
    :goto_5
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    .line 117
    .line 118
    .line 119
    throw p1
.end method

.method public delete(J)V
    .locals 1

    .line 133
    sget-object v0, Lcom/tantanapp/common/data/DbObject;->_ID:Lcom/tantanapp/common/data/orm/LongColumn;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    move-result-object p1

    invoke-virtual {p0, p1}, Ll/wzh0;->delete(Lcom/tantanapp/common/data/orm/Filter;)V

    return-void
.end method

.method public delete(Lcom/tantanapp/common/data/orm/Filter;)V
    .locals 9

    .line 1
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 2
    .line 3
    .line 4
    if-nez p1, :cond_0

    .line 5
    .line 6
    sget-object v0, Lcom/tantanapp/common/data/orm/SqlSegment;->NULL:Lcom/tantanapp/common/data/orm/SqlSegment;

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    invoke-virtual {p1}, Lcom/tantanapp/common/data/orm/Filter;->emit()Lcom/tantanapp/common/data/orm/SqlSegment;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    :goto_0
    instance-of v1, p1, Ll/spq;

    .line 14
    .line 15
    if-eqz v1, :cond_1

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/wzh0;->o()Lio/requery/android/database/sqlite/SQLiteDatabase;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    check-cast p1, Ll/spq;

    .line 22
    .line 23
    const/4 v2, 0x0

    .line 24
    const/4 v3, -0x1

    .line 25
    invoke-virtual {p1, v2, v3}, Ll/spq;->querySql(Lcom/tantanapp/common/data/orm/Order;I)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    iget-object v2, v0, Lcom/tantanapp/common/data/orm/SqlSegment;->args:[Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {v1, p1, v2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    goto :goto_1

    .line 36
    :cond_1
    invoke-virtual {p0}, Ll/wzh0;->o()Lio/requery/android/database/sqlite/SQLiteDatabase;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    iget-object v2, p0, Ll/wzh0;->d:Ljava/lang/String;

    .line 41
    .line 42
    iget-object v4, v0, Lcom/tantanapp/common/data/orm/SqlSegment;->part:Ljava/lang/String;

    .line 43
    .line 44
    iget-object v5, v0, Lcom/tantanapp/common/data/orm/SqlSegment;->args:[Ljava/lang/String;

    .line 45
    .line 46
    const/4 v7, 0x0

    .line 47
    const/4 v8, 0x0

    .line 48
    const/4 v3, 0x0

    .line 49
    const/4 v6, 0x0

    .line 50
    invoke-virtual/range {v1 .. v8}, Lio/requery/android/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    :goto_1
    new-instance v1, Ljava/util/ArrayList;

    .line 55
    .line 56
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 57
    .line 58
    .line 59
    :goto_2
    :try_start_0
    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z

    .line 60
    .line 61
    .line 62
    move-result v2

    .line 63
    if-eqz v2, :cond_2

    .line 64
    .line 65
    iget-object v2, p0, Ll/wzh0;->b:Ll/vzf0;

    .line 66
    .line 67
    const/4 v3, 0x0

    .line 68
    invoke-virtual {v2, p1, v3}, Ll/vzf0;->read(Landroid/database/Cursor;I)Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    check-cast v2, Lcom/tantanapp/common/data/DbObject;

    .line 73
    .line 74
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 75
    .line 76
    .line 77
    goto :goto_2

    .line 78
    :catchall_0
    move-exception v0

    .line 79
    move-object p0, v0

    .line 80
    goto :goto_4

    .line 81
    :cond_2
    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    .line 82
    .line 83
    .line 84
    invoke-virtual {p0}, Ll/wzh0;->o()Lio/requery/android/database/sqlite/SQLiteDatabase;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    iget-object v2, p0, Ll/wzh0;->d:Ljava/lang/String;

    .line 89
    .line 90
    iget-object v3, v0, Lcom/tantanapp/common/data/orm/SqlSegment;->part:Ljava/lang/String;

    .line 91
    .line 92
    iget-object v0, v0, Lcom/tantanapp/common/data/orm/SqlSegment;->args:[Ljava/lang/String;

    .line 93
    .line 94
    invoke-virtual {p1, v2, v3, v0}, Lio/requery/android/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 95
    .line 96
    .line 97
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    :goto_3
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    if-eqz v0, :cond_3

    .line 106
    .line 107
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    check-cast v0, Lcom/tantanapp/common/data/DbObject;

    .line 112
    .line 113
    invoke-virtual {p0, v0}, Ll/wzh0;->D(Lcom/tantanapp/common/data/DbObject;)V

    .line 114
    .line 115
    .line 116
    invoke-virtual {p0, v0}, Ll/wzh0;->E(Lcom/tantanapp/common/data/DbObject;)V

    .line 117
    .line 118
    .line 119
    invoke-virtual {p0}, Ll/wzh0;->A()Lcom/p1/mobile/putong/dbcenter/db/opt/TransactionOpt;

    .line 120
    .line 121
    .line 122
    move-result-object v1

    .line 123
    invoke-virtual {v1, p0, v0}, Lcom/p1/mobile/putong/dbcenter/db/opt/TransactionOpt;->delete(Ll/wzh0;Lcom/tantanapp/common/data/DbObject;)V

    .line 124
    .line 125
    .line 126
    goto :goto_3

    .line 127
    :cond_3
    return-void

    .line 128
    :goto_4
    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    .line 129
    .line 130
    .line 131
    throw p0
.end method

.method public delete(Ljava/lang/String;)V
    .locals 1

    .line 132
    sget-object v0, Lcom/tantanapp/common/data/DbObject;->ID:Lcom/tantanapp/common/data/orm/StringColumn;

    invoke-virtual {v0, p1}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    move-result-object p1

    invoke-virtual {p0, p1}, Ll/wzh0;->delete(Lcom/tantanapp/common/data/orm/Filter;)V

    return-void
.end method

.method public deleteAll()V
    .locals 1

    .line 1
    sget-object v0, Lcom/tantanapp/common/data/orm/Filter;->TRUE:Lcom/tantanapp/common/data/orm/Filter;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/wzh0;->delete(Lcom/tantanapp/common/data/orm/Filter;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public i(ZLl/pcj;Ll/y20;Ll/x20;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(Z",
            "Ll/pcj<",
            "TT;>;",
            "Ll/y20<",
            "TT;>;",
            "Ll/x20;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/l9c;->o()Ll/l9c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual/range {p0 .. p5}, Ll/l9c;->d(ZLl/pcj;Ll/y20;Ll/x20;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public insert(Lcom/tantanapp/common/data/DbObject;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Ll/wzh0;->s(Lcom/tantanapp/common/data/DbObject;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public j(ZLl/pcj;Ll/y20;Ll/x20;ZLjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(Z",
            "Ll/pcj<",
            "TT;>;",
            "Ll/y20<",
            "TT;>;",
            "Ll/x20;",
            "Z",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/l9c;->o()Ll/l9c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual/range {p0 .. p6}, Ll/l9c;->e(ZLl/pcj;Ll/y20;Ll/x20;ZLjava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final k(Ljava/util/List;Lcom/tantanapp/common/data/DbObject;Lcom/tantanapp/common/data/orm/Order;)I
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

.method public l(Lcom/tantanapp/common/data/DbObject;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/wzh0;->i:Ljava/util/concurrent/ConcurrentHashMap;

    .line 2
    .line 3
    if-eqz v0, :cond_3

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentHashMap;->isEmpty()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_3

    .line 10
    .line 11
    iget-object v0, p0, Ll/wzh0;->i:Ljava/util/concurrent/ConcurrentHashMap;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentHashMap;->entrySet()Ljava/util/Set;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-eqz v1, :cond_3

    .line 26
    .line 27
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    check-cast v1, Ljava/util/Map$Entry;

    .line 32
    .line 33
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    check-cast v1, Ll/spq;

    .line 38
    .line 39
    invoke-virtual {v1}, Ll/spq;->d()Ll/wzh0;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    iget-object v3, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 44
    .line 45
    invoke-virtual {v2, v3}, Lcom/tantanapp/common/data/orm/LruCache2;->cached(Ljava/lang/Object;)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    check-cast v2, Lcom/tantanapp/common/data/DbObject;

    .line 50
    .line 51
    if-nez v2, :cond_1

    .line 52
    .line 53
    invoke-virtual {v1}, Ll/spq;->d()Ll/wzh0;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    iget-object v3, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 58
    .line 59
    invoke-virtual {v2, v3}, Ll/wzh0;->query(Ljava/lang/String;)Lcom/tantanapp/common/data/DbObject;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    :cond_1
    if-eqz v2, :cond_0

    .line 64
    .line 65
    invoke-virtual {v1}, Ll/spq;->baseFilter()Lcom/tantanapp/common/data/orm/Filter;

    .line 66
    .line 67
    .line 68
    move-result-object v3

    .line 69
    if-eqz v3, :cond_2

    .line 70
    .line 71
    invoke-virtual {v1}, Ll/spq;->baseFilter()Lcom/tantanapp/common/data/orm/Filter;

    .line 72
    .line 73
    .line 74
    move-result-object v3

    .line 75
    invoke-virtual {v3, v2}, Lcom/tantanapp/common/data/orm/Filter;->filter(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    move-result v3

    .line 79
    if-eqz v3, :cond_0

    .line 80
    .line 81
    :cond_2
    :try_start_0
    invoke-virtual {v2}, Lcom/tantanapp/common/data/ValueObject;->clone()Lcom/google/protobuf/nano/MessageNano;

    .line 82
    .line 83
    .line 84
    move-result-object v3

    .line 85
    check-cast v3, Lcom/tantanapp/common/data/DbObject;

    .line 86
    .line 87
    invoke-virtual {v2}, Lcom/tantanapp/common/data/ValueObject;->clone()Lcom/google/protobuf/nano/MessageNano;

    .line 88
    .line 89
    .line 90
    move-result-object v4

    .line 91
    check-cast v4, Lcom/tantanapp/common/data/DbObject;

    .line 92
    .line 93
    invoke-virtual {v2}, Lcom/tantanapp/common/data/ValueObject;->getExtList()Ljava/util/ArrayList;

    .line 94
    .line 95
    .line 96
    move-result-object v5

    .line 97
    invoke-virtual {v3, v5}, Lcom/tantanapp/common/data/ValueObject;->setExtList(Ljava/util/ArrayList;)V

    .line 98
    .line 99
    .line 100
    invoke-virtual {v2}, Lcom/tantanapp/common/data/ValueObject;->getExtList()Ljava/util/ArrayList;

    .line 101
    .line 102
    .line 103
    move-result-object v2

    .line 104
    invoke-virtual {v4, v2}, Lcom/tantanapp/common/data/ValueObject;->setExtList(Ljava/util/ArrayList;)V

    .line 105
    .line 106
    .line 107
    invoke-virtual {v4, p1}, Lcom/tantanapp/common/data/ValueObject;->addExtraData(Lcom/tantanapp/common/data/ValueObject;)V

    .line 108
    .line 109
    .line 110
    invoke-virtual {p0}, Ll/wzh0;->A()Lcom/p1/mobile/putong/dbcenter/db/opt/TransactionOpt;

    .line 111
    .line 112
    .line 113
    move-result-object v2

    .line 114
    invoke-virtual {v1}, Ll/spq;->d()Ll/wzh0;

    .line 115
    .line 116
    .line 117
    move-result-object v1

    .line 118
    invoke-virtual {v2, v1, v3, v4}, Lcom/p1/mobile/putong/dbcenter/db/opt/TransactionOpt;->update(Ll/wzh0;Lcom/tantanapp/common/data/DbObject;Lcom/tantanapp/common/data/DbObject;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 119
    .line 120
    .line 121
    goto :goto_0

    .line 122
    :catch_0
    move-exception v1

    .line 123
    invoke-static {v1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 124
    .line 125
    .line 126
    goto :goto_0

    .line 127
    :cond_3
    return-void
.end method

.method public final m(Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/DbObject;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/tantanapp/common/data/orm/Filter;",
            "TT;)Z"
        }
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    return p0

    .line 5
    :cond_0
    if-nez p2, :cond_1

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_1
    invoke-virtual {p1, p2}, Lcom/tantanapp/common/data/orm/Filter;->filter(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public o()Lio/requery/android/database/sqlite/SQLiteDatabase;
    .locals 0

    .line 1
    invoke-static {}, Ll/l9c;->o()Ll/l9c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/l9c;->h()Lio/requery/android/database/sqlite/SQLiteDatabase;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public p()V
    .locals 0

    .line 1
    invoke-static {}, Ll/l9c;->o()Ll/l9c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/l9c;->m()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public query(J)Lcom/tantanapp/common/data/DbObject;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)TT;"
        }
    .end annotation

    .line 36
    sget-object v0, Lcom/tantanapp/common/data/DbObject;->_ID:Lcom/tantanapp/common/data/orm/LongColumn;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    move-result-object p1

    const/4 p2, 0x1

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, p2}, Ll/wzh0;->query(Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/Order;I)Ljava/util/List;

    move-result-object p0

    .line 37
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_0

    return-object v0

    :cond_0
    const/4 p1, 0x0

    .line 38
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

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x1

    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    move v2, v1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    move v2, v0

    .line 8
    :goto_0
    invoke-static {v2}, Ll/u11;->h(Z)V

    .line 9
    .line 10
    .line 11
    sget-object v2, Lcom/tantanapp/common/data/DbObject;->ID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 12
    .line 13
    invoke-virtual {v2, p1}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    const/4 v2, 0x0

    .line 18
    invoke-virtual {p0, p1, v2, v1}, Ll/wzh0;->query(Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/Order;I)Ljava/util/List;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    if-eqz p1, :cond_1

    .line 27
    .line 28
    return-object v2

    .line 29
    :cond_1
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    check-cast p0, Lcom/tantanapp/common/data/DbObject;

    .line 34
    .line 35
    return-object p0
.end method

.method public query(Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/Order;I)Ljava/util/List;
    .locals 1
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

    const/4 v0, 0x1

    .line 39
    invoke-virtual {p0, p1, p2, p3, v0}, Ll/wzh0;->z(Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/Order;IZ)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public queryCache(Ljava/lang/String;)Lcom/tantanapp/common/data/DbObject;
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

    .line 200
    :goto_0
    invoke-static {v2}, Ll/u11;->h(Z)V

    .line 201
    invoke-virtual {p0, p1}, Lcom/tantanapp/common/data/orm/LruCache2;->cached(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/tantanapp/common/data/DbObject;

    if-nez v2, :cond_2

    .line 202
    invoke-virtual {p0}, Ll/wzh0;->p()V

    .line 203
    sget-object v2, Lcom/tantanapp/common/data/DbObject;->ID:Lcom/tantanapp/common/data/orm/StringColumn;

    invoke-virtual {v2, p1}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    move-result-object p1

    const/4 v2, 0x0

    invoke-virtual {p0, p1, v2, v1}, Ll/wzh0;->queryCache(Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/Order;I)Ljava/util/List;

    move-result-object p0

    if-eqz p0, :cond_2

    .line 204
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p1

    if-nez p1, :cond_1

    goto :goto_1

    .line 205
    :cond_1
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/tantanapp/common/data/DbObject;

    return-object p0

    :cond_2
    :goto_1
    return-object v2
.end method

.method public queryCache(Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/Order;I)Ljava/util/List;
    .locals 12
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
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 2
    .line 3
    .line 4
    if-nez p1, :cond_0

    .line 5
    .line 6
    sget-object v0, Lcom/tantanapp/common/data/orm/SqlSegment;->NULL:Lcom/tantanapp/common/data/orm/SqlSegment;

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    invoke-virtual {p1}, Lcom/tantanapp/common/data/orm/Filter;->emit()Lcom/tantanapp/common/data/orm/SqlSegment;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    :goto_0
    const/4 v1, 0x0

    .line 14
    if-lez p3, :cond_1

    .line 15
    .line 16
    new-instance v2, Ljava/lang/StringBuilder;

    .line 17
    .line 18
    const-string v3, ""

    .line 19
    .line 20
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    move-object v11, v2

    .line 31
    goto :goto_1

    .line 32
    :cond_1
    move-object v11, v1

    .line 33
    :goto_1
    invoke-virtual {p0}, Ll/wzh0;->p()V

    .line 34
    .line 35
    .line 36
    instance-of v2, p1, Ll/spq;

    .line 37
    .line 38
    if-eqz v2, :cond_2

    .line 39
    .line 40
    invoke-virtual {p0}, Ll/wzh0;->o()Lio/requery/android/database/sqlite/SQLiteDatabase;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    move-object v2, p1

    .line 45
    check-cast v2, Ll/spq;

    .line 46
    .line 47
    invoke-virtual {v2, p2, p3}, Ll/spq;->querySql(Lcom/tantanapp/common/data/orm/Order;I)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p2

    .line 51
    iget-object p3, v0, Lcom/tantanapp/common/data/orm/SqlSegment;->args:[Ljava/lang/String;

    .line 52
    .line 53
    invoke-virtual {v1, p2, p3}, Lio/requery/android/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    .line 54
    .line 55
    .line 56
    move-result-object p2

    .line 57
    goto :goto_4

    .line 58
    :cond_2
    invoke-virtual {p0}, Ll/wzh0;->o()Lio/requery/android/database/sqlite/SQLiteDatabase;

    .line 59
    .line 60
    .line 61
    move-result-object v3

    .line 62
    iget-object v4, p0, Ll/wzh0;->d:Ljava/lang/String;

    .line 63
    .line 64
    iget-object v6, v0, Lcom/tantanapp/common/data/orm/SqlSegment;->part:Ljava/lang/String;

    .line 65
    .line 66
    iget-object v7, v0, Lcom/tantanapp/common/data/orm/SqlSegment;->args:[Ljava/lang/String;

    .line 67
    .line 68
    if-nez p2, :cond_3

    .line 69
    .line 70
    :goto_2
    move-object v10, v1

    .line 71
    goto :goto_3

    .line 72
    :cond_3
    invoke-virtual {p2}, Lcom/tantanapp/common/data/orm/Order;->emit()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    goto :goto_2

    .line 77
    :goto_3
    const/4 v5, 0x0

    .line 78
    const/4 v8, 0x0

    .line 79
    const/4 v9, 0x0

    .line 80
    invoke-virtual/range {v3 .. v11}, Lio/requery/android/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    .line 81
    .line 82
    .line 83
    move-result-object p2

    .line 84
    :goto_4
    new-instance p3, Ljava/util/ArrayList;

    .line 85
    .line 86
    const/16 v0, 0xa

    .line 87
    .line 88
    invoke-direct {p3, v0}, Ljava/util/ArrayList;-><init>(I)V

    .line 89
    .line 90
    .line 91
    :try_start_0
    sget-object v0, Lcom/tantanapp/common/data/DbObject;->ID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 92
    .line 93
    iget-object v0, v0, Lcom/tantanapp/common/data/orm/Column;->NAME:Ljava/lang/String;

    .line 94
    .line 95
    invoke-interface {p2, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    if-ltz v0, :cond_7

    .line 100
    .line 101
    :goto_5
    invoke-interface {p2}, Landroid/database/Cursor;->moveToNext()Z

    .line 102
    .line 103
    .line 104
    move-result v1

    .line 105
    if-eqz v1, :cond_7

    .line 106
    .line 107
    invoke-interface {p2, v0}, Landroid/database/Cursor;->isNull(I)Z

    .line 108
    .line 109
    .line 110
    move-result v1

    .line 111
    if-eqz v1, :cond_4

    .line 112
    .line 113
    goto :goto_5

    .line 114
    :cond_4
    invoke-interface {p2, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object v1

    .line 118
    invoke-virtual {p0, v1}, Lcom/tantanapp/common/data/orm/LruCache2;->cached(Ljava/lang/Object;)Ljava/lang/Object;

    .line 119
    .line 120
    .line 121
    move-result-object v2

    .line 122
    check-cast v2, Lcom/tantanapp/common/data/DbObject;

    .line 123
    .line 124
    if-nez v2, :cond_6

    .line 125
    .line 126
    iget-object v2, p0, Ll/wzh0;->b:Ll/vzf0;

    .line 127
    .line 128
    const/4 v3, 0x0

    .line 129
    invoke-virtual {v2, p2, v3}, Ll/vzf0;->read(Landroid/database/Cursor;I)Ljava/lang/Object;

    .line 130
    .line 131
    .line 132
    move-result-object v2

    .line 133
    check-cast v2, Lcom/tantanapp/common/data/DbObject;

    .line 134
    .line 135
    instance-of v3, p1, Ll/spq;

    .line 136
    .line 137
    if-eqz v3, :cond_5

    .line 138
    .line 139
    move-object v3, p1

    .line 140
    check-cast v3, Ll/spq;

    .line 141
    .line 142
    invoke-virtual {v3}, Ll/spq;->g()Ll/wzh0;

    .line 143
    .line 144
    .line 145
    move-result-object v4

    .line 146
    iget-object v4, v4, Ll/wzh0;->b:Ll/vzf0;

    .line 147
    .line 148
    iget-object v5, p0, Ll/wzh0;->b:Ll/vzf0;

    .line 149
    .line 150
    invoke-virtual {v5}, Ll/vzf0;->getReadIndex()I

    .line 151
    .line 152
    .line 153
    move-result v5

    .line 154
    invoke-virtual {v4, p2, v5}, Ll/vzf0;->read(Landroid/database/Cursor;I)Ljava/lang/Object;

    .line 155
    .line 156
    .line 157
    move-result-object v4

    .line 158
    check-cast v4, Lcom/tantanapp/common/data/ValueObject;

    .line 159
    .line 160
    invoke-virtual {v3}, Ll/spq;->g()Ll/wzh0;

    .line 161
    .line 162
    .line 163
    move-result-object v3

    .line 164
    iget-object v3, v3, Ll/wzh0;->b:Ll/vzf0;

    .line 165
    .line 166
    invoke-virtual {v3}, Ll/vzf0;->init()Ljava/lang/Object;

    .line 167
    .line 168
    .line 169
    move-result-object v3

    .line 170
    check-cast v3, Lcom/tantanapp/common/data/ValueObject;

    .line 171
    .line 172
    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 173
    .line 174
    .line 175
    move-result v3

    .line 176
    if-nez v3, :cond_5

    .line 177
    .line 178
    invoke-virtual {v2, v4}, Lcom/tantanapp/common/data/ValueObject;->addExtraData(Lcom/tantanapp/common/data/ValueObject;)V

    .line 179
    .line 180
    .line 181
    goto :goto_6

    .line 182
    :catchall_0
    move-exception v0

    .line 183
    move-object p0, v0

    .line 184
    goto :goto_7

    .line 185
    :cond_5
    :goto_6
    invoke-virtual {p0, v1, v2}, Lcom/tantanapp/common/data/orm/LruCache2;->cache(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 186
    .line 187
    .line 188
    :cond_6
    invoke-interface {p3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 189
    .line 190
    .line 191
    goto :goto_5

    .line 192
    :cond_7
    invoke-interface {p2}, Landroid/database/Cursor;->close()V

    .line 193
    .line 194
    .line 195
    return-object p3

    .line 196
    :goto_7
    invoke-interface {p2}, Landroid/database/Cursor;->close()V

    .line 197
    .line 198
    .line 199
    throw p0
.end method

.method public s(Lcom/tantanapp/common/data/DbObject;Z)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;Z)V"
        }
    .end annotation

    .line 1
    if-eqz p2, :cond_1

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/tantanapp/common/data/ValueObject;->getExtList()Ljava/util/ArrayList;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    invoke-virtual {p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    :cond_0
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Lcom/tantanapp/common/data/ValueObject;

    .line 28
    .line 29
    invoke-static {}, Ll/l9c;->o()Ll/l9c;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    iget-object v2, p0, Ll/wzh0;->d:Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {v1, v2, v0}, Ll/l9c;->n(Ljava/lang/String;Ljava/lang/Object;)Ll/wzh0;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    if-eqz v1, :cond_0

    .line 40
    .line 41
    instance-of v2, v0, Lcom/tantanapp/common/data/DbObject;

    .line 42
    .line 43
    if-eqz v2, :cond_0

    .line 44
    .line 45
    check-cast v0, Lcom/tantanapp/common/data/DbObject;

    .line 46
    .line 47
    invoke-virtual {v1, v0}, Ll/wzh0;->insert(Lcom/tantanapp/common/data/DbObject;)V

    .line 48
    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_1
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 52
    .line 53
    .line 54
    new-instance p2, Landroid/content/ContentValues;

    .line 55
    .line 56
    invoke-direct {p2}, Landroid/content/ContentValues;-><init>()V

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Ll/wzh0;->b:Ll/vzf0;

    .line 60
    .line 61
    invoke-virtual {v0, p1, p2}, Ll/vzf0;->write(Ljava/lang/Object;Landroid/content/ContentValues;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0}, Ll/wzh0;->o()Lio/requery/android/database/sqlite/SQLiteDatabase;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    iget-object v1, p0, Ll/wzh0;->d:Ljava/lang/String;

    .line 69
    .line 70
    const/4 v2, 0x0

    .line 71
    invoke-virtual {v0, v1, v2, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    .line 72
    .line 73
    .line 74
    move-result-wide v0

    .line 75
    iput-wide v0, p1, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 76
    .line 77
    invoke-virtual {p0, p1}, Ll/wzh0;->l(Lcom/tantanapp/common/data/DbObject;)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {p0}, Ll/wzh0;->A()Lcom/p1/mobile/putong/dbcenter/db/opt/TransactionOpt;

    .line 81
    .line 82
    .line 83
    move-result-object p2

    .line 84
    invoke-virtual {p2, p0, p1}, Lcom/p1/mobile/putong/dbcenter/db/opt/TransactionOpt;->insert(Ll/wzh0;Lcom/tantanapp/common/data/DbObject;)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {p0, p1}, Ll/wzh0;->cacheQueryJoinData(Lcom/tantanapp/common/data/DbObject;)V

    .line 88
    .line 89
    .line 90
    return-void
.end method

.method public sum(Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/OrderedColumn;)I
    .locals 3
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
    if-nez p1, :cond_0

    .line 5
    .line 6
    sget-object p1, Lcom/tantanapp/common/data/orm/SqlSegment;->NULL:Lcom/tantanapp/common/data/orm/SqlSegment;

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    invoke-virtual {p1}, Lcom/tantanapp/common/data/orm/Filter;->emit()Lcom/tantanapp/common/data/orm/SqlSegment;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    :goto_0
    invoke-virtual {p0}, Ll/wzh0;->o()Lio/requery/android/database/sqlite/SQLiteDatabase;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    new-instance v1, Ljava/lang/StringBuilder;

    .line 18
    .line 19
    const-string v2, "SELECT SUM("

    .line 20
    .line 21
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    iget-object p2, p2, Lcom/tantanapp/common/data/orm/Column;->NAME:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    const-string p2, ") FROM "

    .line 30
    .line 31
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    iget-object p0, p0, Ll/wzh0;->d:Ljava/lang/String;

    .line 35
    .line 36
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    const-string p0, " "

    .line 40
    .line 41
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    iget-object p0, p1, Lcom/tantanapp/common/data/orm/SqlSegment;->part:Ljava/lang/String;

    .line 45
    .line 46
    if-nez p0, :cond_1

    .line 47
    .line 48
    const-string p0, ""

    .line 49
    .line 50
    goto :goto_1

    .line 51
    :cond_1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 52
    .line 53
    const-string p2, " WHERE "

    .line 54
    .line 55
    invoke-direct {p0, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    iget-object p2, p1, Lcom/tantanapp/common/data/orm/SqlSegment;->part:Ljava/lang/String;

    .line 59
    .line 60
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    :goto_1
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    iget-object p1, p1, Lcom/tantanapp/common/data/orm/SqlSegment;->args:[Ljava/lang/String;

    .line 75
    .line 76
    invoke-virtual {v0, p0, p1}, Lio/requery/android/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    :try_start_0
    invoke-interface {p0}, Landroid/database/Cursor;->moveToFirst()Z

    .line 81
    .line 82
    .line 83
    move-result p1

    .line 84
    if-eqz p1, :cond_2

    .line 85
    .line 86
    const/4 p1, 0x0

    .line 87
    invoke-interface {p0, p1}, Landroid/database/Cursor;->getInt(I)I

    .line 88
    .line 89
    .line 90
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 91
    goto :goto_2

    .line 92
    :catchall_0
    move-exception p1

    .line 93
    goto :goto_3

    .line 94
    :cond_2
    const/4 p1, -0x1

    .line 95
    :goto_2
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    .line 96
    .line 97
    .line 98
    return p1

    .line 99
    :goto_3
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    .line 100
    .line 101
    .line 102
    throw p1
.end method

.method public syncUiCache(Ljava/util/List;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/ds4;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_15

    .line 2
    .line 3
    :try_start_0
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
    if-eqz v0, :cond_15

    .line 12
    .line 13
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Ll/ds4;

    .line 18
    .line 19
    new-instance v1, Ljava/lang/StringBuilder;

    .line 20
    .line 21
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 22
    .line 23
    .line 24
    const-string v2, "syncing "

    .line 25
    .line 26
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    iget-object v2, p0, Ll/wzh0;->d:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    const-string v2, " "

    .line 35
    .line 36
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    iget v2, v0, Ll/ds4;->a:I

    .line 40
    .line 41
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-static {v1}, Ll/wzh0;->n(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    iget v1, v0, Ll/ds4;->a:I

    .line 52
    .line 53
    const/4 v2, 0x1

    .line 54
    if-eqz v1, :cond_d

    .line 55
    .line 56
    if-eq v1, v2, :cond_a

    .line 57
    .line 58
    const/4 v3, 0x2

    .line 59
    if-eq v1, v3, :cond_5

    .line 60
    .line 61
    const/4 v3, 0x3

    .line 62
    if-eq v1, v3, :cond_1

    .line 63
    .line 64
    goto/16 :goto_9

    .line 65
    .line 66
    :cond_1
    iget-object v1, v0, Ll/ds4;->b:Lcom/tantanapp/common/data/DbObject;

    .line 67
    .line 68
    iget-object v3, v0, Ll/ds4;->c:Lcom/tantanapp/common/data/DbObject;

    .line 69
    .line 70
    iget-object v4, p0, Ll/wzh0;->g:Ljava/util/concurrent/ConcurrentHashMap;

    .line 71
    .line 72
    invoke-virtual {v4}, Ljava/util/concurrent/ConcurrentHashMap;->values()Ljava/util/Collection;

    .line 73
    .line 74
    .line 75
    move-result-object v4

    .line 76
    invoke-interface {v4}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 77
    .line 78
    .line 79
    move-result-object v4

    .line 80
    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 81
    .line 82
    .line 83
    move-result v5

    .line 84
    if-eqz v5, :cond_2

    .line 85
    .line 86
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    move-result-object v5

    .line 90
    check-cast v5, Ll/wzh0$d;

    .line 91
    .line 92
    invoke-virtual {v5, v1, v3}, Ll/wzh0$d;->q(Lcom/tantanapp/common/data/DbObject;Lcom/tantanapp/common/data/DbObject;)Z

    .line 93
    .line 94
    .line 95
    goto :goto_1

    .line 96
    :cond_2
    iget-object v4, p0, Ll/wzh0;->k:Ljava/util/concurrent/ConcurrentHashMap;

    .line 97
    .line 98
    invoke-virtual {v4}, Ljava/util/concurrent/ConcurrentHashMap;->values()Ljava/util/Collection;

    .line 99
    .line 100
    .line 101
    move-result-object v4

    .line 102
    invoke-interface {v4}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 103
    .line 104
    .line 105
    move-result-object v4

    .line 106
    :goto_2
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 107
    .line 108
    .line 109
    move-result v5

    .line 110
    if-eqz v5, :cond_3

    .line 111
    .line 112
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 113
    .line 114
    .line 115
    move-result-object v5

    .line 116
    check-cast v5, Ll/wzh0$b;

    .line 117
    .line 118
    invoke-virtual {v5, v1, v3}, Ll/wzh0$b;->c(Lcom/tantanapp/common/data/DbObject;Lcom/tantanapp/common/data/DbObject;)V

    .line 119
    .line 120
    .line 121
    goto :goto_2

    .line 122
    :cond_3
    iget-object v4, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 123
    .line 124
    iget-object v5, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 125
    .line 126
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 127
    .line 128
    .line 129
    move-result v4

    .line 130
    if-nez v4, :cond_4

    .line 131
    .line 132
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 133
    .line 134
    invoke-virtual {p0, v1}, Lcom/tantanapp/common/data/orm/LruCache2;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 135
    .line 136
    .line 137
    goto/16 :goto_9

    .line 138
    .line 139
    :cond_4
    iget-object v1, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 140
    .line 141
    invoke-virtual {p0, v1}, Lcom/tantanapp/common/data/orm/LruCache2;->cached(Ljava/lang/Object;)Ljava/lang/Object;

    .line 142
    .line 143
    .line 144
    move-result-object v1

    .line 145
    if-eqz v1, :cond_10

    .line 146
    .line 147
    iget-object v1, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 148
    .line 149
    invoke-virtual {p0, v1, v3}, Lcom/tantanapp/common/data/orm/LruCache2;->cache(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 150
    .line 151
    .line 152
    goto/16 :goto_9

    .line 153
    .line 154
    :cond_5
    iget-object v1, v0, Ll/ds4;->b:Lcom/tantanapp/common/data/DbObject;

    .line 155
    .line 156
    iget-object v3, v0, Ll/ds4;->c:Lcom/tantanapp/common/data/DbObject;

    .line 157
    .line 158
    iget-object v4, p0, Ll/wzh0;->g:Ljava/util/concurrent/ConcurrentHashMap;

    .line 159
    .line 160
    invoke-virtual {v4}, Ljava/util/concurrent/ConcurrentHashMap;->values()Ljava/util/Collection;

    .line 161
    .line 162
    .line 163
    move-result-object v4

    .line 164
    invoke-interface {v4}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 165
    .line 166
    .line 167
    move-result-object v4

    .line 168
    :goto_3
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 169
    .line 170
    .line 171
    move-result v5

    .line 172
    if-eqz v5, :cond_6

    .line 173
    .line 174
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 175
    .line 176
    .line 177
    move-result-object v5

    .line 178
    check-cast v5, Ll/wzh0$d;

    .line 179
    .line 180
    invoke-virtual {v5, v1, v3}, Ll/wzh0$d;->q(Lcom/tantanapp/common/data/DbObject;Lcom/tantanapp/common/data/DbObject;)Z

    .line 181
    .line 182
    .line 183
    goto :goto_3

    .line 184
    :cond_6
    iget-object v4, p0, Ll/wzh0;->k:Ljava/util/concurrent/ConcurrentHashMap;

    .line 185
    .line 186
    invoke-virtual {v4}, Ljava/util/concurrent/ConcurrentHashMap;->values()Ljava/util/Collection;

    .line 187
    .line 188
    .line 189
    move-result-object v4

    .line 190
    invoke-interface {v4}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 191
    .line 192
    .line 193
    move-result-object v4

    .line 194
    :goto_4
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 195
    .line 196
    .line 197
    move-result v5

    .line 198
    if-eqz v5, :cond_7

    .line 199
    .line 200
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 201
    .line 202
    .line 203
    move-result-object v5

    .line 204
    check-cast v5, Ll/wzh0$b;

    .line 205
    .line 206
    invoke-virtual {v5, v1, v3}, Ll/wzh0$b;->c(Lcom/tantanapp/common/data/DbObject;Lcom/tantanapp/common/data/DbObject;)V

    .line 207
    .line 208
    .line 209
    goto :goto_4

    .line 210
    :cond_7
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 211
    .line 212
    .line 213
    move-result v4

    .line 214
    if-eqz v4, :cond_8

    .line 215
    .line 216
    iget-object v4, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 217
    .line 218
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 219
    .line 220
    .line 221
    move-result v4

    .line 222
    if-eqz v4, :cond_8

    .line 223
    .line 224
    new-instance v4, Ljava/lang/StringBuffer;

    .line 225
    .line 226
    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    .line 227
    .line 228
    .line 229
    new-instance v5, Ljava/lang/StringBuilder;

    .line 230
    .line 231
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 232
    .line 233
    .line 234
    const-string v6, "update table id error :"

    .line 235
    .line 236
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 237
    .line 238
    .line 239
    iget-object v6, p0, Ll/wzh0;->d:Ljava/lang/String;

    .line 240
    .line 241
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 242
    .line 243
    .line 244
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 245
    .line 246
    .line 247
    move-result-object v5

    .line 248
    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 249
    .line 250
    .line 251
    new-instance v5, Ljava/lang/StringBuilder;

    .line 252
    .line 253
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 254
    .line 255
    .line 256
    const-string v6, ", detail: "

    .line 257
    .line 258
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 259
    .line 260
    .line 261
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ValueObject;->toJson()Ljava/lang/String;

    .line 262
    .line 263
    .line 264
    move-result-object v6

    .line 265
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 266
    .line 267
    .line 268
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 269
    .line 270
    .line 271
    move-result-object v5

    .line 272
    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 273
    .line 274
    .line 275
    const-string v5, " , new id: "

    .line 276
    .line 277
    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 278
    .line 279
    .line 280
    iget-object v5, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 281
    .line 282
    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 283
    .line 284
    .line 285
    new-instance v5, Ljava/lang/RuntimeException;

    .line 286
    .line 287
    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    .line 288
    .line 289
    .line 290
    move-result-object v4

    .line 291
    invoke-direct {v5, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 292
    .line 293
    .line 294
    invoke-static {v5}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 295
    .line 296
    .line 297
    :cond_8
    iget-object v4, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 298
    .line 299
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 300
    .line 301
    .line 302
    move-result v4

    .line 303
    if-nez v4, :cond_9

    .line 304
    .line 305
    iget-object v4, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 306
    .line 307
    iget-object v5, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 308
    .line 309
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 310
    .line 311
    .line 312
    move-result v4

    .line 313
    if-nez v4, :cond_9

    .line 314
    .line 315
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 316
    .line 317
    invoke-virtual {p0, v1}, Lcom/tantanapp/common/data/orm/LruCache2;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 318
    .line 319
    .line 320
    goto/16 :goto_9

    .line 321
    .line 322
    :cond_9
    iget-object v1, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 323
    .line 324
    invoke-virtual {p0, v1, v3}, Lcom/tantanapp/common/data/orm/LruCache2;->cache(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 325
    .line 326
    .line 327
    goto/16 :goto_9

    .line 328
    .line 329
    :cond_a
    iget-object v1, v0, Ll/ds4;->b:Lcom/tantanapp/common/data/DbObject;

    .line 330
    .line 331
    iget-object v3, p0, Ll/wzh0;->g:Ljava/util/concurrent/ConcurrentHashMap;

    .line 332
    .line 333
    invoke-virtual {v3}, Ljava/util/concurrent/ConcurrentHashMap;->values()Ljava/util/Collection;

    .line 334
    .line 335
    .line 336
    move-result-object v3

    .line 337
    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 338
    .line 339
    .line 340
    move-result-object v3

    .line 341
    :goto_5
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 342
    .line 343
    .line 344
    move-result v4

    .line 345
    if-eqz v4, :cond_b

    .line 346
    .line 347
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 348
    .line 349
    .line 350
    move-result-object v4

    .line 351
    check-cast v4, Ll/wzh0$d;

    .line 352
    .line 353
    invoke-virtual {v4, v1}, Ll/wzh0$d;->p(Lcom/tantanapp/common/data/DbObject;)Z

    .line 354
    .line 355
    .line 356
    goto :goto_5

    .line 357
    :cond_b
    iget-object v3, p0, Ll/wzh0;->k:Ljava/util/concurrent/ConcurrentHashMap;

    .line 358
    .line 359
    invoke-virtual {v3}, Ljava/util/concurrent/ConcurrentHashMap;->values()Ljava/util/Collection;

    .line 360
    .line 361
    .line 362
    move-result-object v3

    .line 363
    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 364
    .line 365
    .line 366
    move-result-object v3

    .line 367
    :goto_6
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 368
    .line 369
    .line 370
    move-result v4

    .line 371
    if-eqz v4, :cond_c

    .line 372
    .line 373
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 374
    .line 375
    .line 376
    move-result-object v4

    .line 377
    check-cast v4, Ll/wzh0$b;

    .line 378
    .line 379
    invoke-virtual {v4, v1}, Ll/wzh0$b;->b(Lcom/tantanapp/common/data/DbObject;)V

    .line 380
    .line 381
    .line 382
    goto :goto_6

    .line 383
    :cond_c
    iget-object v3, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 384
    .line 385
    invoke-virtual {p0, v3, v1}, Lcom/tantanapp/common/data/orm/LruCache2;->cache(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 386
    .line 387
    .line 388
    goto :goto_9

    .line 389
    :cond_d
    iget-object v1, v0, Ll/ds4;->b:Lcom/tantanapp/common/data/DbObject;

    .line 390
    .line 391
    iget-object v3, p0, Ll/wzh0;->g:Ljava/util/concurrent/ConcurrentHashMap;

    .line 392
    .line 393
    invoke-virtual {v3}, Ljava/util/concurrent/ConcurrentHashMap;->values()Ljava/util/Collection;

    .line 394
    .line 395
    .line 396
    move-result-object v3

    .line 397
    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 398
    .line 399
    .line 400
    move-result-object v3

    .line 401
    :goto_7
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 402
    .line 403
    .line 404
    move-result v4

    .line 405
    if-eqz v4, :cond_e

    .line 406
    .line 407
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 408
    .line 409
    .line 410
    move-result-object v4

    .line 411
    check-cast v4, Ll/wzh0$d;

    .line 412
    .line 413
    invoke-virtual {v4, v1}, Ll/wzh0$d;->o(Lcom/tantanapp/common/data/DbObject;)V

    .line 414
    .line 415
    .line 416
    goto :goto_7

    .line 417
    :cond_e
    iget-object v3, p0, Ll/wzh0;->k:Ljava/util/concurrent/ConcurrentHashMap;

    .line 418
    .line 419
    invoke-virtual {v3}, Ljava/util/concurrent/ConcurrentHashMap;->values()Ljava/util/Collection;

    .line 420
    .line 421
    .line 422
    move-result-object v3

    .line 423
    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 424
    .line 425
    .line 426
    move-result-object v3

    .line 427
    :goto_8
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 428
    .line 429
    .line 430
    move-result v4

    .line 431
    if-eqz v4, :cond_f

    .line 432
    .line 433
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 434
    .line 435
    .line 436
    move-result-object v4

    .line 437
    check-cast v4, Ll/wzh0$b;

    .line 438
    .line 439
    invoke-virtual {v4, v1}, Ll/wzh0$b;->a(Lcom/tantanapp/common/data/DbObject;)V

    .line 440
    .line 441
    .line 442
    goto :goto_8

    .line 443
    :cond_f
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 444
    .line 445
    invoke-virtual {p0, v1}, Lcom/tantanapp/common/data/orm/LruCache2;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 446
    .line 447
    .line 448
    :cond_10
    :goto_9
    iget-object v1, v0, Ll/ds4;->b:Lcom/tantanapp/common/data/DbObject;

    .line 449
    .line 450
    if-eqz v1, :cond_12

    .line 451
    .line 452
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 453
    .line 454
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 455
    .line 456
    .line 457
    move-result v1

    .line 458
    if-nez v1, :cond_12

    .line 459
    .line 460
    iget-object v1, p0, Ll/wzh0;->j:Ljava/util/concurrent/ConcurrentHashMap;

    .line 461
    .line 462
    iget-object v3, v0, Ll/ds4;->b:Lcom/tantanapp/common/data/DbObject;

    .line 463
    .line 464
    iget-object v3, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 465
    .line 466
    invoke-virtual {v1, v3}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 467
    .line 468
    .line 469
    move-result-object v1

    .line 470
    check-cast v1, Ll/wzh0$c;

    .line 471
    .line 472
    if-eqz v1, :cond_12

    .line 473
    .line 474
    iget-object v3, v0, Ll/ds4;->c:Lcom/tantanapp/common/data/DbObject;

    .line 475
    .line 476
    if-eqz v3, :cond_11

    .line 477
    .line 478
    iget-object v4, v0, Ll/ds4;->b:Lcom/tantanapp/common/data/DbObject;

    .line 479
    .line 480
    invoke-virtual {v4, v3}, Lcom/tantanapp/common/data/DbObject;->equals(Ljava/lang/Object;)Z

    .line 481
    .line 482
    .line 483
    move-result v3

    .line 484
    if-nez v3, :cond_12

    .line 485
    .line 486
    iput-boolean v2, v1, Ll/wzh0$c;->d:Z

    .line 487
    .line 488
    goto :goto_a

    .line 489
    :cond_11
    iput-boolean v2, v1, Ll/wzh0$c;->d:Z

    .line 490
    .line 491
    :cond_12
    :goto_a
    iget-object v1, v0, Ll/ds4;->c:Lcom/tantanapp/common/data/DbObject;

    .line 492
    .line 493
    if-eqz v1, :cond_0

    .line 494
    .line 495
    iget-object v3, v0, Ll/ds4;->b:Lcom/tantanapp/common/data/DbObject;

    .line 496
    .line 497
    if-eqz v3, :cond_13

    .line 498
    .line 499
    iget-object v3, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 500
    .line 501
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 502
    .line 503
    invoke-static {v3, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 504
    .line 505
    .line 506
    move-result v1

    .line 507
    if-eqz v1, :cond_13

    .line 508
    .line 509
    goto/16 :goto_0

    .line 510
    .line 511
    :cond_13
    iget-object v1, p0, Ll/wzh0;->j:Ljava/util/concurrent/ConcurrentHashMap;

    .line 512
    .line 513
    iget-object v3, v0, Ll/ds4;->c:Lcom/tantanapp/common/data/DbObject;

    .line 514
    .line 515
    iget-object v3, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 516
    .line 517
    invoke-virtual {v1, v3}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 518
    .line 519
    .line 520
    move-result-object v1

    .line 521
    check-cast v1, Ll/wzh0$c;

    .line 522
    .line 523
    if-eqz v1, :cond_0

    .line 524
    .line 525
    iget-object v3, v0, Ll/ds4;->b:Lcom/tantanapp/common/data/DbObject;

    .line 526
    .line 527
    if-eqz v3, :cond_14

    .line 528
    .line 529
    iget-object v0, v0, Ll/ds4;->c:Lcom/tantanapp/common/data/DbObject;

    .line 530
    .line 531
    invoke-virtual {v0, v3}, Lcom/tantanapp/common/data/DbObject;->equals(Ljava/lang/Object;)Z

    .line 532
    .line 533
    .line 534
    move-result v0

    .line 535
    if-nez v0, :cond_0

    .line 536
    .line 537
    iput-boolean v2, v1, Ll/wzh0$c;->d:Z

    .line 538
    .line 539
    goto/16 :goto_0

    .line 540
    .line 541
    :cond_14
    iput-boolean v2, v1, Ll/wzh0$c;->d:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 542
    .line 543
    goto/16 :goto_0

    .line 544
    .line 545
    :catchall_0
    move-exception p0

    .line 546
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 547
    .line 548
    .line 549
    :cond_15
    return-void
.end method

.method public final synthetic t(Ljava/lang/String;Ll/wzh0$c;Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wzh0;->j:Ljava/util/concurrent/ConcurrentHashMap;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    invoke-virtual {p2, p3}, Ll/wzh0$c;->g(Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public triggerMergeUpdates()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/wzh0;->g:Ljava/util/concurrent/ConcurrentHashMap;

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
    check-cast v1, Ll/wzh0$d;

    .line 22
    .line 23
    invoke-virtual {v1}, Ll/wzh0$d;->r()V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    iget-object v0, p0, Ll/wzh0;->k:Ljava/util/concurrent/ConcurrentHashMap;

    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentHashMap;->values()Ljava/util/Collection;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-eqz v1, :cond_1

    .line 42
    .line 43
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    check-cast v1, Ll/wzh0$b;

    .line 48
    .line 49
    invoke-virtual {v1}, Ll/wzh0$b;->e()V

    .line 50
    .line 51
    .line 52
    goto :goto_1

    .line 53
    :cond_1
    iget-object p0, p0, Ll/wzh0;->j:Ljava/util/concurrent/ConcurrentHashMap;

    .line 54
    .line 55
    invoke-virtual {p0}, Ljava/util/concurrent/ConcurrentHashMap;->values()Ljava/util/Collection;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    :goto_2
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    if-eqz v0, :cond_2

    .line 68
    .line 69
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    check-cast v0, Ll/wzh0$c;

    .line 74
    .line 75
    invoke-virtual {v0}, Ll/wzh0$c;->f()V

    .line 76
    .line 77
    .line 78
    goto :goto_2

    .line 79
    :cond_2
    return-void
.end method

.method public final synthetic u(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wzh0;->j:Ljava/util/concurrent/ConcurrentHashMap;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/wzh0$c;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-static {v0}, Ll/wzh0$c;->c(Ll/wzh0$c;)Lrx/subjects/a;

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
    iget-object p0, p0, Ll/wzh0;->j:Ljava/util/concurrent/ConcurrentHashMap;

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    :cond_0
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
    invoke-virtual {p0, p1, v0}, Ll/wzh0;->uiGet(Ljava/lang/String;Z)Lrx/c;

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
    iget-object v0, p0, Ll/wzh0;->j:Ljava/util/concurrent/ConcurrentHashMap;

    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Ll/wzh0$c;

    .line 16
    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    new-instance v0, Ll/wzh0$c;

    .line 20
    .line 21
    invoke-direct {v0, p0, p1}, Ll/wzh0$c;-><init>(Ll/wzh0;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    iget-object v1, p0, Ll/wzh0;->j:Ljava/util/concurrent/ConcurrentHashMap;

    .line 25
    .line 26
    invoke-virtual {v1, p1, v0}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    :cond_1
    invoke-static {v0}, Ll/wzh0$c;->c(Ll/wzh0$c;)Lrx/subjects/a;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    new-instance v2, Ll/nzh0;

    .line 34
    .line 35
    invoke-direct {v2, p0, p1, v0, p2}, Ll/nzh0;-><init>(Ll/wzh0;Ljava/lang/String;Ll/wzh0$c;Z)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v1, v2}, Lrx/c;->doOnSubscribe(Ll/x20;)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object p2

    .line 42
    new-instance v0, Ll/ozh0;

    .line 43
    .line 44
    invoke-direct {v0, p0, p1}, Ll/ozh0;-><init>(Ll/wzh0;Ljava/lang/String;)V

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
    .locals 9
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
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 2
    .line 3
    .line 4
    if-nez p2, :cond_0

    .line 5
    .line 6
    sget-object v0, Lcom/tantanapp/common/data/orm/SqlSegment;->NULL:Lcom/tantanapp/common/data/orm/SqlSegment;

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    invoke-virtual {p2}, Lcom/tantanapp/common/data/orm/Filter;->emit()Lcom/tantanapp/common/data/orm/SqlSegment;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    :goto_0
    instance-of v1, p2, Ll/spq;

    .line 14
    .line 15
    if-eqz v1, :cond_1

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/wzh0;->o()Lio/requery/android/database/sqlite/SQLiteDatabase;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    check-cast p2, Ll/spq;

    .line 22
    .line 23
    const/4 v2, 0x0

    .line 24
    const/4 v3, -0x1

    .line 25
    invoke-virtual {p2, v2, v3}, Ll/spq;->querySql(Lcom/tantanapp/common/data/orm/Order;I)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    iget-object v2, v0, Lcom/tantanapp/common/data/orm/SqlSegment;->args:[Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {v1, p2, v2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    .line 32
    .line 33
    .line 34
    move-result-object p2

    .line 35
    goto :goto_1

    .line 36
    :cond_1
    invoke-virtual {p0}, Ll/wzh0;->o()Lio/requery/android/database/sqlite/SQLiteDatabase;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    iget-object v2, p0, Ll/wzh0;->d:Ljava/lang/String;

    .line 41
    .line 42
    iget-object v4, v0, Lcom/tantanapp/common/data/orm/SqlSegment;->part:Ljava/lang/String;

    .line 43
    .line 44
    iget-object v5, v0, Lcom/tantanapp/common/data/orm/SqlSegment;->args:[Ljava/lang/String;

    .line 45
    .line 46
    const/4 v7, 0x0

    .line 47
    const/4 v8, 0x0

    .line 48
    const/4 v3, 0x0

    .line 49
    const/4 v6, 0x0

    .line 50
    invoke-virtual/range {v1 .. v8}, Lio/requery/android/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    .line 51
    .line 52
    .line 53
    move-result-object p2

    .line 54
    :goto_1
    new-instance v1, Ljava/util/ArrayList;

    .line 55
    .line 56
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 57
    .line 58
    .line 59
    :goto_2
    :try_start_0
    invoke-interface {p2}, Landroid/database/Cursor;->moveToNext()Z

    .line 60
    .line 61
    .line 62
    move-result v2

    .line 63
    if-eqz v2, :cond_2

    .line 64
    .line 65
    iget-object v2, p0, Ll/wzh0;->b:Ll/vzf0;

    .line 66
    .line 67
    const/4 v3, 0x0

    .line 68
    invoke-virtual {v2, p2, v3}, Ll/vzf0;->read(Landroid/database/Cursor;I)Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    check-cast v2, Lcom/tantanapp/common/data/DbObject;

    .line 73
    .line 74
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 75
    .line 76
    .line 77
    goto :goto_2

    .line 78
    :catchall_0
    move-exception v0

    .line 79
    move-object p0, v0

    .line 80
    goto/16 :goto_7

    .line 81
    .line 82
    :cond_2
    invoke-interface {p2}, Landroid/database/Cursor;->close()V

    .line 83
    .line 84
    .line 85
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 86
    .line 87
    .line 88
    move-result p2

    .line 89
    if-lez p2, :cond_5

    .line 90
    .line 91
    new-instance p2, Landroid/content/ContentValues;

    .line 92
    .line 93
    invoke-direct {p2}, Landroid/content/ContentValues;-><init>()V

    .line 94
    .line 95
    .line 96
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 97
    .line 98
    .line 99
    move-result-object v2

    .line 100
    :goto_3
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 101
    .line 102
    .line 103
    move-result v3

    .line 104
    if-eqz v3, :cond_3

    .line 105
    .line 106
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 107
    .line 108
    .line 109
    move-result-object v3

    .line 110
    check-cast v3, Ll/pf60;

    .line 111
    .line 112
    iget-object v4, v3, Ll/pf60;->a:Ljava/lang/Object;

    .line 113
    .line 114
    check-cast v4, Lcom/tantanapp/common/data/orm/Column;

    .line 115
    .line 116
    iget-object v3, v3, Ll/pf60;->b:Ljava/lang/Object;

    .line 117
    .line 118
    invoke-virtual {v4, p2, v3}, Lcom/tantanapp/common/data/orm/Column;->put(Landroid/content/ContentValues;Ljava/lang/Object;)V

    .line 119
    .line 120
    .line 121
    goto :goto_3

    .line 122
    :cond_3
    invoke-virtual {p0}, Ll/wzh0;->o()Lio/requery/android/database/sqlite/SQLiteDatabase;

    .line 123
    .line 124
    .line 125
    move-result-object v2

    .line 126
    iget-object v3, p0, Ll/wzh0;->d:Ljava/lang/String;

    .line 127
    .line 128
    iget-object v4, v0, Lcom/tantanapp/common/data/orm/SqlSegment;->part:Ljava/lang/String;

    .line 129
    .line 130
    iget-object v0, v0, Lcom/tantanapp/common/data/orm/SqlSegment;->args:[Ljava/lang/String;

    .line 131
    .line 132
    invoke-virtual {v2, v3, p2, v4, v0}, Lio/requery/android/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 133
    .line 134
    .line 135
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 136
    .line 137
    .line 138
    move-result-object p2

    .line 139
    :goto_4
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 140
    .line 141
    .line 142
    move-result v0

    .line 143
    if-eqz v0, :cond_5

    .line 144
    .line 145
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 146
    .line 147
    .line 148
    move-result-object v0

    .line 149
    check-cast v0, Lcom/tantanapp/common/data/DbObject;

    .line 150
    .line 151
    :try_start_1
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ValueObject;->clone()Lcom/google/protobuf/nano/MessageNano;

    .line 152
    .line 153
    .line 154
    move-result-object v1

    .line 155
    check-cast v1, Lcom/tantanapp/common/data/DbObject;

    .line 156
    .line 157
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 158
    .line 159
    .line 160
    move-result-object v2

    .line 161
    :goto_5
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 162
    .line 163
    .line 164
    move-result v3

    .line 165
    if-eqz v3, :cond_4

    .line 166
    .line 167
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 168
    .line 169
    .line 170
    move-result-object v3

    .line 171
    check-cast v3, Ll/pf60;

    .line 172
    .line 173
    iget-object v4, v3, Ll/pf60;->a:Ljava/lang/Object;

    .line 174
    .line 175
    check-cast v4, Lcom/tantanapp/common/data/orm/Column;

    .line 176
    .line 177
    iget-object v3, v3, Ll/pf60;->b:Ljava/lang/Object;

    .line 178
    .line 179
    invoke-virtual {v4, v1, v3}, Lcom/tantanapp/common/data/orm/Column;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 180
    .line 181
    .line 182
    goto :goto_5

    .line 183
    :catch_0
    move-exception v0

    .line 184
    goto :goto_6

    .line 185
    :cond_4
    invoke-virtual {p0, v0, v1}, Ll/wzh0;->B(Lcom/tantanapp/common/data/DbObject;Lcom/tantanapp/common/data/DbObject;)V

    .line 186
    .line 187
    .line 188
    invoke-virtual {p0, v0, v1}, Ll/wzh0;->C(Lcom/tantanapp/common/data/DbObject;Lcom/tantanapp/common/data/DbObject;)V

    .line 189
    .line 190
    .line 191
    invoke-virtual {p0}, Ll/wzh0;->A()Lcom/p1/mobile/putong/dbcenter/db/opt/TransactionOpt;

    .line 192
    .line 193
    .line 194
    move-result-object v2

    .line 195
    invoke-virtual {v2, p0, v0, v1}, Lcom/p1/mobile/putong/dbcenter/db/opt/TransactionOpt;->update(Ll/wzh0;Lcom/tantanapp/common/data/DbObject;Lcom/tantanapp/common/data/DbObject;)V
    :try_end_1
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_1 .. :try_end_1} :catch_0

    .line 196
    .line 197
    .line 198
    goto :goto_4

    .line 199
    :goto_6
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 200
    .line 201
    .line 202
    goto :goto_4

    .line 203
    :cond_5
    return-void

    .line 204
    :goto_7
    invoke-interface {p2}, Landroid/database/Cursor;->close()V

    .line 205
    .line 206
    .line 207
    throw p0
.end method

.method public updateBy_id(Lcom/tantanapp/common/data/DbObject;)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/wzh0;->o()Lio/requery/android/database/sqlite/SQLiteDatabase;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v1, p0, Ll/wzh0;->d:Ljava/lang/String;

    .line 9
    .line 10
    new-instance v2, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 13
    .line 14
    .line 15
    sget-object v8, Lcom/tantanapp/common/data/DbObject;->_ID:Lcom/tantanapp/common/data/orm/LongColumn;

    .line 16
    .line 17
    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    const-string v9, " = ?"

    .line 21
    .line 22
    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    iget-wide v4, p1, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 30
    .line 31
    invoke-static {v4, v5}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    filled-new-array {v2}, [Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v4

    .line 39
    const/4 v6, 0x0

    .line 40
    const/4 v7, 0x0

    .line 41
    const/4 v2, 0x0

    .line 42
    const/4 v5, 0x0

    .line 43
    invoke-virtual/range {v0 .. v7}, Lio/requery/android/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    :try_start_0
    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-eqz v0, :cond_0

    .line 52
    .line 53
    iget-object v0, p0, Ll/wzh0;->b:Ll/vzf0;

    .line 54
    .line 55
    const/4 v2, 0x0

    .line 56
    invoke-virtual {v0, v1, v2}, Ll/vzf0;->read(Landroid/database/Cursor;I)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    check-cast v0, Lcom/tantanapp/common/data/DbObject;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :catchall_0
    move-exception v0

    .line 64
    move-object p0, v0

    .line 65
    goto :goto_1

    .line 66
    :cond_0
    const/4 v0, 0x0

    .line 67
    :goto_0
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 68
    .line 69
    .line 70
    if-eqz v0, :cond_1

    .line 71
    .line 72
    new-instance v1, Landroid/content/ContentValues;

    .line 73
    .line 74
    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    .line 75
    .line 76
    .line 77
    iget-object v2, p0, Ll/wzh0;->b:Ll/vzf0;

    .line 78
    .line 79
    invoke-virtual {v2, p1, v1}, Ll/vzf0;->write(Ljava/lang/Object;Landroid/content/ContentValues;)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {p0}, Ll/wzh0;->o()Lio/requery/android/database/sqlite/SQLiteDatabase;

    .line 83
    .line 84
    .line 85
    move-result-object v2

    .line 86
    iget-object v3, p0, Ll/wzh0;->d:Ljava/lang/String;

    .line 87
    .line 88
    new-instance v4, Ljava/lang/StringBuilder;

    .line 89
    .line 90
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 91
    .line 92
    .line 93
    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object v4

    .line 103
    iget-wide v5, p1, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 104
    .line 105
    invoke-static {v5, v6}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v5

    .line 109
    filled-new-array {v5}, [Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object v5

    .line 113
    invoke-virtual {v2, v3, v1, v4, v5}, Lio/requery/android/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 114
    .line 115
    .line 116
    invoke-virtual {p0}, Ll/wzh0;->A()Lcom/p1/mobile/putong/dbcenter/db/opt/TransactionOpt;

    .line 117
    .line 118
    .line 119
    move-result-object v1

    .line 120
    invoke-virtual {v1, p0, v0, p1}, Lcom/p1/mobile/putong/dbcenter/db/opt/TransactionOpt;->update(Ll/wzh0;Lcom/tantanapp/common/data/DbObject;Lcom/tantanapp/common/data/DbObject;)V

    .line 121
    .line 122
    .line 123
    :cond_1
    return-void

    .line 124
    :goto_1
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 125
    .line 126
    .line 127
    throw p0
.end method

.method public upsert(Lcom/tantanapp/common/data/DbObject;Ll/z20;)Lcom/tantanapp/common/data/DbObject;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Ll/z20<",
            "TT;TT;>;)TT;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/wzh0;->o()Lio/requery/android/database/sqlite/SQLiteDatabase;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v1, p0, Ll/wzh0;->d:Ljava/lang/String;

    .line 9
    .line 10
    new-instance v2, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 13
    .line 14
    .line 15
    sget-object v8, Lcom/tantanapp/common/data/DbObject;->ID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 16
    .line 17
    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    const-string v9, " = ?"

    .line 21
    .line 22
    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    iget-object v2, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 30
    .line 31
    filled-new-array {v2}, [Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v4

    .line 35
    const/4 v6, 0x0

    .line 36
    const/4 v7, 0x0

    .line 37
    const/4 v2, 0x0

    .line 38
    const/4 v5, 0x0

    .line 39
    invoke-virtual/range {v0 .. v7}, Lio/requery/android/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    :try_start_0
    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    const/4 v2, 0x0

    .line 48
    if-eqz v0, :cond_0

    .line 49
    .line 50
    iget-object v0, p0, Ll/wzh0;->b:Ll/vzf0;

    .line 51
    .line 52
    const/4 v3, 0x0

    .line 53
    invoke-virtual {v0, v1, v3}, Ll/vzf0;->read(Landroid/database/Cursor;I)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    check-cast v0, Lcom/tantanapp/common/data/DbObject;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :catchall_0
    move-exception v0

    .line 61
    move-object p0, v0

    .line 62
    goto/16 :goto_1

    .line 63
    .line 64
    :cond_0
    move-object v0, v2

    .line 65
    :goto_0
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 66
    .line 67
    .line 68
    if-eqz v0, :cond_3

    .line 69
    .line 70
    iget-wide v1, v0, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 71
    .line 72
    iput-wide v1, p1, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 73
    .line 74
    if-eqz p2, :cond_1

    .line 75
    .line 76
    invoke-interface {p2, p1, v0}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 77
    .line 78
    .line 79
    :cond_1
    invoke-virtual {p1, v0}, Lcom/tantanapp/common/data/ValueObject;->mergeData(Lcom/tantanapp/common/data/ValueObject;)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {v0, p1}, Lcom/tantanapp/common/data/DbObject;->equals(Ljava/lang/Object;)Z

    .line 83
    .line 84
    .line 85
    move-result p2

    .line 86
    if-nez p2, :cond_2

    .line 87
    .line 88
    new-instance p2, Landroid/content/ContentValues;

    .line 89
    .line 90
    invoke-direct {p2}, Landroid/content/ContentValues;-><init>()V

    .line 91
    .line 92
    .line 93
    iget-object v1, p0, Ll/wzh0;->b:Ll/vzf0;

    .line 94
    .line 95
    invoke-virtual {v1, p1, p2}, Ll/vzf0;->write(Ljava/lang/Object;Landroid/content/ContentValues;)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {p0}, Ll/wzh0;->o()Lio/requery/android/database/sqlite/SQLiteDatabase;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    iget-object v2, p0, Ll/wzh0;->d:Ljava/lang/String;

    .line 103
    .line 104
    new-instance v3, Ljava/lang/StringBuilder;

    .line 105
    .line 106
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 107
    .line 108
    .line 109
    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 110
    .line 111
    .line 112
    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 113
    .line 114
    .line 115
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v3

    .line 119
    iget-object v4, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 120
    .line 121
    filled-new-array {v4}, [Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object v4

    .line 125
    invoke-virtual {v1, v2, p2, v3, v4}, Lio/requery/android/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 126
    .line 127
    .line 128
    move-result p2

    .line 129
    if-lez p2, :cond_2

    .line 130
    .line 131
    invoke-virtual {p0, v0, p1}, Ll/wzh0;->B(Lcom/tantanapp/common/data/DbObject;Lcom/tantanapp/common/data/DbObject;)V

    .line 132
    .line 133
    .line 134
    invoke-virtual {p0, v0, p1}, Ll/wzh0;->C(Lcom/tantanapp/common/data/DbObject;Lcom/tantanapp/common/data/DbObject;)V

    .line 135
    .line 136
    .line 137
    invoke-virtual {p0}, Ll/wzh0;->A()Lcom/p1/mobile/putong/dbcenter/db/opt/TransactionOpt;

    .line 138
    .line 139
    .line 140
    move-result-object p2

    .line 141
    invoke-virtual {p2, p0, v0, p1}, Lcom/p1/mobile/putong/dbcenter/db/opt/TransactionOpt;->update(Ll/wzh0;Lcom/tantanapp/common/data/DbObject;Lcom/tantanapp/common/data/DbObject;)V

    .line 142
    .line 143
    .line 144
    :cond_2
    return-object p1

    .line 145
    :cond_3
    if-eqz p2, :cond_4

    .line 146
    .line 147
    invoke-interface {p2, p1, v2}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 148
    .line 149
    .line 150
    :cond_4
    new-instance p2, Landroid/content/ContentValues;

    .line 151
    .line 152
    invoke-direct {p2}, Landroid/content/ContentValues;-><init>()V

    .line 153
    .line 154
    .line 155
    iget-object v0, p0, Ll/wzh0;->b:Ll/vzf0;

    .line 156
    .line 157
    invoke-virtual {v0, p1, p2}, Ll/vzf0;->write(Ljava/lang/Object;Landroid/content/ContentValues;)V

    .line 158
    .line 159
    .line 160
    invoke-virtual {p0}, Ll/wzh0;->o()Lio/requery/android/database/sqlite/SQLiteDatabase;

    .line 161
    .line 162
    .line 163
    move-result-object v0

    .line 164
    iget-object v1, p0, Ll/wzh0;->d:Ljava/lang/String;

    .line 165
    .line 166
    invoke-virtual {v0, v1, v2, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    .line 167
    .line 168
    .line 169
    move-result-wide v0

    .line 170
    iput-wide v0, p1, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 171
    .line 172
    invoke-virtual {p0, p1}, Ll/wzh0;->l(Lcom/tantanapp/common/data/DbObject;)V

    .line 173
    .line 174
    .line 175
    invoke-virtual {p0}, Ll/wzh0;->A()Lcom/p1/mobile/putong/dbcenter/db/opt/TransactionOpt;

    .line 176
    .line 177
    .line 178
    move-result-object p2

    .line 179
    invoke-virtual {p2, p0, p1}, Lcom/p1/mobile/putong/dbcenter/db/opt/TransactionOpt;->insert(Ll/wzh0;Lcom/tantanapp/common/data/DbObject;)V

    .line 180
    .line 181
    .line 182
    invoke-virtual {p0, p1}, Ll/wzh0;->cacheQueryJoinData(Lcom/tantanapp/common/data/DbObject;)V

    .line 183
    .line 184
    .line 185
    return-object p1

    .line 186
    :goto_1
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 187
    .line 188
    .line 189
    throw p0
.end method

.method public upsert(Lcom/tantanapp/common/data/DbObject;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    const/4 v0, 0x0

    .line 190
    invoke-virtual {p0, p1, v0}, Ll/wzh0;->upsert(Lcom/tantanapp/common/data/DbObject;Ll/z20;)Lcom/tantanapp/common/data/DbObject;

    return-void
.end method

.method public final synthetic v(Ljava/lang/String;)V
    .locals 1

    .line 1
    new-instance v0, Ll/qzh0;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/qzh0;-><init>(Ll/wzh0;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-wide/16 p0, 0x3e8

    .line 7
    .line 8
    invoke-static {v0, p0, p1}, Lcom/tantanapp/common/utils/ThreadUtil;->h(Ljava/lang/Runnable;J)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic w(I)Ljava/util/List;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0, v0, p1}, Ll/wzh0;->query(Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/Order;I)Ljava/util/List;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public warmUp(II)V
    .locals 1

    .line 1
    new-instance v0, Ll/pzh0;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/pzh0;-><init>(Ll/wzh0;I)V

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

.method public final synthetic x(Ljava/util/List;)V
    .locals 2

    .line 1
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Lcom/tantanapp/common/data/DbObject;

    .line 16
    .line 17
    iget-object v1, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {p0, v1, v0}, Lcom/tantanapp/common/data/orm/LruCache2;->cache(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    return-void
.end method

.method public final synthetic y(I)V
    .locals 6

    .line 1
    invoke-static {}, Ll/l9c;->o()Ll/l9c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v2, Ll/rzh0;

    .line 6
    .line 7
    invoke-direct {v2, p0, p1}, Ll/rzh0;-><init>(Ll/wzh0;I)V

    .line 8
    .line 9
    .line 10
    new-instance v3, Ll/szh0;

    .line 11
    .line 12
    invoke-direct {v3, p0}, Ll/szh0;-><init>(Ll/wzh0;)V

    .line 13
    .line 14
    .line 15
    new-instance p1, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    const-string v1, "warmUp_"

    .line 18
    .line 19
    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Ll/wzh0;->d:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v5

    .line 31
    const/4 v1, 0x0

    .line 32
    const/4 v4, 0x0

    .line 33
    invoke-virtual/range {v0 .. v5}, Ll/l9c;->d(ZLl/pcj;Ll/y20;Ll/x20;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public z(Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/Order;IZ)Ljava/util/List;
    .locals 17
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/tantanapp/common/data/orm/Filter<",
            "TT;>;",
            "Lcom/tantanapp/common/data/orm/Order<",
            "TT;>;IZ)",
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
    if-eqz p4, :cond_0

    .line 10
    .line 11
    invoke-static {}, Ll/l9c;->o()Ll/l9c;

    .line 12
    .line 13
    .line 14
    move-result-object v4

    .line 15
    invoke-virtual {v4}, Ll/l9c;->r()Z

    .line 16
    .line 17
    .line 18
    move-result v4

    .line 19
    if-nez v4, :cond_0

    .line 20
    .line 21
    new-instance v0, Ljava/util/ArrayList;

    .line 22
    .line 23
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 24
    .line 25
    .line 26
    return-object v0

    .line 27
    :cond_0
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 28
    .line 29
    .line 30
    if-nez v1, :cond_1

    .line 31
    .line 32
    sget-object v4, Lcom/tantanapp/common/data/orm/SqlSegment;->NULL:Lcom/tantanapp/common/data/orm/SqlSegment;

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    invoke-virtual {v1}, Lcom/tantanapp/common/data/orm/Filter;->emit()Lcom/tantanapp/common/data/orm/SqlSegment;

    .line 36
    .line 37
    .line 38
    move-result-object v4

    .line 39
    :goto_0
    const/4 v5, 0x0

    .line 40
    const-string v6, ""

    .line 41
    .line 42
    if-lez v3, :cond_2

    .line 43
    .line 44
    new-instance v7, Ljava/lang/StringBuilder;

    .line 45
    .line 46
    invoke-direct {v7, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v7

    .line 56
    move-object/from16 v16, v7

    .line 57
    .line 58
    goto :goto_1

    .line 59
    :cond_2
    move-object/from16 v16, v5

    .line 60
    .line 61
    :goto_1
    instance-of v7, v1, Ll/spq;

    .line 62
    .line 63
    if-eqz v7, :cond_3

    .line 64
    .line 65
    move-object v5, v1

    .line 66
    check-cast v5, Ll/spq;

    .line 67
    .line 68
    invoke-virtual {v5, v2, v3}, Ll/spq;->querySql(Lcom/tantanapp/common/data/orm/Order;I)Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v5

    .line 72
    invoke-virtual {v0}, Ll/wzh0;->o()Lio/requery/android/database/sqlite/SQLiteDatabase;

    .line 73
    .line 74
    .line 75
    move-result-object v8

    .line 76
    iget-object v9, v4, Lcom/tantanapp/common/data/orm/SqlSegment;->args:[Ljava/lang/String;

    .line 77
    .line 78
    invoke-virtual {v8, v5, v9}, Lio/requery/android/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    .line 79
    .line 80
    .line 81
    move-result-object v5

    .line 82
    goto :goto_4

    .line 83
    :cond_3
    invoke-virtual {v0}, Ll/wzh0;->o()Lio/requery/android/database/sqlite/SQLiteDatabase;

    .line 84
    .line 85
    .line 86
    move-result-object v8

    .line 87
    iget-object v9, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 88
    .line 89
    iget-object v11, v4, Lcom/tantanapp/common/data/orm/SqlSegment;->part:Ljava/lang/String;

    .line 90
    .line 91
    iget-object v12, v4, Lcom/tantanapp/common/data/orm/SqlSegment;->args:[Ljava/lang/String;

    .line 92
    .line 93
    if-nez v2, :cond_4

    .line 94
    .line 95
    :goto_2
    move-object v15, v5

    .line 96
    goto :goto_3

    .line 97
    :cond_4
    invoke-virtual {v2}, Lcom/tantanapp/common/data/orm/Order;->emit()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v5

    .line 101
    goto :goto_2

    .line 102
    :goto_3
    const/4 v10, 0x0

    .line 103
    const/4 v13, 0x0

    .line 104
    const/4 v14, 0x0

    .line 105
    invoke-virtual/range {v8 .. v16}, Lio/requery/android/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    .line 106
    .line 107
    .line 108
    move-result-object v5

    .line 109
    :goto_4
    new-instance v8, Ljava/util/ArrayList;

    .line 110
    .line 111
    invoke-interface {v5}, Landroid/database/Cursor;->getCount()I

    .line 112
    .line 113
    .line 114
    move-result v9

    .line 115
    invoke-direct {v8, v9}, Ljava/util/ArrayList;-><init>(I)V

    .line 116
    .line 117
    .line 118
    if-eqz v7, :cond_5

    .line 119
    .line 120
    move-object v4, v1

    .line 121
    check-cast v4, Ll/spq;

    .line 122
    .line 123
    invoke-virtual {v4, v2, v3}, Ll/spq;->querySql(Lcom/tantanapp/common/data/orm/Order;I)Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    goto :goto_7

    .line 127
    :cond_5
    invoke-virtual {v0}, Ll/wzh0;->o()Lio/requery/android/database/sqlite/SQLiteDatabase;

    .line 128
    .line 129
    .line 130
    move-result-object v3

    .line 131
    new-instance v7, Ljava/lang/StringBuilder;

    .line 132
    .line 133
    const-string v9, "SELECT * FROM "

    .line 134
    .line 135
    invoke-direct {v7, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 136
    .line 137
    .line 138
    iget-object v9, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 139
    .line 140
    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    iget-object v9, v4, Lcom/tantanapp/common/data/orm/SqlSegment;->part:Ljava/lang/String;

    .line 144
    .line 145
    if-nez v9, :cond_6

    .line 146
    .line 147
    move-object v9, v6

    .line 148
    goto :goto_5

    .line 149
    :cond_6
    new-instance v9, Ljava/lang/StringBuilder;

    .line 150
    .line 151
    const-string v10, " WHERE "

    .line 152
    .line 153
    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 154
    .line 155
    .line 156
    iget-object v10, v4, Lcom/tantanapp/common/data/orm/SqlSegment;->part:Ljava/lang/String;

    .line 157
    .line 158
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 159
    .line 160
    .line 161
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 162
    .line 163
    .line 164
    move-result-object v9

    .line 165
    :goto_5
    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 166
    .line 167
    .line 168
    if-nez v2, :cond_7

    .line 169
    .line 170
    goto :goto_6

    .line 171
    :cond_7
    new-instance v6, Ljava/lang/StringBuilder;

    .line 172
    .line 173
    const-string v9, " ORDER BY "

    .line 174
    .line 175
    invoke-direct {v6, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 176
    .line 177
    .line 178
    invoke-virtual {v2}, Lcom/tantanapp/common/data/orm/Order;->emit()Ljava/lang/String;

    .line 179
    .line 180
    .line 181
    move-result-object v2

    .line 182
    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 183
    .line 184
    .line 185
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 186
    .line 187
    .line 188
    move-result-object v6

    .line 189
    :goto_6
    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 190
    .line 191
    .line 192
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 193
    .line 194
    .line 195
    move-result-object v2

    .line 196
    iget-object v4, v4, Lcom/tantanapp/common/data/orm/SqlSegment;->args:[Ljava/lang/String;

    .line 197
    .line 198
    invoke-static {v3, v2, v4}, Ll/wzh0;->q(Lio/requery/android/database/sqlite/SQLiteDatabase;Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    .line 199
    .line 200
    .line 201
    :cond_8
    :goto_7
    :try_start_0
    invoke-interface {v5}, Landroid/database/Cursor;->moveToNext()Z

    .line 202
    .line 203
    .line 204
    move-result v2

    .line 205
    if-eqz v2, :cond_9

    .line 206
    .line 207
    iget-object v2, v0, Ll/wzh0;->b:Ll/vzf0;

    .line 208
    .line 209
    const/4 v3, 0x0

    .line 210
    invoke-virtual {v2, v5, v3}, Ll/vzf0;->read(Landroid/database/Cursor;I)Ljava/lang/Object;

    .line 211
    .line 212
    .line 213
    move-result-object v2

    .line 214
    check-cast v2, Lcom/tantanapp/common/data/DbObject;

    .line 215
    .line 216
    invoke-interface {v8, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 217
    .line 218
    .line 219
    instance-of v3, v1, Ll/spq;

    .line 220
    .line 221
    if-eqz v3, :cond_8

    .line 222
    .line 223
    move-object v3, v1

    .line 224
    check-cast v3, Ll/spq;

    .line 225
    .line 226
    invoke-virtual {v3}, Ll/spq;->g()Ll/wzh0;

    .line 227
    .line 228
    .line 229
    move-result-object v4

    .line 230
    iget-object v4, v4, Ll/wzh0;->b:Ll/vzf0;

    .line 231
    .line 232
    iget-object v6, v0, Ll/wzh0;->b:Ll/vzf0;

    .line 233
    .line 234
    invoke-virtual {v6}, Ll/vzf0;->getReadIndex()I

    .line 235
    .line 236
    .line 237
    move-result v6

    .line 238
    invoke-virtual {v4, v5, v6}, Ll/vzf0;->read(Landroid/database/Cursor;I)Ljava/lang/Object;

    .line 239
    .line 240
    .line 241
    move-result-object v4

    .line 242
    check-cast v4, Lcom/tantanapp/common/data/ValueObject;

    .line 243
    .line 244
    invoke-virtual {v3}, Ll/spq;->g()Ll/wzh0;

    .line 245
    .line 246
    .line 247
    move-result-object v3

    .line 248
    iget-object v3, v3, Ll/wzh0;->b:Ll/vzf0;

    .line 249
    .line 250
    invoke-virtual {v3}, Ll/vzf0;->init()Ljava/lang/Object;

    .line 251
    .line 252
    .line 253
    move-result-object v3

    .line 254
    check-cast v3, Lcom/tantanapp/common/data/ValueObject;

    .line 255
    .line 256
    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 257
    .line 258
    .line 259
    move-result v3

    .line 260
    if-nez v3, :cond_8

    .line 261
    .line 262
    invoke-virtual {v2, v4}, Lcom/tantanapp/common/data/ValueObject;->addExtraData(Lcom/tantanapp/common/data/ValueObject;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 263
    .line 264
    .line 265
    goto :goto_7

    .line 266
    :catchall_0
    move-exception v0

    .line 267
    goto :goto_8

    .line 268
    :cond_9
    invoke-interface {v5}, Landroid/database/Cursor;->close()V

    .line 269
    .line 270
    .line 271
    return-object v8

    .line 272
    :goto_8
    invoke-interface {v5}, Landroid/database/Cursor;->close()V

    .line 273
    .line 274
    .line 275
    throw v0
.end method
