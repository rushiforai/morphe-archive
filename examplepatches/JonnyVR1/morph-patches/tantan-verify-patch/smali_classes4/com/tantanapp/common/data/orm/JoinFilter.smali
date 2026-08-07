.class public abstract Lcom/tantanapp/common/data/orm/JoinFilter;
.super Lcom/tantanapp/common/data/orm/Filter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Lcom/tantanapp/common/data/DbObject;",
        ">",
        "Lcom/tantanapp/common/data/orm/Filter<",
        "TK;>;"
    }
.end annotation


# static fields
.field private static final COUNT_MODEL:Ljava/lang/String; = "SELECT count(t1._id) FROM ^1 AS t1, ^2 AS t2 WHERE ^3 "

.field private static final QUERY_MODEL:Ljava/lang/String; = "SELECT t1.* FROM ^1 AS t1, ^2 AS t2 WHERE ^3 "


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

.method public static AND(Lcom/tantanapp/common/data/orm/JoinFilter;Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/JoinFilter;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/tantanapp/common/data/DbObject;",
            "M:",
            "Lcom/tantanapp/common/data/DbObject;",
            ">(",
            "Lcom/tantanapp/common/data/orm/JoinFilter<",
            "TT;TM;>;",
            "Lcom/tantanapp/common/data/orm/Filter<",
            "TT;>;)",
            "Lcom/tantanapp/common/data/orm/JoinFilter<",
            "TT;TM;>;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/tantanapp/common/data/orm/JoinFilter;->baseFilter()Lcom/tantanapp/common/data/orm/Filter;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    filled-new-array {v0, p1}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-static {p1}, Lcom/tantanapp/common/data/orm/Filter;->AND([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p0, p1}, Lcom/tantanapp/common/data/orm/JoinFilter;->setBaseFilter(Lcom/tantanapp/common/data/orm/Filter;)V

    .line 14
    .line 15
    .line 16
    return-object p0
.end method

.method public static JOIN(Lcom/tantanapp/common/data/orm/DatabaseStore$Table;Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/StringColumn;Lcom/tantanapp/common/data/orm/DatabaseStore$Table;Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/JoinFilter;
    .locals 6
    .param p0    # Lcom/tantanapp/common/data/orm/DatabaseStore$Table;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/tantanapp/common/data/orm/StringColumn;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Lcom/tantanapp/common/data/orm/DatabaseStore$Table;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # Lcom/tantanapp/common/data/orm/Filter;
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
            "Lcom/tantanapp/common/data/orm/DatabaseStore$Table<",
            "TT;>;",
            "Lcom/tantanapp/common/data/orm/Filter<",
            "TT;>;",
            "Lcom/tantanapp/common/data/orm/StringColumn;",
            "Lcom/tantanapp/common/data/orm/DatabaseStore$Table<",
            "TM;>;",
            "Lcom/tantanapp/common/data/orm/Filter<",
            "TM;>;)",
            "Lcom/tantanapp/common/data/orm/JoinFilter<",
            "TT;TM;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/tantanapp/common/data/orm/JoinFilter$1;

    .line 2
    .line 3
    move-object v3, p0

    .line 4
    move-object v1, p1

    .line 5
    move-object v5, p2

    .line 6
    move-object v4, p3

    .line 7
    move-object v2, p4

    .line 8
    invoke-direct/range {v0 .. v5}, Lcom/tantanapp/common/data/orm/JoinFilter$1;-><init>(Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/DatabaseStore$Table;Lcom/tantanapp/common/data/orm/DatabaseStore$Table;Lcom/tantanapp/common/data/orm/StringColumn;)V

    .line 9
    .line 10
    .line 11
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

.method public abstract filter(Ljava/lang/Object;Lcom/tantanapp/common/data/DbObject;)Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;)Z"
        }
    .end annotation
.end method

.method public abstract foreignC()Lcom/tantanapp/common/data/orm/StringColumn;
.end method

.method public abstract joinTable()Lcom/tantanapp/common/data/orm/DatabaseStore$Table;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/tantanapp/common/data/orm/DatabaseStore$Table<",
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
