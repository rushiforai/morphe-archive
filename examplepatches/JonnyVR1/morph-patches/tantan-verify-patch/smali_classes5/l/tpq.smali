.class public Ll/tpq;
.super Lcom/tantanapp/common/data/orm/Order;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lcom/tantanapp/common/data/DbObject;",
        "J:",
        "Lcom/tantanapp/common/data/DbObject;",
        ">",
        "Lcom/tantanapp/common/data/orm/Order<",
        "TT;>;"
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public a:Lcom/tantanapp/common/data/orm/Order;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Order<",
            "TT;>;"
        }
    .end annotation
.end field

.field public b:Lcom/tantanapp/common/data/orm/Order;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Order<",
            "TJ;>;"
        }
    .end annotation
.end field

.field public c:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "TJ;>;"
        }
    .end annotation
.end field

.field public d:Z


# direct methods
.method public static bridge synthetic a(Ll/tpq;)Lcom/tantanapp/common/data/orm/Order;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tpq;->b:Lcom/tantanapp/common/data/orm/Order;

    return-object p0
.end method

.method public static bridge synthetic b(Ll/tpq;)Lcom/tantanapp/common/data/orm/Order;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tpq;->a:Lcom/tantanapp/common/data/orm/Order;

    return-object p0
.end method


# virtual methods
.method public bridge synthetic EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;
    .locals 0

    .line 1
    check-cast p1, Lcom/tantanapp/common/data/DbObject;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/tpq;->c(Lcom/tantanapp/common/data/DbObject;)Lcom/tantanapp/common/data/orm/Filter;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public bridge synthetic GT(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;
    .locals 0

    .line 1
    check-cast p1, Lcom/tantanapp/common/data/DbObject;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/tpq;->d(Lcom/tantanapp/common/data/DbObject;)Lcom/tantanapp/common/data/orm/Filter;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public bridge synthetic GT_EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;
    .locals 0

    .line 1
    check-cast p1, Lcom/tantanapp/common/data/DbObject;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/tpq;->e(Lcom/tantanapp/common/data/DbObject;)Lcom/tantanapp/common/data/orm/Filter;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public c(Lcom/tantanapp/common/data/DbObject;)Lcom/tantanapp/common/data/orm/Filter;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)",
            "Lcom/tantanapp/common/data/orm/Filter<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/tpq$c;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/tpq$c;-><init>(Ll/tpq;Lcom/tantanapp/common/data/DbObject;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public column()Lcom/tantanapp/common/data/orm/Column;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    .line 1
    check-cast p1, Lcom/tantanapp/common/data/DbObject;

    .line 2
    .line 3
    check-cast p2, Lcom/tantanapp/common/data/DbObject;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/tpq;->f(Lcom/tantanapp/common/data/DbObject;Lcom/tantanapp/common/data/DbObject;)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public d(Lcom/tantanapp/common/data/DbObject;)Lcom/tantanapp/common/data/orm/Filter;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)",
            "Lcom/tantanapp/common/data/orm/Filter<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/tpq$a;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/tpq$a;-><init>(Ll/tpq;Lcom/tantanapp/common/data/DbObject;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public e(Lcom/tantanapp/common/data/DbObject;)Lcom/tantanapp/common/data/orm/Filter;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)",
            "Lcom/tantanapp/common/data/orm/Filter<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/tpq$b;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/tpq$b;-><init>(Ll/tpq;Lcom/tantanapp/common/data/DbObject;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public emit()Ljava/lang/String;
    .locals 3

    .line 1
    iget-boolean v0, p0, Ll/tpq;->d:Z

    .line 2
    .line 3
    const-string v1, ","

    .line 4
    .line 5
    const-string v2, "1=1"

    .line 6
    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    iget-object v0, p0, Ll/tpq;->b:Lcom/tantanapp/common/data/orm/Order;

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    move-object v0, v2

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    invoke-virtual {v0}, Lcom/tantanapp/common/data/orm/Order;->emit()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    :goto_0
    iget-object p0, p0, Ll/tpq;->a:Lcom/tantanapp/common/data/orm/Order;

    .line 20
    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    goto :goto_1

    .line 24
    :cond_1
    invoke-virtual {p0}, Lcom/tantanapp/common/data/orm/Order;->emit()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    :goto_1
    filled-new-array {v0, v2}, [Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-static {v1, p0}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    return-object p0

    .line 41
    :cond_2
    iget-object v0, p0, Ll/tpq;->a:Lcom/tantanapp/common/data/orm/Order;

    .line 42
    .line 43
    if-nez v0, :cond_3

    .line 44
    .line 45
    move-object v0, v2

    .line 46
    goto :goto_2

    .line 47
    :cond_3
    invoke-virtual {v0}, Lcom/tantanapp/common/data/orm/Order;->emit()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    :goto_2
    iget-object p0, p0, Ll/tpq;->b:Lcom/tantanapp/common/data/orm/Order;

    .line 52
    .line 53
    if-nez p0, :cond_4

    .line 54
    .line 55
    goto :goto_3

    .line 56
    :cond_4
    invoke-virtual {p0}, Lcom/tantanapp/common/data/orm/Order;->emit()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    :goto_3
    filled-new-array {v0, v2}, [Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-static {v1, p0}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    return-object p0
.end method

.method public f(Lcom/tantanapp/common/data/DbObject;Lcom/tantanapp/common/data/DbObject;)I
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TT;)I"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/tpq;->a:Lcom/tantanapp/common/data/orm/Order;

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    const/4 v2, 0x1

    .line 5
    const/4 v3, 0x0

    .line 6
    if-eqz v0, :cond_4

    .line 7
    .line 8
    iget-object v4, p0, Ll/tpq;->b:Lcom/tantanapp/common/data/orm/Order;

    .line 9
    .line 10
    if-eqz v4, :cond_4

    .line 11
    .line 12
    invoke-interface {v0, p1, p2}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_3

    .line 17
    .line 18
    iget-object v4, p0, Ll/tpq;->c:Ljava/lang/Class;

    .line 19
    .line 20
    invoke-virtual {p1, v4}, Lcom/tantanapp/common/data/ValueObject;->getExtTabData(Ljava/lang/Class;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    iget-object v4, p0, Ll/tpq;->c:Ljava/lang/Class;

    .line 25
    .line 26
    invoke-virtual {p2, v4}, Lcom/tantanapp/common/data/ValueObject;->getExtTabData(Ljava/lang/Class;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    if-nez p1, :cond_0

    .line 31
    .line 32
    if-nez p2, :cond_0

    .line 33
    .line 34
    return v3

    .line 35
    :cond_0
    if-eqz p1, :cond_1

    .line 36
    .line 37
    if-eqz p2, :cond_1

    .line 38
    .line 39
    check-cast p1, Lcom/tantanapp/common/data/DbObject;

    .line 40
    .line 41
    check-cast p2, Lcom/tantanapp/common/data/DbObject;

    .line 42
    .line 43
    iget-object p0, p0, Ll/tpq;->b:Lcom/tantanapp/common/data/orm/Order;

    .line 44
    .line 45
    invoke-interface {p0, p1, p2}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    return p0

    .line 50
    :cond_1
    if-eqz p1, :cond_2

    .line 51
    .line 52
    return v2

    .line 53
    :cond_2
    if-eqz p2, :cond_3

    .line 54
    .line 55
    return v1

    .line 56
    :cond_3
    return v0

    .line 57
    :cond_4
    if-eqz v0, :cond_5

    .line 58
    .line 59
    invoke-interface {v0, p1, p2}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    .line 60
    .line 61
    .line 62
    move-result p0

    .line 63
    return p0

    .line 64
    :cond_5
    iget-object v0, p0, Ll/tpq;->b:Lcom/tantanapp/common/data/orm/Order;

    .line 65
    .line 66
    if-eqz v0, :cond_9

    .line 67
    .line 68
    iget-object v0, p0, Ll/tpq;->c:Ljava/lang/Class;

    .line 69
    .line 70
    invoke-virtual {p1, v0}, Lcom/tantanapp/common/data/ValueObject;->getExtTabData(Ljava/lang/Class;)Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    iget-object v0, p0, Ll/tpq;->c:Ljava/lang/Class;

    .line 75
    .line 76
    invoke-virtual {p2, v0}, Lcom/tantanapp/common/data/ValueObject;->getExtTabData(Ljava/lang/Class;)Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object p2

    .line 80
    if-nez p1, :cond_6

    .line 81
    .line 82
    if-nez p2, :cond_6

    .line 83
    .line 84
    return v3

    .line 85
    :cond_6
    if-eqz p1, :cond_7

    .line 86
    .line 87
    if-eqz p2, :cond_7

    .line 88
    .line 89
    check-cast p1, Lcom/tantanapp/common/data/DbObject;

    .line 90
    .line 91
    check-cast p2, Lcom/tantanapp/common/data/DbObject;

    .line 92
    .line 93
    iget-object p0, p0, Ll/tpq;->b:Lcom/tantanapp/common/data/orm/Order;

    .line 94
    .line 95
    invoke-interface {p0, p1, p2}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    .line 96
    .line 97
    .line 98
    move-result p0

    .line 99
    return p0

    .line 100
    :cond_7
    if-eqz p1, :cond_8

    .line 101
    .line 102
    return v2

    .line 103
    :cond_8
    if-eqz p2, :cond_9

    .line 104
    .line 105
    return v1

    .line 106
    :cond_9
    return v3
.end method

.method public g()Lcom/tantanapp/common/data/orm/Order;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/tantanapp/common/data/orm/Order<",
            "TJ;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/tpq;->b:Lcom/tantanapp/common/data/orm/Order;

    .line 2
    .line 3
    return-object p0
.end method

.method public h()Lcom/tantanapp/common/data/orm/Order;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/tantanapp/common/data/orm/Order<",
            "TT;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/tpq;->a:Lcom/tantanapp/common/data/orm/Order;

    .line 2
    .line 3
    return-object p0
.end method
