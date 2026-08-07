.class public Ll/u6b0;
.super Ll/wzh0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/wzh0<",
        "Lcom/p1/mobile/putong/core/data/MonetizationPromotion;",
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
            "Lcom/p1/mobile/putong/core/data/MonetizationPromotion;",
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
            "Lcom/p1/mobile/putong/core/data/MonetizationPromotion;",
            ">.a;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/wzh0$a;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/data/MonetizationPromotion;->ID:Lcom/tantanapp/common/data/orm/StringColumn;

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
    const-string v2, "queryAllPromotions"

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
