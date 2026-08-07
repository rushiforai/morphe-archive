.class public abstract Lcom/p1/mobile/putong/data/tenum/TEnumColumn;
.super Lcom/tantanapp/common/data/orm/OrderedColumn;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "Enum:",
        "Lcom/p1/mobile/putong/data/tenum/TEnum;",
        ">",
        "Lcom/tantanapp/common/data/orm/OrderedColumn<",
        "TT;",
        "Lcom/p1/mobile/putong/data/tenum/TEnum;",
        ">;"
    }
.end annotation


# instance fields
.field private final nameColumnInner:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "TT;>;"
        }
    .end annotation
.end field

.field private final ordinalColumnInner:Lcom/tantanapp/common/data/orm/IntegerColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/IntegerColumn<",
            "TT;>;"
        }
    .end annotation
.end field

.field private final tEnumJsonAdapter:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Lcom/tantanapp/common/data/orm/OrderedColumn;-><init>(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    iput-object p3, p0, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->tEnumJsonAdapter:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 5
    .line 6
    if-eqz p2, :cond_0

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/data/tenum/TEnumColumn$1;

    .line 9
    .line 10
    invoke-direct {v0, p0, p2}, Lcom/p1/mobile/putong/data/tenum/TEnumColumn$1;-><init>(Lcom/p1/mobile/putong/data/tenum/TEnumColumn;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->ordinalColumnInner:Lcom/tantanapp/common/data/orm/IntegerColumn;

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 p2, 0x0

    .line 17
    iput-object p2, p0, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->ordinalColumnInner:Lcom/tantanapp/common/data/orm/IntegerColumn;

    .line 18
    .line 19
    :goto_0
    new-instance p2, Lcom/p1/mobile/putong/data/tenum/TEnumColumn$2;

    .line 20
    .line 21
    invoke-direct {p2, p0, p1, p3}, Lcom/p1/mobile/putong/data/tenum/TEnumColumn$2;-><init>(Lcom/p1/mobile/putong/data/tenum/TEnumColumn;Ljava/lang/String;Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;)V

    .line 22
    .line 23
    .line 24
    iput-object p2, p0, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->nameColumnInner:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 25
    .line 26
    return-void
.end method


# virtual methods
.method public CONTAINS(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lcom/tantanapp/common/data/orm/Filter<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance p0, Ljava/lang/RuntimeException;

    .line 2
    .line 3
    const-string p1, "not support!!!"

    .line 4
    .line 5
    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    throw p0
.end method

.method public EQ(Lcom/p1/mobile/putong/data/tenum/TEnum;)Lcom/tantanapp/common/data/orm/Filter;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/tenum/TEnum;",
            ")",
            "Lcom/tantanapp/common/data/orm/Filter<",
            "TT;>;"
        }
    .end annotation

    .line 76
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->EQ(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;
    .locals 0

    .line 77
    check-cast p1, Lcom/p1/mobile/putong/data/tenum/TEnum;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->EQ(Lcom/p1/mobile/putong/data/tenum/TEnum;)Lcom/tantanapp/common/data/orm/Filter;

    move-result-object p0

    return-object p0
.end method

.method public EQ(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lcom/tantanapp/common/data/orm/Filter<",
            "TT;>;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->ordinalColumnInner:Lcom/tantanapp/common/data/orm/IntegerColumn;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->tEnumJsonAdapter:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->getInteger(Ljava/lang/String;)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->nameColumnInner:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/tantanapp/common/data/orm/Column;->NULL()Lcom/tantanapp/common/data/orm/Filter;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iget-object v1, p0, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->ordinalColumnInner:Lcom/tantanapp/common/data/orm/IntegerColumn;

    .line 21
    .line 22
    iget-object v2, p0, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->tEnumJsonAdapter:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 23
    .line 24
    invoke-virtual {v2, p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->getInteger(Ljava/lang/String;)Ljava/lang/Integer;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    filled-new-array {v0, v1}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-static {v0}, Lcom/tantanapp/common/data/orm/Filter;->AND([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    iget-object v1, p0, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->nameColumnInner:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 41
    .line 42
    invoke-virtual {v1}, Lcom/tantanapp/common/data/orm/Column;->NOT_NULL()Lcom/tantanapp/common/data/orm/Filter;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    iget-object p0, p0, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->nameColumnInner:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 47
    .line 48
    invoke-virtual {p0, p1}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    filled-new-array {v1, p0}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-static {p0}, Lcom/tantanapp/common/data/orm/Filter;->AND([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    filled-new-array {v0, p0}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-static {p0}, Lcom/tantanapp/common/data/orm/Filter;->OR([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    return-object p0

    .line 69
    :cond_1
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->nameColumnInner:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 70
    .line 71
    invoke-virtual {p0, p1}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    return-object p0
.end method

.method public EQ_CONSTANT(Lcom/p1/mobile/putong/data/tenum/TEnum;)Lcom/tantanapp/common/data/orm/Filter;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/tenum/TEnum;",
            ")",
            "Lcom/tantanapp/common/data/orm/Filter<",
            "TT;>;"
        }
    .end annotation

    .line 80
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->EQ_CONSTANT(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic EQ_CONSTANT(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;
    .locals 0

    .line 81
    check-cast p1, Lcom/p1/mobile/putong/data/tenum/TEnum;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->EQ_CONSTANT(Lcom/p1/mobile/putong/data/tenum/TEnum;)Lcom/tantanapp/common/data/orm/Filter;

    move-result-object p0

    return-object p0
.end method

.method public EQ_CONSTANT(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lcom/tantanapp/common/data/orm/Filter<",
            "TT;>;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->ordinalColumnInner:Lcom/tantanapp/common/data/orm/IntegerColumn;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->nameColumnInner:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ_CONSTANT(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->tEnumJsonAdapter:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 13
    .line 14
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->getInteger(Ljava/lang/String;)Ljava/lang/Integer;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->nameColumnInner:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 19
    .line 20
    if-nez v0, :cond_1

    .line 21
    .line 22
    invoke-virtual {v1, p1}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ_CONSTANT(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0

    .line 27
    :cond_1
    invoke-virtual {v1}, Lcom/tantanapp/common/data/orm/Column;->NULL()Lcom/tantanapp/common/data/orm/Filter;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iget-object v1, p0, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->ordinalColumnInner:Lcom/tantanapp/common/data/orm/IntegerColumn;

    .line 32
    .line 33
    iget-object v2, p0, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->tEnumJsonAdapter:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 34
    .line 35
    invoke-virtual {v2, p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->getInteger(Ljava/lang/String;)Ljava/lang/Integer;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ_CONSTANT(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    filled-new-array {v0, v1}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-static {v0}, Lcom/tantanapp/common/data/orm/Filter;->AND([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    iget-object v1, p0, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->nameColumnInner:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 52
    .line 53
    invoke-virtual {v1}, Lcom/tantanapp/common/data/orm/Column;->NOT_NULL()Lcom/tantanapp/common/data/orm/Filter;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    iget-object p0, p0, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->nameColumnInner:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 58
    .line 59
    invoke-virtual {p0, p1}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ_CONSTANT(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    filled-new-array {v1, p0}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-static {p0}, Lcom/tantanapp/common/data/orm/Filter;->AND([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    filled-new-array {v0, p0}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    invoke-static {p0}, Lcom/tantanapp/common/data/orm/Filter;->OR([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    return-object p0
.end method

.method public IN(Ljava/util/List;)Lcom/tantanapp/common/data/orm/Filter;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/tantanapp/common/data/orm/Filter<",
            "TT;>;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->ordinalColumnInner:Lcom/tantanapp/common/data/orm/IntegerColumn;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->nameColumnInner:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/tantanapp/common/data/orm/StringColumn;->IN(Ljava/util/List;)Lcom/tantanapp/common/data/orm/Filter;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 15
    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    if-ge v1, v2, :cond_2

    .line 23
    .line 24
    iget-object v2, p0, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->tEnumJsonAdapter:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 25
    .line 26
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    check-cast v3, Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->getInteger(Ljava/lang/String;)Ljava/lang/Integer;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    if-eqz v2, :cond_1

    .line 37
    .line 38
    iget-object v3, p0, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->ordinalColumnInner:Lcom/tantanapp/common/data/orm/IntegerColumn;

    .line 39
    .line 40
    invoke-virtual {v3, v2}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_2
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    if-nez v1, :cond_3

    .line 55
    .line 56
    iget-object p0, p0, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->nameColumnInner:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 57
    .line 58
    invoke-virtual {p0, p1}, Lcom/tantanapp/common/data/orm/StringColumn;->IN(Ljava/util/List;)Lcom/tantanapp/common/data/orm/Filter;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    return-object p0

    .line 63
    :cond_3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    new-array v1, v1, [Lcom/tantanapp/common/data/orm/Filter;

    .line 68
    .line 69
    invoke-interface {v0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    check-cast v0, [Lcom/tantanapp/common/data/orm/Filter;

    .line 74
    .line 75
    iget-object v1, p0, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->nameColumnInner:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 76
    .line 77
    invoke-virtual {v1}, Lcom/tantanapp/common/data/orm/Column;->NOT_NULL()Lcom/tantanapp/common/data/orm/Filter;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    iget-object v2, p0, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->nameColumnInner:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 82
    .line 83
    invoke-virtual {v2, p1}, Lcom/tantanapp/common/data/orm/StringColumn;->IN(Ljava/util/List;)Lcom/tantanapp/common/data/orm/Filter;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    filled-new-array {v1, p1}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    invoke-static {p1}, Lcom/tantanapp/common/data/orm/Filter;->AND([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    iget-object p0, p0, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->nameColumnInner:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 96
    .line 97
    invoke-virtual {p0}, Lcom/tantanapp/common/data/orm/Column;->NULL()Lcom/tantanapp/common/data/orm/Filter;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    invoke-static {v0}, Lcom/tantanapp/common/data/orm/Filter;->OR([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    filled-new-array {p0, v0}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    invoke-static {p0}, Lcom/tantanapp/common/data/orm/Filter;->AND([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    filled-new-array {p1, p0}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    invoke-static {p0}, Lcom/tantanapp/common/data/orm/Filter;->OR([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    return-object p0
.end method

.method public IN_(Ljava/util/List;)Lcom/tantanapp/common/data/orm/Filter;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/tenum/TEnum;",
            ">;)",
            "Lcom/tantanapp/common/data/orm/Filter<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 8
    .line 9
    .line 10
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    check-cast v1, Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 25
    .line 26
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->IN(Ljava/util/List;)Lcom/tantanapp/common/data/orm/Filter;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    return-object p0
.end method

.method public LEQ(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lcom/tantanapp/common/data/orm/Filter<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance p0, Ljava/lang/RuntimeException;

    .line 2
    .line 3
    const-string p1, "not support!!!"

    .line 4
    .line 5
    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    throw p0
.end method

.method public NEQ(Lcom/p1/mobile/putong/data/tenum/TEnum;)Lcom/tantanapp/common/data/orm/Filter;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/tenum/TEnum;",
            ")",
            "Lcom/tantanapp/common/data/orm/Filter<",
            "TT;>;"
        }
    .end annotation

    .line 76
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->NEQ(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic NEQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;
    .locals 0

    .line 77
    check-cast p1, Lcom/p1/mobile/putong/data/tenum/TEnum;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->NEQ(Lcom/p1/mobile/putong/data/tenum/TEnum;)Lcom/tantanapp/common/data/orm/Filter;

    move-result-object p0

    return-object p0
.end method

.method public NEQ(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lcom/tantanapp/common/data/orm/Filter<",
            "TT;>;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->ordinalColumnInner:Lcom/tantanapp/common/data/orm/IntegerColumn;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->tEnumJsonAdapter:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->getInteger(Ljava/lang/String;)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->nameColumnInner:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/tantanapp/common/data/orm/Column;->NULL()Lcom/tantanapp/common/data/orm/Filter;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iget-object v1, p0, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->ordinalColumnInner:Lcom/tantanapp/common/data/orm/IntegerColumn;

    .line 21
    .line 22
    iget-object v2, p0, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->tEnumJsonAdapter:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 23
    .line 24
    invoke-virtual {v2, p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->getInteger(Ljava/lang/String;)Ljava/lang/Integer;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/orm/ValueColumn;->NEQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    filled-new-array {v0, v1}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-static {v0}, Lcom/tantanapp/common/data/orm/Filter;->AND([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    iget-object v1, p0, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->nameColumnInner:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 41
    .line 42
    invoke-virtual {v1}, Lcom/tantanapp/common/data/orm/Column;->NOT_NULL()Lcom/tantanapp/common/data/orm/Filter;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    iget-object p0, p0, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->nameColumnInner:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 47
    .line 48
    invoke-virtual {p0, p1}, Lcom/tantanapp/common/data/orm/ValueColumn;->NEQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    filled-new-array {v1, p0}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-static {p0}, Lcom/tantanapp/common/data/orm/Filter;->AND([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    filled-new-array {v0, p0}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-static {p0}, Lcom/tantanapp/common/data/orm/Filter;->OR([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    return-object p0

    .line 69
    :cond_1
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->nameColumnInner:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 70
    .line 71
    invoke-virtual {p0, p1}, Lcom/tantanapp/common/data/orm/ValueColumn;->NEQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    return-object p0
.end method

.method public NOT_IN(Ljava/util/List;)Lcom/tantanapp/common/data/orm/Filter;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/tantanapp/common/data/orm/Filter<",
            "TT;>;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->ordinalColumnInner:Lcom/tantanapp/common/data/orm/IntegerColumn;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->nameColumnInner:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/tantanapp/common/data/orm/StringColumn;->NOT_IN(Ljava/util/List;)Lcom/tantanapp/common/data/orm/Filter;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 15
    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    if-ge v1, v2, :cond_2

    .line 23
    .line 24
    iget-object v2, p0, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->tEnumJsonAdapter:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 25
    .line 26
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    check-cast v3, Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->getInteger(Ljava/lang/String;)Ljava/lang/Integer;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    if-eqz v2, :cond_1

    .line 37
    .line 38
    iget-object v3, p0, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->ordinalColumnInner:Lcom/tantanapp/common/data/orm/IntegerColumn;

    .line 39
    .line 40
    invoke-virtual {v3, v2}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_2
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    if-nez v1, :cond_3

    .line 55
    .line 56
    iget-object p0, p0, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->nameColumnInner:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 57
    .line 58
    invoke-virtual {p0, p1}, Lcom/tantanapp/common/data/orm/StringColumn;->NOT_IN(Ljava/util/List;)Lcom/tantanapp/common/data/orm/Filter;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    return-object p0

    .line 63
    :cond_3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    new-array v1, v1, [Lcom/tantanapp/common/data/orm/Filter;

    .line 68
    .line 69
    invoke-interface {v0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    check-cast v0, [Lcom/tantanapp/common/data/orm/Filter;

    .line 74
    .line 75
    iget-object v1, p0, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->nameColumnInner:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 76
    .line 77
    invoke-virtual {v1}, Lcom/tantanapp/common/data/orm/Column;->NOT_NULL()Lcom/tantanapp/common/data/orm/Filter;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    iget-object v2, p0, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->nameColumnInner:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 82
    .line 83
    invoke-virtual {v2, p1}, Lcom/tantanapp/common/data/orm/StringColumn;->NOT_IN(Ljava/util/List;)Lcom/tantanapp/common/data/orm/Filter;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    filled-new-array {v1, p1}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    invoke-static {p1}, Lcom/tantanapp/common/data/orm/Filter;->AND([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    iget-object p0, p0, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->nameColumnInner:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 96
    .line 97
    invoke-virtual {p0}, Lcom/tantanapp/common/data/orm/Column;->NULL()Lcom/tantanapp/common/data/orm/Filter;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    invoke-static {v0}, Lcom/tantanapp/common/data/orm/Filter;->AND([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    filled-new-array {p0, v0}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    invoke-static {p0}, Lcom/tantanapp/common/data/orm/Filter;->AND([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    filled-new-array {p1, p0}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    invoke-static {p0}, Lcom/tantanapp/common/data/orm/Filter;->OR([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    return-object p0
.end method

.method public NOT_IN_(Ljava/util/List;)Lcom/tantanapp/common/data/orm/Filter;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/tenum/TEnum;",
            ">;)",
            "Lcom/tantanapp/common/data/orm/Filter<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 8
    .line 9
    .line 10
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    check-cast v1, Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 25
    .line 26
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->NOT_IN(Ljava/util/List;)Lcom/tantanapp/common/data/orm/Filter;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    return-object p0
.end method

.method public NOT_STARTS_WITH(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lcom/tantanapp/common/data/orm/Filter<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance p0, Ljava/lang/RuntimeException;

    .line 2
    .line 3
    const-string p1, "not support!!!"

    .line 4
    .line 5
    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    throw p0
.end method

.method public REQ(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lcom/tantanapp/common/data/orm/Filter<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance p0, Ljava/lang/RuntimeException;

    .line 2
    .line 3
    const-string p1, "not support!!!"

    .line 4
    .line 5
    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    throw p0
.end method

.method public STARTS_WITH(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lcom/tantanapp/common/data/orm/Filter<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance p0, Ljava/lang/RuntimeException;

    .line 2
    .line 3
    const-string p1, "not support!!!"

    .line 4
    .line 5
    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    throw p0
.end method

.method public put(Landroid/content/ContentValues;Lcom/p1/mobile/putong/data/tenum/TEnum;)V
    .locals 2

    .line 1
    if-eqz p2, :cond_1

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->ordinalColumnInner:Lcom/tantanapp/common/data/orm/IntegerColumn;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, v0, Lcom/tantanapp/common/data/orm/Column;->NAME:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-static {p1, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->nameColumnInner:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 21
    .line 22
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/Column;->NAME:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->name()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    invoke-static {p1, p0, p2}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_1
    iget-object p2, p0, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->nameColumnInner:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 33
    .line 34
    iget-object p2, p2, Lcom/tantanapp/common/data/orm/Column;->NAME:Ljava/lang/String;

    .line 35
    .line 36
    const/4 v0, 0x0

    .line 37
    invoke-static {p1, p2, v0}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    iget-object p0, p0, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->ordinalColumnInner:Lcom/tantanapp/common/data/orm/IntegerColumn;

    .line 41
    .line 42
    if-eqz p0, :cond_2

    .line 43
    .line 44
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/Column;->NAME:Ljava/lang/String;

    .line 45
    .line 46
    invoke-static {p1, p0, v0}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 47
    .line 48
    .line 49
    :cond_2
    return-void
.end method

.method public bridge synthetic put(Landroid/content/ContentValues;Ljava/lang/Object;)V
    .locals 0

    .line 50
    check-cast p2, Lcom/p1/mobile/putong/data/tenum/TEnum;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->put(Landroid/content/ContentValues;Lcom/p1/mobile/putong/data/tenum/TEnum;)V

    return-void
.end method

.method public final set(Ljava/lang/Object;Lcom/p1/mobile/putong/data/tenum/TEnum;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Lcom/p1/mobile/putong/data/tenum/TEnum;",
            ")V"
        }
    .end annotation

    .line 7
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->setTEnum(Ljava/lang/Object;Lcom/p1/mobile/putong/data/tenum/TEnum;)V

    return-void
.end method

.method public bridge synthetic set(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->set(Ljava/lang/Object;Lcom/p1/mobile/putong/data/tenum/TEnum;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public abstract setTEnum(Ljava/lang/Object;Lcom/p1/mobile/putong/data/tenum/TEnum;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TEnum;)V"
        }
    .end annotation
.end method
