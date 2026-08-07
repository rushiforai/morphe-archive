.class public Ll/wzh0$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/wzh0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Lcom/tantanapp/common/data/orm/Filter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Filter<",
            "TT;>;"
        }
    .end annotation
.end field

.field public final c:Lcom/tantanapp/common/data/orm/Order;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Order<",
            "TT;>;"
        }
    .end annotation
.end field

.field public final d:I

.field public final e:I

.field public f:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap<",
            "Ljava/lang/String;",
            "Ll/wzh0<",
            "TT;>.a;>;"
        }
    .end annotation
.end field

.field public final synthetic g:Ll/wzh0;


# direct methods
.method public constructor <init>(Ll/wzh0;Ljava/lang/String;Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/Order;II)V
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
    iput-object p1, p0, Ll/wzh0$a;->g:Ll/wzh0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance p1, Ljava/util/concurrent/ConcurrentHashMap;

    .line 7
    .line 8
    invoke-direct {p1}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Ll/wzh0$a;->f:Ljava/util/concurrent/ConcurrentHashMap;

    .line 12
    .line 13
    invoke-static {p4}, Ll/u11;->d(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    iput-object p2, p0, Ll/wzh0$a;->a:Ljava/lang/String;

    .line 17
    .line 18
    iput-object p3, p0, Ll/wzh0$a;->b:Lcom/tantanapp/common/data/orm/Filter;

    .line 19
    .line 20
    iput-object p4, p0, Ll/wzh0$a;->c:Lcom/tantanapp/common/data/orm/Order;

    .line 21
    .line 22
    iput p5, p0, Ll/wzh0$a;->d:I

    .line 23
    .line 24
    iput p6, p0, Ll/wzh0$a;->e:I

    .line 25
    .line 26
    return-void
.end method

.method public static synthetic a(Ll/wzh0$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/wzh0$a;->h()V

    return-void
.end method

.method public static synthetic b(Ll/wzh0$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/wzh0$a;->i()V

    return-void
.end method

.method public static synthetic c(Ll/wzh0$a;Ll/wzh0$d;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/wzh0$a;->g(Ll/wzh0$d;Z)V

    return-void
.end method

.method public static bridge synthetic d(Ll/wzh0$a;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wzh0$a;->a:Ljava/lang/String;

    return-object p0
.end method


# virtual methods
.method public e()I
    .locals 2

    .line 1
    iget-object v0, p0, Ll/wzh0$a;->g:Ll/wzh0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/wzh0$a;->b:Lcom/tantanapp/common/data/orm/Filter;

    .line 4
    .line 5
    const/4 v1, -0x1

    .line 6
    invoke-virtual {v0, p0, v1}, Ll/wzh0;->count(Lcom/tantanapp/common/data/orm/Filter;I)I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method

.method public f()Z
    .locals 3

    .line 1
    iget-object v0, p0, Ll/wzh0$a;->g:Ll/wzh0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/wzh0$a;->b:Lcom/tantanapp/common/data/orm/Filter;

    .line 4
    .line 5
    iget-object p0, p0, Ll/wzh0$a;->c:Lcom/tantanapp/common/data/orm/Order;

    .line 6
    .line 7
    const/4 v2, 0x1

    .line 8
    invoke-virtual {v0, v1, p0, v2}, Ll/wzh0;->query(Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/Order;I)Ljava/util/List;

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

.method public final synthetic g(Ll/wzh0$d;Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wzh0$a;->g:Ll/wzh0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/wzh0;->g:Ljava/util/concurrent/ConcurrentHashMap;

    .line 4
    .line 5
    iget-object p0, p0, Ll/wzh0$a;->a:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, p0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1, p2}, Ll/wzh0$d;->t(Z)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic h()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/wzh0$a;->g:Ll/wzh0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/wzh0;->g:Ljava/util/concurrent/ConcurrentHashMap;

    .line 4
    .line 5
    iget-object v1, p0, Ll/wzh0$a;->a:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ll/wzh0$d;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-static {v0}, Ll/wzh0$d;->e(Ll/wzh0$d;)Lrx/subjects/a;

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
    if-nez v0, :cond_0

    .line 24
    .line 25
    iget-object v0, p0, Ll/wzh0$a;->g:Ll/wzh0;

    .line 26
    .line 27
    iget-object v0, v0, Ll/wzh0;->g:Ljava/util/concurrent/ConcurrentHashMap;

    .line 28
    .line 29
    iget-object p0, p0, Ll/wzh0$a;->a:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {v0, p0}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    :cond_0
    return-void
.end method

.method public final synthetic i()V
    .locals 3

    .line 1
    new-instance v0, Ll/vzh0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/vzh0;-><init>(Ll/wzh0$a;)V

    .line 4
    .line 5
    .line 6
    const-wide/16 v1, 0x3e8

    .line 7
    .line 8
    invoke-static {v0, v1, v2}, Lcom/tantanapp/common/utils/ThreadUtil;->h(Ljava/lang/Runnable;J)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public j()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/wzh0$a$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/wzh0$a$a;-><init>(Ll/wzh0$a;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public k(Ljava/util/List;)Lcom/tantanapp/common/data/orm/Filter;
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
    iget-object p0, p0, Ll/wzh0$a;->b:Lcom/tantanapp/common/data/orm/Filter;

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
    iget-object v1, p0, Ll/wzh0$a;->b:Lcom/tantanapp/common/data/orm/Filter;

    .line 23
    .line 24
    instance-of v2, v1, Ll/spq;

    .line 25
    .line 26
    if-eqz v2, :cond_1

    .line 27
    .line 28
    check-cast v1, Ll/spq;

    .line 29
    .line 30
    iget-object p0, p0, Ll/wzh0$a;->c:Lcom/tantanapp/common/data/orm/Order;

    .line 31
    .line 32
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    add-int/lit8 v0, v0, -0x1

    .line 37
    .line 38
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    check-cast p1, Lcom/tantanapp/common/data/DbObject;

    .line 43
    .line 44
    invoke-static {v1, p0, p1}, Ll/spq;->b(Ll/spq;Lcom/tantanapp/common/data/orm/Order;Lcom/tantanapp/common/data/DbObject;)Ll/spq;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    return-object p0

    .line 49
    :cond_1
    iget-object p0, p0, Ll/wzh0$a;->c:Lcom/tantanapp/common/data/orm/Order;

    .line 50
    .line 51
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    add-int/lit8 v2, v2, -0x1

    .line 56
    .line 57
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    check-cast p1, Lcom/tantanapp/common/data/DbObject;

    .line 62
    .line 63
    invoke-virtual {p0, p1}, Lcom/tantanapp/common/data/orm/Order;->GT_EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    sget-object p1, Lcom/tantanapp/common/data/DbObject;->_ID:Lcom/tantanapp/common/data/orm/LongColumn;

    .line 68
    .line 69
    iget-wide v2, v0, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 70
    .line 71
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-virtual {p1, v0}, Lcom/tantanapp/common/data/orm/ValueColumn;->NEQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    filled-new-array {v1, p0, p1}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    invoke-static {p0}, Lcom/tantanapp/common/data/orm/Filter;->AND([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    return-object p0
.end method

.method public l(Ljava/util/List;II)I
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

.method public m()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/util/List<",
            "TT;>;>;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Ll/wzh0$a;->n(Z)Lrx/c;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public n(Z)Lrx/c;
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
    iget-object v0, p0, Ll/wzh0$a;->g:Ll/wzh0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/wzh0;->g:Ljava/util/concurrent/ConcurrentHashMap;

    .line 4
    .line 5
    iget-object v1, p0, Ll/wzh0$a;->a:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ll/wzh0$d;

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    new-instance v0, Ll/wzh0$d;

    .line 16
    .line 17
    iget-object v1, p0, Ll/wzh0$a;->g:Ll/wzh0;

    .line 18
    .line 19
    invoke-direct {v0, v1, p0}, Ll/wzh0$d;-><init>(Ll/wzh0;Ll/wzh0$a;)V

    .line 20
    .line 21
    .line 22
    iget-object v1, p0, Ll/wzh0$a;->g:Ll/wzh0;

    .line 23
    .line 24
    iget-object v1, v1, Ll/wzh0;->g:Ljava/util/concurrent/ConcurrentHashMap;

    .line 25
    .line 26
    iget-object v2, p0, Ll/wzh0$a;->a:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {v1, v2, v0}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    iget-object v1, p0, Ll/wzh0$a;->b:Lcom/tantanapp/common/data/orm/Filter;

    .line 32
    .line 33
    instance-of v2, v1, Ll/spq;

    .line 34
    .line 35
    if-eqz v2, :cond_0

    .line 36
    .line 37
    check-cast v1, Ll/spq;

    .line 38
    .line 39
    iget-object v2, p0, Ll/wzh0$a;->g:Ll/wzh0;

    .line 40
    .line 41
    iget-object v2, v2, Ll/wzh0;->h:Ljava/util/concurrent/ConcurrentHashMap;

    .line 42
    .line 43
    iget-object v3, p0, Ll/wzh0$a;->a:Ljava/lang/String;

    .line 44
    .line 45
    invoke-virtual {v2, v3, v1}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v1}, Ll/spq;->g()Ll/wzh0;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    iget-object v2, v2, Ll/wzh0;->i:Ljava/util/concurrent/ConcurrentHashMap;

    .line 53
    .line 54
    iget-object v3, p0, Ll/wzh0$a;->a:Ljava/lang/String;

    .line 55
    .line 56
    invoke-virtual {v2, v3, v1}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    :cond_0
    invoke-static {v0}, Ll/wzh0$d;->e(Ll/wzh0$d;)Lrx/subjects/a;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    new-instance v2, Ll/tzh0;

    .line 64
    .line 65
    invoke-direct {v2, p0, v0, p1}, Ll/tzh0;-><init>(Ll/wzh0$a;Ll/wzh0$d;Z)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v1, v2}, Lrx/c;->doOnSubscribe(Ll/x20;)Lrx/c;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    new-instance v0, Ll/uzh0;

    .line 73
    .line 74
    invoke-direct {v0, p0}, Ll/uzh0;-><init>(Ll/wzh0$a;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {p1, v0}, Lrx/c;->doOnUnsubscribe(Ll/x20;)Lrx/c;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    return-object p0
.end method
