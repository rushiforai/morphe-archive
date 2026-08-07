.class public Ll/s900;
.super Ll/dxi0;
.source "SourceFile"

# interfaces
.implements Ll/p4m;
.implements Ll/kzl;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/s900$a;,
        Ll/s900$b;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/dxi0<",
        "Ll/ns2;",
        ">;",
        "Ll/p4m;",
        "Ll/kzl;"
    }
.end annotation


# instance fields
.field public b:Ll/l900;

.field public c:Z

.field public d:I

.field public e:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field public f:Landroid/view/View;

.field public g:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/s900$a;",
            ">;"
        }
    .end annotation
.end field

.field public h:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/s900$a;",
            ">;"
        }
    .end annotation
.end field

.field public i:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Ll/s900$a;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/l900;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/dxi0;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/s900;->c:Z

    .line 6
    .line 7
    iput v0, p0, Ll/s900;->d:I

    .line 8
    .line 9
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Ll/s900;->e:Lrx/subjects/b;

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    iput-object v0, p0, Ll/s900;->f:Landroid/view/View;

    .line 17
    .line 18
    new-instance v0, Ljava/util/ArrayList;

    .line 19
    .line 20
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Ll/s900;->g:Ljava/util/List;

    .line 24
    .line 25
    new-instance v0, Ljava/util/ArrayList;

    .line 26
    .line 27
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Ll/s900;->h:Ljava/util/List;

    .line 31
    .line 32
    new-instance v0, Landroid/util/SparseArray;

    .line 33
    .line 34
    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    .line 35
    .line 36
    .line 37
    iput-object v0, p0, Ll/s900;->i:Landroid/util/SparseArray;

    .line 38
    .line 39
    iput-object p1, p0, Ll/s900;->b:Ll/l900;

    .line 40
    .line 41
    return-void
.end method

