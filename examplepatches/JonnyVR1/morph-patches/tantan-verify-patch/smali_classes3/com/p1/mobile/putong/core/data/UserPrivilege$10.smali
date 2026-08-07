.class Lcom/p1/mobile/putong/core/data/UserPrivilege$10;
.super Lcom/tantanapp/common/data/orm/IntegerColumn;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/UserPrivilege;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/orm/IntegerColumn<",
        "Lcom/p1/mobile/putong/core/data/UserPrivilege;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/tantanapp/common/data/orm/IntegerColumn;-><init>(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public get(Lcom/p1/mobile/putong/core/data/UserPrivilege;)Ljava/lang/Integer;
    .locals 0

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/UserPrivilege;->content:Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;

    .line 2
    .line 3
    iget p0, p0, Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;->refreshMaxRemaining:I

    .line 4
    .line 5
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public bridge synthetic get(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 10
    check-cast p1, Lcom/p1/mobile/putong/core/data/UserPrivilege;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/UserPrivilege$10;->get(Lcom/p1/mobile/putong/core/data/UserPrivilege;)Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public set(Lcom/p1/mobile/putong/core/data/UserPrivilege;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/UserPrivilege;->content:Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;

    .line 2
    .line 3
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    iput p1, p0, Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;->refreshMaxRemaining:I

    .line 8
    .line 9
    return-void
.end method

.method public bridge synthetic set(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 10
    check-cast p1, Lcom/p1/mobile/putong/core/data/UserPrivilege;

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/UserPrivilege$10;->set(Lcom/p1/mobile/putong/core/data/UserPrivilege;Ljava/lang/Integer;)V

    return-void
.end method
