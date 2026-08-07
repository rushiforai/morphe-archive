.class Lcom/tantanapp/common/data/orm/JoinFilter$1;
.super Lcom/tantanapp/common/data/orm/JoinFilter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tantanapp/common/data/orm/JoinFilter;->JOIN(Lcom/tantanapp/common/data/orm/DatabaseStore$Table;Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/StringColumn;Lcom/tantanapp/common/data/orm/DatabaseStore$Table;Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/JoinFilter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/orm/JoinFilter<",
        "TT;TM;>;"
    }
.end annotation


# instance fields
.field private baseFilter:Lcom/tantanapp/common/data/orm/Filter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Filter<",
            "TT;>;"
        }
    .end annotation
.end field

.field final synthetic val$baseFilter_:Lcom/tantanapp/common/data/orm/Filter;

.field final synthetic val$baseTable:Lcom/tantanapp/common/data/orm/DatabaseStore$Table;

.field final synthetic val$foreignC:Lcom/tantanapp/common/data/orm/StringColumn;

.field final synthetic val$joinFilter:Lcom/tantanapp/common/data/orm/Filter;

.field final synthetic val$joinTable:Lcom/tantanapp/common/data/orm/DatabaseStore$Table;


# direct methods
.method public constructor <init>(Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/DatabaseStore$Table;Lcom/tantanapp/common/data/orm/DatabaseStore$Table;Lcom/tantanapp/common/data/orm/StringColumn;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/common/data/orm/JoinFilter$1;->val$baseFilter_:Lcom/tantanapp/common/data/orm/Filter;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tantanapp/common/data/orm/JoinFilter$1;->val$joinFilter:Lcom/tantanapp/common/data/orm/Filter;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/tantanapp/common/data/orm/JoinFilter$1;->val$baseTable:Lcom/tantanapp/common/data/orm/DatabaseStore$Table;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/tantanapp/common/data/orm/JoinFilter$1;->val$joinTable:Lcom/tantanapp/common/data/orm/DatabaseStore$Table;

    .line 8
    .line 9
    iput-object p5, p0, Lcom/tantanapp/common/data/orm/JoinFilter$1;->val$foreignC:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 10
    .line 11
    invoke-direct {p0}, Lcom/tantanapp/common/data/orm/JoinFilter;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object p1, p0, Lcom/tantanapp/common/data/orm/JoinFilter$1;->baseFilter:Lcom/tantanapp/common/data/orm/Filter;

    .line 15
    .line 16
    return-void
.end method

.method private where()Ljava/lang/String;
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/tantanapp/common/data/orm/JoinFilter$1;->baseFilter:Lcom/tantanapp/common/data/orm/Filter;

    .line 7
    .line 8
    const-string v2, "t1."

    .line 9
    .line 10
    const-string v3, "$."

    .line 11
    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    invoke-virtual {v1}, Lcom/tantanapp/common/data/orm/Filter;->emitWithPrefix()Lcom/tantanapp/common/data/orm/SqlSegment;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    iget-object v1, v1, Lcom/tantanapp/common/data/orm/SqlSegment;->part:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v1, v3, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    const-string v1, " AND "

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    :cond_0
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    iget-object v1, p0, Lcom/tantanapp/common/data/orm/JoinFilter$1;->val$foreignC:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 40
    .line 41
    iget-object v1, v1, Lcom/tantanapp/common/data/orm/Column;->NAME:Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    const-string v1, " = t2.id_c AND "

    .line 51
    .line 52
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/JoinFilter$1;->val$joinFilter:Lcom/tantanapp/common/data/orm/Filter;

    .line 56
    .line 57
    invoke-virtual {p0}, Lcom/tantanapp/common/data/orm/Filter;->emitWithPrefix()Lcom/tantanapp/common/data/orm/SqlSegment;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/SqlSegment;->part:Ljava/lang/String;

    .line 62
    .line 63
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    const-string v1, "t2."

    .line 68
    .line 69
    invoke-virtual {p0, v3, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    return-object p0
.end method


# virtual methods
.method public baseFilter()Lcom/tantanapp/common/data/orm/Filter;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/tantanapp/common/data/orm/Filter<",
            "TT;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/JoinFilter$1;->baseFilter:Lcom/tantanapp/common/data/orm/Filter;

    .line 2
    .line 3
    return-object p0
.end method

.method public countSql()Ljava/lang/String;
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/tantanapp/common/data/orm/JoinFilter$1;->val$baseTable:Lcom/tantanapp/common/data/orm/DatabaseStore$Table;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->tableName:Ljava/lang/String;

    .line 4
    .line 5
    iget-object v1, p0, Lcom/tantanapp/common/data/orm/JoinFilter$1;->val$joinTable:Lcom/tantanapp/common/data/orm/DatabaseStore$Table;

    .line 6
    .line 7
    iget-object v1, v1, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->tableName:Ljava/lang/String;

    .line 8
    .line 9
    invoke-direct {p0}, Lcom/tantanapp/common/data/orm/JoinFilter$1;->where()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const/4 v2, 0x3

    .line 14
    new-array v2, v2, [Ljava/lang/CharSequence;

    .line 15
    .line 16
    const/4 v3, 0x0

    .line 17
    aput-object v0, v2, v3

    .line 18
    .line 19
    const/4 v0, 0x1

    .line 20
    aput-object v1, v2, v0

    .line 21
    .line 22
    const/4 v0, 0x2

    .line 23
    aput-object p0, v2, v0

    .line 24
    .line 25
    const-string p0, "SELECT count(t1._id) FROM ^1 AS t1, ^2 AS t2 WHERE ^3 "

    .line 26
    .line 27
    invoke-static {p0, v2}, Landroid/text/TextUtils;->expandTemplate(Ljava/lang/CharSequence;[Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    return-object p0
.end method

.method public emit()Lcom/tantanapp/common/data/orm/SqlSegment;
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/tantanapp/common/data/orm/JoinFilter$1;->baseFilter:Lcom/tantanapp/common/data/orm/Filter;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/tantanapp/common/data/orm/Filter;->emit()Lcom/tantanapp/common/data/orm/SqlSegment;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v0, v0, Lcom/tantanapp/common/data/orm/SqlSegment;->args:[Ljava/lang/String;

    .line 10
    .line 11
    array-length v0, v0

    .line 12
    iget-object v1, p0, Lcom/tantanapp/common/data/orm/JoinFilter$1;->val$joinFilter:Lcom/tantanapp/common/data/orm/Filter;

    .line 13
    .line 14
    invoke-virtual {v1}, Lcom/tantanapp/common/data/orm/Filter;->emit()Lcom/tantanapp/common/data/orm/SqlSegment;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    iget-object v1, v1, Lcom/tantanapp/common/data/orm/SqlSegment;->args:[Ljava/lang/String;

    .line 19
    .line 20
    array-length v1, v1

    .line 21
    add-int/2addr v0, v1

    .line 22
    new-array v0, v0, [Ljava/lang/String;

    .line 23
    .line 24
    iget-object v1, p0, Lcom/tantanapp/common/data/orm/JoinFilter$1;->baseFilter:Lcom/tantanapp/common/data/orm/Filter;

    .line 25
    .line 26
    invoke-virtual {v1}, Lcom/tantanapp/common/data/orm/Filter;->emit()Lcom/tantanapp/common/data/orm/SqlSegment;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    iget-object v1, v1, Lcom/tantanapp/common/data/orm/SqlSegment;->args:[Ljava/lang/String;

    .line 31
    .line 32
    array-length v2, v1

    .line 33
    const/4 v3, 0x0

    .line 34
    move v4, v3

    .line 35
    move v5, v4

    .line 36
    :goto_0
    if-ge v4, v2, :cond_0

    .line 37
    .line 38
    aget-object v6, v1, v4

    .line 39
    .line 40
    add-int/lit8 v7, v5, 0x1

    .line 41
    .line 42
    aput-object v6, v0, v5

    .line 43
    .line 44
    add-int/lit8 v4, v4, 0x1

    .line 45
    .line 46
    move v5, v7

    .line 47
    goto :goto_0

    .line 48
    :cond_0
    iget-object v1, p0, Lcom/tantanapp/common/data/orm/JoinFilter$1;->val$joinFilter:Lcom/tantanapp/common/data/orm/Filter;

    .line 49
    .line 50
    invoke-virtual {v1}, Lcom/tantanapp/common/data/orm/Filter;->emit()Lcom/tantanapp/common/data/orm/SqlSegment;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    iget-object v1, v1, Lcom/tantanapp/common/data/orm/SqlSegment;->args:[Ljava/lang/String;

    .line 55
    .line 56
    array-length v2, v1

    .line 57
    :goto_1
    if-ge v3, v2, :cond_1

    .line 58
    .line 59
    aget-object v4, v1, v3

    .line 60
    .line 61
    add-int/lit8 v6, v5, 0x1

    .line 62
    .line 63
    aput-object v4, v0, v5

    .line 64
    .line 65
    add-int/lit8 v3, v3, 0x1

    .line 66
    .line 67
    move v5, v6

    .line 68
    goto :goto_1

    .line 69
    :cond_1
    new-instance v1, Lcom/tantanapp/common/data/orm/SqlSegment;

    .line 70
    .line 71
    invoke-direct {p0}, Lcom/tantanapp/common/data/orm/JoinFilter$1;->where()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    invoke-direct {v1, p0, v0}, Lcom/tantanapp/common/data/orm/SqlSegment;-><init>(Ljava/lang/String;[Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    return-object v1

    .line 79
    :cond_2
    new-instance v0, Lcom/tantanapp/common/data/orm/SqlSegment;

    .line 80
    .line 81
    invoke-direct {p0}, Lcom/tantanapp/common/data/orm/JoinFilter$1;->where()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/JoinFilter$1;->val$joinFilter:Lcom/tantanapp/common/data/orm/Filter;

    .line 86
    .line 87
    invoke-virtual {p0}, Lcom/tantanapp/common/data/orm/Filter;->emit()Lcom/tantanapp/common/data/orm/SqlSegment;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/SqlSegment;->args:[Ljava/lang/String;

    .line 92
    .line 93
    invoke-direct {v0, v1, p0}, Lcom/tantanapp/common/data/orm/SqlSegment;-><init>(Ljava/lang/String;[Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    return-object v0
.end method

.method public emitWithPrefix()Lcom/tantanapp/common/data/orm/SqlSegment;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/tantanapp/common/data/orm/JoinFilter$1;->emit()Lcom/tantanapp/common/data/orm/SqlSegment;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public filter(Lcom/tantanapp/common/data/DbObject;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    .line 32
    const/4 p0, 0x0

    return p0
.end method

.method public filter(Lcom/tantanapp/common/data/DbObject;Lcom/tantanapp/common/data/DbObject;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TM;)Z"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/tantanapp/common/data/orm/JoinFilter$1;->baseFilter:Lcom/tantanapp/common/data/orm/Filter;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/JoinFilter$1;->val$joinFilter:Lcom/tantanapp/common/data/orm/Filter;

    .line 6
    .line 7
    invoke-virtual {p0, p2}, Lcom/tantanapp/common/data/orm/Filter;->filter(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0

    .line 12
    :cond_0
    invoke-virtual {v0, p1}, Lcom/tantanapp/common/data/orm/Filter;->filter(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-eqz p1, :cond_1

    .line 17
    .line 18
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/JoinFilter$1;->val$joinFilter:Lcom/tantanapp/common/data/orm/Filter;

    .line 19
    .line 20
    invoke-virtual {p0, p2}, Lcom/tantanapp/common/data/orm/Filter;->filter(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    if-eqz p0, :cond_1

    .line 25
    .line 26
    const/4 p0, 0x1

    .line 27
    return p0

    .line 28
    :cond_1
    const/4 p0, 0x0

    .line 29
    return p0
.end method

.method public bridge synthetic filter(Ljava/lang/Object;)Z
    .locals 0

    .line 30
    check-cast p1, Lcom/tantanapp/common/data/DbObject;

    invoke-virtual {p0, p1}, Lcom/tantanapp/common/data/orm/JoinFilter$1;->filter(Lcom/tantanapp/common/data/DbObject;)Z

    move-result p0

    return p0
.end method

.method public bridge synthetic filter(Ljava/lang/Object;Lcom/tantanapp/common/data/DbObject;)Z
    .locals 0

    .line 31
    check-cast p1, Lcom/tantanapp/common/data/DbObject;

    invoke-virtual {p0, p1, p2}, Lcom/tantanapp/common/data/orm/JoinFilter$1;->filter(Lcom/tantanapp/common/data/DbObject;Lcom/tantanapp/common/data/DbObject;)Z

    move-result p0

    return p0
.end method

.method public foreignC()Lcom/tantanapp/common/data/orm/StringColumn;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/JoinFilter$1;->val$foreignC:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 2
    .line 3
    return-object p0
.end method

.method public joinTable()Lcom/tantanapp/common/data/orm/DatabaseStore$Table;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/tantanapp/common/data/orm/DatabaseStore$Table<",
            "TM;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/JoinFilter$1;->val$joinTable:Lcom/tantanapp/common/data/orm/DatabaseStore$Table;

    .line 2
    .line 3
    return-object p0
.end method

.method public querySql(Lcom/tantanapp/common/data/orm/Order;I)Ljava/lang/String;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/tantanapp/common/data/orm/Order<",
            "TT;>;I)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/tantanapp/common/data/orm/JoinFilter$1;->val$baseTable:Lcom/tantanapp/common/data/orm/DatabaseStore$Table;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->tableName:Ljava/lang/String;

    .line 4
    .line 5
    iget-object v1, p0, Lcom/tantanapp/common/data/orm/JoinFilter$1;->val$joinTable:Lcom/tantanapp/common/data/orm/DatabaseStore$Table;

    .line 6
    .line 7
    iget-object v1, v1, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->tableName:Ljava/lang/String;

    .line 8
    .line 9
    invoke-direct {p0}, Lcom/tantanapp/common/data/orm/JoinFilter$1;->where()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const/4 v2, 0x3

    .line 14
    new-array v2, v2, [Ljava/lang/CharSequence;

    .line 15
    .line 16
    const/4 v3, 0x0

    .line 17
    aput-object v0, v2, v3

    .line 18
    .line 19
    const/4 v0, 0x1

    .line 20
    aput-object v1, v2, v0

    .line 21
    .line 22
    const/4 v0, 0x2

    .line 23
    aput-object p0, v2, v0

    .line 24
    .line 25
    const-string p0, "SELECT t1.* FROM ^1 AS t1, ^2 AS t2 WHERE ^3 "

    .line 26
    .line 27
    invoke-static {p0, v2}, Landroid/text/TextUtils;->expandTemplate(Ljava/lang/CharSequence;[Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    if-eqz p1, :cond_0

    .line 36
    .line 37
    new-instance v0, Ljava/lang/StringBuilder;

    .line 38
    .line 39
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    const-string p0, " ORDER BY "

    .line 46
    .line 47
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {p1}, Lcom/tantanapp/common/data/orm/Order;->emit()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    :cond_0
    if-lez p2, :cond_1

    .line 62
    .line 63
    new-instance p1, Ljava/lang/StringBuilder;

    .line 64
    .line 65
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    const-string p0, " LIMIT "

    .line 72
    .line 73
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    :cond_1
    return-object p0
.end method

.method public setBaseFilter(Lcom/tantanapp/common/data/orm/Filter;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/tantanapp/common/data/orm/Filter<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/tantanapp/common/data/orm/JoinFilter$1;->baseFilter:Lcom/tantanapp/common/data/orm/Filter;

    .line 2
    .line 3
    return-void
.end method
