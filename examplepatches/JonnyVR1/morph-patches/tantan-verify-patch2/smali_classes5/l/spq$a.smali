.class public Ll/spq$a;
.super Ll/spq;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/spq;->c(Ll/wzh0;Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/StringColumn;Ll/wzh0;Lcom/tantanapp/common/data/orm/Filter;Z)Ll/spq;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/spq<",
        "TT;TM;>;"
    }
.end annotation


# instance fields
.field public a:Lcom/tantanapp/common/data/orm/Filter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Filter<",
            "TT;>;"
        }
    .end annotation
.end field

.field public b:Lcom/tantanapp/common/data/orm/Filter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Filter<",
            "TM;>;"
        }
    .end annotation
.end field

.field public final synthetic c:Lcom/tantanapp/common/data/orm/Filter;

.field public final synthetic d:Lcom/tantanapp/common/data/orm/Filter;

.field public final synthetic e:Z

.field public final synthetic f:Ll/wzh0;

.field public final synthetic g:Ll/wzh0;

.field public final synthetic h:Lcom/tantanapp/common/data/orm/StringColumn;


# direct methods
.method public constructor <init>(Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/Filter;ZLl/wzh0;Ll/wzh0;Lcom/tantanapp/common/data/orm/StringColumn;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/spq$a;->c:Lcom/tantanapp/common/data/orm/Filter;

    .line 2
    .line 3
    iput-object p2, p0, Ll/spq$a;->d:Lcom/tantanapp/common/data/orm/Filter;

    .line 4
    .line 5
    iput-boolean p3, p0, Ll/spq$a;->e:Z

    .line 6
    .line 7
    iput-object p4, p0, Ll/spq$a;->f:Ll/wzh0;

    .line 8
    .line 9
    iput-object p5, p0, Ll/spq$a;->g:Ll/wzh0;

    .line 10
    .line 11
    iput-object p6, p0, Ll/spq$a;->h:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 12
    .line 13
    invoke-direct {p0}, Ll/spq;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Ll/spq$a;->a:Lcom/tantanapp/common/data/orm/Filter;

    .line 17
    .line 18
    iput-object p2, p0, Ll/spq$a;->b:Lcom/tantanapp/common/data/orm/Filter;

    .line 19
    .line 20
    return-void
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
    iget-object p0, p0, Ll/spq$a;->a:Lcom/tantanapp/common/data/orm/Filter;

    .line 2
    .line 3
    return-object p0
.end method

.method public countSql()Ljava/lang/String;
    .locals 4

    .line 1
    iget-object v0, p0, Ll/spq$a;->f:Ll/wzh0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 4
    .line 5
    iget-object v1, p0, Ll/spq$a;->g:Ll/wzh0;

    .line 6
    .line 7
    iget-object v1, v1, Ll/wzh0;->d:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/spq$a;->where()Ljava/lang/String;

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
    const-string p0, "SELECT count(t1._id) FROM ^1 AS t1 left join ^2 AS t2 ON ^3 "

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

.method public d()Ll/wzh0;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/wzh0<",
            "TT;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/spq$a;->f:Ll/wzh0;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/spq$a;->e:Z

    .line 2
    .line 3
    return p0
.end method

.method public emit()Lcom/tantanapp/common/data/orm/SqlSegment;
    .locals 8

    .line 1
    iget-object v0, p0, Ll/spq$a;->a:Lcom/tantanapp/common/data/orm/Filter;

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
    iget-object v1, p0, Ll/spq$a;->b:Lcom/tantanapp/common/data/orm/Filter;

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
    iget-object v1, p0, Ll/spq$a;->a:Lcom/tantanapp/common/data/orm/Filter;

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
    iget-object v1, p0, Ll/spq$a;->b:Lcom/tantanapp/common/data/orm/Filter;

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
    invoke-virtual {p0}, Ll/spq$a;->where()Ljava/lang/String;

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
    iget-object v0, p0, Ll/spq$a;->b:Lcom/tantanapp/common/data/orm/Filter;

    .line 80
    .line 81
    if-eqz v0, :cond_3

    .line 82
    .line 83
    new-instance v0, Lcom/tantanapp/common/data/orm/SqlSegment;

    .line 84
    .line 85
    invoke-virtual {p0}, Ll/spq$a;->where()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    iget-object p0, p0, Ll/spq$a;->b:Lcom/tantanapp/common/data/orm/Filter;

    .line 90
    .line 91
    invoke-virtual {p0}, Lcom/tantanapp/common/data/orm/Filter;->emit()Lcom/tantanapp/common/data/orm/SqlSegment;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/SqlSegment;->args:[Ljava/lang/String;

    .line 96
    .line 97
    invoke-direct {v0, v1, p0}, Lcom/tantanapp/common/data/orm/SqlSegment;-><init>(Ljava/lang/String;[Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    return-object v0

    .line 101
    :cond_3
    sget-object p0, Lcom/tantanapp/common/data/orm/SqlSegment;->NULL:Lcom/tantanapp/common/data/orm/SqlSegment;

    .line 102
    .line 103
    return-object p0
.end method

.method public emitWithPrefix()Lcom/tantanapp/common/data/orm/SqlSegment;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/spq$a;->emit()Lcom/tantanapp/common/data/orm/SqlSegment;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public f()Lcom/tantanapp/common/data/orm/Filter;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/tantanapp/common/data/orm/Filter<",
            "TM;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/spq$a;->b:Lcom/tantanapp/common/data/orm/Filter;

    .line 2
    .line 3
    return-object p0
.end method

.method public filter(Lcom/tantanapp/common/data/DbObject;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    .line 103
    const/4 p0, 0x0

    return p0
.end method

.method public filter(Lcom/tantanapp/common/data/DbObject;Lcom/tantanapp/common/data/DbObject;)Z
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TM;)Z"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/spq$a;->e()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Ll/spq$a;->a:Lcom/tantanapp/common/data/orm/Filter;

    .line 6
    .line 7
    const/4 v2, 0x1

    .line 8
    const/4 v3, 0x0

    .line 9
    if-eqz v0, :cond_5

    .line 10
    .line 11
    if-eqz v1, :cond_1

    .line 12
    .line 13
    iget-object v0, p0, Ll/spq$a;->b:Lcom/tantanapp/common/data/orm/Filter;

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    invoke-virtual {v1, p1}, Lcom/tantanapp/common/data/orm/Filter;->filter(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-eqz p1, :cond_0

    .line 22
    .line 23
    iget-object p0, p0, Ll/spq$a;->b:Lcom/tantanapp/common/data/orm/Filter;

    .line 24
    .line 25
    invoke-virtual {p0, p2}, Lcom/tantanapp/common/data/orm/Filter;->filter(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-eqz p0, :cond_0

    .line 30
    .line 31
    return v2

    .line 32
    :cond_0
    return v3

    .line 33
    :cond_1
    if-eqz v1, :cond_2

    .line 34
    .line 35
    invoke-virtual {v1, p1}, Lcom/tantanapp/common/data/orm/Filter;->filter(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-nez p1, :cond_2

    .line 40
    .line 41
    return v3

    .line 42
    :cond_2
    iget-object p0, p0, Ll/spq$a;->b:Lcom/tantanapp/common/data/orm/Filter;

    .line 43
    .line 44
    if-eqz p0, :cond_4

    .line 45
    .line 46
    if-nez p2, :cond_3

    .line 47
    .line 48
    return v3

    .line 49
    :cond_3
    invoke-virtual {p0, p2}, Lcom/tantanapp/common/data/orm/Filter;->filter(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    if-nez p0, :cond_4

    .line 54
    .line 55
    return v3

    .line 56
    :cond_4
    return v2

    .line 57
    :cond_5
    if-eqz v1, :cond_7

    .line 58
    .line 59
    iget-object v0, p0, Ll/spq$a;->b:Lcom/tantanapp/common/data/orm/Filter;

    .line 60
    .line 61
    if-eqz v0, :cond_7

    .line 62
    .line 63
    invoke-virtual {v1, p1}, Lcom/tantanapp/common/data/orm/Filter;->filter(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    move-result p1

    .line 67
    if-eqz p1, :cond_6

    .line 68
    .line 69
    iget-object p0, p0, Ll/spq$a;->b:Lcom/tantanapp/common/data/orm/Filter;

    .line 70
    .line 71
    invoke-virtual {p0, p2}, Lcom/tantanapp/common/data/orm/Filter;->filter(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    move-result p0

    .line 75
    if-eqz p0, :cond_6

    .line 76
    .line 77
    return v2

    .line 78
    :cond_6
    return v3

    .line 79
    :cond_7
    if-eqz v1, :cond_8

    .line 80
    .line 81
    invoke-virtual {v1, p1}, Lcom/tantanapp/common/data/orm/Filter;->filter(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    move-result p1

    .line 85
    if-nez p1, :cond_8

    .line 86
    .line 87
    return v3

    .line 88
    :cond_8
    if-nez p2, :cond_9

    .line 89
    .line 90
    return v3

    .line 91
    :cond_9
    iget-object p0, p0, Ll/spq$a;->b:Lcom/tantanapp/common/data/orm/Filter;

    .line 92
    .line 93
    if-eqz p0, :cond_a

    .line 94
    .line 95
    invoke-virtual {p0, p2}, Lcom/tantanapp/common/data/orm/Filter;->filter(Ljava/lang/Object;)Z

    .line 96
    .line 97
    .line 98
    move-result p0

    .line 99
    if-nez p0, :cond_a

    .line 100
    .line 101
    return v3

    .line 102
    :cond_a
    return v2
.end method

.method public bridge synthetic filter(Ljava/lang/Object;)Z
    .locals 0

    .line 104
    check-cast p1, Lcom/tantanapp/common/data/DbObject;

    invoke-virtual {p0, p1}, Ll/spq$a;->filter(Lcom/tantanapp/common/data/DbObject;)Z

    move-result p0

    return p0
.end method

.method public foreignC()Lcom/tantanapp/common/data/orm/StringColumn;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/spq$a;->h:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 2
    .line 3
    return-object p0
.end method

.method public g()Ll/wzh0;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/wzh0<",
            "TM;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/spq$a;->g:Ll/wzh0;

    .line 2
    .line 3
    return-object p0
.end method

.method public querySql(Lcom/tantanapp/common/data/orm/Order;I)Ljava/lang/String;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/tantanapp/common/data/orm/Order<",
            "TT;>;I)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Ll/spq$a;->e:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const-string v0, "SELECT * FROM ^1 AS t1 left join ^2 AS t2 ON ^3 "

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const-string v0, "SELECT * FROM ^1 AS t1, ^2 AS t2 WHERE ^3 "

    .line 9
    .line 10
    :goto_0
    iget-object v1, p0, Ll/spq$a;->f:Ll/wzh0;

    .line 11
    .line 12
    iget-object v1, v1, Ll/wzh0;->d:Ljava/lang/String;

    .line 13
    .line 14
    iget-object v2, p0, Ll/spq$a;->g:Ll/wzh0;

    .line 15
    .line 16
    iget-object v2, v2, Ll/wzh0;->d:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/spq$a;->where()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    const/4 v3, 0x3

    .line 23
    new-array v3, v3, [Ljava/lang/CharSequence;

    .line 24
    .line 25
    const/4 v4, 0x0

    .line 26
    aput-object v1, v3, v4

    .line 27
    .line 28
    const/4 v1, 0x1

    .line 29
    aput-object v2, v3, v1

    .line 30
    .line 31
    const/4 v1, 0x2

    .line 32
    aput-object p0, v3, v1

    .line 33
    .line 34
    invoke-static {v0, v3}, Landroid/text/TextUtils;->expandTemplate(Ljava/lang/CharSequence;[Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    if-eqz p1, :cond_1

    .line 43
    .line 44
    new-instance v0, Ljava/lang/StringBuilder;

    .line 45
    .line 46
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    const-string p0, " ORDER BY "

    .line 53
    .line 54
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {p1}, Lcom/tantanapp/common/data/orm/Order;->emit()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    :cond_1
    if-lez p2, :cond_2

    .line 69
    .line 70
    new-instance p1, Ljava/lang/StringBuilder;

    .line 71
    .line 72
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 73
    .line 74
    .line 75
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    const-string p0, " LIMIT "

    .line 79
    .line 80
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    :cond_2
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
    iput-object p1, p0, Ll/spq$a;->a:Lcom/tantanapp/common/data/orm/Filter;

    .line 2
    .line 3
    return-void
.end method

.method public final where()Ljava/lang/String;
    .locals 5

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, " t1."

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Ll/spq$a;->h:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 9
    .line 10
    iget-object v1, v1, Lcom/tantanapp/common/data/orm/Column;->NAME:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string v1, " = t2.id_c"

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    iget-object v1, p0, Ll/spq$a;->a:Lcom/tantanapp/common/data/orm/Filter;

    .line 25
    .line 26
    const-string v2, "$."

    .line 27
    .line 28
    const-string v3, " where "

    .line 29
    .line 30
    if-eqz v1, :cond_0

    .line 31
    .line 32
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    iget-object v1, p0, Ll/spq$a;->a:Lcom/tantanapp/common/data/orm/Filter;

    .line 36
    .line 37
    invoke-virtual {v1}, Lcom/tantanapp/common/data/orm/Filter;->emitWithPrefix()Lcom/tantanapp/common/data/orm/SqlSegment;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    iget-object v1, v1, Lcom/tantanapp/common/data/orm/SqlSegment;->part:Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    const-string v4, "t1."

    .line 48
    .line 49
    invoke-virtual {v1, v2, v4}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    const/4 v1, 0x1

    .line 57
    goto :goto_0

    .line 58
    :cond_0
    const/4 v1, 0x0

    .line 59
    :goto_0
    iget-object v4, p0, Ll/spq$a;->b:Lcom/tantanapp/common/data/orm/Filter;

    .line 60
    .line 61
    if-eqz v4, :cond_2

    .line 62
    .line 63
    if-nez v1, :cond_1

    .line 64
    .line 65
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    goto :goto_1

    .line 69
    :cond_1
    const-string v1, " AND "

    .line 70
    .line 71
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    :goto_1
    iget-object p0, p0, Ll/spq$a;->b:Lcom/tantanapp/common/data/orm/Filter;

    .line 75
    .line 76
    invoke-virtual {p0}, Lcom/tantanapp/common/data/orm/Filter;->emitWithPrefix()Lcom/tantanapp/common/data/orm/SqlSegment;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/SqlSegment;->part:Ljava/lang/String;

    .line 81
    .line 82
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    const-string v1, "t2."

    .line 87
    .line 88
    invoke-virtual {p0, v2, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    :cond_2
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    return-object p0
.end method
