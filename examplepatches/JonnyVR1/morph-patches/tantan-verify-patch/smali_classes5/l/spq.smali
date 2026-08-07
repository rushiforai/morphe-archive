.class public abstract Ll/spq;
.super Lcom/tantanapp/common/data/orm/Filter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Lcom/tantanapp/common/data/DbObject;",
        "V:",
        "Lcom/tantanapp/common/data/DbObject;",
        ">",
        "Lcom/tantanapp/common/data/orm/Filter<",
        "TK;>;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/tantanapp/common/data/orm/Filter;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Ll/spq;Lcom/tantanapp/common/data/orm/Filter;)Ll/spq;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/tantanapp/common/data/DbObject;",
            "M:",
            "Lcom/tantanapp/common/data/DbObject;",
            ">(",
            "Ll/spq<",
            "TT;TM;>;",
            "Lcom/tantanapp/common/data/orm/Filter<",
            "TT;>;)",
            "Ll/spq<",
            "TT;TM;>;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/spq;->baseFilter()Lcom/tantanapp/common/data/orm/Filter;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/spq;->baseFilter()Lcom/tantanapp/common/data/orm/Filter;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    filled-new-array {v0, p1}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-static {p1}, Lcom/tantanapp/common/data/orm/Filter;->AND([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p0, p1}, Ll/spq;->setBaseFilter(Lcom/tantanapp/common/data/orm/Filter;)V

    .line 17
    .line 18
    .line 19
    return-object p0
.end method

