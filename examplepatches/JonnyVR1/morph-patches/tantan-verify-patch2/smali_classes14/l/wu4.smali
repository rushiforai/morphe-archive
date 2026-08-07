.class public Ll/wu4;
.super Ll/wzh0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/wzh0<",
        "Lcom/p1/mobile/putong/core/data/ChatGroupMember;",
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
            "Lcom/p1/mobile/putong/core/data/ChatGroupMember;",
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
.method public F(Ljava/lang/String;)Ll/wzh0$a;
    .locals 7

    .line 1
    new-instance v0, Ll/wzh0$a;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "group/member/"

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
    const-string v2, "/user"

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    sget-object v1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->USERID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 23
    .line 24
    invoke-virtual {v1, p1}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    filled-new-array {p1}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-static {p1}, Lcom/tantanapp/common/data/orm/Filter;->AND([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    sget-object p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->CREATEDTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 37
    .line 38
    iget-object v4, p1, Lcom/tantanapp/common/data/orm/OrderedColumn;->ASC:Lcom/tantanapp/common/data/orm/Order;

    .line 39
    .line 40
    const/4 v5, 0x0

    .line 41
    const/16 v6, 0x64

    .line 42
    .line 43
    move-object v1, p0

    .line 44
    invoke-direct/range {v0 .. v6}, Ll/wzh0$a;-><init>(Ll/wzh0;Ljava/lang/String;Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/Order;II)V

    .line 45
    .line 46
    .line 47
    return-object v0
.end method

.method public G(Ljava/lang/String;)Ll/wzh0$a;
    .locals 7

    .line 1
    new-instance v0, Ll/wzh0$a;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "group/"

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
    const-string v2, "/members"

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    sget-object v1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->GROUPID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 23
    .line 24
    invoke-virtual {v1, p1}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    sget-object v1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->STATUS:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;

    .line 29
    .line 30
    const-string v3, "exited"

    .line 31
    .line 32
    invoke-virtual {v1, v3}, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->NEQ(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    filled-new-array {p1, v1}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-static {p1}, Lcom/tantanapp/common/data/orm/Filter;->AND([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    sget-object p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->JOINTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 45
    .line 46
    iget-object v4, p1, Lcom/tantanapp/common/data/orm/OrderedColumn;->ASC:Lcom/tantanapp/common/data/orm/Order;

    .line 47
    .line 48
    const/4 v5, 0x0

    .line 49
    const/16 v6, 0x1f4

    .line 50
    .line 51
    move-object v1, p0

    .line 52
    invoke-direct/range {v0 .. v6}, Ll/wzh0$a;-><init>(Ll/wzh0;Ljava/lang/String;Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/Order;II)V

    .line 53
    .line 54
    .line 55
    return-object v0
.end method
