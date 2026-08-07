.class Lcom/tantanapp/common/data/orm/DoubleOrder$2;
.super Lcom/tantanapp/common/data/orm/Filter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tantanapp/common/data/orm/DoubleOrder;->GT_EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;
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
.field final synthetic this$0:Lcom/tantanapp/common/data/orm/DoubleOrder;

.field final synthetic val$t:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lcom/tantanapp/common/data/orm/DoubleOrder;Ljava/lang/Object;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/common/data/orm/DoubleOrder$2;->this$0:Lcom/tantanapp/common/data/orm/DoubleOrder;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tantanapp/common/data/orm/DoubleOrder$2;->val$t:Ljava/lang/Object;

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
    iget-object v0, p0, Lcom/tantanapp/common/data/orm/DoubleOrder$2;->this$0:Lcom/tantanapp/common/data/orm/DoubleOrder;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/data/orm/DoubleOrder;->access$000(Lcom/tantanapp/common/data/orm/DoubleOrder;)Lcom/tantanapp/common/data/orm/Order;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/tantanapp/common/data/orm/DoubleOrder$2;->val$t:Ljava/lang/Object;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Lcom/tantanapp/common/data/orm/Order;->GT_EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v1, p0, Lcom/tantanapp/common/data/orm/DoubleOrder$2;->this$0:Lcom/tantanapp/common/data/orm/DoubleOrder;

    .line 14
    .line 15
    invoke-static {v1}, Lcom/tantanapp/common/data/orm/DoubleOrder;->access$100(Lcom/tantanapp/common/data/orm/DoubleOrder;)Lcom/tantanapp/common/data/orm/Order;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    iget-object v2, p0, Lcom/tantanapp/common/data/orm/DoubleOrder$2;->val$t:Ljava/lang/Object;

    .line 20
    .line 21
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/orm/Order;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    filled-new-array {v0, v1}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-static {v0}, Lcom/tantanapp/common/data/orm/Filter;->AND([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iget-object v1, p0, Lcom/tantanapp/common/data/orm/DoubleOrder$2;->this$0:Lcom/tantanapp/common/data/orm/DoubleOrder;

    .line 34
    .line 35
    invoke-static {v1}, Lcom/tantanapp/common/data/orm/DoubleOrder;->access$100(Lcom/tantanapp/common/data/orm/DoubleOrder;)Lcom/tantanapp/common/data/orm/Order;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/DoubleOrder$2;->val$t:Ljava/lang/Object;

    .line 40
    .line 41
    invoke-virtual {v1, p0}, Lcom/tantanapp/common/data/orm/Order;->GT(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    filled-new-array {v0, p0}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-static {p0}, Lcom/tantanapp/common/data/orm/Filter;->OR([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-virtual {p0}, Lcom/tantanapp/common/data/orm/Filter;->emit()Lcom/tantanapp/common/data/orm/SqlSegment;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    return-object p0
.end method

.method public emitWithPrefix()Lcom/tantanapp/common/data/orm/SqlSegment;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/tantanapp/common/data/orm/DoubleOrder$2;->this$0:Lcom/tantanapp/common/data/orm/DoubleOrder;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/data/orm/DoubleOrder;->access$000(Lcom/tantanapp/common/data/orm/DoubleOrder;)Lcom/tantanapp/common/data/orm/Order;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/tantanapp/common/data/orm/DoubleOrder$2;->val$t:Ljava/lang/Object;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Lcom/tantanapp/common/data/orm/Order;->GT_EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v1, p0, Lcom/tantanapp/common/data/orm/DoubleOrder$2;->this$0:Lcom/tantanapp/common/data/orm/DoubleOrder;

    .line 14
    .line 15
    invoke-static {v1}, Lcom/tantanapp/common/data/orm/DoubleOrder;->access$100(Lcom/tantanapp/common/data/orm/DoubleOrder;)Lcom/tantanapp/common/data/orm/Order;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    iget-object v2, p0, Lcom/tantanapp/common/data/orm/DoubleOrder$2;->val$t:Ljava/lang/Object;

    .line 20
    .line 21
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/orm/Order;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    filled-new-array {v0, v1}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-static {v0}, Lcom/tantanapp/common/data/orm/Filter;->AND([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iget-object v1, p0, Lcom/tantanapp/common/data/orm/DoubleOrder$2;->this$0:Lcom/tantanapp/common/data/orm/DoubleOrder;

    .line 34
    .line 35
    invoke-static {v1}, Lcom/tantanapp/common/data/orm/DoubleOrder;->access$100(Lcom/tantanapp/common/data/orm/DoubleOrder;)Lcom/tantanapp/common/data/orm/Order;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/DoubleOrder$2;->val$t:Ljava/lang/Object;

    .line 40
    .line 41
    invoke-virtual {v1, p0}, Lcom/tantanapp/common/data/orm/Order;->GT(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    filled-new-array {v0, p0}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-static {p0}, Lcom/tantanapp/common/data/orm/Filter;->OR([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-virtual {p0}, Lcom/tantanapp/common/data/orm/Filter;->emitWithPrefix()Lcom/tantanapp/common/data/orm/SqlSegment;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    return-object p0
.end method

.method public filter(Ljava/lang/Object;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/tantanapp/common/data/orm/DoubleOrder$2;->this$0:Lcom/tantanapp/common/data/orm/DoubleOrder;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/data/orm/DoubleOrder;->access$000(Lcom/tantanapp/common/data/orm/DoubleOrder;)Lcom/tantanapp/common/data/orm/Order;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/tantanapp/common/data/orm/DoubleOrder$2;->val$t:Ljava/lang/Object;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Lcom/tantanapp/common/data/orm/Order;->GT_EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0, p1}, Lcom/tantanapp/common/data/orm/Filter;->filter(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Lcom/tantanapp/common/data/orm/DoubleOrder$2;->this$0:Lcom/tantanapp/common/data/orm/DoubleOrder;

    .line 20
    .line 21
    invoke-static {v0}, Lcom/tantanapp/common/data/orm/DoubleOrder;->access$100(Lcom/tantanapp/common/data/orm/DoubleOrder;)Lcom/tantanapp/common/data/orm/Order;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iget-object v1, p0, Lcom/tantanapp/common/data/orm/DoubleOrder$2;->val$t:Ljava/lang/Object;

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Lcom/tantanapp/common/data/orm/Order;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v0, p1}, Lcom/tantanapp/common/data/orm/Filter;->filter(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-nez v0, :cond_1

    .line 36
    .line 37
    :cond_0
    iget-object v0, p0, Lcom/tantanapp/common/data/orm/DoubleOrder$2;->this$0:Lcom/tantanapp/common/data/orm/DoubleOrder;

    .line 38
    .line 39
    invoke-static {v0}, Lcom/tantanapp/common/data/orm/DoubleOrder;->access$100(Lcom/tantanapp/common/data/orm/DoubleOrder;)Lcom/tantanapp/common/data/orm/Order;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/DoubleOrder$2;->val$t:Ljava/lang/Object;

    .line 44
    .line 45
    invoke-virtual {v0, p0}, Lcom/tantanapp/common/data/orm/Order;->GT(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {p0, p1}, Lcom/tantanapp/common/data/orm/Filter;->filter(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    if-eqz p0, :cond_2

    .line 54
    .line 55
    :cond_1
    const/4 p0, 0x1

    .line 56
    return p0

    .line 57
    :cond_2
    const/4 p0, 0x0

    .line 58
    return p0
.end method
