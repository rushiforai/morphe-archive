.class Lcom/tantanapp/common/data/orm/StringColumn$4;
.super Lcom/tantanapp/common/data/orm/Filter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tantanapp/common/data/orm/StringColumn;->IN(Ljava/util/List;)Lcom/tantanapp/common/data/orm/Filter;
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
.field final synthetic this$0:Lcom/tantanapp/common/data/orm/StringColumn;

.field final synthetic val$exclude:Ljava/util/List;


# direct methods
.method public constructor <init>(Lcom/tantanapp/common/data/orm/StringColumn;Ljava/util/List;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/common/data/orm/StringColumn$4;->this$0:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tantanapp/common/data/orm/StringColumn$4;->val$exclude:Ljava/util/List;

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
    iget-object v0, p0, Lcom/tantanapp/common/data/orm/StringColumn$4;->val$exclude:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    sget-object p0, Lcom/tantanapp/common/data/orm/SqlSegment;->FALSE:Lcom/tantanapp/common/data/orm/SqlSegment;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    new-instance v0, Lcom/tantanapp/common/data/orm/SqlSegment;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/tantanapp/common/data/orm/StringColumn$4;->val$exclude:Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-nez v1, :cond_1

    .line 21
    .line 22
    const-string p0, ""

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    .line 26
    .line 27
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 28
    .line 29
    .line 30
    iget-object v2, p0, Lcom/tantanapp/common/data/orm/StringColumn$4;->this$0:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 31
    .line 32
    iget-object v2, v2, Lcom/tantanapp/common/data/orm/Column;->NAME:Ljava/lang/String;

    .line 33
    .line 34
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    const-string v2, " IN (\'"

    .line 38
    .line 39
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/StringColumn$4;->val$exclude:Ljava/util/List;

    .line 43
    .line 44
    const-string v2, "\', \'"

    .line 45
    .line 46
    invoke-static {p0, v2}, Ll/jyb;->U(Ljava/util/Collection;Ljava/lang/String;)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string p0, "\')"

    .line 54
    .line 55
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    :goto_0
    const/4 v1, 0x0

    .line 63
    invoke-direct {v0, p0, v1}, Lcom/tantanapp/common/data/orm/SqlSegment;-><init>(Ljava/lang/String;[Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    return-object v0
.end method

.method public emitWithPrefix()Lcom/tantanapp/common/data/orm/SqlSegment;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/tantanapp/common/data/orm/StringColumn$4;->val$exclude:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    sget-object p0, Lcom/tantanapp/common/data/orm/SqlSegment;->FALSE:Lcom/tantanapp/common/data/orm/SqlSegment;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    new-instance v0, Lcom/tantanapp/common/data/orm/SqlSegment;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/tantanapp/common/data/orm/StringColumn$4;->val$exclude:Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-nez v1, :cond_1

    .line 21
    .line 22
    const-string p0, ""

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    .line 26
    .line 27
    const-string v2, "$."

    .line 28
    .line 29
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    iget-object v2, p0, Lcom/tantanapp/common/data/orm/StringColumn$4;->this$0:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 33
    .line 34
    iget-object v2, v2, Lcom/tantanapp/common/data/orm/Column;->NAME:Ljava/lang/String;

    .line 35
    .line 36
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    const-string v2, " IN (\'"

    .line 40
    .line 41
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/StringColumn$4;->val$exclude:Ljava/util/List;

    .line 45
    .line 46
    const-string v2, "\', \'"

    .line 47
    .line 48
    invoke-static {p0, v2}, Ll/jyb;->U(Ljava/util/Collection;Ljava/lang/String;)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    const-string p0, "\')"

    .line 56
    .line 57
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    :goto_0
    const/4 v1, 0x0

    .line 65
    invoke-direct {v0, p0, v1}, Lcom/tantanapp/common/data/orm/SqlSegment;-><init>(Ljava/lang/String;[Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
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
    iget-object v0, p0, Lcom/tantanapp/common/data/orm/StringColumn$4;->this$0:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/tantanapp/common/data/orm/Column;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Ljava/lang/String;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/StringColumn$4;->val$exclude:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {p0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method
