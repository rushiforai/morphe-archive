.class public Ll/cr00;
.super Ll/wzh0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/wzh0<",
        "Lcom/p1/mobile/putong/feed/data/Moment;",
        ">;"
    }
.end annotation


# instance fields
.field public m:Ll/wzh0$a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/wzh0<",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ">.a;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/h9c;Ljava/lang/String;Ll/vzf0;Ljava/util/List;I)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/h9c;",
            "Ljava/lang/String;",
            "Ll/vzf0<",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ">;",
            "Ljava/util/List<",
            "Lcom/tantanapp/common/data/orm/Index;",
            ">;I)V"
        }
    .end annotation

    .line 1
    invoke-direct/range {p0 .. p5}, Ll/wzh0;-><init>(Ll/h9c;Ljava/lang/String;Ll/vzf0;Ljava/util/List;I)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/wzh0$a;

    .line 5
    .line 6
    sget-object p1, Lcom/p1/mobile/putong/feed/data/Moment;->LOCALINFEED:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/tantanapp/common/data/orm/BooleanColumn;->T()Lcom/tantanapp/common/data/orm/Filter;

    .line 9
    .line 10
    .line 11
    move-result-object v3

    .line 12
    sget-object p1, Lcom/p1/mobile/putong/feed/data/Moment;->CREATEDTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 13
    .line 14
    iget-object v4, p1, Lcom/tantanapp/common/data/orm/OrderedColumn;->DESC:Lcom/tantanapp/common/data/orm/Order;

    .line 15
    .line 16
    const/4 v5, 0x0

    .line 17
    const/16 v6, 0x64

    .line 18
    .line 19
    const-string v2, "moments"

    .line 20
    .line 21
    move-object v1, p0

    .line 22
    invoke-direct/range {v0 .. v6}, Ll/wzh0$a;-><init>(Ll/wzh0;Ljava/lang/String;Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/Order;II)V

    .line 23
    .line 24
    .line 25
    iput-object v0, p0, Ll/cr00;->m:Ll/wzh0$a;

    .line 26
    .line 27
    return-void
.end method

