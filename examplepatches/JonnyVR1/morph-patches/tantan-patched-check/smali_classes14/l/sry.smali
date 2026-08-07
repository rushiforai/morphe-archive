.class public Ll/sry;
.super Ll/wzh0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/wzh0<",
        "Lcom/p1/mobile/putong/core/data/Merchandise;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/h9c;Ljava/lang/String;Ll/vzf0;Ljava/util/List;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/h9c;",
            "Ljava/lang/String;",
            "Ll/vzf0<",
            "Lcom/p1/mobile/putong/core/data/Merchandise;",
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
    return-void
.end method


# virtual methods
.method public F()Ll/wzh0$a;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/wzh0<",
            "Lcom/p1/mobile/putong/core/data/Merchandise;",
            ">.a;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/wzh0$a;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/data/Merchandise;->ID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 4
    .line 5
    iget-object v4, v1, Lcom/tantanapp/common/data/orm/OrderedColumn;->DESC:Lcom/tantanapp/common/data/orm/Order;

    .line 6
    .line 7
    const/4 v5, 0x0

    .line 8
    const/16 v6, 0x14

    .line 9
    .line 10
    const-string v2, "queryAllMerchandises"

    .line 11
    .line 12
    const/4 v3, 0x0

    .line 13
    move-object v1, p0

    .line 14
    invoke-direct/range {v0 .. v6}, Ll/wzh0$a;-><init>(Ll/wzh0;Ljava/lang/String;Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/Order;II)V

    .line 15
    .line 16
    .line 17
    return-object v0
.end method

.method public G(Lcom/p1/mobile/putong/core/data/ProductCategory;Z)Ll/wzh0$a;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/ProductCategory;",
            "Z)",
            "Ll/wzh0<",
            "Lcom/p1/mobile/putong/core/data/Merchandise;",
            ">.a;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/wzh0$a;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->name()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v2

    .line 7
    sget-object v1, Lcom/p1/mobile/putong/core/data/Merchandise;->CATEGORY:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {v1, p1}, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->EQ(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    sget-object p1, Lcom/p1/mobile/putong/core/data/Merchandise;->QUANTITY:Lcom/tantanapp/common/data/orm/IntegerColumn;

    .line 18
    .line 19
    if-eqz p2, :cond_0

    .line 20
    .line 21
    iget-object p1, p1, Lcom/tantanapp/common/data/orm/OrderedColumn;->DESC:Lcom/tantanapp/common/data/orm/Order;

    .line 22
    .line 23
    :goto_0
    move-object v4, p1

    .line 24
    goto :goto_1

    .line 25
    :cond_0
    iget-object p1, p1, Lcom/tantanapp/common/data/orm/OrderedColumn;->ASC:Lcom/tantanapp/common/data/orm/Order;

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :goto_1
    const/4 v5, 0x0

    .line 29
    const/16 v6, 0x3e8

    .line 30
    .line 31
    move-object v1, p0

    .line 32
    invoke-direct/range {v0 .. v6}, Ll/wzh0$a;-><init>(Ll/wzh0;Ljava/lang/String;Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/Order;II)V

    .line 33
    .line 34
    .line 35
    return-object v0
.end method

.method public H(Lcom/p1/mobile/putong/core/data/ProductCategory;Ljava/lang/String;)Ll/wzh0$a;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/ProductCategory;",
            "Ljava/lang/String;",
            ")",
            "Ll/wzh0<",
            "Lcom/p1/mobile/putong/core/data/Merchandise;",
            ">.a;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/wzh0$a;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/data/Merchandise;->CATEGORY:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {v1, p1}, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->EQ(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    sget-object v1, Lcom/p1/mobile/putong/core/data/Merchandise;->DEFAULTSTOCKKEEPUNIT_ID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 14
    .line 15
    invoke-virtual {v1, p2}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    filled-new-array {p1, v1}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-static {p1}, Lcom/tantanapp/common/data/orm/Filter;->AND([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    sget-object p1, Lcom/p1/mobile/putong/core/data/Merchandise;->QUANTITY:Lcom/tantanapp/common/data/orm/IntegerColumn;

    .line 28
    .line 29
    iget-object v4, p1, Lcom/tantanapp/common/data/orm/OrderedColumn;->DESC:Lcom/tantanapp/common/data/orm/Order;

    .line 30
    .line 31
    const/4 v5, 0x0

    .line 32
    const/16 v6, 0x3e8

    .line 33
    .line 34
    move-object v1, p0

    .line 35
    move-object v2, p2

    .line 36
    invoke-direct/range {v0 .. v6}, Ll/wzh0$a;-><init>(Ll/wzh0;Ljava/lang/String;Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/Order;II)V

    .line 37
    .line 38
    .line 39
    return-object v0
.end method

.method public I(Lcom/p1/mobile/putong/core/data/ProductCategory;Ljava/lang/String;)Ll/wzh0$a;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/ProductCategory;",
            "Ljava/lang/String;",
            ")",
            "Ll/wzh0<",
            "Lcom/p1/mobile/putong/core/data/Merchandise;",
            ">.a;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/wzh0$a;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/data/Merchandise;->CATEGORY:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {v1, p1}, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->EQ(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    sget-object v1, Lcom/p1/mobile/putong/core/data/Merchandise;->ID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 14
    .line 15
    invoke-virtual {v1, p2}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    filled-new-array {p1, v1}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-static {p1}, Lcom/tantanapp/common/data/orm/Filter;->AND([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    sget-object p1, Lcom/p1/mobile/putong/core/data/Merchandise;->QUANTITY:Lcom/tantanapp/common/data/orm/IntegerColumn;

    .line 28
    .line 29
    iget-object v4, p1, Lcom/tantanapp/common/data/orm/OrderedColumn;->DESC:Lcom/tantanapp/common/data/orm/Order;

    .line 30
    .line 31
    const/4 v5, 0x0

    .line 32
    const/16 v6, 0x3e8

    .line 33
    .line 34
    move-object v1, p0

    .line 35
    move-object v2, p2

    .line 36
    invoke-direct/range {v0 .. v6}, Ll/wzh0$a;-><init>(Ll/wzh0;Ljava/lang/String;Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/Order;II)V

    .line 37
    .line 38
    .line 39
    return-object v0
.end method

.method public deleteAll()V
    .locals 2

    .line 1
    const-string v0, "[core][merchandise]"

    .line 2
    .line 3
    const-string v1, " merchandises table deleteAll"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-super {p0}, Ll/wzh0;->deleteAll()V

    .line 9
    .line 10
    .line 11
    return-void
.end method
