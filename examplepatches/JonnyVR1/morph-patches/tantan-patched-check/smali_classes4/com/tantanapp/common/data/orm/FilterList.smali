.class public Lcom/tantanapp/common/data/orm/FilterList;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private final filterArrayList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/tantanapp/common/data/orm/Filter<",
            "TT;>;>;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/tantanapp/common/data/orm/FilterList;->filterArrayList:Ljava/util/ArrayList;

    .line 10
    .line 11
    return-void
.end method

.method public static list()Lcom/tantanapp/common/data/orm/FilterList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">()",
            "Lcom/tantanapp/common/data/orm/FilterList<",
            "TR;>;"
        }
    .end annotation

    .line 10
    new-instance v0, Lcom/tantanapp/common/data/orm/FilterList;

    invoke-direct {v0}, Lcom/tantanapp/common/data/orm/FilterList;-><init>()V

    return-object v0
.end method

.method public static varargs list([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/FilterList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">([",
            "Lcom/tantanapp/common/data/orm/Filter<",
            "TR;>;)",
            "Lcom/tantanapp/common/data/orm/FilterList<",
            "TR;>;"
        }
    .end annotation

    .annotation runtime Ljava/lang/SafeVarargs;
    .end annotation

    .line 1
    new-instance v0, Lcom/tantanapp/common/data/orm/FilterList;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/tantanapp/common/data/orm/FilterList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p0}, Lcom/tantanapp/common/data/orm/FilterList;->addAll([Lcom/tantanapp/common/data/orm/Filter;)V

    .line 7
    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public add(Lcom/tantanapp/common/data/orm/Filter;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/tantanapp/common/data/orm/Filter<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/FilterList;->filterArrayList:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public varargs addAll([Lcom/tantanapp/common/data/orm/Filter;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lcom/tantanapp/common/data/orm/Filter<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/FilterList;->filterArrayList:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public getList()Ljava/util/ArrayList;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/tantanapp/common/data/orm/Filter<",
            "TT;>;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/FilterList;->filterArrayList:Ljava/util/ArrayList;

    .line 2
    .line 3
    return-object p0
.end method

.method public toFilters()[Lcom/tantanapp/common/data/orm/Filter;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()[",
            "Lcom/tantanapp/common/data/orm/Filter<",
            "TT;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/FilterList;->filterArrayList:Ljava/util/ArrayList;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    new-array v0, v0, [Lcom/tantanapp/common/data/orm/Filter;

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, [Lcom/tantanapp/common/data/orm/Filter;

    .line 11
    .line 12
    return-object p0
.end method
