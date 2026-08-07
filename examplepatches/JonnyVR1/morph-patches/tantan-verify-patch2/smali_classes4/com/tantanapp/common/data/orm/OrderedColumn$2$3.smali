.class Lcom/tantanapp/common/data/orm/OrderedColumn$2$3;
.super Lcom/tantanapp/common/data/orm/Filter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tantanapp/common/data/orm/OrderedColumn$2;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/orm/Filter<",
        "TT;>;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/tantanapp/common/data/orm/OrderedColumn$2;

.field final synthetic val$t:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lcom/tantanapp/common/data/orm/OrderedColumn$2;Ljava/lang/Object;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/common/data/orm/OrderedColumn$2$3;->this$1:Lcom/tantanapp/common/data/orm/OrderedColumn$2;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tantanapp/common/data/orm/OrderedColumn$2$3;->val$t:Ljava/lang/Object;

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/tantanapp/common/data/orm/Filter;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public emit()Lcom/tantanapp/common/data/orm/SqlSegment;
    .locals 3

    .line 1
    new-instance v0, Lcom/tantanapp/common/data/orm/SqlSegment;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    iget-object v2, p0, Lcom/tantanapp/common/data/orm/OrderedColumn$2$3;->this$1:Lcom/tantanapp/common/data/orm/OrderedColumn$2;

    .line 9
    .line 10
    iget-object v2, v2, Lcom/tantanapp/common/data/orm/OrderedColumn$2;->this$0:Lcom/tantanapp/common/data/orm/OrderedColumn;

    .line 11
    .line 12
    iget-object v2, v2, Lcom/tantanapp/common/data/orm/Column;->NAME:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const-string v2, " = ?"

    .line 18
    .line 19
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    iget-object v2, p0, Lcom/tantanapp/common/data/orm/OrderedColumn$2$3;->this$1:Lcom/tantanapp/common/data/orm/OrderedColumn$2;

    .line 27
    .line 28
    iget-object v2, v2, Lcom/tantanapp/common/data/orm/OrderedColumn$2;->this$0:Lcom/tantanapp/common/data/orm/OrderedColumn;

    .line 29
    .line 30
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/OrderedColumn$2$3;->val$t:Ljava/lang/Object;

    .line 31
    .line 32
    invoke-virtual {v2, p0}, Lcom/tantanapp/common/data/orm/Column;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    check-cast p0, Ljava/lang/Comparable;

    .line 37
    .line 38
    invoke-virtual {v2, p0}, Lcom/tantanapp/common/data/orm/ValueColumn;->asString(Ljava/lang/Object;)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    filled-new-array {p0}, [Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-direct {v0, v1, p0}, Lcom/tantanapp/common/data/orm/SqlSegment;-><init>(Ljava/lang/String;[Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    return-object v0
.end method

.method public emitWithPrefix()Lcom/tantanapp/common/data/orm/SqlSegment;
    .locals 3

    .line 1
    new-instance v0, Lcom/tantanapp/common/data/orm/SqlSegment;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "$."

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object v2, p0, Lcom/tantanapp/common/data/orm/OrderedColumn$2$3;->this$1:Lcom/tantanapp/common/data/orm/OrderedColumn$2;

    .line 11
    .line 12
    iget-object v2, v2, Lcom/tantanapp/common/data/orm/OrderedColumn$2;->this$0:Lcom/tantanapp/common/data/orm/OrderedColumn;

    .line 13
    .line 14
    iget-object v2, v2, Lcom/tantanapp/common/data/orm/Column;->NAME:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string v2, " = ?"

    .line 20
    .line 21
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    iget-object v2, p0, Lcom/tantanapp/common/data/orm/OrderedColumn$2$3;->this$1:Lcom/tantanapp/common/data/orm/OrderedColumn$2;

    .line 29
    .line 30
    iget-object v2, v2, Lcom/tantanapp/common/data/orm/OrderedColumn$2;->this$0:Lcom/tantanapp/common/data/orm/OrderedColumn;

    .line 31
    .line 32
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/OrderedColumn$2$3;->val$t:Ljava/lang/Object;

    .line 33
    .line 34
    invoke-virtual {v2, p0}, Lcom/tantanapp/common/data/orm/Column;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    check-cast p0, Ljava/lang/Comparable;

    .line 39
    .line 40
    invoke-virtual {v2, p0}, Lcom/tantanapp/common/data/orm/ValueColumn;->asString(Ljava/lang/Object;)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    filled-new-array {p0}, [Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-direct {v0, v1, p0}, Lcom/tantanapp/common/data/orm/SqlSegment;-><init>(Ljava/lang/String;[Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    return-object v0
.end method

.method public filter(Ljava/lang/Object;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/tantanapp/common/data/orm/OrderedColumn$2$3;->this$1:Lcom/tantanapp/common/data/orm/OrderedColumn$2;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/tantanapp/common/data/orm/OrderedColumn$2;->this$0:Lcom/tantanapp/common/data/orm/OrderedColumn;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/tantanapp/common/data/orm/Column;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, Ljava/lang/Comparable;

    .line 10
    .line 11
    iget-object v0, p0, Lcom/tantanapp/common/data/orm/OrderedColumn$2$3;->this$1:Lcom/tantanapp/common/data/orm/OrderedColumn$2;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/tantanapp/common/data/orm/OrderedColumn$2;->this$0:Lcom/tantanapp/common/data/orm/OrderedColumn;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/OrderedColumn$2$3;->val$t:Ljava/lang/Object;

    .line 16
    .line 17
    invoke-virtual {v0, p0}, Lcom/tantanapp/common/data/orm/Column;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Ljava/lang/Comparable;

    .line 22
    .line 23
    invoke-interface {p1, p0}, Ljava/lang/Comparable;->compareTo(Ljava/lang/Object;)I

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-nez p0, :cond_0

    .line 28
    .line 29
    const/4 p0, 0x1

    .line 30
    return p0

    .line 31
    :cond_0
    const/4 p0, 0x0

    .line 32
    return p0
.end method