.method public static synthetic A(Landroid/view/View;Landroid/view/View;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    if-ne p1, p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    goto :goto_0

    .line 5
    :cond_0
    const/4 p0, 0x0

    .line 6
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public static synthetic B(Lrx/c;)Lrx/c;
    .locals 0

    .line 1
    return-object p0
.end method


# virtual methods
.method public C()I
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/s900;->G()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-boolean v0, p0, Ll/s900;->c:Z

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return p0

    .line 13
    :cond_0
    iget-object p0, p0, Ll/s900;->h:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    return p0
.end method

.method public D()I
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/s900;->G()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-boolean v0, p0, Ll/s900;->c:Z

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return p0

    .line 13
    :cond_0
    iget-object p0, p0, Ll/s900;->g:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    return p0
.end method

.method public final E(I)Lcom/p1/mobile/putong/core/data/Message;
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/s900;->D()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-lt p1, v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/s900;->D()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget-object v1, p0, Ll/s900;->b:Ll/l900;

    .line 12
    .line 13
    invoke-virtual {v1}, Ll/l900;->d()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    add-int/2addr v0, v1

    .line 18
    if-lt p1, v0, :cond_0

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    iget-object v0, p0, Ll/s900;->b:Ll/l900;

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/s900;->D()I

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    sub-int/2addr p1, p0

    .line 28
    invoke-virtual {v0, p1}, Ll/l900;->m(I)Lcom/p1/mobile/putong/core/data/Message;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0

    .line 33
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 34
    return-object p0
.end method

.method public F()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s900;->b:Ll/l900;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    invoke-virtual {p0}, Ll/l900;->d()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public final G()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/s900;->b:Ll/l900;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/s900;->b:Ll/l900;

    .line 10
    .line 11
    invoke-interface {p0}, Ll/lzl;->f()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0
.end method

.method public H(I)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/s900;->D()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-lt p1, v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/s900;->D()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    invoke-virtual {p0}, Ll/s900;->F()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    add-int/2addr v0, v1

    .line 16
    if-lt p1, v0, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    iget-object v0, p0, Ll/s900;->b:Ll/l900;

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/s900;->D()I

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    sub-int/2addr p1, p0

    .line 26
    invoke-interface {v0, p1}, Ll/lzl;->e(I)V

    .line 27
    .line 28
    .line 29
    :cond_1
    :goto_0
    return-void
.end method

.method public final I(Landroid/view/View;Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Ljava/util/List<",
            "Ll/s900$a;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_1

    .line 4
    :cond_0
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-nez v0, :cond_2

    .line 9
    .line 10
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    :cond_1
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_2

    .line 19
    .line 20
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Ll/s900$a;

    .line 25
    .line 26
    iget-object v0, v0, Ll/s900$a;->b:Landroid/view/View;

    .line 27
    .line 28
    if-ne v0, p1, :cond_1

    .line 29
    .line 30
    invoke-interface {p2}, Ljava/util/Iterator;->remove()V

    .line 31
    .line 32
    .line 33
    :cond_2
    iget-object p2, p0, Ll/s900;->i:Landroid/util/SparseArray;

    .line 34
    .line 35
    invoke-virtual {p2}, Landroid/util/SparseArray;->size()I

    .line 36
    .line 37
    .line 38
    move-result p2

    .line 39
    const/4 v0, 0x0

    .line 40
    :goto_0
    if-ge v0, p2, :cond_4

    .line 41
    .line 42
    iget-object v1, p0, Ll/s900;->i:Landroid/util/SparseArray;

    .line 43
    .line 44
    invoke-virtual {v1, v0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    check-cast v1, Ll/s900$a;

    .line 49
    .line 50
    if-eqz v1, :cond_3

    .line 51
    .line 52
    iget-object v1, v1, Ll/s900$a;->b:Landroid/view/View;

    .line 53
    .line 54
    if-ne v1, p1, :cond_3

    .line 55
    .line 56
    iget-object p0, p0, Ll/s900;->i:Landroid/util/SparseArray;

    .line 57
    .line 58
    invoke-virtual {p0, v0}, Landroid/util/SparseArray;->removeAt(I)V

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    :cond_3
    add-int/lit8 v0, v0, 0x1

    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_4
    :goto_1
    return-void
.end method

.method public a(Ll/ns2;II)V
    .locals 3

    .line 1
    iget-object p1, p1, Ll/ns2;->a:Landroid/view/View;

    .line 2
    .line 3
    iput-object p1, p0, Ll/s900;->f:Landroid/view/View;

    .line 4
    .line 5
    const/16 v0, 0x2af8

    .line 6
    .line 7
    if-ge p3, v0, :cond_1

    .line 8
    .line 9
    const/16 v0, 0x2710

    .line 10
    .line 11
    if-lt p3, v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-object v0, p0, Ll/s900;->b:Ll/l900;

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/s900;->D()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    sub-int v1, p2, v1

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Ll/l900;->m(I)Lcom/p1/mobile/putong/core/data/Message;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {p0}, Ll/s900;->D()I

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    sub-int v2, p2, v2

    .line 31
    .line 32
    invoke-virtual {v0, p1, v1, p3, v2}, Ll/l900;->a(Landroid/view/View;Lcom/p1/mobile/putong/core/data/Message;II)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0, p2}, Ll/s900;->H(I)V

    .line 36
    .line 37
    .line 38
    :cond_1
    :goto_0
    return-void
.end method

.method public b(ILandroid/view/ViewGroup;I)Ll/ns2;
    .locals 0

    .line 1
    const/16 p1, 0x2af8

    .line 2
    .line 3
    if-ge p3, p1, :cond_1

    .line 4
    .line 5
    const/16 p1, 0x2710

    .line 6
    .line 7
    if-lt p3, p1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object p1, p0, Ll/s900;->b:Ll/l900;

    .line 11
    .line 12
    invoke-virtual {p1, p2, p3}, Ll/l900;->w(Landroid/view/ViewGroup;I)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    goto :goto_1

    .line 17
    :cond_1
    :goto_0
    iget-object p1, p0, Ll/s900;->i:Landroid/util/SparseArray;

    .line 18
    .line 19
    invoke-virtual {p1, p3}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    check-cast p1, Ll/s900$a;

    .line 24
    .line 25
    iget-object p1, p1, Ll/s900$a;->b:Landroid/view/View;

    .line 26
    .line 27
    :goto_1
    new-instance p2, Ll/s900$b;

    .line 28
    .line 29
    invoke-direct {p2, p0, p1}, Ll/s900$b;-><init>(Ll/s900;Landroid/view/View;)V

    .line 30
    .line 31
    .line 32
    return-object p2
.end method

.method public c(Ll/ner;Lrx/c;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<V:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/ner;",
            "Lrx/c<",
            "TV;>;)",
            "Lrx/c<",
            "TV;>;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, p1, p2, v0}, Ll/s900;->g(Ll/ner;Lrx/c;Z)Lrx/c;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public d(I)Ljava/lang/String;
    .locals 4

    .line 1
    iget-object v0, p0, Ll/s900;->b:Ll/l900;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const-string v1, "invalid"

    .line 8
    .line 9
    if-eqz v0, :cond_3

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/s900;->D()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const-string v2, ""

    .line 16
    .line 17
    if-ge p1, v0, :cond_0

    .line 18
    .line 19
    new-instance v0, Ljava/lang/StringBuilder;

    .line 20
    .line 21
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Ll/s900;->g:Ljava/util/List;

    .line 25
    .line 26
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    check-cast p0, Ll/s900$a;

    .line 31
    .line 32
    iget-object p0, p0, Ll/s900$a;->c:Lcom/p1/mobile/putong/core/data/Message;

    .line 33
    .line 34
    iget-wide p0, p0, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 35
    .line 36
    invoke-virtual {v0, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    return-object p0

    .line 47
    :cond_0
    invoke-virtual {p0}, Ll/s900;->D()I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    iget-object v3, p0, Ll/s900;->b:Ll/l900;

    .line 52
    .line 53
    invoke-virtual {v3}, Ll/l900;->d()I

    .line 54
    .line 55
    .line 56
    move-result v3

    .line 57
    add-int/2addr v0, v3

    .line 58
    if-lt p1, v0, :cond_1

    .line 59
    .line 60
    new-instance v0, Ljava/lang/StringBuilder;

    .line 61
    .line 62
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 63
    .line 64
    .line 65
    iget-object v1, p0, Ll/s900;->h:Ljava/util/List;

    .line 66
    .line 67
    invoke-virtual {p0}, Ll/s900;->D()I

    .line 68
    .line 69
    .line 70
    move-result v3

    .line 71
    sub-int/2addr p1, v3

    .line 72
    iget-object p0, p0, Ll/s900;->b:Ll/l900;

    .line 73
    .line 74
    invoke-virtual {p0}, Ll/l900;->d()I

    .line 75
    .line 76
    .line 77
    move-result p0

    .line 78
    sub-int/2addr p1, p0

    .line 79
    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    check-cast p0, Ll/s900$a;

    .line 84
    .line 85
    iget-object p0, p0, Ll/s900$a;->c:Lcom/p1/mobile/putong/core/data/Message;

    .line 86
    .line 87
    iget-wide p0, p0, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 88
    .line 89
    invoke-virtual {v0, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    return-object p0

    .line 100
    :cond_1
    invoke-virtual {p0, p1}, Ll/s900;->E(I)Lcom/p1/mobile/putong/core/data/Message;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    if-nez p0, :cond_2

    .line 105
    .line 106
    return-object v1

    .line 107
    :cond_2
    new-instance p1, Ljava/lang/StringBuilder;

    .line 108
    .line 109
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 110
    .line 111
    .line 112
    iget-wide v0, p0, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 113
    .line 114
    invoke-virtual {p1, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 115
    .line 116
    .line 117
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object p0

    .line 124
    return-object p0

    .line 125
    :cond_3
    return-object v1
.end method

.method public g(Ll/ner;Lrx/c;Z)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<V:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/ner;",
            "Lrx/c<",
            "TV;>;Z)",
            "Lrx/c<",
            "TV;>;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/s900;->f:Landroid/view/View;

    .line 2
    .line 3
    invoke-interface {p1}, Ll/ner;->lifecycle()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {}, Ll/psd0;->E()Lrx/c$d;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {p1, v1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iget-object p0, p0, Ll/s900;->e:Lrx/subjects/b;

    .line 16
    .line 17
    new-instance v1, Ll/q900;

    .line 18
    .line 19
    invoke-direct {v1, v0}, Ll/q900;-><init>(Landroid/view/View;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p1, p0}, Lrx/c;->takeUntil(Lrx/c;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    new-instance p1, Ll/r900;

    .line 31
    .line 32
    invoke-direct {p1, p2}, Ll/r900;-><init>(Lrx/c;)V

    .line 33
    .line 34
    .line 35
    invoke-static {p1, p0, p3}, Ll/psd0;->D(Ll/pcj;Lrx/c;Z)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    return-object p0
.end method

.method public i(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Landroid/view/View;

    .line 22
    .line 23
    new-instance v1, Ll/s900$a;

    .line 24
    .line 25
    iget v2, p0, Ll/s900;->d:I

    .line 26
    .line 27
    add-int/lit16 v2, v2, 0x2af8

    .line 28
    .line 29
    invoke-direct {v1, p0, v2, v0}, Ll/s900$a;-><init>(Ll/s900;ILandroid/view/View;)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Ll/s900;->h:Ljava/util/List;

    .line 33
    .line 34
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Ll/s900;->i:Landroid/util/SparseArray;

    .line 38
    .line 39
    iget v2, v1, Ll/s900$a;->a:I

    .line 40
    .line 41
    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 42
    .line 43
    .line 44
    iget v0, p0, Ll/s900;->d:I

    .line 45
    .line 46
    add-int/lit8 v0, v0, 0x1

    .line 47
    .line 48
    iput v0, p0, Ll/s900;->d:I

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_0
    invoke-virtual {p0}, Ll/dxi0;->s()V

    .line 52
    .line 53
    .line 54
    :cond_1
    return-void
.end method

.method public j(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/s900;->g:Ljava/util/List;

    .line 2
    .line 3
    invoke-virtual {p0, p1, v0}, Ll/s900;->I(Landroid/view/View;Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/dxi0;->s()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public m()I
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/s900;->C()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Ll/s900;->D()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    add-int/2addr v0, v1

    .line 10
    iget-object p0, p0, Ll/s900;->b:Ll/l900;

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/l900;->d()I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    add-int/2addr v0, p0

    .line 17
    return v0
.end method

.method public n()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/dxi0;->s()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public p(I)I
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/s900;->D()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-ge p1, v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/s900;->g:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Ll/s900$a;

    .line 14
    .line 15
    iget p0, p0, Ll/s900$a;->a:I

    .line 16
    .line 17
    return p0

    .line 18
    :cond_0
    invoke-virtual {p0}, Ll/s900;->D()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    invoke-virtual {p0}, Ll/s900;->F()I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    add-int/2addr v0, v1

    .line 27
    if-lt p1, v0, :cond_1

    .line 28
    .line 29
    iget-object v0, p0, Ll/s900;->h:Ljava/util/List;

    .line 30
    .line 31
    invoke-virtual {p0}, Ll/s900;->D()I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    sub-int/2addr p1, v1

    .line 36
    invoke-virtual {p0}, Ll/s900;->F()I

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    sub-int/2addr p1, p0

    .line 41
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    check-cast p0, Ll/s900$a;

    .line 46
    .line 47
    iget p0, p0, Ll/s900$a;->a:I

    .line 48
    .line 49
    return p0

    .line 50
    :cond_1
    iget-object v0, p0, Ll/s900;->b:Ll/l900;

    .line 51
    .line 52
    invoke-virtual {p0}, Ll/s900;->D()I

    .line 53
    .line 54
    .line 55
    move-result p0

    .line 56
    sub-int/2addr p1, p0

    .line 57
    invoke-virtual {v0, p1}, Ll/l900;->p(I)I

    .line 58
    .line 59
    .line 60
    move-result p0

    .line 61
    return p0
.end method

.method public r()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/s900;->c:Z

    .line 3
    .line 4
    return-void
.end method

.method public t(Landroid/view/View;)V
    .locals 2

    .line 1
    new-instance v0, Ll/s900$a;

    .line 2
    .line 3
    iget v1, p0, Ll/s900;->d:I

    .line 4
    .line 5
    add-int/lit16 v1, v1, 0x2710

    .line 6
    .line 7
    invoke-direct {v0, p0, v1, p1}, Ll/s900$a;-><init>(Ll/s900;ILandroid/view/View;)V

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Ll/s900;->g:Ljava/util/List;

    .line 11
    .line 12
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Ll/s900;->i:Landroid/util/SparseArray;

    .line 16
    .line 17
    iget v1, v0, Ll/s900$a;->a:I

    .line 18
    .line 19
    invoke-virtual {p1, v1, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    iget p1, p0, Ll/s900;->d:I

    .line 23
    .line 24
    add-int/lit8 p1, p1, 0x1

    .line 25
    .line 26
    iput p1, p0, Ll/s900;->d:I

    .line 27
    .line 28
    invoke-virtual {p0}, Ll/dxi0;->s()V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public u()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/dxi0;->s()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public w(Ll/ns2;)V
    .locals 2

    .line 1
    iget-object v0, p1, Ll/ns2;->a:Landroid/view/View;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Ll/s900;->e:Lrx/subjects/b;

    .line 6
    .line 7
    invoke-virtual {v1, v0}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    invoke-super {p0, p1}, Ll/dxi0;->w(Ll/ns2;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public x(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Landroid/view/View;

    .line 22
    .line 23
    new-instance v1, Ll/s900$a;

    .line 24
    .line 25
    iget v2, p0, Ll/s900;->d:I

    .line 26
    .line 27
    add-int/lit16 v2, v2, 0x2710

    .line 28
    .line 29
    invoke-direct {v1, p0, v2, v0}, Ll/s900$a;-><init>(Ll/s900;ILandroid/view/View;)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Ll/s900;->g:Ljava/util/List;

    .line 33
    .line 34
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Ll/s900;->i:Landroid/util/SparseArray;

    .line 38
    .line 39
    iget v2, v1, Ll/s900$a;->a:I

    .line 40
    .line 41
    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 42
    .line 43
    .line 44
    iget v0, p0, Ll/s900;->d:I

    .line 45
    .line 46
    add-int/lit8 v0, v0, 0x1

    .line 47
    .line 48
    iput v0, p0, Ll/s900;->d:I

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_0
    invoke-virtual {p0}, Ll/dxi0;->s()V

    .line 52
    .line 53
    .line 54
    :cond_1
    return-void
.end method

.method public z()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method