.method public static b(Ll/spq;Lcom/tantanapp/common/data/orm/Order;Lcom/tantanapp/common/data/DbObject;)Ll/spq;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/tantanapp/common/data/DbObject;",
            "M:",
            "Lcom/tantanapp/common/data/DbObject;",
            ">(",
            "Ll/spq<",
            "TT;TM;>;",
            "Lcom/tantanapp/common/data/orm/Order;",
            "TT;)",
            "Ll/spq<",
            "TT;TM;>;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/spq;->d()Ll/wzh0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Ll/spq;->baseFilter()Lcom/tantanapp/common/data/orm/Filter;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {p0}, Ll/spq;->foreignC()Lcom/tantanapp/common/data/orm/StringColumn;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-virtual {p0}, Ll/spq;->g()Ll/wzh0;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    invoke-virtual {p0}, Ll/spq;->f()Lcom/tantanapp/common/data/orm/Filter;

    .line 18
    .line 19
    .line 20
    move-result-object v4

    .line 21
    invoke-virtual {p0}, Ll/spq;->e()Z

    .line 22
    .line 23
    .line 24
    move-result v5

    .line 25
    invoke-static/range {v0 .. v5}, Ll/spq;->c(Ll/wzh0;Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/StringColumn;Ll/wzh0;Lcom/tantanapp/common/data/orm/Filter;Z)Ll/spq;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    instance-of v0, p1, Ll/tpq;

    .line 30
    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    move-object v0, p1

    .line 34
    check-cast v0, Ll/tpq;

    .line 35
    .line 36
    invoke-virtual {v0}, Ll/tpq;->g()Lcom/tantanapp/common/data/orm/Order;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    if-nez v0, :cond_0

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_0
    invoke-virtual {p1, p2}, Lcom/tantanapp/common/data/orm/Order;->GT_EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    sget-object v0, Lcom/tantanapp/common/data/DbObject;->_ID:Lcom/tantanapp/common/data/orm/LongColumn;

    .line 48
    .line 49
    iget-wide v1, p2, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 50
    .line 51
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 52
    .line 53
    .line 54
    move-result-object p2

    .line 55
    invoke-virtual {v0, p2}, Lcom/tantanapp/common/data/orm/ValueColumn;->NEQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 56
    .line 57
    .line 58
    move-result-object p2

    .line 59
    filled-new-array {p1, p2}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    invoke-static {p1}, Lcom/tantanapp/common/data/orm/Filter;->AND([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    invoke-static {p0, p1}, Ll/spq;->a(Ll/spq;Lcom/tantanapp/common/data/orm/Filter;)Ll/spq;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    return-object p0

    .line 72
    :cond_1
    :goto_0
    invoke-virtual {p1, p2}, Lcom/tantanapp/common/data/orm/Order;->GT_EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    sget-object v0, Lcom/tantanapp/common/data/DbObject;->_ID:Lcom/tantanapp/common/data/orm/LongColumn;

    .line 77
    .line 78
    iget-wide v1, p2, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 79
    .line 80
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 81
    .line 82
    .line 83
    move-result-object p2

    .line 84
    invoke-virtual {v0, p2}, Lcom/tantanapp/common/data/orm/ValueColumn;->NEQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 85
    .line 86
    .line 87
    move-result-object p2

    .line 88
    filled-new-array {p1, p2}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    invoke-static {p1}, Lcom/tantanapp/common/data/orm/Filter;->AND([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    invoke-static {p0, p1}, Ll/spq;->a(Ll/spq;Lcom/tantanapp/common/data/orm/Filter;)Ll/spq;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    return-object p0
.end method

.method public static c(Ll/wzh0;Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/StringColumn;Ll/wzh0;Lcom/tantanapp/common/data/orm/Filter;Z)Ll/spq;
    .locals 7
    .param p0    # Ll/wzh0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/tantanapp/common/data/orm/StringColumn;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ll/wzh0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/tantanapp/common/data/DbObject;",
            "M:",
            "Lcom/tantanapp/common/data/DbObject;",
            ">(",
            "Ll/wzh0<",
            "TT;>;",
            "Lcom/tantanapp/common/data/orm/Filter<",
            "TT;>;",
            "Lcom/tantanapp/common/data/orm/StringColumn;",
            "Ll/wzh0<",
            "TM;>;",
            "Lcom/tantanapp/common/data/orm/Filter<",
            "TM;>;Z)",
            "Ll/spq<",
            "TT;TM;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/spq$a;

    .line 2
    .line 3
    move-object v4, p0

    .line 4
    move-object v1, p1

    .line 5
    move-object v6, p2

    .line 6
    move-object v5, p3

    .line 7
    move-object v2, p4

    .line 8
    move v3, p5

    .line 9
    invoke-direct/range {v0 .. v6}, Ll/spq$a;-><init>(Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/Filter;ZLl/wzh0;Ll/wzh0;Lcom/tantanapp/common/data/orm/StringColumn;)V

    .line 10
    .line 11
    .line 12
    return-object v0
.end method


# virtual methods
.method public abstract baseFilter()Lcom/tantanapp/common/data/orm/Filter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/tantanapp/common/data/orm/Filter<",
            "TK;>;"
        }
    .end annotation
.end method

.method public abstract countSql()Ljava/lang/String;
.end method

.method public abstract d()Ll/wzh0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/wzh0<",
            "TK;>;"
        }
    .end annotation
.end method

.method public abstract e()Z
.end method

.method public abstract f()Lcom/tantanapp/common/data/orm/Filter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/tantanapp/common/data/orm/Filter<",
            "TV;>;"
        }
    .end annotation
.end method

.method public abstract filter(Lcom/tantanapp/common/data/DbObject;Lcom/tantanapp/common/data/DbObject;)Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;)Z"
        }
    .end annotation
.end method

.method public abstract foreignC()Lcom/tantanapp/common/data/orm/StringColumn;
.end method

.method public abstract g()Ll/wzh0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/wzh0<",
            "TV;>;"
        }
    .end annotation
.end method

.method public abstract querySql(Lcom/tantanapp/common/data/orm/Order;I)Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/tantanapp/common/data/orm/Order<",
            "TK;>;I)",
            "Ljava/lang/String;"
        }
    .end annotation
.end method

.method public abstract setBaseFilter(Lcom/tantanapp/common/data/orm/Filter;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/tantanapp/common/data/orm/Filter<",
            "TK;>;)V"
        }
    .end annotation
.end method