.method public static synthetic F(Lcom/p1/mobile/putong/feed/data/Moment;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public G(Ljava/lang/String;)Ll/wzh0$a;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ll/wzh0<",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ">.a;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/wzh0$a;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "cachedMoments"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    sget-object v1, Lcom/p1/mobile/putong/feed/data/Moment;->OWNER:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 18
    .line 19
    invoke-virtual {v1, p1}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    sget-object p1, Lcom/p1/mobile/putong/feed/data/Moment;->CREATEDTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 24
    .line 25
    iget-object v4, p1, Lcom/tantanapp/common/data/orm/OrderedColumn;->DESC:Lcom/tantanapp/common/data/orm/Order;

    .line 26
    .line 27
    const/4 v5, 0x0

    .line 28
    const/16 v6, 0x1e

    .line 29
    .line 30
    move-object v1, p0

    .line 31
    invoke-direct/range {v0 .. v6}, Ll/wzh0$a;-><init>(Ll/wzh0;Ljava/lang/String;Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/Order;II)V

    .line 32
    .line 33
    .line 34
    return-object v0
.end method

.method public H(Ljava/lang/String;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/data/Moment;->OWNER:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Ll/wzh0;->delete(Lcom/tantanapp/common/data/orm/Filter;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public I(Ljava/util/ArrayList;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/data/Moment;->OWNER:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/tantanapp/common/data/orm/StringColumn;->IN(Ljava/util/List;)Lcom/tantanapp/common/data/orm/Filter;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Ll/wzh0;->delete(Lcom/tantanapp/common/data/orm/Filter;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final J(Ljava/lang/String;Z)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Z)",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/data/Moment;->LOCALINFEED:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 2
    .line 3
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    invoke-virtual {v0, p2}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    sget-object v0, Lcom/p1/mobile/putong/feed/data/Moment;->OWNER:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 12
    .line 13
    invoke-virtual {v0, p1}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    sget-object v0, Lcom/p1/mobile/putong/feed/data/Moment;->ID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 18
    .line 19
    const-string v1, "fake_id_"

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Lcom/tantanapp/common/data/orm/StringColumn;->NOT_STARTS_WITH(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    filled-new-array {p2, p1, v0}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-static {p1}, Lcom/tantanapp/common/data/orm/Filter;->AND([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    const/4 p2, 0x0

    .line 34
    const/4 v0, -0x1

    .line 35
    invoke-virtual {p0, p1, p2, v0}, Ll/wzh0;->query(Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/Order;I)Ljava/util/List;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    return-object p0
.end method

.method public K(Ljava/lang/String;Z)Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Z)",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/cr00;->J(Ljava/lang/String;Z)Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance p1, Ll/br00;

    .line 6
    .line 7
    invoke-direct {p1}, Ll/br00;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-static {p0, p1}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public L(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-virtual {p0, p1}, Ll/wzh0;->query(Ljava/lang/String;)Lcom/tantanapp/common/data/DbObject;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 6
    .line 7
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->messages:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 8
    .line 9
    iget v1, v0, Lcom/p1/mobile/putong/data/PartialIdList;->count:I

    .line 10
    .line 11
    add-int/lit8 v1, v1, 0x1

    .line 12
    .line 13
    iput v1, v0, Lcom/p1/mobile/putong/data/PartialIdList;->count:I

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PartialIdList;->ids:Ljava/util/List;

    .line 16
    .line 17
    invoke-interface {v0, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, p1}, Ll/wzh0;->upsert(Lcom/tantanapp/common/data/DbObject;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public M(Ljava/lang/String;)Ll/wzh0$a;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ll/wzh0<",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ">.a;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/wzh0$a;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/feed/data/Moment;->LOCALINUSERFEED:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 4
    .line 5
    invoke-virtual {v1}, Lcom/tantanapp/common/data/orm/BooleanColumn;->T()Lcom/tantanapp/common/data/orm/Filter;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    sget-object v2, Lcom/p1/mobile/putong/feed/data/Moment;->OWNER:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 10
    .line 11
    invoke-virtual {v2, p1}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    filled-new-array {v1, v2}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-static {v1}, Lcom/tantanapp/common/data/orm/Filter;->AND([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    sget-object v1, Lcom/p1/mobile/putong/feed/data/Moment;->CREATEDTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 24
    .line 25
    iget-object v4, v1, Lcom/tantanapp/common/data/orm/OrderedColumn;->DESC:Lcom/tantanapp/common/data/orm/Order;

    .line 26
    .line 27
    const/4 v5, 0x0

    .line 28
    const/16 v6, 0x1e

    .line 29
    .line 30
    move-object v1, p0

    .line 31
    move-object v2, p1

    .line 32
    invoke-direct/range {v0 .. v6}, Ll/wzh0$a;-><init>(Ll/wzh0;Ljava/lang/String;Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/Order;II)V

    .line 33
    .line 34
    .line 35
    return-object v0
.end method

.method public N(Ljava/util/List;Z)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/data/Moment;->LOCALINFEED:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 2
    .line 3
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    filled-new-array {v1}, [Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-static {v1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    xor-int/lit8 p2, p2, 0x1

    .line 20
    .line 21
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    invoke-virtual {v0, p2}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    sget-object v0, Lcom/p1/mobile/putong/feed/data/Moment;->ID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 30
    .line 31
    const-string v2, "fake_id_"

    .line 32
    .line 33
    invoke-virtual {v0, v2}, Lcom/tantanapp/common/data/orm/StringColumn;->NOT_STARTS_WITH(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-virtual {v0, p1}, Lcom/tantanapp/common/data/orm/StringColumn;->NOT_IN(Ljava/util/List;)Lcom/tantanapp/common/data/orm/Filter;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    filled-new-array {p2, v2, p1}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-static {p1}, Lcom/tantanapp/common/data/orm/Filter;->AND([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-virtual {p0, v1, p1}, Ll/wzh0;->update(Ljava/util/List;Lcom/tantanapp/common/data/orm/Filter;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public O(Ljava/lang/String;Z)V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/data/Moment;->LOCALINFEED:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 2
    .line 3
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    filled-new-array {v1}, [Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-static {v1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    xor-int/lit8 p2, p2, 0x1

    .line 20
    .line 21
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    invoke-virtual {v0, p2}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    sget-object v0, Lcom/p1/mobile/putong/feed/data/Moment;->OWNER:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 30
    .line 31
    invoke-virtual {v0, p1}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    sget-object v0, Lcom/p1/mobile/putong/feed/data/Moment;->ID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 36
    .line 37
    const-string v2, "fake_id_"

    .line 38
    .line 39
    invoke-virtual {v0, v2}, Lcom/tantanapp/common/data/orm/StringColumn;->NOT_STARTS_WITH(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    filled-new-array {p2, p1, v0}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    invoke-static {p1}, Lcom/tantanapp/common/data/orm/Filter;->AND([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-virtual {p0, v1, p1}, Ll/wzh0;->update(Ljava/util/List;Lcom/tantanapp/common/data/orm/Filter;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public P(Ljava/lang/String;Ljava/util/List;Z)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/data/Moment;->LOCALINUSERFEED:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 2
    .line 3
    invoke-static {p3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    filled-new-array {v1}, [Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-static {v1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    xor-int/lit8 p3, p3, 0x1

    .line 20
    .line 21
    invoke-static {p3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 22
    .line 23
    .line 24
    move-result-object p3

    .line 25
    invoke-virtual {v0, p3}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 26
    .line 27
    .line 28
    move-result-object p3

    .line 29
    sget-object v0, Lcom/p1/mobile/putong/feed/data/Moment;->OWNER:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 30
    .line 31
    invoke-virtual {v0, p1}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    sget-object v0, Lcom/p1/mobile/putong/feed/data/Moment;->ID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 36
    .line 37
    const-string v2, "fake_id_"

    .line 38
    .line 39
    invoke-virtual {v0, v2}, Lcom/tantanapp/common/data/orm/StringColumn;->NOT_STARTS_WITH(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    invoke-virtual {v0, p2}, Lcom/tantanapp/common/data/orm/StringColumn;->NOT_IN(Ljava/util/List;)Lcom/tantanapp/common/data/orm/Filter;

    .line 44
    .line 45
    .line 46
    move-result-object p2

    .line 47
    filled-new-array {p3, p1, v2, p2}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-static {p1}, Lcom/tantanapp/common/data/orm/Filter;->AND([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    invoke-virtual {p0, v1, p1}, Ll/wzh0;->update(Ljava/util/List;Lcom/tantanapp/common/data/orm/Filter;)V

    .line 56
    .line 57
    .line 58
    return-void
.end method
