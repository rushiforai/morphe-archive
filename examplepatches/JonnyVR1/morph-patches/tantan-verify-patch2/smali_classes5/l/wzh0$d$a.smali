.class public Ll/wzh0$d$a;
.super Ljava/util/AbstractList;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/wzh0$d;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/AbstractList<",
        "TT;>;"
    }
.end annotation


# instance fields
.field public a:I

.field public b:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation
.end field

.field public c:Z

.field public d:I

.field public e:J

.field public final synthetic f:Ll/wzh0$d;


# direct methods
.method public constructor <init>(Ll/wzh0$d;)V
    .locals 2

    .line 48
    iput-object p1, p0, Ll/wzh0$d$a;->f:Ll/wzh0$d;

    invoke-direct {p0}, Ljava/util/AbstractList;-><init>()V

    const/4 p1, 0x0

    .line 49
    iput-object p1, p0, Ll/wzh0$d$a;->b:Ljava/util/List;

    const/4 p1, 0x0

    .line 50
    iput-boolean p1, p0, Ll/wzh0$d$a;->c:Z

    const/4 p1, -0x1

    .line 51
    iput p1, p0, Ll/wzh0$d$a;->d:I

    const-wide/16 v0, -0x1

    .line 52
    iput-wide v0, p0, Ll/wzh0$d$a;->e:J

    .line 53
    iput p1, p0, Ll/wzh0$d$a;->a:I

    return-void
.end method

