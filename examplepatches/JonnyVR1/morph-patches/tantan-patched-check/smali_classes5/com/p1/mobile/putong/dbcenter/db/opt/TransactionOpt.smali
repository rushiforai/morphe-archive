.class public Lcom/p1/mobile/putong/dbcenter/db/opt/TransactionOpt;
.super Ljava/util/HashMap;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/HashMap<",
        "Ljava/lang/String;",
        "Ljava/util/List<",
        "Ll/ds4;",
        ">;>;"
    }
.end annotation


# instance fields
.field public tickSynced:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ll/pf60<",
            "Ll/x20;",
            "Ll/x20;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

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
    iput-object v0, p0, Lcom/p1/mobile/putong/dbcenter/db/opt/TransactionOpt;->tickSynced:Ljava/util/ArrayList;

    .line 10
    .line 11
    return-void
.end method

.method private add(Ll/wzh0;Ll/ds4;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/wzh0;",
            "Ll/ds4;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object p1, p1, Ll/wzh0;->d:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/AbstractMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/util/List;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, p1, v0}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    :cond_0
    invoke-interface {v0, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public delete(Ll/wzh0;Lcom/tantanapp/common/data/DbObject;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/tantanapp/common/data/DbObject;",
            ">(",
            "Ll/wzh0;",
            "TT;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/ds4;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x0

    .line 5
    invoke-direct {v0, v1, p2, v2}, Ll/ds4;-><init>(ILcom/tantanapp/common/data/DbObject;Lcom/tantanapp/common/data/DbObject;)V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/dbcenter/db/opt/TransactionOpt;->add(Ll/wzh0;Ll/ds4;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public insert(Ll/wzh0;Lcom/tantanapp/common/data/DbObject;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/tantanapp/common/data/DbObject;",
            ">(",
            "Ll/wzh0;",
            "TT;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/ds4;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const/4 v2, 0x0

    .line 5
    invoke-direct {v0, v1, p2, v2}, Ll/ds4;-><init>(ILcom/tantanapp/common/data/DbObject;Lcom/tantanapp/common/data/DbObject;)V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/dbcenter/db/opt/TransactionOpt;->add(Ll/wzh0;Ll/ds4;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public joinUpdate(Ll/wzh0;Lcom/tantanapp/common/data/DbObject;Lcom/tantanapp/common/data/DbObject;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/tantanapp/common/data/DbObject;",
            ">(",
            "Ll/wzh0;",
            "TT;TT;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/ds4;

    .line 2
    .line 3
    const/4 v1, 0x3

    .line 4
    invoke-direct {v0, v1, p2, p3}, Ll/ds4;-><init>(ILcom/tantanapp/common/data/DbObject;Lcom/tantanapp/common/data/DbObject;)V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/dbcenter/db/opt/TransactionOpt;->add(Ll/wzh0;Ll/ds4;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public update(Ll/wzh0;Lcom/tantanapp/common/data/DbObject;Lcom/tantanapp/common/data/DbObject;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/tantanapp/common/data/DbObject;",
            ">(",
            "Ll/wzh0;",
            "TT;TT;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/ds4;

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    invoke-direct {v0, v1, p2, p3}, Ll/ds4;-><init>(ILcom/tantanapp/common/data/DbObject;Lcom/tantanapp/common/data/DbObject;)V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/dbcenter/db/opt/TransactionOpt;->add(Ll/wzh0;Ll/ds4;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
