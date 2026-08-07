.class public Ll/xu4;
.super Ll/wzh0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/wzh0<",
        "Lcom/p1/mobile/putong/core/data/ChatGroup;",
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
            "Lcom/p1/mobile/putong/core/data/ChatGroup;",
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

    .line 1
    new-instance v0, Ll/wzh0$a;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/data/ChatGroup;->STATUS:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;

    .line 4
    .line 5
    const-string v2, "default"

    .line 6
    .line 7
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->EQ(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 8
    .line 9
    .line 10
    move-result-object v3

    .line 11
    sget-object v1, Lcom/p1/mobile/putong/core/data/ChatGroup;->CREATEDTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 12
    .line 13
    iget-object v4, v1, Lcom/tantanapp/common/data/orm/OrderedColumn;->ASC:Lcom/tantanapp/common/data/orm/Order;

    .line 14
    .line 15
    const/4 v5, 0x1

    .line 16
    const/16 v6, 0x64

    .line 17
    .line 18
    const-string v2, "joinGroups"

    .line 19
    .line 20
    move-object v1, p0

    .line 21
    invoke-direct/range {v0 .. v6}, Ll/wzh0$a;-><init>(Ll/wzh0;Ljava/lang/String;Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/Order;II)V

    .line 22
    .line 23
    .line 24
    return-object v0
.end method