.method public constructor <init>(Ll/wzh0$d;Ll/wzh0$d$a;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/wzh0<",
            "TT;>.d.a;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/wzh0$d$a;->f:Ll/wzh0$d;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/AbstractList;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 p1, -0x1

    .line 7
    iput p1, p0, Ll/wzh0$d$a;->a:I

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput-object v0, p0, Ll/wzh0$d$a;->b:Ljava/util/List;

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    iput-boolean v1, p0, Ll/wzh0$d$a;->c:Z

    .line 14
    .line 15
    iput p1, p0, Ll/wzh0$d$a;->d:I

    .line 16
    .line 17
    const-wide/16 v1, -0x1

    .line 18
    .line 19
    iput-wide v1, p0, Ll/wzh0$d$a;->e:J

    .line 20
    .line 21
    iget p1, p2, Ll/wzh0$d$a;->a:I

    .line 22
    .line 23
    iput p1, p0, Ll/wzh0$d$a;->a:I

    .line 24
    .line 25
    iget-object p1, p2, Ll/wzh0$d$a;->b:Ljava/util/List;

    .line 26
    .line 27
    if-nez p1, :cond_0

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    .line 31
    .line 32
    iget-object p1, p2, Ll/wzh0$d$a;->b:Ljava/util/List;

    .line 33
    .line 34
    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 35
    .line 36
    .line 37
    :goto_0
    iput-object v0, p0, Ll/wzh0$d$a;->b:Ljava/util/List;

    .line 38
    .line 39
    iget-boolean p1, p2, Ll/wzh0$d$a;->c:Z

    .line 40
    .line 41
    iput-boolean p1, p0, Ll/wzh0$d$a;->c:Z

    .line 42
    .line 43
    iget p1, p2, Ll/wzh0$d$a;->d:I

    .line 44
    .line 45
    iput p1, p0, Ll/wzh0$d$a;->d:I

    .line 46
    .line 47
    return-void
.end method

.method public static synthetic a(Ll/wzh0$d$a;Lcom/tantanapp/common/data/orm/Filter;I)Ll/pf60;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/wzh0$d$a;->l(Lcom/tantanapp/common/data/orm/Filter;I)Ll/pf60;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic c(Ll/wzh0$d$a;Ll/wzh0$d$a;IILl/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/wzh0$d$a;->o(Ll/wzh0$d$a;IILl/pf60;)V

    return-void
.end method

.method public static synthetic f(Ll/wzh0$d$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/wzh0$d$a;->p()V

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Ljava/util/AbstractList;->equals(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public g(I)V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic get(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/wzh0$d$a;->i(I)Lcom/tantanapp/common/data/DbObject;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public h(Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ll/wzh0$d$a;->f:Ll/wzh0$d;

    .line 7
    .line 8
    iget-object v1, v1, Ll/wzh0$d;->f:Ll/wzh0;

    .line 9
    .line 10
    iget-object v1, v1, Ll/wzh0;->d:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v1, "/"

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    iget-object v1, p0, Ll/wzh0$d$a;->f:Ll/wzh0$d;

    .line 21
    .line 22
    iget-object v1, v1, Ll/wzh0$d;->a:Ll/wzh0$a;

    .line 23
    .line 24
    invoke-static {v1}, Ll/wzh0$a;->d(Ll/wzh0$a;)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    const-string v1, " "

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    const-string p1, "\n\t\t\t\tbase:"

    .line 40
    .line 41
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    iget-object p1, p0, Ll/wzh0$d$a;->b:Ljava/util/List;

    .line 45
    .line 46
    if-nez p1, :cond_0

    .line 47
    .line 48
    const-string p1, "null"

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    :goto_0
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    const-string p1, ", size: "

    .line 63
    .line 64
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    iget p1, p0, Ll/wzh0$d$a;->a:I

    .line 68
    .line 69
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    const-string p1, ", full: "

    .line 73
    .line 74
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    iget-boolean p0, p0, Ll/wzh0$d$a;->c:Z

    .line 78
    .line 79
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-static {p0}, Ll/wzh0;->n(Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    return-void
.end method

.method public i(I)Lcom/tantanapp/common/data/DbObject;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    .line 1
    iget v0, p0, Ll/wzh0$d$a;->d:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, -0x1

    .line 4
    .line 5
    invoke-static {p1, v0}, Ljava/lang/Math;->min(II)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iput v0, p0, Ll/wzh0$d$a;->d:I

    .line 10
    .line 11
    const/4 v1, -0x1

    .line 12
    if-ge v0, v1, :cond_0

    .line 13
    .line 14
    iput v1, p0, Ll/wzh0$d$a;->d:I

    .line 15
    .line 16
    :cond_0
    invoke-virtual {p0, p1}, Ll/wzh0$d$a;->s(I)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ll/wzh0$d$a;->f:Ll/wzh0$d;

    .line 20
    .line 21
    iget-object v0, v0, Ll/wzh0$d;->a:Ll/wzh0$a;

    .line 22
    .line 23
    iget v0, v0, Ll/wzh0$a;->d:I

    .line 24
    .line 25
    if-lt p1, v0, :cond_1

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Ll/wzh0$d$a;->v(I)V

    .line 28
    .line 29
    .line 30
    :cond_1
    iget-object p0, p0, Ll/wzh0$d$a;->b:Ljava/util/List;

    .line 31
    .line 32
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    check-cast p0, Lcom/tantanapp/common/data/DbObject;

    .line 37
    .line 38
    return-object p0
.end method

.method public isEmpty()Z
    .locals 2

    .line 1
    iget-object v0, p0, Ll/wzh0$d$a;->b:Ljava/util/List;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0, v1}, Ll/wzh0$d$a;->s(I)V

    .line 7
    .line 8
    .line 9
    :cond_0
    invoke-virtual {p0}, Ll/wzh0$d$a;->size()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-gtz p0, :cond_1

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_1
    return v1
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "TT;>;"
        }
    .end annotation

    .line 1
    invoke-super {p0}, Ljava/util/AbstractList;->iterator()Ljava/util/Iterator;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public j(Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ll/wzh0$d$a;->f:Ll/wzh0$d;

    .line 7
    .line 8
    iget-object v1, v1, Ll/wzh0$d;->f:Ll/wzh0;

    .line 9
    .line 10
    iget-object v1, v1, Ll/wzh0;->d:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v1, "/"

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    iget-object v1, p0, Ll/wzh0$d$a;->f:Ll/wzh0$d;

    .line 21
    .line 22
    iget-object v1, v1, Ll/wzh0$d;->a:Ll/wzh0$a;

    .line 23
    .line 24
    invoke-static {v1}, Ll/wzh0$a;->d(Ll/wzh0$a;)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    const-string v1, " "

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    const-string p1, "\n\t\t\t\tbase:"

    .line 40
    .line 41
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    iget-object p1, p0, Ll/wzh0$d$a;->b:Ljava/util/List;

    .line 45
    .line 46
    if-nez p1, :cond_0

    .line 47
    .line 48
    const-string p1, "null"

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    :goto_0
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    const-string p1, ", size: "

    .line 63
    .line 64
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    iget p1, p0, Ll/wzh0$d$a;->a:I

    .line 68
    .line 69
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    const-string p1, ", full: "

    .line 73
    .line 74
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    iget-boolean p0, p0, Ll/wzh0$d$a;->c:Z

    .line 78
    .line 79
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-static {p0}, Ll/wzh0;->r(Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    return-void
.end method

.method public final synthetic l(Lcom/tantanapp/common/data/orm/Filter;I)Ll/pf60;
    .locals 4

    .line 1
    iget-object v0, p0, Ll/wzh0$d$a;->f:Ll/wzh0$d;

    .line 2
    .line 3
    iget-object v1, v0, Ll/wzh0$d;->f:Ll/wzh0;

    .line 4
    .line 5
    iget-object v0, v0, Ll/wzh0$d;->a:Ll/wzh0$a;

    .line 6
    .line 7
    iget-object v0, v0, Ll/wzh0$a;->c:Lcom/tantanapp/common/data/orm/Order;

    .line 8
    .line 9
    invoke-virtual {v1, p1, v0, p2}, Ll/wzh0;->query(Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/Order;I)Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    new-instance p2, Ljava/util/ArrayList;

    .line 14
    .line 15
    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/wzh0$d$a;->f:Ll/wzh0$d;

    .line 19
    .line 20
    iget-object v0, v0, Ll/wzh0$d;->f:Ll/wzh0;

    .line 21
    .line 22
    iget-object v0, v0, Ll/wzh0;->c:Ll/pf60;

    .line 23
    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    iget-object v1, v0, Ll/pf60;->a:Ljava/lang/Object;

    .line 27
    .line 28
    check-cast v1, Ll/wzh0;

    .line 29
    .line 30
    iget-object v0, v0, Ll/pf60;->b:Ljava/lang/Object;

    .line 31
    .line 32
    check-cast v0, Ll/bkj0;

    .line 33
    .line 34
    iget-object v0, v0, Ll/bkj0;->a:Ljava/lang/Object;

    .line 35
    .line 36
    check-cast v0, Ll/qcj;

    .line 37
    .line 38
    invoke-interface {v0, p1}, Ll/qcj;->call(Ljava/lang/Object;)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    check-cast v0, Lcom/tantanapp/common/data/orm/Filter;

    .line 43
    .line 44
    iget-object v2, p0, Ll/wzh0$d$a;->f:Ll/wzh0$d;

    .line 45
    .line 46
    iget-object v2, v2, Ll/wzh0$d;->f:Ll/wzh0;

    .line 47
    .line 48
    iget-object v2, v2, Ll/wzh0;->c:Ll/pf60;

    .line 49
    .line 50
    iget-object v2, v2, Ll/pf60;->b:Ljava/lang/Object;

    .line 51
    .line 52
    check-cast v2, Ll/bkj0;

    .line 53
    .line 54
    iget-object v2, v2, Ll/bkj0;->b:Ljava/lang/Object;

    .line 55
    .line 56
    check-cast v2, Ll/pcj;

    .line 57
    .line 58
    invoke-interface {v2}, Ll/pcj;->call()Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    check-cast v2, Lcom/tantanapp/common/data/orm/Order;

    .line 63
    .line 64
    iget-object v3, p0, Ll/wzh0$d$a;->f:Ll/wzh0$d;

    .line 65
    .line 66
    iget-object v3, v3, Ll/wzh0$d;->f:Ll/wzh0;

    .line 67
    .line 68
    iget-object v3, v3, Ll/wzh0;->c:Ll/pf60;

    .line 69
    .line 70
    iget-object v3, v3, Ll/pf60;->b:Ljava/lang/Object;

    .line 71
    .line 72
    check-cast v3, Ll/bkj0;

    .line 73
    .line 74
    iget-object v3, v3, Ll/bkj0;->c:Ljava/lang/Object;

    .line 75
    .line 76
    check-cast v3, Ljava/lang/Integer;

    .line 77
    .line 78
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 79
    .line 80
    .line 81
    move-result v3

    .line 82
    invoke-virtual {v1, v0, v2, v3}, Ll/wzh0;->query(Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/Order;I)Ljava/util/List;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    iget-object v1, p0, Ll/wzh0$d$a;->f:Ll/wzh0$d;

    .line 87
    .line 88
    iget-object v1, v1, Ll/wzh0$d;->f:Ll/wzh0;

    .line 89
    .line 90
    iget-object v1, v1, Ll/wzh0;->c:Ll/pf60;

    .line 91
    .line 92
    iget-object v1, v1, Ll/pf60;->a:Ljava/lang/Object;

    .line 93
    .line 94
    check-cast v1, Ll/wzh0;

    .line 95
    .line 96
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    invoke-interface {p2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 101
    .line 102
    .line 103
    :cond_0
    iget-object p0, p0, Ll/wzh0$d$a;->f:Ll/wzh0$d;

    .line 104
    .line 105
    invoke-static {p0, p1}, Ll/wzh0$d;->f(Ll/wzh0$d;Ljava/util/List;)Ll/pf60;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    if-eqz p0, :cond_1

    .line 110
    .line 111
    invoke-interface {p2, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 112
    .line 113
    .line 114
    :cond_1
    invoke-static {p1, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    return-object p0
.end method

.method public final synthetic o(Ll/wzh0$d$a;IILl/pf60;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/wzh0$d$a;->f:Ll/wzh0$d;

    .line 2
    .line 3
    iget-object v0, v0, Ll/wzh0$d;->e:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 4
    .line 5
    const/4 v1, 0x2

    .line 6
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p4, Ll/pf60;->a:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast v0, Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    check-cast v1, Lcom/tantanapp/common/data/DbObject;

    .line 28
    .line 29
    iget-object v2, p0, Ll/wzh0$d$a;->f:Ll/wzh0$d;

    .line 30
    .line 31
    iget-object v2, v2, Ll/wzh0$d;->f:Ll/wzh0;

    .line 32
    .line 33
    iget-object v3, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {v2, v3, v1}, Lcom/tantanapp/common/data/orm/LruCache2;->cache(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    iget-object v0, p0, Ll/wzh0$d$a;->f:Ll/wzh0$d;

    .line 40
    .line 41
    iget-object v1, p4, Ll/pf60;->b:Ljava/lang/Object;

    .line 42
    .line 43
    check-cast v1, Ljava/util/List;

    .line 44
    .line 45
    invoke-static {v0, v1}, Ll/wzh0$d;->g(Ll/wzh0$d;Ljava/util/List;)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Ll/wzh0$d$a;->f:Ll/wzh0$d;

    .line 49
    .line 50
    invoke-virtual {v0}, Ll/wzh0$d;->j()Ll/wzh0$d$a;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    if-eqz v0, :cond_1

    .line 55
    .line 56
    if-ne v0, p1, :cond_1

    .line 57
    .line 58
    invoke-virtual {v0}, Ll/wzh0$d$a;->size()I

    .line 59
    .line 60
    .line 61
    move-result p1

    .line 62
    if-ne p1, p2, :cond_1

    .line 63
    .line 64
    iget-object p1, p0, Ll/wzh0$d$a;->b:Ljava/util/List;

    .line 65
    .line 66
    iget-object p2, p4, Ll/pf60;->a:Ljava/lang/Object;

    .line 67
    .line 68
    check-cast p2, Ljava/util/Collection;

    .line 69
    .line 70
    invoke-interface {p1, p2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 71
    .line 72
    .line 73
    iget-object p1, p4, Ll/pf60;->a:Ljava/lang/Object;

    .line 74
    .line 75
    check-cast p1, Ljava/util/List;

    .line 76
    .line 77
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 78
    .line 79
    .line 80
    move-result p1

    .line 81
    if-eq p1, p3, :cond_1

    .line 82
    .line 83
    iget-object p1, p0, Ll/wzh0$d$a;->b:Ljava/util/List;

    .line 84
    .line 85
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 86
    .line 87
    .line 88
    move-result p1

    .line 89
    iput p1, p0, Ll/wzh0$d$a;->a:I

    .line 90
    .line 91
    const/4 p1, 0x1

    .line 92
    iput-boolean p1, p0, Ll/wzh0$d$a;->c:Z

    .line 93
    .line 94
    :cond_1
    return-void
.end method

.method public final synthetic p()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/wzh0$d$a;->f:Ll/wzh0$d;

    .line 2
    .line 3
    iget-object p0, p0, Ll/wzh0$d;->e:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 4
    .line 5
    const/4 v0, 0x2

    .line 6
    invoke-virtual {p0, v0}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public r()V
    .locals 4

    .line 1
    invoke-static {}, Lcom/tantanapp/common/utils/ThreadUtil;->f()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v0, "query size called"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/wzh0$d$a;->h(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Ll/wzh0$d$a;->f:Ll/wzh0$d;

    .line 13
    .line 14
    iget-object v0, v0, Ll/wzh0$d;->f:Ll/wzh0;

    .line 15
    .line 16
    invoke-virtual {v0}, Ll/wzh0;->p()V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ll/wzh0$d$a;->f:Ll/wzh0$d;

    .line 20
    .line 21
    iget-object v0, v0, Ll/wzh0$d;->a:Ll/wzh0$a;

    .line 22
    .line 23
    invoke-virtual {v0}, Ll/wzh0$a;->e()I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    iput v0, p0, Ll/wzh0$d$a;->a:I

    .line 28
    .line 29
    iget-object v1, p0, Ll/wzh0$d$a;->b:Ljava/util/List;

    .line 30
    .line 31
    const/4 v2, 0x0

    .line 32
    const/4 v3, 0x1

    .line 33
    if-eqz v1, :cond_2

    .line 34
    .line 35
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    if-ne v0, v1, :cond_1

    .line 40
    .line 41
    move v2, v3

    .line 42
    :cond_1
    iput-boolean v2, p0, Ll/wzh0$d$a;->c:Z

    .line 43
    .line 44
    return-void

    .line 45
    :cond_2
    if-nez v0, :cond_3

    .line 46
    .line 47
    new-instance v0, Ljava/util/ArrayList;

    .line 48
    .line 49
    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 50
    .line 51
    .line 52
    iput-object v0, p0, Ll/wzh0$d$a;->b:Ljava/util/List;

    .line 53
    .line 54
    iput-boolean v3, p0, Ll/wzh0$d$a;->c:Z

    .line 55
    .line 56
    :cond_3
    return-void
.end method

.method public s(I)V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/wzh0$d$a;->b:Ljava/util/List;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/wzh0$d$a;->b:Ljava/util/List;

    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Ll/wzh0$d$a;->b:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-lt p1, v0, :cond_3

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Ll/wzh0$d$a;->g(I)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/wzh0$d$a;->b:Ljava/util/List;

    .line 24
    .line 25
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    iget-object v1, p0, Ll/wzh0$d$a;->f:Ll/wzh0$d;

    .line 30
    .line 31
    iget-object v1, v1, Ll/wzh0$d;->a:Ll/wzh0$a;

    .line 32
    .line 33
    iget v2, v1, Ll/wzh0$a;->d:I

    .line 34
    .line 35
    if-ge p1, v2, :cond_1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    iget v2, v1, Ll/wzh0$a;->e:I

    .line 39
    .line 40
    :goto_0
    iget-object v3, p0, Ll/wzh0$d$a;->b:Ljava/util/List;

    .line 41
    .line 42
    invoke-virtual {v1, v3}, Ll/wzh0$a;->k(Ljava/util/List;)Lcom/tantanapp/common/data/orm/Filter;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    iget-object v3, p0, Ll/wzh0$d$a;->f:Ll/wzh0$d;

    .line 47
    .line 48
    iget-object v3, v3, Ll/wzh0$d;->a:Ll/wzh0$a;

    .line 49
    .line 50
    iget-object v4, p0, Ll/wzh0$d$a;->b:Ljava/util/List;

    .line 51
    .line 52
    invoke-virtual {v3, v4, p1, v2}, Ll/wzh0$a;->l(Ljava/util/List;II)I

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    iget v2, p0, Ll/wzh0$d$a;->a:I

    .line 57
    .line 58
    iget-object v3, p0, Ll/wzh0$d$a;->b:Ljava/util/List;

    .line 59
    .line 60
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 61
    .line 62
    .line 63
    move-result v3

    .line 64
    sub-int/2addr v2, v3

    .line 65
    invoke-static {p1, v2}, Ljava/lang/Math;->min(II)I

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    new-instance v2, Ljava/lang/StringBuilder;

    .line 70
    .line 71
    const-string v3, "query cache called "

    .line 72
    .line 73
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    invoke-virtual {p0, v2}, Ll/wzh0$d$a;->h(Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    iget-object v2, p0, Ll/wzh0$d$a;->f:Ll/wzh0$d;

    .line 87
    .line 88
    iget-object v3, v2, Ll/wzh0$d;->f:Ll/wzh0;

    .line 89
    .line 90
    iget-object v2, v2, Ll/wzh0$d;->a:Ll/wzh0$a;

    .line 91
    .line 92
    iget-object v2, v2, Ll/wzh0$a;->c:Lcom/tantanapp/common/data/orm/Order;

    .line 93
    .line 94
    invoke-virtual {v3, v1, v2, p1}, Ll/wzh0;->queryCache(Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/Order;I)Ljava/util/List;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    iget-object v2, p0, Ll/wzh0$d$a;->b:Ljava/util/List;

    .line 99
    .line 100
    invoke-interface {v2, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 101
    .line 102
    .line 103
    iget-object v1, p0, Ll/wzh0$d$a;->b:Ljava/util/List;

    .line 104
    .line 105
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 106
    .line 107
    .line 108
    move-result v1

    .line 109
    add-int/2addr p1, v0

    .line 110
    if-ge v1, p1, :cond_2

    .line 111
    .line 112
    const/4 p1, 0x1

    .line 113
    iput-boolean p1, p0, Ll/wzh0$d$a;->c:Z

    .line 114
    .line 115
    iget-object p1, p0, Ll/wzh0$d$a;->b:Ljava/util/List;

    .line 116
    .line 117
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 118
    .line 119
    .line 120
    move-result p1

    .line 121
    iput p1, p0, Ll/wzh0$d$a;->a:I

    .line 122
    .line 123
    :cond_2
    invoke-static {}, Lcom/tantanapp/common/utils/ThreadUtil;->f()Z

    .line 124
    .line 125
    .line 126
    move-result p1

    .line 127
    if-eqz p1, :cond_3

    .line 128
    .line 129
    const-string p1, "status updated"

    .line 130
    .line 131
    invoke-virtual {p0, p1}, Ll/wzh0$d$a;->h(Ljava/lang/String;)V

    .line 132
    .line 133
    .line 134
    :cond_3
    return-void
.end method

.method public size()I
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "size called with "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget v1, p0, Ll/wzh0$d$a;->a:I

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {v0}, Ll/wzh0;->n(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget v0, p0, Ll/wzh0$d$a;->a:I

    .line 21
    .line 22
    const/4 v1, -0x1

    .line 23
    if-ne v0, v1, :cond_0

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/wzh0$d$a;->r()V

    .line 26
    .line 27
    .line 28
    :cond_0
    iget p0, p0, Ll/wzh0$d$a;->a:I

    .line 29
    .line 30
    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "size: "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget v1, p0, Ll/wzh0$d$a;->a:I

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, "\nfull: "

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-boolean v1, p0, Ll/wzh0$d$a;->c:Z

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, "\nbase: "

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget-object v1, p0, Ll/wzh0$d$a;->b:Ljava/util/List;

    .line 29
    .line 30
    if-nez v1, :cond_0

    .line 31
    .line 32
    const-string p0, "null"

    .line 33
    .line 34
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    const-string v1, "size "

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    iget-object v1, p0, Ll/wzh0$d$a;->b:Ljava/util/List;

    .line 44
    .line 45
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    const-string v1, "\n["

    .line 53
    .line 54
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    iget-object p0, p0, Ll/wzh0$d$a;->b:Ljava/util/List;

    .line 58
    .line 59
    const-string v1, "; "

    .line 60
    .line 61
    invoke-static {p0, v1}, Ll/jyb;->U(Ljava/util/Collection;Ljava/lang/String;)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    const-string p0, "]"

    .line 69
    .line 70
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    :goto_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    return-object p0
.end method

.method public final v(I)V
    .locals 9

    .line 1
    iget-object v0, p0, Ll/wzh0$d$a;->b:Ljava/util/List;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    iget-object v1, p0, Ll/wzh0$d$a;->f:Ll/wzh0$d;

    .line 6
    .line 7
    iget-object v1, v1, Ll/wzh0$d;->a:Ll/wzh0$a;

    .line 8
    .line 9
    iget v1, v1, Ll/wzh0$a;->d:I

    .line 10
    .line 11
    if-lt p1, v1, :cond_2

    .line 12
    .line 13
    iget-boolean v1, p0, Ll/wzh0$d$a;->c:Z

    .line 14
    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    goto/16 :goto_1

    .line 18
    .line 19
    :cond_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    sub-int/2addr v0, p1

    .line 24
    iget-object v1, p0, Ll/wzh0$d$a;->f:Ll/wzh0$d;

    .line 25
    .line 26
    iget-object v1, v1, Ll/wzh0$d;->a:Ll/wzh0$a;

    .line 27
    .line 28
    iget v1, v1, Ll/wzh0$a;->e:I

    .line 29
    .line 30
    const/4 v2, 0x2

    .line 31
    div-int/2addr v1, v2

    .line 32
    if-gt v0, v1, :cond_2

    .line 33
    .line 34
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 35
    .line 36
    .line 37
    move-result-wide v0

    .line 38
    iget-wide v3, p0, Ll/wzh0$d$a;->e:J

    .line 39
    .line 40
    sub-long/2addr v0, v3

    .line 41
    const-wide/16 v3, 0x1

    .line 42
    .line 43
    cmp-long v0, v0, v3

    .line 44
    .line 45
    if-lez v0, :cond_2

    .line 46
    .line 47
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 48
    .line 49
    .line 50
    move-result-wide v0

    .line 51
    iput-wide v0, p0, Ll/wzh0$d$a;->e:J

    .line 52
    .line 53
    iget-object v0, p0, Ll/wzh0$d$a;->b:Ljava/util/List;

    .line 54
    .line 55
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    iget-object v1, p0, Ll/wzh0$d$a;->f:Ll/wzh0$d;

    .line 60
    .line 61
    iget-object v1, v1, Ll/wzh0$d;->a:Ll/wzh0$a;

    .line 62
    .line 63
    iget v3, v1, Ll/wzh0$a;->d:I

    .line 64
    .line 65
    if-ge p1, v3, :cond_1

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_1
    iget v3, v1, Ll/wzh0$a;->e:I

    .line 69
    .line 70
    :goto_0
    iget-object v4, p0, Ll/wzh0$d$a;->b:Ljava/util/List;

    .line 71
    .line 72
    invoke-virtual {v1, v4}, Ll/wzh0$a;->k(Ljava/util/List;)Lcom/tantanapp/common/data/orm/Filter;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    iget-object v4, p0, Ll/wzh0$d$a;->f:Ll/wzh0$d;

    .line 77
    .line 78
    iget-object v4, v4, Ll/wzh0$d;->a:Ll/wzh0$a;

    .line 79
    .line 80
    iget-object v5, p0, Ll/wzh0$d$a;->b:Ljava/util/List;

    .line 81
    .line 82
    invoke-virtual {v4, v5, p1, v3}, Ll/wzh0$a;->l(Ljava/util/List;II)I

    .line 83
    .line 84
    .line 85
    move-result p1

    .line 86
    iget-object v3, p0, Ll/wzh0$d$a;->f:Ll/wzh0$d;

    .line 87
    .line 88
    iget-object v3, v3, Ll/wzh0$d;->e:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 89
    .line 90
    const/4 v4, 0x1

    .line 91
    invoke-virtual {v3, v2, v4}, Ljava/util/concurrent/atomic/AtomicInteger;->compareAndSet(II)Z

    .line 92
    .line 93
    .line 94
    move-result v2

    .line 95
    if-eqz v2, :cond_2

    .line 96
    .line 97
    sget-boolean v2, Ll/wzh0;->l:Z

    .line 98
    .line 99
    if-nez v2, :cond_2

    .line 100
    .line 101
    const-string v2, "preloading"

    .line 102
    .line 103
    invoke-virtual {p0, v2}, Ll/wzh0$d$a;->j(Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    iget-object v2, p0, Ll/wzh0$d$a;->f:Ll/wzh0$d;

    .line 107
    .line 108
    iget-object v3, v2, Ll/wzh0$d;->f:Ll/wzh0;

    .line 109
    .line 110
    new-instance v5, Ll/d0i0;

    .line 111
    .line 112
    invoke-direct {v5, p0, v1, p1}, Ll/d0i0;-><init>(Ll/wzh0$d$a;Lcom/tantanapp/common/data/orm/Filter;I)V

    .line 113
    .line 114
    .line 115
    new-instance v6, Ll/e0i0;

    .line 116
    .line 117
    invoke-direct {v6, p0, p0, v0, p1}, Ll/e0i0;-><init>(Ll/wzh0$d$a;Ll/wzh0$d$a;II)V

    .line 118
    .line 119
    .line 120
    new-instance v7, Ll/f0i0;

    .line 121
    .line 122
    invoke-direct {v7, p0}, Ll/f0i0;-><init>(Ll/wzh0$d$a;)V

    .line 123
    .line 124
    .line 125
    new-instance p1, Ljava/lang/StringBuilder;

    .line 126
    .line 127
    const-string v0, "uiquery_tryPreload_"

    .line 128
    .line 129
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 130
    .line 131
    .line 132
    iget-object v0, p0, Ll/wzh0$d$a;->f:Ll/wzh0$d;

    .line 133
    .line 134
    iget-object v0, v0, Ll/wzh0$d;->f:Ll/wzh0;

    .line 135
    .line 136
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 137
    .line 138
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 139
    .line 140
    .line 141
    const-string v0, "_"

    .line 142
    .line 143
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 144
    .line 145
    .line 146
    iget-object p0, p0, Ll/wzh0$d$a;->f:Ll/wzh0$d;

    .line 147
    .line 148
    iget-object p0, p0, Ll/wzh0$d;->a:Ll/wzh0$a;

    .line 149
    .line 150
    invoke-static {p0}, Ll/wzh0$a;->d(Ll/wzh0$a;)Ljava/lang/String;

    .line 151
    .line 152
    .line 153
    move-result-object p0

    .line 154
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 155
    .line 156
    .line 157
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object v8

    .line 161
    const/4 v4, 0x1

    .line 162
    invoke-virtual/range {v3 .. v8}, Ll/wzh0;->i(ZLl/pcj;Ll/y20;Ll/x20;Ljava/lang/String;)V

    .line 163
    .line 164
    .line 165
    :cond_2
    :goto_1
    return-void
.end method
