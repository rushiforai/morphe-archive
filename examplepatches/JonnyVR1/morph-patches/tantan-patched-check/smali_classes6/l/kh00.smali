.class public Ll/kh00;
.super Ll/wzh0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/wzh0<",
        "Lcom/p1/mobile/putong/feed/data/MomentActivity;",
        ">;"
    }
.end annotation


# instance fields
.field public m:Ll/wzh0$a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/wzh0<",
            "Lcom/p1/mobile/putong/feed/data/MomentActivity;",
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
            "Lcom/p1/mobile/putong/feed/data/MomentActivity;",
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
    sget-object p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->CREATEDTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 7
    .line 8
    iget-object v4, p1, Lcom/tantanapp/common/data/orm/OrderedColumn;->DESC:Lcom/tantanapp/common/data/orm/Order;

    .line 9
    .line 10
    const/4 v5, 0x0

    .line 11
    const/16 v6, 0x1e

    .line 12
    .line 13
    const-string v2, "activities"

    .line 14
    .line 15
    const/4 v3, 0x0

    .line 16
    move-object v1, p0

    .line 17
    invoke-direct/range {v0 .. v6}, Ll/wzh0$a;-><init>(Ll/wzh0;Ljava/lang/String;Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/Order;II)V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Ll/kh00;->m:Ll/wzh0$a;

    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public F(Ljava/lang/String;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->ACTORS:Lcom/tantanapp/common/data/orm/StringColumn;

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

.method public G(Ljava/lang/String;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->REFERENCE_ID:Lcom/tantanapp/common/data/orm/StringColumn;

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

.method public H(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->ID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/tantanapp/common/data/orm/StringColumn;->NOT_IN(Ljava/util/List;)Lcom/tantanapp/common/data/orm/Filter;

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

.method public I()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->READ:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 2
    .line 3
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    filled-new-array {v1}, [Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-static {v1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v0}, Lcom/tantanapp/common/data/orm/BooleanColumn;->F()Lcom/tantanapp/common/data/orm/Filter;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {p0, v1, v0}, Ll/wzh0;->update(Ljava/util/List;Lcom/tantanapp/common/data/orm/Filter;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public J(Ljava/lang/String;)I
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->REFERENCE_ID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    sget-object v0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->READ:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/tantanapp/common/data/orm/BooleanColumn;->F()Lcom/tantanapp/common/data/orm/Filter;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    filled-new-array {p1, v0}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-static {p1}, Lcom/tantanapp/common/data/orm/Filter;->AND([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    const/4 v0, -0x1

    .line 22
    invoke-virtual {p0, p1, v0}, Ll/wzh0;->count(Lcom/tantanapp/common/data/orm/Filter;I)I

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    return p0
.end method
