.class public Ll/wzh0$d;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/wzh0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "d"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/wzh0$d$a;
    }
.end annotation


# instance fields
.field public final a:Ll/wzh0$a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/wzh0<",
            "TT;>.a;"
        }
    .end annotation
.end field

.field public b:Ll/wzh0$d$a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/wzh0<",
            "TT;>.d.a;"
        }
    .end annotation
.end field

.field public c:Z

.field public d:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/wzh0<",
            "TT;>.d.a;>;"
        }
    .end annotation
.end field

.field public e:Ljava/util/concurrent/atomic/AtomicInteger;

.field public final synthetic f:Ll/wzh0;


# direct methods
.method public constructor <init>(Ll/wzh0;Ll/wzh0$a;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/wzh0<",
            "TT;>.a;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/wzh0$d;->f:Ll/wzh0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    iput-object v0, p0, Ll/wzh0$d;->b:Ll/wzh0$d$a;

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput-boolean v0, p0, Ll/wzh0$d;->c:Z

    .line 11
    .line 12
    new-instance v1, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 13
    .line 14
    invoke-direct {v1, v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    .line 15
    .line 16
    .line 17
    iput-object v1, p0, Ll/wzh0$d;->e:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 18
    .line 19
    iput-object p2, p0, Ll/wzh0$d;->a:Ll/wzh0$a;

    .line 20
    .line 21
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iput-object v0, p0, Ll/wzh0$d;->d:Lrx/subjects/a;

    .line 26
    .line 27
    iget-object p0, p2, Ll/wzh0$a;->c:Lcom/tantanapp/common/data/orm/Order;

    .line 28
    .line 29
    instance-of p0, p0, Lcom/tantanapp/common/data/orm/DoubleOrder;

    .line 30
    .line 31
    if-eqz p0, :cond_0

    .line 32
    .line 33
    invoke-virtual {p1}, Ll/wzh0;->p()V

    .line 34
    .line 35
    .line 36
    :cond_0
    return-void
.end method

.method public static synthetic a(Ll/wzh0$d;Ll/bkj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/wzh0$d;->m(Ll/bkj0;)V

    return-void
.end method

.method public static synthetic b(Ll/wzh0$d;)Ll/bkj0;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/wzh0$d;->l()Ll/bkj0;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic c(Ll/spq;Lcom/tantanapp/common/data/DbObject;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/spq;->foreignC()Lcom/tantanapp/common/data/orm/StringColumn;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Lcom/tantanapp/common/data/orm/Column;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Ljava/lang/String;

    .line 10
    .line 11
    return-object p0
.end method

.method public static synthetic d(Ll/spq;Lcom/tantanapp/common/data/DbObject;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/spq;->foreignC()Lcom/tantanapp/common/data/orm/StringColumn;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Lcom/tantanapp/common/data/orm/Column;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    xor-int/lit8 p0, p0, 0x1

    .line 16
    .line 17
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method public static bridge synthetic e(Ll/wzh0$d;)Lrx/subjects/a;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wzh0$d;->d:Lrx/subjects/a;

    return-object p0
.end method

.method public static bridge synthetic f(Ll/wzh0$d;Ljava/util/List;)Ll/pf60;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/wzh0$d;->n(Ljava/util/List;)Ll/pf60;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic g(Ll/wzh0$d;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/wzh0$d;->s(Ljava/util/List;)V

    return-void
.end method


# virtual methods
.method public final h(Lcom/tantanapp/common/data/DbObject;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Ll/wzh0$d;->i(Lcom/tantanapp/common/data/DbObject;Z)Z

    .line 3
    .line 4
    .line 5
    move-result p0

    .line 6
    return p0
.end method

.method public final i(Lcom/tantanapp/common/data/DbObject;Z)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;Z)Z"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/wzh0$d;->a:Ll/wzh0$a;

    .line 2
    .line 3
    iget-object p0, p0, Ll/wzh0$a;->b:Lcom/tantanapp/common/data/orm/Filter;

    .line 4
    .line 5
    instance-of v0, p0, Ll/spq;

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    const/4 v2, 0x0

    .line 9
    if-eqz v0, :cond_3

    .line 10
    .line 11
    check-cast p0, Ll/spq;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/spq;->foreignC()Lcom/tantanapp/common/data/orm/StringColumn;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0, p1}, Lcom/tantanapp/common/data/orm/Column;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    return v2

    .line 30
    :cond_0
    invoke-virtual {p0}, Ll/spq;->g()Ll/wzh0;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    iget-object v0, v0, Ll/wzh0;->b:Ll/vzf0;

    .line 35
    .line 36
    invoke-virtual {v0}, Ll/vzf0;->getDataClass()Ljava/lang/Class;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {p1, v0}, Lcom/tantanapp/common/data/ValueObject;->getExtTabData(Ljava/lang/Class;)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    check-cast v0, Lcom/tantanapp/common/data/DbObject;

    .line 45
    .line 46
    invoke-virtual {p0}, Ll/spq;->e()Z

    .line 47
    .line 48
    .line 49
    if-eqz p2, :cond_2

    .line 50
    .line 51
    invoke-virtual {p0}, Ll/spq;->baseFilter()Lcom/tantanapp/common/data/orm/Filter;

    .line 52
    .line 53
    .line 54
    move-result-object p2

    .line 55
    if-nez p2, :cond_1

    .line 56
    .line 57
    return v1

    .line 58
    :cond_1
    invoke-virtual {p0}, Ll/spq;->baseFilter()Lcom/tantanapp/common/data/orm/Filter;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-virtual {p0, p1}, Lcom/tantanapp/common/data/orm/Filter;->filter(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result p0

    .line 66
    return p0

    .line 67
    :cond_2
    invoke-virtual {p0, p1, v0}, Ll/spq;->filter(Lcom/tantanapp/common/data/DbObject;Lcom/tantanapp/common/data/DbObject;)Z

    .line 68
    .line 69
    .line 70
    move-result p0

    .line 71
    return p0

    .line 72
    :cond_3
    if-eqz p0, :cond_5

    .line 73
    .line 74
    invoke-virtual {p0, p1}, Lcom/tantanapp/common/data/orm/Filter;->filter(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    move-result p0

    .line 78
    if-eqz p0, :cond_4

    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_4
    return v2

    .line 82
    :cond_5
    :goto_0
    return v1
.end method

.method public j()Ll/wzh0$d$a;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/wzh0<",
            "TT;>.d.a;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/wzh0$d;->b:Ll/wzh0$d$a;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/wzh0$d;->d:Lrx/subjects/a;

    .line 6
    .line 7
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Ll/wzh0$d$a;

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    return-object v0
.end method

.method public k()Ll/wzh0$d$a;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/wzh0<",
            "TT;>.d.a;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/wzh0$d;->b:Ll/wzh0$d$a;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/wzh0$d;->d:Lrx/subjects/a;

    .line 6
    .line 7
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    new-instance v0, Ll/wzh0$d$a;

    .line 14
    .line 15
    iget-object v1, p0, Ll/wzh0$d;->d:Lrx/subjects/a;

    .line 16
    .line 17
    invoke-virtual {v1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    check-cast v1, Ll/wzh0$d$a;

    .line 22
    .line 23
    invoke-direct {v0, p0, v1}, Ll/wzh0$d$a;-><init>(Ll/wzh0$d;Ll/wzh0$d$a;)V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Ll/wzh0$d;->b:Ll/wzh0$d$a;

    .line 27
    .line 28
    new-instance v0, Ljava/lang/StringBuilder;

    .line 29
    .line 30
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 31
    .line 32
    .line 33
    iget-object v1, p0, Ll/wzh0$d;->a:Ll/wzh0$a;

    .line 34
    .line 35
    invoke-static {v1}, Ll/wzh0$a;->d(Ll/wzh0$a;)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    const-string v1, " temp items created for write"

    .line 43
    .line 44
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-static {v0}, Ll/wzh0;->n(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    :cond_0
    iget-object p0, p0, Ll/wzh0$d;->b:Ll/wzh0$d$a;

    .line 55
    .line 56
    return-object p0
.end method

.method public final synthetic l()Ll/bkj0;
    .locals 7

    .line 1
    iget-object v0, p0, Ll/wzh0$d;->a:Ll/wzh0$a;

    .line 2
    .line 3
    iget v1, v0, Ll/wzh0$a;->d:I

    .line 4
    .line 5
    if-lez v1, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget v1, v0, Ll/wzh0$a;->e:I

    .line 9
    .line 10
    :goto_0
    if-lez v1, :cond_1

    .line 11
    .line 12
    const/4 v0, 0x1

    .line 13
    goto :goto_1

    .line 14
    :cond_1
    const/4 v0, 0x0

    .line 15
    :goto_1
    invoke-static {v0}, Ll/u11;->h(Z)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/wzh0$d;->f:Ll/wzh0;

    .line 19
    .line 20
    iget-object v2, p0, Ll/wzh0$d;->a:Ll/wzh0$a;

    .line 21
    .line 22
    iget-object v3, v2, Ll/wzh0$a;->b:Lcom/tantanapp/common/data/orm/Filter;

    .line 23
    .line 24
    iget-object v2, v2, Ll/wzh0$a;->c:Lcom/tantanapp/common/data/orm/Order;

    .line 25
    .line 26
    invoke-virtual {v0, v3, v2, v1}, Ll/wzh0;->query(Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/Order;I)Ljava/util/List;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    if-ge v2, v1, :cond_2

    .line 35
    .line 36
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    goto :goto_2

    .line 41
    :cond_2
    iget-object v1, p0, Ll/wzh0$d;->a:Ll/wzh0$a;

    .line 42
    .line 43
    invoke-virtual {v1}, Ll/wzh0$a;->e()I

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    :goto_2
    if-nez v1, :cond_3

    .line 48
    .line 49
    new-instance p0, Ljava/util/ArrayList;

    .line 50
    .line 51
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 52
    .line 53
    .line 54
    goto :goto_3

    .line 55
    :cond_3
    new-instance v2, Ljava/util/ArrayList;

    .line 56
    .line 57
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 58
    .line 59
    .line 60
    iget-object v3, p0, Ll/wzh0$d;->f:Ll/wzh0;

    .line 61
    .line 62
    iget-object v3, v3, Ll/wzh0;->c:Ll/pf60;

    .line 63
    .line 64
    if-eqz v3, :cond_4

    .line 65
    .line 66
    iget-object v4, v3, Ll/pf60;->a:Ljava/lang/Object;

    .line 67
    .line 68
    check-cast v4, Ll/wzh0;

    .line 69
    .line 70
    iget-object v3, v3, Ll/pf60;->b:Ljava/lang/Object;

    .line 71
    .line 72
    check-cast v3, Ll/bkj0;

    .line 73
    .line 74
    iget-object v3, v3, Ll/bkj0;->a:Ljava/lang/Object;

    .line 75
    .line 76
    check-cast v3, Ll/qcj;

    .line 77
    .line 78
    invoke-interface {v3, v0}, Ll/qcj;->call(Ljava/lang/Object;)Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object v3

    .line 82
    check-cast v3, Lcom/tantanapp/common/data/orm/Filter;

    .line 83
    .line 84
    iget-object v5, p0, Ll/wzh0$d;->f:Ll/wzh0;

    .line 85
    .line 86
    iget-object v5, v5, Ll/wzh0;->c:Ll/pf60;

    .line 87
    .line 88
    iget-object v5, v5, Ll/pf60;->b:Ljava/lang/Object;

    .line 89
    .line 90
    check-cast v5, Ll/bkj0;

    .line 91
    .line 92
    iget-object v5, v5, Ll/bkj0;->b:Ljava/lang/Object;

    .line 93
    .line 94
    check-cast v5, Ll/pcj;

    .line 95
    .line 96
    invoke-interface {v5}, Ll/pcj;->call()Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    move-result-object v5

    .line 100
    check-cast v5, Lcom/tantanapp/common/data/orm/Order;

    .line 101
    .line 102
    iget-object v6, p0, Ll/wzh0$d;->f:Ll/wzh0;

    .line 103
    .line 104
    iget-object v6, v6, Ll/wzh0;->c:Ll/pf60;

    .line 105
    .line 106
    iget-object v6, v6, Ll/pf60;->b:Ljava/lang/Object;

    .line 107
    .line 108
    check-cast v6, Ll/bkj0;

    .line 109
    .line 110
    iget-object v6, v6, Ll/bkj0;->c:Ljava/lang/Object;

    .line 111
    .line 112
    check-cast v6, Ljava/lang/Integer;

    .line 113
    .line 114
    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    .line 115
    .line 116
    .line 117
    move-result v6

    .line 118
    invoke-virtual {v4, v3, v5, v6}, Ll/wzh0;->query(Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/Order;I)Ljava/util/List;

    .line 119
    .line 120
    .line 121
    move-result-object v3

    .line 122
    iget-object v4, p0, Ll/wzh0$d;->f:Ll/wzh0;

    .line 123
    .line 124
    iget-object v4, v4, Ll/wzh0;->c:Ll/pf60;

    .line 125
    .line 126
    iget-object v4, v4, Ll/pf60;->a:Ljava/lang/Object;

    .line 127
    .line 128
    check-cast v4, Ll/wzh0;

    .line 129
    .line 130
    invoke-static {v4, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 131
    .line 132
    .line 133
    move-result-object v3

    .line 134
    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 135
    .line 136
    .line 137
    :cond_4
    invoke-virtual {p0, v0}, Ll/wzh0$d;->n(Ljava/util/List;)Ll/pf60;

    .line 138
    .line 139
    .line 140
    move-result-object p0

    .line 141
    if-eqz p0, :cond_5

    .line 142
    .line 143
    invoke-interface {v2, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 144
    .line 145
    .line 146
    :cond_5
    move-object p0, v2

    .line 147
    :goto_3
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 148
    .line 149
    .line 150
    move-result-object v1

    .line 151
    invoke-static {v1, v0, p0}, Ll/bkj0;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ll/bkj0;

    .line 152
    .line 153
    .line 154
    move-result-object p0

    .line 155
    return-object p0
.end method

.method public final synthetic m(Ll/bkj0;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/wzh0$d;->e:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p1, Ll/bkj0;->b:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast v0, Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    check-cast v1, Lcom/tantanapp/common/data/DbObject;

    .line 26
    .line 27
    iget-object v2, p0, Ll/wzh0$d;->f:Ll/wzh0;

    .line 28
    .line 29
    iget-object v3, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {v2, v3, v1}, Lcom/tantanapp/common/data/orm/LruCache2;->cache(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    iget-object v0, p1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 36
    .line 37
    check-cast v0, Ljava/util/List;

    .line 38
    .line 39
    invoke-virtual {p0, v0}, Ll/wzh0$d;->s(Ljava/util/List;)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Ll/wzh0$d;->d:Lrx/subjects/a;

    .line 43
    .line 44
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    if-nez v0, :cond_2

    .line 49
    .line 50
    new-instance v0, Ll/wzh0$d$a;

    .line 51
    .line 52
    invoke-direct {v0, p0}, Ll/wzh0$d$a;-><init>(Ll/wzh0$d;)V

    .line 53
    .line 54
    .line 55
    iget-object v1, p1, Ll/bkj0;->b:Ljava/lang/Object;

    .line 56
    .line 57
    check-cast v1, Ljava/util/List;

    .line 58
    .line 59
    iput-object v1, v0, Ll/wzh0$d$a;->b:Ljava/util/List;

    .line 60
    .line 61
    iget-object p1, p1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 62
    .line 63
    check-cast p1, Ljava/lang/Integer;

    .line 64
    .line 65
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    iput p1, v0, Ll/wzh0$d$a;->a:I

    .line 70
    .line 71
    iget-object p1, v0, Ll/wzh0$d$a;->b:Ljava/util/List;

    .line 72
    .line 73
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 74
    .line 75
    .line 76
    move-result p1

    .line 77
    iget v1, v0, Ll/wzh0$d$a;->a:I

    .line 78
    .line 79
    if-ne p1, v1, :cond_1

    .line 80
    .line 81
    const/4 p1, 0x1

    .line 82
    goto :goto_1

    .line 83
    :cond_1
    const/4 p1, 0x0

    .line 84
    :goto_1
    iput-boolean p1, v0, Ll/wzh0$d$a;->c:Z

    .line 85
    .line 86
    iget-object p0, p0, Ll/wzh0$d;->d:Lrx/subjects/a;

    .line 87
    .line 88
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 89
    .line 90
    .line 91
    :cond_2
    return-void
.end method

.method public final n(Ljava/util/List;)Ll/pf60;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "TT;>;)",
            "Ll/pf60<",
            "Ll/wzh0;",
            "Ljava/util/List;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/wzh0$d;->a:Ll/wzh0$a;

    .line 2
    .line 3
    iget-object v0, v0, Ll/wzh0$a;->b:Lcom/tantanapp/common/data/orm/Filter;

    .line 4
    .line 5
    instance-of v1, v0, Ll/spq;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-eqz v1, :cond_1

    .line 9
    .line 10
    check-cast v0, Ll/spq;

    .line 11
    .line 12
    iget-object p0, p0, Ll/wzh0$d;->f:Ll/wzh0;

    .line 13
    .line 14
    iget-object p0, p0, Ll/wzh0;->c:Ll/pf60;

    .line 15
    .line 16
    if-eqz p0, :cond_0

    .line 17
    .line 18
    iget-object p0, p0, Ll/pf60;->a:Ljava/lang/Object;

    .line 19
    .line 20
    invoke-virtual {v0}, Ll/spq;->g()Ll/wzh0;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    if-eq p0, v1, :cond_1

    .line 25
    .line 26
    :cond_0
    new-instance p0, Ll/b0i0;

    .line 27
    .line 28
    invoke-direct {p0, v0}, Ll/b0i0;-><init>(Ll/spq;)V

    .line 29
    .line 30
    .line 31
    invoke-static {p1, p0}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    new-instance p1, Ll/c0i0;

    .line 36
    .line 37
    invoke-direct {p1, v0}, Ll/c0i0;-><init>(Ll/spq;)V

    .line 38
    .line 39
    .line 40
    invoke-static {p0, p1}, Ll/jyb;->T(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    new-instance p1, Ljava/lang/StringBuilder;

    .line 45
    .line 46
    const-string v1, "cache join ids -> ids= "

    .line 47
    .line 48
    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    const-string v1, ","

    .line 52
    .line 53
    invoke-static {v1, p0}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    invoke-static {p1}, Ll/wzh0;->n(Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {v0}, Ll/spq;->g()Ll/wzh0;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    sget-object v1, Lcom/tantanapp/common/data/DbObject;->ID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 72
    .line 73
    invoke-virtual {v1, p0}, Lcom/tantanapp/common/data/orm/StringColumn;->IN(Ljava/util/List;)Lcom/tantanapp/common/data/orm/Filter;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    const/4 v1, -0x1

    .line 78
    invoke-virtual {p1, p0, v2, v1}, Ll/wzh0;->query(Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/Order;I)Ljava/util/List;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    new-instance p1, Ljava/lang/StringBuilder;

    .line 83
    .line 84
    const-string v1, "cache join data size -> size "

    .line 85
    .line 86
    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 90
    .line 91
    .line 92
    move-result v1

    .line 93
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    invoke-static {p1}, Ll/wzh0;->n(Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    invoke-virtual {v0}, Ll/spq;->g()Ll/wzh0;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    invoke-static {p1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    return-object p0

    .line 112
    :cond_1
    return-object v2
.end method

.method public o(Lcom/tantanapp/common/data/DbObject;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/wzh0$d;->j()Ll/wzh0$d$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    iget-object v2, p0, Ll/wzh0$d;->a:Ll/wzh0$a;

    .line 11
    .line 12
    invoke-static {v2}, Ll/wzh0$a;->d(Ll/wzh0$a;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string v2, " sync cache delete"

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
    invoke-static {v1}, Ll/wzh0;->n(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    iget-object v1, p0, Ll/wzh0$d;->a:Ll/wzh0$a;

    .line 32
    .line 33
    iget-object v1, v1, Ll/wzh0$a;->b:Lcom/tantanapp/common/data/orm/Filter;

    .line 34
    .line 35
    instance-of v2, v1, Ll/spq;

    .line 36
    .line 37
    if-eqz v2, :cond_0

    .line 38
    .line 39
    check-cast v1, Ll/spq;

    .line 40
    .line 41
    invoke-virtual {v1}, Ll/spq;->g()Ll/wzh0;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    iget-object v2, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 46
    .line 47
    invoke-virtual {v1, v2}, Ll/wzh0;->queryCache(Ljava/lang/String;)Lcom/tantanapp/common/data/DbObject;

    .line 48
    .line 49
    .line 50
    :cond_0
    if-eqz v0, :cond_5

    .line 51
    .line 52
    const/4 v1, 0x1

    .line 53
    invoke-virtual {p0, p1, v1}, Ll/wzh0$d;->i(Lcom/tantanapp/common/data/DbObject;Z)Z

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    if-eqz v2, :cond_5

    .line 58
    .line 59
    const-string v2, "sync cache delete inside"

    .line 60
    .line 61
    invoke-virtual {v0, v2}, Ll/wzh0$d$a;->h(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    iput-boolean v1, p0, Ll/wzh0$d;->c:Z

    .line 65
    .line 66
    iget-object v2, v0, Ll/wzh0$d$a;->b:Ljava/util/List;

    .line 67
    .line 68
    if-eqz v2, :cond_3

    .line 69
    .line 70
    iget-object v3, p0, Ll/wzh0$d;->a:Ll/wzh0$a;

    .line 71
    .line 72
    iget-object v3, v3, Ll/wzh0$a;->c:Lcom/tantanapp/common/data/orm/Order;

    .line 73
    .line 74
    instance-of v4, v3, Ll/tpq;

    .line 75
    .line 76
    if-eqz v4, :cond_1

    .line 77
    .line 78
    check-cast v3, Ll/tpq;

    .line 79
    .line 80
    invoke-virtual {v3}, Ll/tpq;->h()Lcom/tantanapp/common/data/orm/Order;

    .line 81
    .line 82
    .line 83
    move-result-object v2

    .line 84
    iget-object v3, p0, Ll/wzh0$d;->f:Ll/wzh0;

    .line 85
    .line 86
    iget-object v4, v0, Ll/wzh0$d$a;->b:Ljava/util/List;

    .line 87
    .line 88
    invoke-static {v3, v4, p1, v2}, Ll/wzh0;->h(Ll/wzh0;Ljava/util/List;Lcom/tantanapp/common/data/DbObject;Lcom/tantanapp/common/data/orm/Order;)I

    .line 89
    .line 90
    .line 91
    move-result p1

    .line 92
    goto :goto_0

    .line 93
    :cond_1
    iget-object v4, p0, Ll/wzh0$d;->f:Ll/wzh0;

    .line 94
    .line 95
    invoke-static {v4, v2, p1, v3}, Ll/wzh0;->g(Ll/wzh0;Ljava/util/List;Lcom/tantanapp/common/data/DbObject;Lcom/tantanapp/common/data/orm/Order;)I

    .line 96
    .line 97
    .line 98
    move-result p1

    .line 99
    :goto_0
    if-ltz p1, :cond_2

    .line 100
    .line 101
    invoke-virtual {p0}, Ll/wzh0$d;->k()Ll/wzh0$d$a;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    iget-object v2, v0, Ll/wzh0$d$a;->b:Ljava/util/List;

    .line 106
    .line 107
    invoke-interface {v2, p1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 108
    .line 109
    .line 110
    iget-object p1, v0, Ll/wzh0$d$a;->b:Ljava/util/List;

    .line 111
    .line 112
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 113
    .line 114
    .line 115
    move-result p1

    .line 116
    if-eqz p1, :cond_2

    .line 117
    .line 118
    iget-boolean p1, v0, Ll/wzh0$d$a;->c:Z

    .line 119
    .line 120
    if-nez p1, :cond_2

    .line 121
    .line 122
    iput-boolean v1, v0, Ll/wzh0$d$a;->c:Z

    .line 123
    .line 124
    :cond_2
    const-string p1, "item removed"

    .line 125
    .line 126
    invoke-virtual {v0, p1}, Ll/wzh0$d$a;->h(Ljava/lang/String;)V

    .line 127
    .line 128
    .line 129
    :cond_3
    iget p1, v0, Ll/wzh0$d$a;->a:I

    .line 130
    .line 131
    if-ltz p1, :cond_5

    .line 132
    .line 133
    invoke-virtual {p0}, Ll/wzh0$d;->k()Ll/wzh0$d$a;

    .line 134
    .line 135
    .line 136
    move-result-object p0

    .line 137
    iget p1, p0, Ll/wzh0$d$a;->a:I

    .line 138
    .line 139
    sub-int/2addr p1, v1

    .line 140
    iput p1, p0, Ll/wzh0$d$a;->a:I

    .line 141
    .line 142
    const/4 v0, -0x1

    .line 143
    if-ne p1, v0, :cond_4

    .line 144
    .line 145
    const/4 p1, 0x0

    .line 146
    iput-boolean p1, p0, Ll/wzh0$d$a;->c:Z

    .line 147
    .line 148
    :cond_4
    const-string p1, "size changed"

    .line 149
    .line 150
    invoke-virtual {p0, p1}, Ll/wzh0$d$a;->h(Ljava/lang/String;)V

    .line 151
    .line 152
    .line 153
    :cond_5
    return-void
.end method

.method public p(Lcom/tantanapp/common/data/DbObject;)Z
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/wzh0$d;->j()Ll/wzh0$d$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    iget-object v2, p0, Ll/wzh0$d;->a:Ll/wzh0$a;

    .line 11
    .line 12
    invoke-static {v2}, Ll/wzh0$a;->d(Ll/wzh0$a;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string v2, " sync cache insert"

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
    invoke-static {v1}, Ll/wzh0;->n(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    const/4 v1, 0x0

    .line 32
    if-eqz v0, :cond_b

    .line 33
    .line 34
    invoke-virtual {p0, p1}, Ll/wzh0$d;->h(Lcom/tantanapp/common/data/DbObject;)Z

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    if-eqz v2, :cond_b

    .line 39
    .line 40
    const/4 v2, 0x1

    .line 41
    iput-boolean v2, p0, Ll/wzh0$d;->c:Z

    .line 42
    .line 43
    iget-object v3, v0, Ll/wzh0$d$a;->b:Ljava/util/List;

    .line 44
    .line 45
    if-nez v3, :cond_0

    .line 46
    .line 47
    iget v4, v0, Ll/wzh0$d$a;->a:I

    .line 48
    .line 49
    if-gtz v4, :cond_0

    .line 50
    .line 51
    iget-boolean v4, v0, Ll/wzh0$d$a;->c:Z

    .line 52
    .line 53
    if-nez v4, :cond_0

    .line 54
    .line 55
    const-string p0, "sync cache insert nothing"

    .line 56
    .line 57
    invoke-virtual {v0, p0}, Ll/wzh0$d$a;->h(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    return v1

    .line 61
    :cond_0
    const-string v4, "size updated"

    .line 62
    .line 63
    if-eqz v3, :cond_4

    .line 64
    .line 65
    iget-boolean v5, v0, Ll/wzh0$d$a;->c:Z

    .line 66
    .line 67
    if-nez v5, :cond_4

    .line 68
    .line 69
    const-string v3, "sync cache insert partial"

    .line 70
    .line 71
    invoke-virtual {v0, v3}, Ll/wzh0$d$a;->h(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    iget-object v3, p0, Ll/wzh0$d;->f:Ll/wzh0;

    .line 75
    .line 76
    iget-object v5, v0, Ll/wzh0$d$a;->b:Ljava/util/List;

    .line 77
    .line 78
    iget-object v6, p0, Ll/wzh0$d;->a:Ll/wzh0$a;

    .line 79
    .line 80
    iget-object v6, v6, Ll/wzh0$a;->c:Lcom/tantanapp/common/data/orm/Order;

    .line 81
    .line 82
    invoke-static {v3, v5, p1, v6}, Ll/wzh0;->g(Ll/wzh0;Ljava/util/List;Lcom/tantanapp/common/data/DbObject;Lcom/tantanapp/common/data/orm/Order;)I

    .line 83
    .line 84
    .line 85
    move-result v3

    .line 86
    if-gez v3, :cond_1

    .line 87
    .line 88
    neg-int v3, v3

    .line 89
    sub-int/2addr v3, v2

    .line 90
    :cond_1
    iget v5, v0, Ll/wzh0$d$a;->a:I

    .line 91
    .line 92
    if-ltz v5, :cond_2

    .line 93
    .line 94
    invoke-virtual {p0}, Ll/wzh0$d;->k()Ll/wzh0$d$a;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    iget v5, v0, Ll/wzh0$d$a;->a:I

    .line 99
    .line 100
    add-int/2addr v5, v2

    .line 101
    iput v5, v0, Ll/wzh0$d$a;->a:I

    .line 102
    .line 103
    invoke-virtual {v0, v4}, Ll/wzh0$d$a;->h(Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    :cond_2
    iget-object v0, v0, Ll/wzh0$d$a;->b:Ljava/util/List;

    .line 107
    .line 108
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 109
    .line 110
    .line 111
    move-result v0

    .line 112
    if-ge v3, v0, :cond_3

    .line 113
    .line 114
    invoke-virtual {p0}, Ll/wzh0$d;->k()Ll/wzh0$d$a;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    iget-object v0, p0, Ll/wzh0$d$a;->b:Ljava/util/List;

    .line 119
    .line 120
    invoke-interface {v0, v3, p1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 121
    .line 122
    .line 123
    const-string p1, "item inserted"

    .line 124
    .line 125
    invoke-virtual {p0, p1}, Ll/wzh0$d$a;->h(Ljava/lang/String;)V

    .line 126
    .line 127
    .line 128
    return v2

    .line 129
    :cond_3
    return v1

    .line 130
    :cond_4
    if-nez v3, :cond_5

    .line 131
    .line 132
    iget v5, v0, Ll/wzh0$d$a;->a:I

    .line 133
    .line 134
    if-ltz v5, :cond_5

    .line 135
    .line 136
    iget-boolean v5, v0, Ll/wzh0$d$a;->c:Z

    .line 137
    .line 138
    if-nez v5, :cond_5

    .line 139
    .line 140
    const-string p1, "sync cache insert size"

    .line 141
    .line 142
    invoke-virtual {v0, p1}, Ll/wzh0$d$a;->h(Ljava/lang/String;)V

    .line 143
    .line 144
    .line 145
    invoke-virtual {p0}, Ll/wzh0$d;->k()Ll/wzh0$d$a;

    .line 146
    .line 147
    .line 148
    move-result-object p0

    .line 149
    iget p1, p0, Ll/wzh0$d$a;->a:I

    .line 150
    .line 151
    add-int/2addr p1, v2

    .line 152
    iput p1, p0, Ll/wzh0$d$a;->a:I

    .line 153
    .line 154
    invoke-virtual {p0, v4}, Ll/wzh0$d$a;->h(Ljava/lang/String;)V

    .line 155
    .line 156
    .line 157
    return v1

    .line 158
    :cond_5
    if-eqz v3, :cond_9

    .line 159
    .line 160
    iget v3, v0, Ll/wzh0$d$a;->a:I

    .line 161
    .line 162
    if-ltz v3, :cond_9

    .line 163
    .line 164
    iget-boolean v3, v0, Ll/wzh0$d$a;->c:Z

    .line 165
    .line 166
    if-eqz v3, :cond_9

    .line 167
    .line 168
    const-string v3, "sync cache insert full"

    .line 169
    .line 170
    invoke-virtual {v0, v3}, Ll/wzh0$d$a;->h(Ljava/lang/String;)V

    .line 171
    .line 172
    .line 173
    iget-object v3, p0, Ll/wzh0$d;->f:Ll/wzh0;

    .line 174
    .line 175
    iget-object v0, v0, Ll/wzh0$d$a;->b:Ljava/util/List;

    .line 176
    .line 177
    iget-object v4, p0, Ll/wzh0$d;->a:Ll/wzh0$a;

    .line 178
    .line 179
    iget-object v4, v4, Ll/wzh0$a;->c:Lcom/tantanapp/common/data/orm/Order;

    .line 180
    .line 181
    invoke-static {v3, v0, p1, v4}, Ll/wzh0;->g(Ll/wzh0;Ljava/util/List;Lcom/tantanapp/common/data/DbObject;Lcom/tantanapp/common/data/orm/Order;)I

    .line 182
    .line 183
    .line 184
    move-result v0

    .line 185
    if-gez v0, :cond_6

    .line 186
    .line 187
    neg-int v0, v0

    .line 188
    sub-int/2addr v0, v2

    .line 189
    :cond_6
    invoke-virtual {p0}, Ll/wzh0$d;->k()Ll/wzh0$d$a;

    .line 190
    .line 191
    .line 192
    move-result-object v3

    .line 193
    iget-object v4, v3, Ll/wzh0$d$a;->b:Ljava/util/List;

    .line 194
    .line 195
    invoke-interface {v4}, Ljava/util/List;->size()I

    .line 196
    .line 197
    .line 198
    move-result v4

    .line 199
    if-ne v0, v4, :cond_7

    .line 200
    .line 201
    move v4, v2

    .line 202
    goto :goto_0

    .line 203
    :cond_7
    move v4, v1

    .line 204
    :goto_0
    iget v5, v3, Ll/wzh0$d$a;->a:I

    .line 205
    .line 206
    add-int/2addr v5, v2

    .line 207
    iput v5, v3, Ll/wzh0$d$a;->a:I

    .line 208
    .line 209
    if-eqz v4, :cond_8

    .line 210
    .line 211
    iget v4, v3, Ll/wzh0$d$a;->d:I

    .line 212
    .line 213
    iget-object p0, p0, Ll/wzh0$d;->a:Ll/wzh0$a;

    .line 214
    .line 215
    iget p0, p0, Ll/wzh0$a;->e:I

    .line 216
    .line 217
    mul-int/lit8 p0, p0, 0x2

    .line 218
    .line 219
    add-int/2addr v4, p0

    .line 220
    iget-object p0, v3, Ll/wzh0$d$a;->b:Ljava/util/List;

    .line 221
    .line 222
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 223
    .line 224
    .line 225
    move-result p0

    .line 226
    if-gt v4, p0, :cond_8

    .line 227
    .line 228
    iput-boolean v1, v3, Ll/wzh0$d$a;->c:Z

    .line 229
    .line 230
    goto :goto_1

    .line 231
    :cond_8
    iget-object p0, v3, Ll/wzh0$d$a;->b:Ljava/util/List;

    .line 232
    .line 233
    invoke-interface {p0, v0, p1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 234
    .line 235
    .line 236
    :goto_1
    const-string p0, "sync cache insert full end"

    .line 237
    .line 238
    invoke-virtual {v3, p0}, Ll/wzh0$d$a;->h(Ljava/lang/String;)V

    .line 239
    .line 240
    .line 241
    return v2

    .line 242
    :cond_9
    const-string v2, "what??"

    .line 243
    .line 244
    invoke-virtual {v0, v2}, Ll/wzh0$d$a;->h(Ljava/lang/String;)V

    .line 245
    .line 246
    .line 247
    new-instance v2, Ljava/lang/Exception;

    .line 248
    .line 249
    new-instance v3, Ljava/lang/StringBuilder;

    .line 250
    .line 251
    const-string v4, "syncCacheInsert IllegalStateException == "

    .line 252
    .line 253
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 254
    .line 255
    .line 256
    iget-object v4, p0, Ll/wzh0$d;->f:Ll/wzh0;

    .line 257
    .line 258
    iget-object v4, v4, Ll/wzh0;->d:Ljava/lang/String;

    .line 259
    .line 260
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 261
    .line 262
    .line 263
    const-string v4, "/"

    .line 264
    .line 265
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 266
    .line 267
    .line 268
    iget-object p0, p0, Ll/wzh0$d;->a:Ll/wzh0$a;

    .line 269
    .line 270
    invoke-static {p0}, Ll/wzh0$a;->d(Ll/wzh0$a;)Ljava/lang/String;

    .line 271
    .line 272
    .line 273
    move-result-object p0

    .line 274
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 275
    .line 276
    .line 277
    const-string p0, "\n\t\t\t\tbase:"

    .line 278
    .line 279
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 280
    .line 281
    .line 282
    iget-object p0, v0, Ll/wzh0$d$a;->b:Ljava/util/List;

    .line 283
    .line 284
    if-nez p0, :cond_a

    .line 285
    .line 286
    const-string p0, "null"

    .line 287
    .line 288
    goto :goto_2

    .line 289
    :cond_a
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 290
    .line 291
    .line 292
    move-result p0

    .line 293
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 294
    .line 295
    .line 296
    move-result-object p0

    .line 297
    :goto_2
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 298
    .line 299
    .line 300
    const-string p0, ", size: "

    .line 301
    .line 302
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 303
    .line 304
    .line 305
    iget p0, v0, Ll/wzh0$d$a;->a:I

    .line 306
    .line 307
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 308
    .line 309
    .line 310
    const-string p0, ", full: "

    .line 311
    .line 312
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 313
    .line 314
    .line 315
    iget-boolean p0, v0, Ll/wzh0$d$a;->c:Z

    .line 316
    .line 317
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 318
    .line 319
    .line 320
    const-string p0, "\nnewItem:"

    .line 321
    .line 322
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 323
    .line 324
    .line 325
    invoke-virtual {p1}, Lcom/tantanapp/common/data/ValueObject;->toJson()Ljava/lang/String;

    .line 326
    .line 327
    .line 328
    move-result-object p0

    .line 329
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 330
    .line 331
    .line 332
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 333
    .line 334
    .line 335
    move-result-object p0

    .line 336
    invoke-direct {v2, p0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 337
    .line 338
    .line 339
    invoke-static {v2}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 340
    .line 341
    .line 342
    invoke-static {}, Ll/wpg0;->a()V

    .line 343
    .line 344
    .line 345
    :cond_b
    return v1
.end method

.method public q(Lcom/tantanapp/common/data/DbObject;Lcom/tantanapp/common/data/DbObject;)Z
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TT;)Z"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/wzh0$d;->j()Ll/wzh0$d$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Ll/wzh0$d;->a:Ll/wzh0$a;

    .line 6
    .line 7
    iget-object v1, v1, Ll/wzh0$a;->b:Lcom/tantanapp/common/data/orm/Filter;

    .line 8
    .line 9
    instance-of v1, v1, Ll/spq;

    .line 10
    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/tantanapp/common/data/ValueObject;->getExtList()Ljava/util/ArrayList;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-nez v1, :cond_0

    .line 22
    .line 23
    invoke-virtual {p2}, Lcom/tantanapp/common/data/ValueObject;->getExtList()Ljava/util/ArrayList;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 28
    .line 29
    .line 30
    :cond_0
    if-eqz v0, :cond_3

    .line 31
    .line 32
    iget-object v1, p0, Ll/wzh0$d;->a:Ll/wzh0$a;

    .line 33
    .line 34
    iget-object v1, v1, Ll/wzh0$a;->b:Lcom/tantanapp/common/data/orm/Filter;

    .line 35
    .line 36
    if-eqz v1, :cond_1

    .line 37
    .line 38
    invoke-virtual {p0, p1}, Ll/wzh0$d;->h(Lcom/tantanapp/common/data/DbObject;)Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    if-eqz v1, :cond_3

    .line 43
    .line 44
    invoke-virtual {p0, p2}, Ll/wzh0$d;->h(Lcom/tantanapp/common/data/DbObject;)Z

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    if-eqz v1, :cond_3

    .line 49
    .line 50
    :cond_1
    iget-object v1, p0, Ll/wzh0$d;->a:Ll/wzh0$a;

    .line 51
    .line 52
    iget-object v1, v1, Ll/wzh0$a;->c:Lcom/tantanapp/common/data/orm/Order;

    .line 53
    .line 54
    if-eqz v1, :cond_3

    .line 55
    .line 56
    invoke-interface {v1, p1, p2}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    if-nez v1, :cond_3

    .line 61
    .line 62
    const/4 v1, 0x1

    .line 63
    iput-boolean v1, p0, Ll/wzh0$d;->c:Z

    .line 64
    .line 65
    iget-object v0, v0, Ll/wzh0$d$a;->b:Ljava/util/List;

    .line 66
    .line 67
    const/4 v2, 0x0

    .line 68
    if-eqz v0, :cond_2

    .line 69
    .line 70
    iget-object v3, p0, Ll/wzh0$d;->f:Ll/wzh0;

    .line 71
    .line 72
    iget-object v4, p0, Ll/wzh0$d;->a:Ll/wzh0$a;

    .line 73
    .line 74
    iget-object v4, v4, Ll/wzh0$a;->c:Lcom/tantanapp/common/data/orm/Order;

    .line 75
    .line 76
    invoke-static {v3, v0, p1, v4}, Ll/wzh0;->g(Ll/wzh0;Ljava/util/List;Lcom/tantanapp/common/data/DbObject;Lcom/tantanapp/common/data/orm/Order;)I

    .line 77
    .line 78
    .line 79
    move-result p1

    .line 80
    if-ltz p1, :cond_2

    .line 81
    .line 82
    invoke-virtual {p0}, Ll/wzh0$d;->k()Ll/wzh0$d$a;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    iget-object p0, p0, Ll/wzh0$d$a;->b:Ljava/util/List;

    .line 87
    .line 88
    invoke-interface {p0, p1, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    return v1

    .line 92
    :cond_2
    return v2

    .line 93
    :cond_3
    invoke-virtual {p0, p1}, Ll/wzh0$d;->o(Lcom/tantanapp/common/data/DbObject;)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {p0, p2}, Ll/wzh0$d;->p(Lcom/tantanapp/common/data/DbObject;)Z

    .line 97
    .line 98
    .line 99
    move-result p0

    .line 100
    return p0
.end method

.method public r()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/wzh0$d;->c:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/wzh0$d;->j()Ll/wzh0$d$a;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v1, p0, Ll/wzh0$d;->d:Lrx/subjects/a;

    .line 12
    .line 13
    invoke-virtual {v1, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 17
    .line 18
    const-string v1, "triggered query "

    .line 19
    .line 20
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    iget-object v1, p0, Ll/wzh0$d;->a:Ll/wzh0$a;

    .line 24
    .line 25
    invoke-static {v1}, Ll/wzh0$a;->d(Ll/wzh0$a;)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-static {v0}, Ll/wzh0;->n(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    const/4 v0, 0x0

    .line 40
    iput-object v0, p0, Ll/wzh0$d;->b:Ll/wzh0$d$a;

    .line 41
    .line 42
    const/4 v0, 0x0

    .line 43
    iput-boolean v0, p0, Ll/wzh0$d;->c:Z

    .line 44
    .line 45
    :cond_1
    return-void
.end method

.method public final s(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/pf60<",
            "Ll/wzh0;",
            "Ljava/util/List;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-lez p0, :cond_3

    .line 6
    .line 7
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_3

    .line 16
    .line 17
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    check-cast p1, Ll/pf60;

    .line 22
    .line 23
    iget-object v0, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 24
    .line 25
    check-cast v0, Ljava/util/List;

    .line 26
    .line 27
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-eqz v1, :cond_0

    .line 36
    .line 37
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    check-cast v1, Lcom/tantanapp/common/data/DbObject;

    .line 42
    .line 43
    if-eqz v1, :cond_1

    .line 44
    .line 45
    iget-object v2, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 46
    .line 47
    if-nez v2, :cond_2

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_2
    iget-object v3, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 51
    .line 52
    check-cast v3, Ll/wzh0;

    .line 53
    .line 54
    invoke-virtual {v3, v2, v1}, Lcom/tantanapp/common/data/orm/LruCache2;->cache(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_3
    return-void
.end method

.method public t(Z)V
    .locals 7

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    sget-boolean p1, Ll/wzh0;->l:Z

    .line 4
    .line 5
    if-nez p1, :cond_1

    .line 6
    .line 7
    iget-object p1, p0, Ll/wzh0$d;->e:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    const/4 v1, 0x1

    .line 11
    invoke-virtual {p1, v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->compareAndSet(II)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Ll/wzh0$d;->f:Ll/wzh0;

    .line 18
    .line 19
    new-instance v2, Ll/zzh0;

    .line 20
    .line 21
    invoke-direct {v2, p0}, Ll/zzh0;-><init>(Ll/wzh0$d;)V

    .line 22
    .line 23
    .line 24
    new-instance v3, Ll/a0i0;

    .line 25
    .line 26
    invoke-direct {v3, p0}, Ll/a0i0;-><init>(Ll/wzh0$d;)V

    .line 27
    .line 28
    .line 29
    new-instance p1, Ljava/lang/StringBuilder;

    .line 30
    .line 31
    const-string v1, "uiquery_"

    .line 32
    .line 33
    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    iget-object v1, p0, Ll/wzh0$d;->f:Ll/wzh0;

    .line 37
    .line 38
    iget-object v1, v1, Ll/wzh0;->d:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v1, "_"

    .line 44
    .line 45
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget-object p0, p0, Ll/wzh0$d;->a:Ll/wzh0$a;

    .line 49
    .line 50
    invoke-static {p0}, Ll/wzh0$a;->d(Ll/wzh0$a;)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v6

    .line 61
    const/4 v1, 0x0

    .line 62
    const/4 v4, 0x0

    .line 63
    const/4 v5, 0x1

    .line 64
    invoke-virtual/range {v0 .. v6}, Ll/wzh0;->j(ZLl/pcj;Ll/y20;Ll/x20;ZLjava/lang/String;)V

    .line 65
    .line 66
    .line 67
    :cond_0
    return-void

    .line 68
    :cond_1
    iget-object p1, p0, Ll/wzh0$d;->e:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 69
    .line 70
    const/4 v0, 0x2

    .line 71
    invoke-virtual {p1, v0}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 72
    .line 73
    .line 74
    iget-object p1, p0, Ll/wzh0$d;->d:Lrx/subjects/a;

    .line 75
    .line 76
    new-instance v0, Ll/wzh0$d$a;

    .line 77
    .line 78
    invoke-direct {v0, p0}, Ll/wzh0$d$a;-><init>(Ll/wzh0$d;)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {p1, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 82
    .line 83
    .line 84
    return-void
.end method
