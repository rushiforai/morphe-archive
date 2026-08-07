.class public abstract Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;
.super Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/d;
.source "SourceFile"


# instance fields
.field public h:Ll/dxi0;

.field public i:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/orc0;",
            ">;"
        }
    .end annotation
.end field

.field public j:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/orc0;",
            ">;"
        }
    .end annotation
.end field

.field public k:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;

.field public l:Ll/qrc0;

.field public m:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field public n:Ll/yde0;

.field public o:Ll/yde0;

.field public p:Ll/pi80;

.field public q:I

.field public r:Z

.field public s:Z


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/d;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->q:I

    .line 6
    .line 7
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->r:Z

    .line 8
    .line 9
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->s:Z

    .line 10
    .line 11
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->i:Ljava/util/List;

    .line 17
    .line 18
    new-instance v0, Ljava/util/ArrayList;

    .line 19
    .line 20
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->j:Ljava/util/List;

    .line 24
    .line 25
    new-instance v0, Landroid/util/SparseArray;

    .line 26
    .line 27
    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->m:Landroid/util/SparseArray;

    .line 31
    .line 32
    new-instance v0, Ll/pi80;

    .line 33
    .line 34
    invoke-direct {v0}, Ll/pi80;-><init>()V

    .line 35
    .line 36
    .line 37
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->p:Ll/pi80;

    .line 38
    .line 39
    new-instance v0, Ll/yde0;

    .line 40
    .line 41
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->p:Ll/pi80;

    .line 42
    .line 43
    invoke-direct {v0, v1}, Ll/yde0;-><init>(Ll/pi80;)V

    .line 44
    .line 45
    .line 46
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->n:Ll/yde0;

    .line 47
    .line 48
    new-instance v0, Ll/yde0;

    .line 49
    .line 50
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->p:Ll/pi80;

    .line 51
    .line 52
    invoke-direct {v0, v1}, Ll/yde0;-><init>(Ll/pi80;)V

    .line 53
    .line 54
    .line 55
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->o:Ll/yde0;

    .line 56
    .line 57
    return-void
.end method

.method public static synthetic o(Ljava/util/List;)V
    .locals 4

    .line 1
    invoke-interface {p0}, Ljava/util/List;->listIterator()Ljava/util/ListIterator;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 7
    .line 8
    .line 9
    move-result v2

    .line 10
    if-eqz v2, :cond_1

    .line 11
    .line 12
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    check-cast v2, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/c;

    .line 17
    .line 18
    instance-of v3, v2, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/c$b;

    .line 19
    .line 20
    if-eqz v3, :cond_0

    .line 21
    .line 22
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    .line 23
    .line 24
    .line 25
    move-object v1, v2

    .line 26
    goto :goto_0

    .line 27
    :cond_1
    if-eqz v1, :cond_2

    .line 28
    .line 29
    const/4 v0, 0x0

    .line 30
    invoke-interface {p0, v0, v1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 31
    .line 32
    .line 33
    :cond_2
    return-void
.end method

.method public static synthetic p()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic q(Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;Ll/orc0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->M(Ll/orc0;)V

    return-void
.end method


# virtual methods
.method public A()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public final B(Ljava/lang/String;II)I
    .locals 5

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->L(Ljava/lang/String;I)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return p2

    .line 8
    :cond_0
    const/4 v0, 0x1

    .line 9
    move v1, v0

    .line 10
    :goto_0
    const/4 v2, 0x0

    .line 11
    if-ge v1, p3, :cond_3

    .line 12
    .line 13
    add-int v3, p2, v1

    .line 14
    .line 15
    invoke-virtual {p0, p1, v3}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->L(Ljava/lang/String;I)Z

    .line 16
    .line 17
    .line 18
    move-result v3

    .line 19
    if-eqz v3, :cond_1

    .line 20
    .line 21
    move v4, v2

    .line 22
    move v2, v0

    .line 23
    move v0, v4

    .line 24
    goto :goto_1

    .line 25
    :cond_1
    sub-int v3, p2, v1

    .line 26
    .line 27
    invoke-virtual {p0, p1, v3}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->L(Ljava/lang/String;I)Z

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    if-eqz v3, :cond_2

    .line 32
    .line 33
    goto :goto_1

    .line 34
    :cond_2
    add-int/lit8 v1, v1, 0x1

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_3
    move v0, v2

    .line 38
    :goto_1
    if-eqz v0, :cond_4

    .line 39
    .line 40
    sub-int/2addr p2, v1

    .line 41
    return p2

    .line 42
    :cond_4
    if-eqz v2, :cond_5

    .line 43
    .line 44
    add-int/2addr p2, v1

    .line 45
    return p2

    .line 46
    :cond_5
    const/4 p0, -0x1

    .line 47
    return p0
.end method

.method public final C(III)Ll/orc0;
    .locals 3

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->j:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    const/4 p3, 0x0

    .line 8
    :goto_0
    if-ge p3, p2, :cond_2

    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->j:Ljava/util/List;

    .line 11
    .line 12
    invoke-interface {v0, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Ll/orc0;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->h:Ll/dxi0;

    .line 19
    .line 20
    invoke-virtual {v1}, Ll/dxi0;->z()Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->h:Ll/dxi0;

    .line 25
    .line 26
    if-eqz v1, :cond_0

    .line 27
    .line 28
    invoke-virtual {v2, p1}, Ll/dxi0;->d(I)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    iget-object v2, v0, Ll/orc0;->g:Ll/ns2;

    .line 33
    .line 34
    iget-object v2, v2, Ll/ns2;->b:Ljava/lang/String;

    .line 35
    .line 36
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    if-eqz v1, :cond_1

    .line 41
    .line 42
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->h:Ll/dxi0;

    .line 43
    .line 44
    invoke-virtual {v1, p1}, Ll/dxi0;->p(I)I

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    iget-object v2, v0, Ll/orc0;->g:Ll/ns2;

    .line 49
    .line 50
    iget v2, v2, Ll/ns2;->c:I

    .line 51
    .line 52
    if-ne v1, v2, :cond_1

    .line 53
    .line 54
    goto :goto_1

    .line 55
    :cond_0
    invoke-virtual {v2, p1}, Ll/dxi0;->p(I)I

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    iget-object v2, v0, Ll/orc0;->g:Ll/ns2;

    .line 60
    .line 61
    iget v2, v2, Ll/ns2;->c:I

    .line 62
    .line 63
    if-ne v1, v2, :cond_1

    .line 64
    .line 65
    goto :goto_1

    .line 66
    :cond_1
    add-int/lit8 p3, p3, 0x1

    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_2
    const/4 v0, 0x0

    .line 70
    :goto_1
    if-eqz v0, :cond_3

    .line 71
    .line 72
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->j:Ljava/util/List;

    .line 73
    .line 74
    invoke-interface {p0, v0}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    :cond_3
    return-object v0
.end method

.method public D(III)Ll/orc0;
    .locals 4

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->C(III)Ll/orc0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 8
    .line 9
    .line 10
    iget-object v1, v0, Ll/orc0;->g:Ll/ns2;

    .line 11
    .line 12
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->h:Ll/dxi0;

    .line 13
    .line 14
    invoke-virtual {v2, p1}, Ll/dxi0;->p(I)I

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    iput v2, v1, Ll/ns2;->c:I

    .line 19
    .line 20
    iget-object v1, v0, Ll/orc0;->g:Ll/ns2;

    .line 21
    .line 22
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->h:Ll/dxi0;

    .line 23
    .line 24
    invoke-virtual {v2, p1}, Ll/dxi0;->d(I)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    iput-object v2, v1, Ll/ns2;->b:Ljava/lang/String;

    .line 29
    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->h:Ll/dxi0;

    .line 31
    .line 32
    iget-object v2, v0, Ll/orc0;->g:Ll/ns2;

    .line 33
    .line 34
    invoke-virtual {v1, v2}, Ll/dxi0;->w(Ll/ns2;)V

    .line 35
    .line 36
    .line 37
    const-string v1, "tempList begin"

    .line 38
    .line 39
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->u(Ll/orc0;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->h:Ll/dxi0;

    .line 43
    .line 44
    iget-object v2, v0, Ll/orc0;->g:Ll/ns2;

    .line 45
    .line 46
    invoke-virtual {v1, p1}, Ll/dxi0;->p(I)I

    .line 47
    .line 48
    .line 49
    move-result v3

    .line 50
    invoke-virtual {v1, v2, p1, v3}, Ll/dxi0;->a(Ll/ns2;II)V

    .line 51
    .line 52
    .line 53
    const-string v1, "tempList end"

    .line 54
    .line 55
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->u(Ll/orc0;Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p0, p2, p3, v0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->r(IILl/orc0;)V

    .line 59
    .line 60
    .line 61
    :cond_0
    if-nez v0, :cond_1

    .line 62
    .line 63
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->H(III)Ll/orc0;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    :cond_1
    if-nez v0, :cond_2

    .line 68
    .line 69
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->z(III)Ll/orc0;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    return-object p0

    .line 74
    :cond_2
    return-object v0
.end method

.method public E()Ll/orc0;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->i:Ljava/util/List;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    check-cast p0, Ll/orc0;

    .line 9
    .line 10
    return-object p0
.end method

.method public F()Ll/orc0;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->i:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    add-int/lit8 v0, v0, -0x1

    .line 8
    .line 9
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Ll/orc0;

    .line 14
    .line 15
    return-object p0
.end method

.method public final G()V
    .locals 10

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->l:Ll/qrc0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/qrc0;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/qrc0;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->l:Ll/qrc0;

    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->i:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->l:Ll/qrc0;

    .line 20
    .line 21
    const/4 v2, 0x0

    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    invoke-virtual {v1}, Ll/qrc0;->b()V

    .line 25
    .line 26
    .line 27
    iput v2, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->q:I

    .line 28
    .line 29
    return-void

    .line 30
    :cond_1
    invoke-virtual {v1}, Ll/qrc0;->b()V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->k:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;

    .line 34
    .line 35
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->getRenderContentHeight()I

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->E()Ll/orc0;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->F()Ll/orc0;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    iget v3, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->q:I

    .line 47
    .line 48
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->l:Ll/qrc0;

    .line 49
    .line 50
    iget v5, v0, Ll/orc0;->f:I

    .line 51
    .line 52
    iput v5, v4, Ll/qrc0;->a:I

    .line 53
    .line 54
    iget v5, v0, Ll/orc0;->a:I

    .line 55
    .line 56
    add-int v6, v5, v3

    .line 57
    .line 58
    iput v6, v4, Ll/qrc0;->c:I

    .line 59
    .line 60
    iget v6, v0, Ll/orc0;->c:I

    .line 61
    .line 62
    add-int/2addr v5, v6

    .line 63
    add-int/2addr v5, v3

    .line 64
    iput v5, v4, Ll/qrc0;->d:I

    .line 65
    .line 66
    iget-object v0, v0, Ll/orc0;->g:Ll/ns2;

    .line 67
    .line 68
    iget-object v0, v0, Ll/ns2;->b:Ljava/lang/String;

    .line 69
    .line 70
    iput-object v0, v4, Ll/qrc0;->b:Ljava/lang/String;

    .line 71
    .line 72
    iget v0, v1, Ll/orc0;->f:I

    .line 73
    .line 74
    iput v0, v4, Ll/qrc0;->e:I

    .line 75
    .line 76
    iget v0, v1, Ll/orc0;->a:I

    .line 77
    .line 78
    add-int v5, v0, v3

    .line 79
    .line 80
    iput v5, v4, Ll/qrc0;->g:I

    .line 81
    .line 82
    iget v5, v1, Ll/orc0;->c:I

    .line 83
    .line 84
    add-int/2addr v0, v5

    .line 85
    add-int/2addr v0, v3

    .line 86
    iput v0, v4, Ll/qrc0;->h:I

    .line 87
    .line 88
    iget-object v0, v1, Ll/orc0;->g:Ll/ns2;

    .line 89
    .line 90
    iget-object v0, v0, Ll/ns2;->b:Ljava/lang/String;

    .line 91
    .line 92
    iput-object v0, v4, Ll/qrc0;->f:Ljava/lang/String;

    .line 93
    .line 94
    int-to-float v0, v3

    .line 95
    iput v0, v4, Ll/qrc0;->i:F

    .line 96
    .line 97
    iput v2, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->q:I

    .line 98
    .line 99
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->i:Ljava/util/List;

    .line 100
    .line 101
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    if-nez v0, :cond_2

    .line 106
    .line 107
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->i:Ljava/util/List;

    .line 108
    .line 109
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 110
    .line 111
    .line 112
    move-result v0

    .line 113
    add-int/lit8 v0, v0, -0x1

    .line 114
    .line 115
    if-ge v2, v0, :cond_2

    .line 116
    .line 117
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->i:Ljava/util/List;

    .line 118
    .line 119
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    check-cast v0, Ll/orc0;

    .line 124
    .line 125
    invoke-static {}, Ll/wpi0;->a()Ll/wpi0;

    .line 126
    .line 127
    .line 128
    move-result-object v4

    .line 129
    iget v5, v0, Ll/orc0;->b:I

    .line 130
    .line 131
    iget v1, v0, Ll/orc0;->a:I

    .line 132
    .line 133
    add-int v6, v1, v3

    .line 134
    .line 135
    iget v7, v0, Ll/orc0;->c:I

    .line 136
    .line 137
    iget v8, v0, Ll/orc0;->f:I

    .line 138
    .line 139
    iget-object v0, v0, Ll/orc0;->g:Ll/ns2;

    .line 140
    .line 141
    iget-object v9, v0, Ll/ns2;->b:Ljava/lang/String;

    .line 142
    .line 143
    invoke-virtual/range {v4 .. v9}, Ll/wpi0;->c(IIIILjava/lang/String;)V

    .line 144
    .line 145
    .line 146
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->l:Ll/qrc0;

    .line 147
    .line 148
    invoke-virtual {v0, v4}, Ll/qrc0;->a(Ll/wpi0;)V

    .line 149
    .line 150
    .line 151
    add-int/lit8 v2, v2, 0x1

    .line 152
    .line 153
    goto :goto_0

    .line 154
    :cond_2
    return-void
.end method

.method public final H(III)Ll/orc0;
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->h:Ll/dxi0;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/dxi0;->p(I)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->p:Ll/pi80;

    .line 8
    .line 9
    invoke-virtual {v1, v0}, Ll/pi80;->b(I)Ll/ns2;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-static {}, Ll/orc0;->a()Ll/orc0;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    iput-object v0, v1, Ll/orc0;->g:Ll/ns2;

    .line 20
    .line 21
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->h:Ll/dxi0;

    .line 22
    .line 23
    invoke-virtual {v2, p1}, Ll/dxi0;->p(I)I

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    iput v2, v0, Ll/ns2;->c:I

    .line 28
    .line 29
    iget-object v0, v1, Ll/orc0;->g:Ll/ns2;

    .line 30
    .line 31
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->h:Ll/dxi0;

    .line 32
    .line 33
    invoke-virtual {v2, p1}, Ll/dxi0;->d(I)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    iput-object v2, v0, Ll/ns2;->b:Ljava/lang/String;

    .line 38
    .line 39
    iput p1, v1, Ll/orc0;->f:I

    .line 40
    .line 41
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->h:Ll/dxi0;

    .line 42
    .line 43
    iget-object v2, v1, Ll/orc0;->g:Ll/ns2;

    .line 44
    .line 45
    invoke-virtual {v0, v2}, Ll/dxi0;->w(Ll/ns2;)V

    .line 46
    .line 47
    .line 48
    const-string v0, "getRecyclerInfoFromPool begin"

    .line 49
    .line 50
    invoke-virtual {p0, v1, v0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->u(Ll/orc0;Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->h:Ll/dxi0;

    .line 54
    .line 55
    iget-object v2, v1, Ll/orc0;->g:Ll/ns2;

    .line 56
    .line 57
    invoke-virtual {v0, p1}, Ll/dxi0;->p(I)I

    .line 58
    .line 59
    .line 60
    move-result v3

    .line 61
    invoke-virtual {v0, v2, p1, v3}, Ll/dxi0;->a(Ll/ns2;II)V

    .line 62
    .line 63
    .line 64
    const-string p1, "getRecyclerInfoFromPool end"

    .line 65
    .line 66
    invoke-virtual {p0, v1, p1}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->u(Ll/orc0;Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p0, p2, p3, v1}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->r(IILl/orc0;)V

    .line 70
    .line 71
    .line 72
    const/4 p0, 0x1

    .line 73
    iput p0, v1, Ll/orc0;->h:I

    .line 74
    .line 75
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 76
    .line 77
    .line 78
    return-object v1

    .line 79
    :cond_0
    const/4 p0, 0x0

    .line 80
    return-object p0
.end method

.method public I()I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->i:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return p0

    .line 11
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->i:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method

.method public J(I)Landroid/view/View;
    .locals 1

    .line 1
    if-ltz p1, :cond_1

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->i:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-lt p1, v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->i:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    check-cast p0, Ll/orc0;

    .line 19
    .line 20
    iget-object p0, p0, Ll/orc0;->g:Ll/ns2;

    .line 21
    .line 22
    iget-object p0, p0, Ll/ns2;->a:Landroid/view/View;

    .line 23
    .line 24
    return-object p0

    .line 25
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 26
    return-object p0
.end method

.method public final K(ILjava/util/List;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;)Z"
        }
    .end annotation

    .line 1
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    if-eqz p2, :cond_1

    .line 10
    .line 11
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    check-cast p2, Ljava/lang/Integer;

    .line 16
    .line 17
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 18
    .line 19
    .line 20
    move-result p2

    .line 21
    if-ne p1, p2, :cond_0

    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    return p0

    .line 25
    :cond_1
    const/4 p0, 0x0

    .line 26
    return p0
.end method

.method public final L(Ljava/lang/String;I)Z
    .locals 1

    .line 1
    if-ltz p2, :cond_0

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->h:Ll/dxi0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dxi0;->m()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-ge p2, v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->h:Ll/dxi0;

    .line 12
    .line 13
    invoke-virtual {p0, p2}, Ll/dxi0;->d(I)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    return p0

    .line 25
    :cond_0
    const/4 p0, 0x0

    .line 26
    return p0
.end method

.method public final synthetic M(Ll/orc0;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->i:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->k:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;

    .line 7
    .line 8
    iget-object p1, p1, Ll/orc0;->g:Ll/ns2;

    .line 9
    .line 10
    iget-object p1, p1, Ll/ns2;->a:Landroid/view/View;

    .line 11
    .line 12
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->addView(Landroid/view/View;)V

    .line 13
    .line 14
    .line 15
    const-string p1, "test add refresh"

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->W(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public N()V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->s:Z

    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->X()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->y()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->f0()V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->Z()V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->l:Ll/qrc0;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->h:Ll/dxi0;

    .line 19
    .line 20
    invoke-virtual {v1}, Ll/dxi0;->m()I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    iput v1, v0, Ll/qrc0;->n:I

    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->l:Ll/qrc0;

    .line 27
    .line 28
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->k:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;

    .line 29
    .line 30
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->getRenderContentHeight()I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    iput v1, v0, Ll/qrc0;->o:I

    .line 35
    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->k:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;

    .line 37
    .line 38
    const-string v1, "layoutAfterAnchor"

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->E(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    const/4 v0, 0x0

    .line 44
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->s:Z

    .line 45
    .line 46
    return-void
.end method

.method public O(ZIIII)V
    .locals 0

    .line 1
    const-string p1, "layoutChild"

    .line 2
    .line 3
    invoke-static {p1}, Ll/yor;->c(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p1, "sys layout"

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->W(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public P()V
    .locals 7

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->s:Z

    .line 3
    .line 4
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->i:Ljava/util/List;

    .line 5
    .line 6
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    const/4 v2, 0x0

    .line 11
    if-lez v1, :cond_4

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->i:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    check-cast v1, Ll/orc0;

    .line 20
    .line 21
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->i:Ljava/util/List;

    .line 22
    .line 23
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 24
    .line 25
    .line 26
    move-result v4

    .line 27
    sub-int/2addr v4, v0

    .line 28
    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    check-cast v3, Ll/orc0;

    .line 33
    .line 34
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->k:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;

    .line 35
    .line 36
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->getRenderContentHeight()I

    .line 37
    .line 38
    .line 39
    move-result v4

    .line 40
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->l:Ll/qrc0;

    .line 41
    .line 42
    iget v6, v5, Ll/qrc0;->o:I

    .line 43
    .line 44
    iput v4, v5, Ll/qrc0;->o:I

    .line 45
    .line 46
    if-le v4, v6, :cond_1

    .line 47
    .line 48
    iget v3, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->q:I

    .line 49
    .line 50
    sub-int/2addr v4, v6

    .line 51
    add-int/2addr v3, v4

    .line 52
    iput v3, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->q:I

    .line 53
    .line 54
    iget v4, v1, Ll/orc0;->a:I

    .line 55
    .line 56
    add-int/2addr v3, v4

    .line 57
    if-lez v3, :cond_4

    .line 58
    .line 59
    iget v1, v1, Ll/orc0;->f:I

    .line 60
    .line 61
    sub-int/2addr v1, v0

    .line 62
    if-ltz v1, :cond_0

    .line 63
    .line 64
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->h:Ll/dxi0;

    .line 65
    .line 66
    invoke-virtual {v0}, Ll/dxi0;->m()I

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    invoke-virtual {p0, v1, v4, v0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->h0(III)V

    .line 71
    .line 72
    .line 73
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->i:Ljava/util/List;

    .line 74
    .line 75
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    check-cast v0, Ll/orc0;

    .line 80
    .line 81
    iget v1, v0, Ll/orc0;->f:I

    .line 82
    .line 83
    if-nez v1, :cond_4

    .line 84
    .line 85
    iget v0, v0, Ll/orc0;->a:I

    .line 86
    .line 87
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->q:I

    .line 88
    .line 89
    add-int v3, v0, v1

    .line 90
    .line 91
    if-lez v3, :cond_4

    .line 92
    .line 93
    add-int/2addr v0, v1

    .line 94
    sub-int/2addr v1, v0

    .line 95
    iput v1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->q:I

    .line 96
    .line 97
    goto :goto_0

    .line 98
    :cond_1
    iget v0, v3, Ll/orc0;->a:I

    .line 99
    .line 100
    iget v1, v3, Ll/orc0;->c:I

    .line 101
    .line 102
    add-int v3, v0, v1

    .line 103
    .line 104
    iget v5, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->q:I

    .line 105
    .line 106
    add-int/2addr v3, v5

    .line 107
    if-lt v3, v6, :cond_2

    .line 108
    .line 109
    add-int v3, v0, v1

    .line 110
    .line 111
    add-int/2addr v3, v5

    .line 112
    if-gt v3, v4, :cond_3

    .line 113
    .line 114
    :cond_2
    add-int v3, v0, v1

    .line 115
    .line 116
    add-int/2addr v3, v5

    .line 117
    if-ge v3, v6, :cond_4

    .line 118
    .line 119
    add-int/2addr v0, v1

    .line 120
    add-int/2addr v0, v5

    .line 121
    if-le v0, v4, :cond_4

    .line 122
    .line 123
    :cond_3
    sub-int/2addr v4, v6

    .line 124
    add-int/2addr v5, v4

    .line 125
    iput v5, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->q:I

    .line 126
    .line 127
    :cond_4
    :goto_0
    iput-boolean v2, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->s:Z

    .line 128
    .line 129
    return-void
.end method

.method public Q()V
    .locals 1

    .line 1
    const-string v0, "notifyDataChange"

    .line 2
    .line 3
    invoke-static {v0}, Ll/yor;->c(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    sget-object v0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/d;->f:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/c;

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/d;->h(Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/c;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public R(Ljava/lang/Runnable;Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->k:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->getRenderContentHeight()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-gtz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    const-string v1, "notifyDataChangeInner ------- begin from: "

    .line 13
    .line 14
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-static {v0}, Ll/yor;->c(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    const/4 v0, 0x1

    .line 28
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->s:Z

    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->y()V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->G()V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->X()V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->s(Ljava/lang/Runnable;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->f0()V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->A()Z

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->Z()V

    .line 49
    .line 50
    .line 51
    const-string p1, "notifyDataChangeInner"

    .line 52
    .line 53
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->Y(Ljava/lang/String;Z)V

    .line 54
    .line 55
    .line 56
    const/4 p1, 0x0

    .line 57
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->s:Z

    .line 58
    .line 59
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->w()V

    .line 60
    .line 61
    .line 62
    new-instance p0, Ljava/lang/StringBuilder;

    .line 63
    .line 64
    const-string p1, "notifyDataChangeInner ------- end from: "

    .line 65
    .line 66
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-static {p0}, Ll/yor;->c(Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method public final S(Ljava/lang/String;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->R(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final T(Ljava/util/List;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_a

    .line 2
    .line 3
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto/16 :goto_3

    .line 10
    .line 11
    :cond_0
    const-string v0, "notifyItemIndex"

    .line 12
    .line 13
    invoke-static {v0}, Ll/yor;->c(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const/4 v0, 0x1

    .line 17
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->s:Z

    .line 18
    .line 19
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->r:Z

    .line 20
    .line 21
    const/4 v2, 0x0

    .line 22
    if-eqz v1, :cond_9

    .line 23
    .line 24
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->k:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;

    .line 25
    .line 26
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->getRenderContentHeight()I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->k:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;

    .line 31
    .line 32
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->getRealWidth()I

    .line 33
    .line 34
    .line 35
    move-result v3

    .line 36
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->i:Ljava/util/List;

    .line 37
    .line 38
    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v4

    .line 42
    check-cast v4, Ll/orc0;

    .line 43
    .line 44
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->i:Ljava/util/List;

    .line 45
    .line 46
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 47
    .line 48
    .line 49
    move-result v6

    .line 50
    sub-int/2addr v6, v0

    .line 51
    invoke-interface {v5, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v5

    .line 55
    check-cast v5, Ll/orc0;

    .line 56
    .line 57
    iget v6, v4, Ll/orc0;->f:I

    .line 58
    .line 59
    if-nez v6, :cond_1

    .line 60
    .line 61
    iget v6, v4, Ll/orc0;->a:I

    .line 62
    .line 63
    iget v7, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->q:I

    .line 64
    .line 65
    add-int/2addr v6, v7

    .line 66
    if-nez v6, :cond_1

    .line 67
    .line 68
    iget v6, v5, Ll/orc0;->f:I

    .line 69
    .line 70
    iget-object v7, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->h:Ll/dxi0;

    .line 71
    .line 72
    invoke-virtual {v7}, Ll/dxi0;->m()I

    .line 73
    .line 74
    .line 75
    move-result v7

    .line 76
    sub-int/2addr v7, v0

    .line 77
    if-ne v6, v7, :cond_2

    .line 78
    .line 79
    iget v6, v5, Ll/orc0;->a:I

    .line 80
    .line 81
    iget v7, v5, Ll/orc0;->c:I

    .line 82
    .line 83
    add-int/2addr v6, v7

    .line 84
    if-gt v6, v1, :cond_2

    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_1
    iget v0, v5, Ll/orc0;->a:I

    .line 88
    .line 89
    iget v6, v5, Ll/orc0;->c:I

    .line 90
    .line 91
    add-int/2addr v0, v6

    .line 92
    :goto_0
    move v0, v2

    .line 93
    :cond_2
    if-nez v0, :cond_3

    .line 94
    .line 95
    iget-object v6, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->i:Ljava/util/List;

    .line 96
    .line 97
    invoke-static {v6}, Ljava/util/Collections;->reverse(Ljava/util/List;)V

    .line 98
    .line 99
    .line 100
    :cond_3
    iget-object v6, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->i:Ljava/util/List;

    .line 101
    .line 102
    invoke-interface {v6}, Ljava/util/List;->listIterator()Ljava/util/ListIterator;

    .line 103
    .line 104
    .line 105
    move-result-object v6

    .line 106
    if-eqz v0, :cond_4

    .line 107
    .line 108
    iget v4, v4, Ll/orc0;->a:I

    .line 109
    .line 110
    goto :goto_2

    .line 111
    :cond_4
    iget v4, v5, Ll/orc0;->a:I

    .line 112
    .line 113
    iget v5, v5, Ll/orc0;->c:I

    .line 114
    .line 115
    :goto_1
    add-int/2addr v4, v5

    .line 116
    :goto_2
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    .line 117
    .line 118
    .line 119
    move-result v5

    .line 120
    if-eqz v5, :cond_7

    .line 121
    .line 122
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 123
    .line 124
    .line 125
    move-result-object v5

    .line 126
    check-cast v5, Ll/orc0;

    .line 127
    .line 128
    iget v7, v5, Ll/orc0;->f:I

    .line 129
    .line 130
    invoke-virtual {p0, v7, p1}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->K(ILjava/util/List;)Z

    .line 131
    .line 132
    .line 133
    move-result v7

    .line 134
    if-eqz v7, :cond_5

    .line 135
    .line 136
    invoke-virtual {p0, v3, v1, v5}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->r(IILl/orc0;)V

    .line 137
    .line 138
    .line 139
    :cond_5
    if-eqz v0, :cond_6

    .line 140
    .line 141
    iput v4, v5, Ll/orc0;->a:I

    .line 142
    .line 143
    iget v5, v5, Ll/orc0;->c:I

    .line 144
    .line 145
    goto :goto_1

    .line 146
    :cond_6
    iget v7, v5, Ll/orc0;->c:I

    .line 147
    .line 148
    sub-int/2addr v4, v7

    .line 149
    iput v4, v5, Ll/orc0;->a:I

    .line 150
    .line 151
    goto :goto_2

    .line 152
    :cond_7
    if-nez v0, :cond_8

    .line 153
    .line 154
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->i:Ljava/util/List;

    .line 155
    .line 156
    invoke-static {p1}, Ljava/util/Collections;->reverse(Ljava/util/List;)V

    .line 157
    .line 158
    .line 159
    :cond_8
    const-string p1, "notify notifyItemIndex"

    .line 160
    .line 161
    invoke-virtual {p0, p1, v2}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->Y(Ljava/lang/String;Z)V

    .line 162
    .line 163
    .line 164
    :cond_9
    iput-boolean v2, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->s:Z

    .line 165
    .line 166
    :cond_a
    :goto_3
    return-void
.end method

.method public U()V
    .locals 5

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "Manager onRequest:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->s:Z

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {v0}, Ll/yor;->c(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->s:Z

    .line 21
    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    goto :goto_1

    .line 25
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->i:Ljava/util/List;

    .line 26
    .line 27
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    new-instance v1, Ljava/util/ArrayList;

    .line 32
    .line 33
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 34
    .line 35
    .line 36
    const/4 v2, 0x0

    .line 37
    :goto_0
    if-ge v2, v0, :cond_2

    .line 38
    .line 39
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->i:Ljava/util/List;

    .line 40
    .line 41
    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    check-cast v3, Ll/orc0;

    .line 46
    .line 47
    iget-object v4, v3, Ll/orc0;->g:Ll/ns2;

    .line 48
    .line 49
    iget-object v4, v4, Ll/ns2;->a:Landroid/view/View;

    .line 50
    .line 51
    invoke-virtual {v4}, Landroid/view/View;->isLayoutRequested()Z

    .line 52
    .line 53
    .line 54
    move-result v4

    .line 55
    if-eqz v4, :cond_1

    .line 56
    .line 57
    iget v3, v3, Ll/orc0;->f:I

    .line 58
    .line 59
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 60
    .line 61
    .line 62
    move-result-object v3

    .line 63
    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    :cond_1
    add-int/lit8 v2, v2, 0x1

    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_2
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    if-eqz v0, :cond_3

    .line 74
    .line 75
    :goto_1
    return-void

    .line 76
    :cond_3
    const-string v0, "TantanListView"

    .line 77
    .line 78
    const-string v2, "item real Request"

    .line 79
    .line 80
    invoke-static {v0, v2}, Ll/yor;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    new-instance v0, Ljava/lang/StringBuilder;

    .line 84
    .line 85
    const-string v2, "Manager onRequest doing:"

    .line 86
    .line 87
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 91
    .line 92
    .line 93
    move-result v2

    .line 94
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 95
    .line 96
    .line 97
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    invoke-static {v0}, Ll/yor;->c(Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    new-instance v0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/c$b;

    .line 105
    .line 106
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/c$b;-><init>()V

    .line 107
    .line 108
    .line 109
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/c$b;->b(Ljava/util/List;)V

    .line 110
    .line 111
    .line 112
    new-instance v1, Ll/rn2;

    .line 113
    .line 114
    invoke-direct {v1}, Ll/rn2;-><init>()V

    .line 115
    .line 116
    .line 117
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/d;->i(Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/c;Ll/y20;)V

    .line 118
    .line 119
    .line 120
    return-void
.end method

.method public V()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->i:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->k:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->getRealWidth()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->k:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;

    .line 16
    .line 17
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->getRenderContentHeight()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->i:Ljava/util/List;

    .line 22
    .line 23
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    if-eqz v3, :cond_0

    .line 32
    .line 33
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    check-cast v3, Ll/orc0;

    .line 38
    .line 39
    invoke-virtual {p0, v0, v1, v3}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->r(IILl/orc0;)V

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_0
    return-void
.end method

.method public W(Ljava/lang/String;)V
    .locals 7

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "realLayoutItem\uff1a"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-static {p1}, Ll/yor;->c(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    const/4 p1, 0x0

    .line 19
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->i:Ljava/util/List;

    .line 20
    .line 21
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-ge p1, v0, :cond_0

    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->i:Ljava/util/List;

    .line 28
    .line 29
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    check-cast v0, Ll/orc0;

    .line 34
    .line 35
    iget-object v1, v0, Ll/orc0;->g:Ll/ns2;

    .line 36
    .line 37
    iget-object v1, v1, Ll/ns2;->a:Landroid/view/View;

    .line 38
    .line 39
    iget v2, v0, Ll/orc0;->b:I

    .line 40
    .line 41
    iget v3, v0, Ll/orc0;->a:I

    .line 42
    .line 43
    iget v4, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->q:I

    .line 44
    .line 45
    add-int v5, v3, v4

    .line 46
    .line 47
    iget v6, v0, Ll/orc0;->d:I

    .line 48
    .line 49
    add-int/2addr v6, v2

    .line 50
    iget v0, v0, Ll/orc0;->c:I

    .line 51
    .line 52
    add-int/2addr v3, v0

    .line 53
    add-int/2addr v3, v4

    .line 54
    invoke-virtual {v1, v2, v5, v6, v3}, Landroid/view/View;->layout(IIII)V

    .line 55
    .line 56
    .line 57
    add-int/lit8 p1, p1, 0x1

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_0
    return-void
.end method

.method public final X()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->i:Ljava/util/List;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-lez v0, :cond_2

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->i:Ljava/util/List;

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
    if-eqz v1, :cond_2

    .line 22
    .line 23
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    check-cast v1, Ll/orc0;

    .line 28
    .line 29
    iget v2, v1, Ll/orc0;->h:I

    .line 30
    .line 31
    const/4 v3, 0x3

    .line 32
    if-ne v2, v3, :cond_0

    .line 33
    .line 34
    const/4 v2, 0x4

    .line 35
    iput v2, v1, Ll/orc0;->h:I

    .line 36
    .line 37
    :cond_0
    iget-object v2, v1, Ll/orc0;->g:Ll/ns2;

    .line 38
    .line 39
    if-nez v2, :cond_1

    .line 40
    .line 41
    const-string v2, "TantanListView"

    .line 42
    .line 43
    const-string v3, "temList hold add null\uff1a----------------"

    .line 44
    .line 45
    invoke-static {v2, v3}, Ll/yor;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    :cond_1
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->j:Ljava/util/List;

    .line 49
    .line 50
    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->i:Ljava/util/List;

    .line 55
    .line 56
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public Y(Ljava/lang/String;Z)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "requestInner from: "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Ll/yor;->c(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    if-eqz p2, :cond_0

    .line 19
    .line 20
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->l:Ll/qrc0;

    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->h:Ll/dxi0;

    .line 23
    .line 24
    invoke-virtual {v0}, Ll/dxi0;->m()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    iput v0, p2, Ll/qrc0;->n:I

    .line 29
    .line 30
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->l:Ll/qrc0;

    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->k:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;

    .line 33
    .line 34
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->getRenderContentHeight()I

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    iput v0, p2, Ll/qrc0;->o:I

    .line 39
    .line 40
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->k:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;

    .line 41
    .line 42
    new-instance p2, Ljava/lang/StringBuilder;

    .line 43
    .line 44
    const-string v0, "request inner "

    .line 45
    .line 46
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->E(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public final Z()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->j:Ljava/util/List;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-lez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->j:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/List;->listIterator()Ljava/util/ListIterator;

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
    check-cast v1, Ll/orc0;

    .line 28
    .line 29
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    .line 30
    .line 31
    .line 32
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->n:Ll/yde0;

    .line 33
    .line 34
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->h:Ll/dxi0;

    .line 35
    .line 36
    invoke-virtual {v2, v1, v3}, Ll/yde0;->d(Ll/orc0;Ll/dxi0;)V

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    return-void
.end method

.method public a0(Ll/dxi0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->h:Ll/dxi0;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Ll/dxi0;->y(Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public b0(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->r:Z

    .line 2
    .line 3
    return-void
.end method

.method public c0(Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->k:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->n(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->n:Ll/yde0;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ll/yde0;->e(Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->o:Ll/yde0;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Ll/yde0;->e(Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public d0(II)Z
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->s:Z

    .line 3
    .line 4
    if-lez p1, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->v(II)Z

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->v(II)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    :goto_0
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->k:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;

    .line 16
    .line 17
    const-string v0, "scroll"

    .line 18
    .line 19
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->E(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    const/4 p2, 0x0

    .line 23
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->s:Z

    .line 24
    .line 25
    return p1
.end method

.method public e0()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->i:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const-string v0, "test notify"

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->S(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->i:Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    add-int/lit8 v1, v1, -0x1

    .line 21
    .line 22
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, Ll/orc0;

    .line 27
    .line 28
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->i:Ljava/util/List;

    .line 29
    .line 30
    invoke-interface {v1, v0}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->k:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;

    .line 34
    .line 35
    iget-object v2, v0, Ll/orc0;->g:Ll/ns2;

    .line 36
    .line 37
    iget-object v2, v2, Ll/ns2;->a:Landroid/view/View;

    .line 38
    .line 39
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 40
    .line 41
    .line 42
    const-string v1, "test remove refresh"

    .line 43
    .line 44
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->W(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->k:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;

    .line 48
    .line 49
    new-instance v2, Ll/tn2;

    .line 50
    .line 51
    invoke-direct {v2, p0, v0}, Ll/tn2;-><init>(Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;Ll/orc0;)V

    .line 52
    .line 53
    .line 54
    const-wide/16 v3, 0xfa0

    .line 55
    .line 56
    invoke-virtual {v1, v2, v3, v4}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 57
    .line 58
    .line 59
    :cond_0
    return-void
.end method

.method public final f0()V
    .locals 10

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->h:Ll/dxi0;

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/dxi0;->m()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->k:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;

    .line 11
    .line 12
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->getRenderContentHeight()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->k:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;

    .line 17
    .line 18
    invoke-virtual {v2}, Landroid/view/View;->getMeasuredWidth()I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->l:Ll/qrc0;

    .line 23
    .line 24
    iget v3, v3, Ll/qrc0;->k:I

    .line 25
    .line 26
    const/4 v4, -0x1

    .line 27
    if-ne v3, v4, :cond_0

    .line 28
    .line 29
    goto/16 :goto_3

    .line 30
    .line 31
    :cond_0
    invoke-virtual {p0, v3, v2, v1}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->D(III)Ll/orc0;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    const/4 v4, 0x0

    .line 36
    iput v4, v2, Ll/orc0;->b:I

    .line 37
    .line 38
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->l:Ll/qrc0;

    .line 39
    .line 40
    iget-boolean v6, v5, Ll/qrc0;->m:Z

    .line 41
    .line 42
    if-eqz v6, :cond_1

    .line 43
    .line 44
    iget v5, v5, Ll/qrc0;->l:I

    .line 45
    .line 46
    iput v5, v2, Ll/orc0;->a:I

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_1
    iget v5, v5, Ll/qrc0;->l:I

    .line 50
    .line 51
    iget v6, v2, Ll/orc0;->c:I

    .line 52
    .line 53
    sub-int/2addr v5, v6

    .line 54
    iput v5, v2, Ll/orc0;->a:I

    .line 55
    .line 56
    :goto_0
    iget v5, v2, Ll/orc0;->h:I

    .line 57
    .line 58
    const/4 v6, 0x1

    .line 59
    if-ne v5, v6, :cond_2

    .line 60
    .line 61
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->k:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;

    .line 62
    .line 63
    iget-object v7, v2, Ll/orc0;->g:Ll/ns2;

    .line 64
    .line 65
    iget-object v7, v7, Ll/ns2;->a:Landroid/view/View;

    .line 66
    .line 67
    invoke-virtual {v5, v7, v4}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->addView(Landroid/view/View;I)V

    .line 68
    .line 69
    .line 70
    goto :goto_1

    .line 71
    :cond_2
    const/4 v7, 0x2

    .line 72
    if-ne v5, v7, :cond_3

    .line 73
    .line 74
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->k:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;

    .line 75
    .line 76
    iget-object v7, v2, Ll/orc0;->g:Ll/ns2;

    .line 77
    .line 78
    iget-object v7, v7, Ll/ns2;->a:Landroid/view/View;

    .line 79
    .line 80
    invoke-virtual {v7}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 81
    .line 82
    .line 83
    move-result-object v8

    .line 84
    invoke-virtual {v5, v7, v4, v8}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->attachViewToParent(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 85
    .line 86
    .line 87
    :cond_3
    :goto_1
    const/4 v5, 0x3

    .line 88
    iput v5, v2, Ll/orc0;->h:I

    .line 89
    .line 90
    iput v3, v2, Ll/orc0;->f:I

    .line 91
    .line 92
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->x(Ll/orc0;)V

    .line 93
    .line 94
    .line 95
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->i:Ljava/util/List;

    .line 96
    .line 97
    invoke-interface {v5, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    iget-boolean v5, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->r:Z

    .line 101
    .line 102
    iget v7, v2, Ll/orc0;->a:I

    .line 103
    .line 104
    if-eqz v5, :cond_5

    .line 105
    .line 106
    add-int/lit8 v5, v3, 0x1

    .line 107
    .line 108
    iget v8, v2, Ll/orc0;->c:I

    .line 109
    .line 110
    add-int/2addr v7, v8

    .line 111
    invoke-virtual {p0, v5, v7, v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->g0(IIII)V

    .line 112
    .line 113
    .line 114
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->i:Ljava/util/List;

    .line 115
    .line 116
    invoke-interface {v5}, Ljava/util/List;->isEmpty()Z

    .line 117
    .line 118
    .line 119
    move-result v5

    .line 120
    if-nez v5, :cond_4

    .line 121
    .line 122
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->i:Ljava/util/List;

    .line 123
    .line 124
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 125
    .line 126
    .line 127
    move-result v7

    .line 128
    sub-int/2addr v7, v6

    .line 129
    invoke-interface {v5, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 130
    .line 131
    .line 132
    move-result-object v5

    .line 133
    check-cast v5, Ll/orc0;

    .line 134
    .line 135
    iget v7, v5, Ll/orc0;->a:I

    .line 136
    .line 137
    iget v5, v5, Ll/orc0;->c:I

    .line 138
    .line 139
    add-int v8, v7, v5

    .line 140
    .line 141
    iget v9, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->q:I

    .line 142
    .line 143
    add-int/2addr v8, v9

    .line 144
    if-ge v8, v1, :cond_4

    .line 145
    .line 146
    add-int/2addr v7, v5

    .line 147
    add-int/2addr v7, v9

    .line 148
    sub-int v5, v1, v7

    .line 149
    .line 150
    add-int/2addr v9, v5

    .line 151
    iput v9, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->q:I

    .line 152
    .line 153
    :cond_4
    sub-int/2addr v3, v6

    .line 154
    iget v2, v2, Ll/orc0;->a:I

    .line 155
    .line 156
    invoke-virtual {p0, v3, v2, v0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->h0(III)V

    .line 157
    .line 158
    .line 159
    goto :goto_2

    .line 160
    :cond_5
    add-int/lit8 v5, v3, -0x1

    .line 161
    .line 162
    invoke-virtual {p0, v5, v7, v0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->h0(III)V

    .line 163
    .line 164
    .line 165
    add-int/2addr v3, v6

    .line 166
    iget v5, v2, Ll/orc0;->a:I

    .line 167
    .line 168
    iget v2, v2, Ll/orc0;->c:I

    .line 169
    .line 170
    add-int/2addr v5, v2

    .line 171
    invoke-virtual {p0, v3, v5, v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->g0(IIII)V

    .line 172
    .line 173
    .line 174
    :goto_2
    iget-boolean v2, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->r:Z

    .line 175
    .line 176
    if-eqz v2, :cond_6

    .line 177
    .line 178
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->i:Ljava/util/List;

    .line 179
    .line 180
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    .line 181
    .line 182
    .line 183
    move-result v2

    .line 184
    if-nez v2, :cond_6

    .line 185
    .line 186
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->i:Ljava/util/List;

    .line 187
    .line 188
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 189
    .line 190
    .line 191
    move-result v3

    .line 192
    sub-int/2addr v3, v6

    .line 193
    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 194
    .line 195
    .line 196
    move-result-object v2

    .line 197
    check-cast v2, Ll/orc0;

    .line 198
    .line 199
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->i:Ljava/util/List;

    .line 200
    .line 201
    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 202
    .line 203
    .line 204
    move-result-object v3

    .line 205
    check-cast v3, Ll/orc0;

    .line 206
    .line 207
    iget v3, v3, Ll/orc0;->a:I

    .line 208
    .line 209
    iget v4, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->q:I

    .line 210
    .line 211
    add-int v5, v3, v4

    .line 212
    .line 213
    if-lez v5, :cond_6

    .line 214
    .line 215
    add-int/2addr v3, v4

    .line 216
    sub-int/2addr v4, v3

    .line 217
    iput v4, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->q:I

    .line 218
    .line 219
    iget v3, v2, Ll/orc0;->f:I

    .line 220
    .line 221
    add-int/2addr v3, v6

    .line 222
    iget v4, v2, Ll/orc0;->a:I

    .line 223
    .line 224
    iget v2, v2, Ll/orc0;->c:I

    .line 225
    .line 226
    add-int/2addr v4, v2

    .line 227
    invoke-virtual {p0, v3, v4, v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->g0(IIII)V

    .line 228
    .line 229
    .line 230
    :cond_6
    :goto_3
    return-void
.end method

.method public final g0(IIII)V
    .locals 5

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->q:I

    .line 2
    .line 3
    add-int/2addr v0, p2

    .line 4
    if-ge v0, p4, :cond_3

    .line 5
    .line 6
    if-ltz p1, :cond_3

    .line 7
    .line 8
    if-lt p1, p3, :cond_0

    .line 9
    .line 10
    goto :goto_1

    .line 11
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->k:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    invoke-virtual {p0, p1, v0, p4}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->D(III)Ll/orc0;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const/4 v1, 0x0

    .line 22
    iput v1, v0, Ll/orc0;->b:I

    .line 23
    .line 24
    iput p2, v0, Ll/orc0;->a:I

    .line 25
    .line 26
    iget p2, v0, Ll/orc0;->h:I

    .line 27
    .line 28
    const/4 v1, 0x1

    .line 29
    if-ne p2, v1, :cond_1

    .line 30
    .line 31
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->k:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;

    .line 32
    .line 33
    iget-object v2, v0, Ll/orc0;->g:Ll/ns2;

    .line 34
    .line 35
    iget-object v2, v2, Ll/ns2;->a:Landroid/view/View;

    .line 36
    .line 37
    invoke-virtual {p2, v2}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->addView(Landroid/view/View;)V

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    const/4 v2, 0x2

    .line 42
    if-ne p2, v2, :cond_2

    .line 43
    .line 44
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->k:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;

    .line 45
    .line 46
    iget-object v2, v0, Ll/orc0;->g:Ll/ns2;

    .line 47
    .line 48
    iget-object v2, v2, Ll/ns2;->a:Landroid/view/View;

    .line 49
    .line 50
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->i:Ljava/util/List;

    .line 51
    .line 52
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 53
    .line 54
    .line 55
    move-result v3

    .line 56
    sub-int/2addr v3, v1

    .line 57
    iget-object v4, v0, Ll/orc0;->g:Ll/ns2;

    .line 58
    .line 59
    iget-object v4, v4, Ll/ns2;->a:Landroid/view/View;

    .line 60
    .line 61
    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 62
    .line 63
    .line 64
    move-result-object v4

    .line 65
    invoke-virtual {p2, v2, v3, v4}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->attachViewToParent(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 66
    .line 67
    .line 68
    :cond_2
    :goto_0
    const/4 p2, 0x3

    .line 69
    iput p2, v0, Ll/orc0;->h:I

    .line 70
    .line 71
    iput p1, v0, Ll/orc0;->f:I

    .line 72
    .line 73
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->x(Ll/orc0;)V

    .line 74
    .line 75
    .line 76
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->i:Ljava/util/List;

    .line 77
    .line 78
    invoke-interface {p2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 79
    .line 80
    .line 81
    add-int/2addr p1, v1

    .line 82
    iget p2, v0, Ll/orc0;->a:I

    .line 83
    .line 84
    iget v0, v0, Ll/orc0;->c:I

    .line 85
    .line 86
    add-int/2addr p2, v0

    .line 87
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->g0(IIII)V

    .line 88
    .line 89
    .line 90
    :cond_3
    :goto_1
    return-void
.end method

.method public final h0(III)V
    .locals 5

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->q:I

    .line 2
    .line 3
    add-int/2addr v0, p2

    .line 4
    if-lez v0, :cond_3

    .line 5
    .line 6
    if-ltz p1, :cond_3

    .line 7
    .line 8
    if-lt p1, p3, :cond_0

    .line 9
    .line 10
    goto :goto_1

    .line 11
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->k:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->getRenderContentHeight()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->k:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;

    .line 18
    .line 19
    invoke-virtual {v1}, Landroid/view/View;->getMeasuredWidth()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    invoke-virtual {p0, p1, v1, v0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->D(III)Ll/orc0;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const/4 v1, 0x0

    .line 28
    iput v1, v0, Ll/orc0;->b:I

    .line 29
    .line 30
    iget v2, v0, Ll/orc0;->c:I

    .line 31
    .line 32
    sub-int/2addr p2, v2

    .line 33
    iput p2, v0, Ll/orc0;->a:I

    .line 34
    .line 35
    iget p2, v0, Ll/orc0;->h:I

    .line 36
    .line 37
    const/4 v2, 0x1

    .line 38
    if-ne p2, v2, :cond_1

    .line 39
    .line 40
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->k:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;

    .line 41
    .line 42
    iget-object v3, v0, Ll/orc0;->g:Ll/ns2;

    .line 43
    .line 44
    iget-object v3, v3, Ll/ns2;->a:Landroid/view/View;

    .line 45
    .line 46
    invoke-virtual {p2, v3, v1}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->addView(Landroid/view/View;I)V

    .line 47
    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_1
    const/4 v3, 0x2

    .line 51
    if-ne p2, v3, :cond_2

    .line 52
    .line 53
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->k:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;

    .line 54
    .line 55
    iget-object v3, v0, Ll/orc0;->g:Ll/ns2;

    .line 56
    .line 57
    iget-object v3, v3, Ll/ns2;->a:Landroid/view/View;

    .line 58
    .line 59
    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 60
    .line 61
    .line 62
    move-result-object v4

    .line 63
    invoke-virtual {p2, v3, v1, v4}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->attachViewToParent(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 64
    .line 65
    .line 66
    :cond_2
    :goto_0
    const/4 p2, 0x3

    .line 67
    iput p2, v0, Ll/orc0;->h:I

    .line 68
    .line 69
    iput p1, v0, Ll/orc0;->f:I

    .line 70
    .line 71
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->x(Ll/orc0;)V

    .line 72
    .line 73
    .line 74
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->i:Ljava/util/List;

    .line 75
    .line 76
    invoke-interface {p2, v1, v0}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->x(Ll/orc0;)V

    .line 80
    .line 81
    .line 82
    sub-int/2addr p1, v2

    .line 83
    iget p2, v0, Ll/orc0;->a:I

    .line 84
    .line 85
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->h0(III)V

    .line 86
    .line 87
    .line 88
    :cond_3
    :goto_1
    return-void
.end method

.method public bridge synthetic handleMessage(Landroid/os/Message;)Z
    .locals 0
    .param p1    # Landroid/os/Message;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/d;->handleMessage(Landroid/os/Message;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public j(Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/c;)V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/d;->f:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->k:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;

    .line 6
    .line 7
    new-instance v0, Ll/sn2;

    .line 8
    .line 9
    invoke-direct {v0}, Ll/sn2;-><init>()V

    .line 10
    .line 11
    .line 12
    const-wide/16 v1, 0x3e8

    .line 13
    .line 14
    invoke-virtual {p1, v0, v1, v2}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 15
    .line 16
    .line 17
    const-string p1, "action"

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->S(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    instance-of v0, p1, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/c$b;

    .line 24
    .line 25
    if-eqz v0, :cond_2

    .line 26
    .line 27
    check-cast p1, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/c$b;

    .line 28
    .line 29
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/c$b;->a:Ljava/util/List;

    .line 30
    .line 31
    if-eqz p1, :cond_1

    .line 32
    .line 33
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-lez v0, :cond_1

    .line 38
    .line 39
    const-string v0, "TantanListView"

    .line 40
    .line 41
    const-string v1, "notifyItemIndex **************************"

    .line 42
    .line 43
    invoke-static {v0, v1}, Ll/yor;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->T(Ljava/util/List;)V

    .line 47
    .line 48
    .line 49
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/d;->e()V

    .line 50
    .line 51
    .line 52
    :cond_2
    return-void
.end method

.method public bridge synthetic n(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/d;->n(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final r(IILl/orc0;)V
    .locals 3

    .line 1
    iget-object p0, p3, Ll/orc0;->g:Ll/ns2;

    .line 2
    .line 3
    iget-object p0, p0, Ll/ns2;->a:Landroid/view/View;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const/4 v0, 0x0

    .line 10
    const/high16 v1, 0x40000000    # 2.0f

    .line 11
    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    iget v2, p0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 15
    .line 16
    if-ltz v2, :cond_0

    .line 17
    .line 18
    iget-object p2, p3, Ll/orc0;->g:Ll/ns2;

    .line 19
    .line 20
    iget-object p2, p2, Ll/ns2;->a:Landroid/view/View;

    .line 21
    .line 22
    invoke-static {p1, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    iget p0, p0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 27
    .line 28
    invoke-static {p0, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    invoke-virtual {p2, p1, p0}, Landroid/view/View;->measure(II)V

    .line 33
    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    iget-object p0, p3, Ll/orc0;->g:Ll/ns2;

    .line 37
    .line 38
    iget-object p0, p0, Ll/ns2;->a:Landroid/view/View;

    .line 39
    .line 40
    invoke-static {p1, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    invoke-static {p2, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 45
    .line 46
    .line 47
    move-result p2

    .line 48
    invoke-virtual {p0, p1, p2}, Landroid/view/View;->measure(II)V

    .line 49
    .line 50
    .line 51
    :goto_0
    iget-object p0, p3, Ll/orc0;->g:Ll/ns2;

    .line 52
    .line 53
    iget-object p0, p0, Ll/ns2;->a:Landroid/view/View;

    .line 54
    .line 55
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 56
    .line 57
    .line 58
    move-result p0

    .line 59
    iget-object p1, p3, Ll/orc0;->g:Ll/ns2;

    .line 60
    .line 61
    iget-object p1, p1, Ll/ns2;->a:Landroid/view/View;

    .line 62
    .line 63
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    .line 64
    .line 65
    .line 66
    move-result p1

    .line 67
    iput p0, p3, Ll/orc0;->d:I

    .line 68
    .line 69
    iput p1, p3, Ll/orc0;->c:I

    .line 70
    .line 71
    iget-object p0, p3, Ll/orc0;->g:Ll/ns2;

    .line 72
    .line 73
    iget-object p0, p0, Ll/ns2;->a:Landroid/view/View;

    .line 74
    .line 75
    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    .line 76
    .line 77
    .line 78
    move-result p0

    .line 79
    const/16 p1, 0x8

    .line 80
    .line 81
    if-ne p0, p1, :cond_1

    .line 82
    .line 83
    iput v0, p3, Ll/orc0;->d:I

    .line 84
    .line 85
    iput v0, p3, Ll/orc0;->c:I

    .line 86
    .line 87
    :cond_1
    return-void
.end method

.method public bridge synthetic run()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/d;->run()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final s(Ljava/lang/Runnable;)V
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->k:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->getRenderContentHeight()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->l:Ll/qrc0;

    .line 8
    .line 9
    iget v2, v1, Ll/qrc0;->h:I

    .line 10
    .line 11
    int-to-float v2, v2

    .line 12
    iget v3, v1, Ll/qrc0;->c:I

    .line 13
    .line 14
    int-to-float v3, v3

    .line 15
    iget-boolean v4, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->r:Z

    .line 16
    .line 17
    const/4 v5, 0x0

    .line 18
    const/4 v6, 0x1

    .line 19
    if-eqz v4, :cond_6

    .line 20
    .line 21
    iget v4, v1, Ll/qrc0;->a:I

    .line 22
    .line 23
    const/4 v7, -0x1

    .line 24
    if-ne v4, v7, :cond_1

    .line 25
    .line 26
    iget v8, v1, Ll/qrc0;->e:I

    .line 27
    .line 28
    if-ne v8, v7, :cond_1

    .line 29
    .line 30
    iput-boolean v5, v1, Ll/qrc0;->m:Z

    .line 31
    .line 32
    iput v0, v1, Ll/qrc0;->l:I

    .line 33
    .line 34
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->h:Ll/dxi0;

    .line 35
    .line 36
    invoke-virtual {v1}, Ll/dxi0;->m()I

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->l:Ll/qrc0;

    .line 41
    .line 42
    if-nez v1, :cond_0

    .line 43
    .line 44
    iput v7, v2, Ll/qrc0;->k:I

    .line 45
    .line 46
    const-string v1, ""

    .line 47
    .line 48
    iput-object v1, v2, Ll/qrc0;->j:Ljava/lang/String;

    .line 49
    .line 50
    goto/16 :goto_0

    .line 51
    .line 52
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->h:Ll/dxi0;

    .line 53
    .line 54
    invoke-virtual {v1}, Ll/dxi0;->m()I

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    sub-int/2addr v1, v6

    .line 59
    iput v1, v2, Ll/qrc0;->k:I

    .line 60
    .line 61
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->l:Ll/qrc0;

    .line 62
    .line 63
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->h:Ll/dxi0;

    .line 64
    .line 65
    iget v3, v1, Ll/qrc0;->k:I

    .line 66
    .line 67
    invoke-virtual {v2, v3}, Ll/dxi0;->d(I)Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    iput-object v2, v1, Ll/qrc0;->j:Ljava/lang/String;

    .line 72
    .line 73
    goto/16 :goto_0

    .line 74
    .line 75
    :cond_1
    if-nez v4, :cond_2

    .line 76
    .line 77
    iget v4, v1, Ll/qrc0;->e:I

    .line 78
    .line 79
    iget v7, v1, Ll/qrc0;->n:I

    .line 80
    .line 81
    sub-int/2addr v7, v6

    .line 82
    if-ne v4, v7, :cond_2

    .line 83
    .line 84
    const/4 v7, 0x0

    .line 85
    cmpl-float v3, v3, v7

    .line 86
    .line 87
    if-nez v3, :cond_2

    .line 88
    .line 89
    int-to-float v3, v0

    .line 90
    cmpg-float v3, v2, v3

    .line 91
    .line 92
    if-gtz v3, :cond_2

    .line 93
    .line 94
    iput-boolean v5, v1, Ll/qrc0;->m:Z

    .line 95
    .line 96
    float-to-int v2, v2

    .line 97
    iput v2, v1, Ll/qrc0;->l:I

    .line 98
    .line 99
    iput v4, v1, Ll/qrc0;->k:I

    .line 100
    .line 101
    iget-object v2, v1, Ll/qrc0;->f:Ljava/lang/String;

    .line 102
    .line 103
    iput-object v2, v1, Ll/qrc0;->j:Ljava/lang/String;

    .line 104
    .line 105
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->t(Ll/qrc0;)V

    .line 106
    .line 107
    .line 108
    goto/16 :goto_0

    .line 109
    .line 110
    :cond_2
    int-to-float v3, v0

    .line 111
    cmpl-float v4, v2, v3

    .line 112
    .line 113
    if-ltz v4, :cond_4

    .line 114
    .line 115
    iput-boolean v6, v1, Ll/qrc0;->m:Z

    .line 116
    .line 117
    iget v2, v1, Ll/qrc0;->g:I

    .line 118
    .line 119
    iput v2, v1, Ll/qrc0;->l:I

    .line 120
    .line 121
    if-nez v4, :cond_3

    .line 122
    .line 123
    iget v1, v1, Ll/qrc0;->e:I

    .line 124
    .line 125
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->h:Ll/dxi0;

    .line 126
    .line 127
    invoke-virtual {v2}, Ll/dxi0;->m()I

    .line 128
    .line 129
    .line 130
    move-result v2

    .line 131
    sub-int/2addr v2, v6

    .line 132
    if-ne v1, v2, :cond_3

    .line 133
    .line 134
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->l:Ll/qrc0;

    .line 135
    .line 136
    sget-object v2, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/d;->g:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/c;

    .line 137
    .line 138
    iput-object v2, v1, Ll/qrc0;->p:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/c;

    .line 139
    .line 140
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->l:Ll/qrc0;

    .line 141
    .line 142
    iget v2, v1, Ll/qrc0;->e:I

    .line 143
    .line 144
    iput v2, v1, Ll/qrc0;->k:I

    .line 145
    .line 146
    iget-object v2, v1, Ll/qrc0;->f:Ljava/lang/String;

    .line 147
    .line 148
    iput-object v2, v1, Ll/qrc0;->j:Ljava/lang/String;

    .line 149
    .line 150
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->t(Ll/qrc0;)V

    .line 151
    .line 152
    .line 153
    goto :goto_0

    .line 154
    :cond_4
    cmpg-float v2, v2, v3

    .line 155
    .line 156
    if-gez v2, :cond_7

    .line 157
    .line 158
    iput-boolean v6, v1, Ll/qrc0;->m:Z

    .line 159
    .line 160
    iget v2, v1, Ll/qrc0;->g:I

    .line 161
    .line 162
    iput v2, v1, Ll/qrc0;->l:I

    .line 163
    .line 164
    if-nez v4, :cond_5

    .line 165
    .line 166
    sget-object v2, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/d;->g:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/c;

    .line 167
    .line 168
    iput-object v2, v1, Ll/qrc0;->p:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/c;

    .line 169
    .line 170
    :cond_5
    iget v2, v1, Ll/qrc0;->e:I

    .line 171
    .line 172
    iput v2, v1, Ll/qrc0;->k:I

    .line 173
    .line 174
    iget-object v2, v1, Ll/qrc0;->f:Ljava/lang/String;

    .line 175
    .line 176
    iput-object v2, v1, Ll/qrc0;->j:Ljava/lang/String;

    .line 177
    .line 178
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->t(Ll/qrc0;)V

    .line 179
    .line 180
    .line 181
    goto :goto_0

    .line 182
    :cond_6
    iget v1, v1, Ll/qrc0;->a:I

    .line 183
    .line 184
    if-ltz v1, :cond_7

    .line 185
    .line 186
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->h:Ll/dxi0;

    .line 187
    .line 188
    invoke-virtual {v2}, Ll/dxi0;->m()I

    .line 189
    .line 190
    .line 191
    move-result v2

    .line 192
    if-ge v1, v2, :cond_7

    .line 193
    .line 194
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->h:Ll/dxi0;

    .line 195
    .line 196
    invoke-virtual {v2, v1}, Ll/dxi0;->d(I)Ljava/lang/String;

    .line 197
    .line 198
    .line 199
    move-result-object v1

    .line 200
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->l:Ll/qrc0;

    .line 201
    .line 202
    iget-object v2, v2, Ll/qrc0;->b:Ljava/lang/String;

    .line 203
    .line 204
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 205
    .line 206
    .line 207
    move-result v1

    .line 208
    if-eqz v1, :cond_7

    .line 209
    .line 210
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->l:Ll/qrc0;

    .line 211
    .line 212
    iget-object v2, v1, Ll/qrc0;->b:Ljava/lang/String;

    .line 213
    .line 214
    iput-object v2, v1, Ll/qrc0;->j:Ljava/lang/String;

    .line 215
    .line 216
    iget v2, v1, Ll/qrc0;->a:I

    .line 217
    .line 218
    iput v2, v1, Ll/qrc0;->k:I

    .line 219
    .line 220
    iput-boolean v5, v1, Ll/qrc0;->m:Z

    .line 221
    .line 222
    iget v2, v1, Ll/qrc0;->d:I

    .line 223
    .line 224
    iput v2, v1, Ll/qrc0;->l:I

    .line 225
    .line 226
    :cond_7
    :goto_0
    if-eqz p1, :cond_8

    .line 227
    .line 228
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 229
    .line 230
    .line 231
    :cond_8
    new-instance p1, Ljava/lang/StringBuilder;

    .line 232
    .line 233
    const-string v1, "##### calculate info :"

    .line 234
    .line 235
    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 236
    .line 237
    .line 238
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->l:Ll/qrc0;

    .line 239
    .line 240
    iget v1, v1, Ll/qrc0;->o:I

    .line 241
    .line 242
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 243
    .line 244
    .line 245
    const-string v1, " , "

    .line 246
    .line 247
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 248
    .line 249
    .line 250
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->l:Ll/qrc0;

    .line 251
    .line 252
    iget v2, v2, Ll/qrc0;->h:I

    .line 253
    .line 254
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 255
    .line 256
    .line 257
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 258
    .line 259
    .line 260
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->l:Ll/qrc0;

    .line 261
    .line 262
    iget v1, v1, Ll/qrc0;->n:I

    .line 263
    .line 264
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 265
    .line 266
    .line 267
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 268
    .line 269
    .line 270
    move-result-object p1

    .line 271
    invoke-static {p1}, Ll/yor;->c(Ljava/lang/String;)V

    .line 272
    .line 273
    .line 274
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->l:Ll/qrc0;

    .line 275
    .line 276
    iget p1, p0, Ll/qrc0;->o:I

    .line 277
    .line 278
    if-lez p1, :cond_9

    .line 279
    .line 280
    move v0, p1

    .line 281
    :cond_9
    iget p1, p0, Ll/qrc0;->h:I

    .line 282
    .line 283
    if-gt p1, v0, :cond_a

    .line 284
    .line 285
    iget p1, p0, Ll/qrc0;->e:I

    .line 286
    .line 287
    iget v0, p0, Ll/qrc0;->n:I

    .line 288
    .line 289
    sub-int/2addr v0, v6

    .line 290
    if-ne p1, v0, :cond_a

    .line 291
    .line 292
    sget-object p1, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/d;->g:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/c;

    .line 293
    .line 294
    iput-object p1, p0, Ll/qrc0;->p:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/c;

    .line 295
    .line 296
    :cond_a
    return-void
.end method

.method public final t(Ll/qrc0;)V
    .locals 11

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->h:Ll/dxi0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/dxi0;->m()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget v1, p1, Ll/qrc0;->n:I

    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    const/4 v3, 0x0

    .line 11
    if-le v0, v1, :cond_0

    .line 12
    .line 13
    move v0, v2

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    move v0, v3

    .line 16
    :goto_0
    if-eqz v0, :cond_1

    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->h:Ll/dxi0;

    .line 19
    .line 20
    invoke-virtual {v0}, Ll/dxi0;->m()I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    iget v1, p1, Ll/qrc0;->n:I

    .line 25
    .line 26
    sub-int/2addr v0, v1

    .line 27
    goto :goto_1

    .line 28
    :cond_1
    move v0, v3

    .line 29
    :goto_1
    iget-object v1, p1, Ll/qrc0;->j:Ljava/lang/String;

    .line 30
    .line 31
    iget v4, p1, Ll/qrc0;->k:I

    .line 32
    .line 33
    add-int/2addr v4, v0

    .line 34
    const/16 v5, 0x14

    .line 35
    .line 36
    invoke-virtual {p0, v1, v4, v5}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->B(Ljava/lang/String;II)I

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    if-ltz v1, :cond_2

    .line 41
    .line 42
    iput v1, p1, Ll/qrc0;->k:I

    .line 43
    .line 44
    return-void

    .line 45
    :cond_2
    iget-object v1, p1, Ll/qrc0;->q:Ljava/util/List;

    .line 46
    .line 47
    iget v4, p1, Ll/qrc0;->k:I

    .line 48
    .line 49
    iget v6, p1, Ll/qrc0;->e:I

    .line 50
    .line 51
    if-ne v4, v6, :cond_3

    .line 52
    .line 53
    invoke-static {v1}, Ljava/util/Collections;->reverse(Ljava/util/List;)V

    .line 54
    .line 55
    .line 56
    move v4, v2

    .line 57
    goto :goto_2

    .line 58
    :cond_3
    move v4, v3

    .line 59
    :goto_2
    iget-object v6, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->k:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;

    .line 60
    .line 61
    invoke-virtual {v6}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->getRenderContentHeight()I

    .line 62
    .line 63
    .line 64
    move-result v6

    .line 65
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 66
    .line 67
    .line 68
    move-result-object v7

    .line 69
    :cond_4
    :goto_3
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    .line 70
    .line 71
    .line 72
    move-result v8

    .line 73
    if-eqz v8, :cond_9

    .line 74
    .line 75
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object v8

    .line 79
    check-cast v8, Ll/wpi0;

    .line 80
    .line 81
    iget v9, v8, Ll/wpi0;->d:I

    .line 82
    .line 83
    iget v10, p1, Ll/qrc0;->k:I

    .line 84
    .line 85
    if-ne v9, v10, :cond_5

    .line 86
    .line 87
    goto :goto_3

    .line 88
    :cond_5
    iget-object v10, v8, Ll/wpi0;->e:Ljava/lang/String;

    .line 89
    .line 90
    add-int/2addr v9, v0

    .line 91
    invoke-virtual {p0, v10, v9, v5}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->B(Ljava/lang/String;II)I

    .line 92
    .line 93
    .line 94
    move-result v9

    .line 95
    if-ltz v9, :cond_4

    .line 96
    .line 97
    iput v9, p1, Ll/qrc0;->k:I

    .line 98
    .line 99
    iget-object p0, v8, Ll/wpi0;->e:Ljava/lang/String;

    .line 100
    .line 101
    iput-object p0, p1, Ll/qrc0;->j:Ljava/lang/String;

    .line 102
    .line 103
    iget p0, v8, Ll/wpi0;->b:I

    .line 104
    .line 105
    iget v0, v8, Ll/wpi0;->c:I

    .line 106
    .line 107
    add-int/2addr v0, p0

    .line 108
    if-eqz v4, :cond_7

    .line 109
    .line 110
    if-ge v0, v6, :cond_6

    .line 111
    .line 112
    iput-boolean v3, p1, Ll/qrc0;->m:Z

    .line 113
    .line 114
    iput v0, p1, Ll/qrc0;->l:I

    .line 115
    .line 116
    return-void

    .line 117
    :cond_6
    iput-boolean v2, p1, Ll/qrc0;->m:Z

    .line 118
    .line 119
    iput p0, p1, Ll/qrc0;->l:I

    .line 120
    .line 121
    return-void

    .line 122
    :cond_7
    if-gez p0, :cond_8

    .line 123
    .line 124
    iput-boolean v3, p1, Ll/qrc0;->m:Z

    .line 125
    .line 126
    iput v0, p1, Ll/qrc0;->l:I

    .line 127
    .line 128
    return-void

    .line 129
    :cond_8
    iput-boolean v2, p1, Ll/qrc0;->m:Z

    .line 130
    .line 131
    iput p0, p1, Ll/qrc0;->l:I

    .line 132
    .line 133
    return-void

    .line 134
    :cond_9
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 135
    .line 136
    .line 137
    move-result p1

    .line 138
    if-eqz p1, :cond_c

    .line 139
    .line 140
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->h:Ll/dxi0;

    .line 141
    .line 142
    invoke-virtual {p1}, Ll/dxi0;->m()I

    .line 143
    .line 144
    .line 145
    move-result p1

    .line 146
    if-nez p1, :cond_a

    .line 147
    .line 148
    goto :goto_4

    .line 149
    :cond_a
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->r:Z

    .line 150
    .line 151
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->l:Ll/qrc0;

    .line 152
    .line 153
    const-string v1, ""

    .line 154
    .line 155
    if-eqz p1, :cond_b

    .line 156
    .line 157
    iput-boolean v3, v0, Ll/qrc0;->m:Z

    .line 158
    .line 159
    iput v6, v0, Ll/qrc0;->l:I

    .line 160
    .line 161
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->h:Ll/dxi0;

    .line 162
    .line 163
    invoke-virtual {p1}, Ll/dxi0;->m()I

    .line 164
    .line 165
    .line 166
    move-result p1

    .line 167
    sub-int/2addr p1, v2

    .line 168
    iput p1, v0, Ll/qrc0;->k:I

    .line 169
    .line 170
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->l:Ll/qrc0;

    .line 171
    .line 172
    iput-object v1, p0, Ll/qrc0;->j:Ljava/lang/String;

    .line 173
    .line 174
    return-void

    .line 175
    :cond_b
    iput-boolean v2, v0, Ll/qrc0;->m:Z

    .line 176
    .line 177
    iput v3, v0, Ll/qrc0;->l:I

    .line 178
    .line 179
    iput v3, v0, Ll/qrc0;->k:I

    .line 180
    .line 181
    iput-object v1, v0, Ll/qrc0;->j:Ljava/lang/String;

    .line 182
    .line 183
    return-void

    .line 184
    :cond_c
    :goto_4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->l:Ll/qrc0;

    .line 185
    .line 186
    invoke-virtual {p0}, Ll/qrc0;->b()V

    .line 187
    .line 188
    .line 189
    return-void
.end method

.method public final u(Ll/orc0;Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method public v(II)Z
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move/from16 v1, p2

    .line 4
    .line 5
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->i:Ljava/util/List;

    .line 6
    .line 7
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    const/4 v3, 0x0

    .line 12
    if-nez v2, :cond_1f

    .line 13
    .line 14
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->k:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;

    .line 15
    .line 16
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->getRenderContentHeight()I

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    iget-object v4, v0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->k:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;

    .line 21
    .line 22
    invoke-virtual {v4}, Landroid/view/View;->getMeasuredWidth()I

    .line 23
    .line 24
    .line 25
    move-result v4

    .line 26
    const-string v5, "\u79fb\u51faitem "

    .line 27
    .line 28
    const-string v7, " result = "

    .line 29
    .line 30
    const-string v9, "TantanListView"

    .line 31
    .line 32
    const/4 v10, 0x1

    .line 33
    if-lez p1, :cond_e

    .line 34
    .line 35
    move/from16 v11, p1

    .line 36
    .line 37
    move v12, v3

    .line 38
    :cond_0
    new-instance v13, Ljava/lang/StringBuilder;

    .line 39
    .line 40
    const-string v14, "\u5f00\u59cb\u586b\u5145\u5411\u4e0bscroll :  "

    .line 41
    .line 42
    invoke-direct {v13, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v13, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v13

    .line 52
    invoke-static {v9, v13}, Ll/yor;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    iget-object v13, v0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->i:Ljava/util/List;

    .line 56
    .line 57
    invoke-interface {v13, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v13

    .line 61
    check-cast v13, Ll/orc0;

    .line 62
    .line 63
    iget v14, v13, Ll/orc0;->a:I

    .line 64
    .line 65
    iget v15, v0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->q:I

    .line 66
    .line 67
    add-int/2addr v14, v15

    .line 68
    iget v15, v13, Ll/orc0;->f:I

    .line 69
    .line 70
    const/16 v16, 0x0

    .line 71
    .line 72
    if-nez v15, :cond_4

    .line 73
    .line 74
    if-nez v14, :cond_2

    .line 75
    .line 76
    move v11, v3

    .line 77
    move v12, v10

    .line 78
    :cond_1
    move/from16 v13, v16

    .line 79
    .line 80
    goto/16 :goto_3

    .line 81
    .line 82
    :cond_2
    add-int v13, v14, v11

    .line 83
    .line 84
    if-lez v13, :cond_3

    .line 85
    .line 86
    neg-int v11, v14

    .line 87
    move v12, v10

    .line 88
    :cond_3
    add-int/2addr v14, v11

    .line 89
    int-to-float v13, v14

    .line 90
    goto/16 :goto_3

    .line 91
    .line 92
    :cond_4
    add-int/2addr v14, v11

    .line 93
    if-lez v14, :cond_1

    .line 94
    .line 95
    add-int/lit8 v15, v15, -0x1

    .line 96
    .line 97
    if-ltz v15, :cond_1

    .line 98
    .line 99
    iget-object v14, v0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->n:Ll/yde0;

    .line 100
    .line 101
    invoke-virtual {v14}, Ll/yde0;->c()Ll/orc0;

    .line 102
    .line 103
    .line 104
    move-result-object v14

    .line 105
    if-eqz v14, :cond_5

    .line 106
    .line 107
    new-instance v6, Ljava/lang/StringBuilder;

    .line 108
    .line 109
    const-string v8, "\u5411\u4e0b\u6eda\u52a8from\u6eda\u52a8\u590d\u7528\u6c60\u4e2d\u83b7\u53d6:"

    .line 110
    .line 111
    invoke-direct {v6, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 112
    .line 113
    .line 114
    invoke-virtual {v6, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 115
    .line 116
    .line 117
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object v6

    .line 121
    invoke-static {v9, v6}, Ll/yor;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 122
    .line 123
    .line 124
    :cond_5
    if-nez v14, :cond_7

    .line 125
    .line 126
    invoke-virtual {v0, v15, v4, v2}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->H(III)Ll/orc0;

    .line 127
    .line 128
    .line 129
    move-result-object v14

    .line 130
    new-instance v6, Ljava/lang/StringBuilder;

    .line 131
    .line 132
    const-string v8, "\u5411\u4e0b\u6eda\u52a8from poll\u590d\u7528\u6c60\u4e2d\u83b7\u53d6:"

    .line 133
    .line 134
    invoke-direct {v6, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 135
    .line 136
    .line 137
    invoke-virtual {v6, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 138
    .line 139
    .line 140
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    if-nez v14, :cond_6

    .line 144
    .line 145
    move v8, v10

    .line 146
    goto :goto_0

    .line 147
    :cond_6
    move v8, v3

    .line 148
    :goto_0
    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 149
    .line 150
    .line 151
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 152
    .line 153
    .line 154
    move-result-object v6

    .line 155
    invoke-static {v9, v6}, Ll/yor;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 156
    .line 157
    .line 158
    :cond_7
    if-nez v14, :cond_8

    .line 159
    .line 160
    invoke-virtual {v0, v15, v4, v2}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->z(III)Ll/orc0;

    .line 161
    .line 162
    .line 163
    move-result-object v14

    .line 164
    new-instance v6, Ljava/lang/StringBuilder;

    .line 165
    .line 166
    const-string v8, "\u5411\u4e0b\u6eda\u52a8from adapter\u521b\u5efa:"

    .line 167
    .line 168
    invoke-direct {v6, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 169
    .line 170
    .line 171
    invoke-virtual {v6, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 172
    .line 173
    .line 174
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 175
    .line 176
    .line 177
    move-result-object v6

    .line 178
    invoke-static {v9, v6}, Ll/yor;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 179
    .line 180
    .line 181
    :cond_8
    iput v3, v14, Ll/orc0;->b:I

    .line 182
    .line 183
    iget v6, v13, Ll/orc0;->a:I

    .line 184
    .line 185
    iget v8, v14, Ll/orc0;->c:I

    .line 186
    .line 187
    sub-int/2addr v6, v8

    .line 188
    iput v6, v14, Ll/orc0;->a:I

    .line 189
    .line 190
    new-instance v6, Ljava/lang/StringBuilder;

    .line 191
    .line 192
    const-string v8, "\u5411\u4e0badd "

    .line 193
    .line 194
    invoke-direct {v6, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 195
    .line 196
    .line 197
    invoke-virtual {v6, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 198
    .line 199
    .line 200
    const-string v8, " , "

    .line 201
    .line 202
    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 203
    .line 204
    .line 205
    iget v8, v14, Ll/orc0;->a:I

    .line 206
    .line 207
    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 208
    .line 209
    .line 210
    const-string v8, ","

    .line 211
    .line 212
    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 213
    .line 214
    .line 215
    iget v8, v14, Ll/orc0;->c:I

    .line 216
    .line 217
    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 218
    .line 219
    .line 220
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 221
    .line 222
    .line 223
    move-result-object v6

    .line 224
    invoke-static {v9, v6}, Ll/yor;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 225
    .line 226
    .line 227
    iget v6, v14, Ll/orc0;->h:I

    .line 228
    .line 229
    if-ne v6, v10, :cond_a

    .line 230
    .line 231
    iget-object v6, v0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->k:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;

    .line 232
    .line 233
    iget-object v8, v14, Ll/orc0;->g:Ll/ns2;

    .line 234
    .line 235
    iget-object v8, v8, Ll/ns2;->a:Landroid/view/View;

    .line 236
    .line 237
    invoke-virtual {v6, v8, v3}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->addView(Landroid/view/View;I)V

    .line 238
    .line 239
    .line 240
    :cond_9
    :goto_1
    const/4 v6, 0x3

    .line 241
    goto :goto_2

    .line 242
    :cond_a
    const/4 v8, 0x2

    .line 243
    if-ne v6, v8, :cond_9

    .line 244
    .line 245
    iget-object v6, v0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->k:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;

    .line 246
    .line 247
    iget-object v8, v14, Ll/orc0;->g:Ll/ns2;

    .line 248
    .line 249
    iget-object v8, v8, Ll/ns2;->a:Landroid/view/View;

    .line 250
    .line 251
    invoke-virtual {v8}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 252
    .line 253
    .line 254
    move-result-object v13

    .line 255
    invoke-virtual {v6, v8, v3, v13}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->attachViewToParent(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 256
    .line 257
    .line 258
    goto :goto_1

    .line 259
    :goto_2
    iput v6, v14, Ll/orc0;->h:I

    .line 260
    .line 261
    iput v15, v14, Ll/orc0;->f:I

    .line 262
    .line 263
    invoke-virtual {v0, v14}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->x(Ll/orc0;)V

    .line 264
    .line 265
    .line 266
    iget-object v6, v0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->i:Ljava/util/List;

    .line 267
    .line 268
    invoke-interface {v6, v3, v14}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 269
    .line 270
    .line 271
    iget v6, v14, Ll/orc0;->a:I

    .line 272
    .line 273
    iget v8, v0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->q:I

    .line 274
    .line 275
    add-int/2addr v6, v8

    .line 276
    add-int/2addr v6, v11

    .line 277
    int-to-float v13, v6

    .line 278
    new-instance v6, Ljava/lang/StringBuilder;

    .line 279
    .line 280
    const-string v8, "\u65b0\u7684top:  "

    .line 281
    .line 282
    invoke-direct {v6, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 283
    .line 284
    .line 285
    invoke-virtual {v6, v13}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 286
    .line 287
    .line 288
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 289
    .line 290
    .line 291
    move-result-object v6

    .line 292
    invoke-static {v9, v6}, Ll/yor;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 293
    .line 294
    .line 295
    :goto_3
    cmpl-float v6, v13, v16

    .line 296
    .line 297
    if-gtz v6, :cond_0

    .line 298
    .line 299
    iget-object v3, v0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->i:Ljava/util/List;

    .line 300
    .line 301
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 302
    .line 303
    .line 304
    move-result-object v3

    .line 305
    :cond_b
    :goto_4
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 306
    .line 307
    .line 308
    move-result v4

    .line 309
    if-eqz v4, :cond_d

    .line 310
    .line 311
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 312
    .line 313
    .line 314
    move-result-object v4

    .line 315
    check-cast v4, Ll/orc0;

    .line 316
    .line 317
    iget v6, v4, Ll/orc0;->a:I

    .line 318
    .line 319
    iget v7, v0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->q:I

    .line 320
    .line 321
    add-int/2addr v6, v7

    .line 322
    add-int/2addr v6, v11

    .line 323
    if-le v6, v2, :cond_b

    .line 324
    .line 325
    new-instance v6, Ljava/lang/StringBuilder;

    .line 326
    .line 327
    invoke-direct {v6, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 328
    .line 329
    .line 330
    iget v7, v4, Ll/orc0;->f:I

    .line 331
    .line 332
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 333
    .line 334
    .line 335
    const-string v7, " state "

    .line 336
    .line 337
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 338
    .line 339
    .line 340
    iget v7, v4, Ll/orc0;->h:I

    .line 341
    .line 342
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 343
    .line 344
    .line 345
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 346
    .line 347
    .line 348
    move-result-object v6

    .line 349
    invoke-static {v9, v6}, Ll/yor;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 350
    .line 351
    .line 352
    invoke-interface {v3}, Ljava/util/Iterator;->remove()V

    .line 353
    .line 354
    .line 355
    const/4 v8, 0x2

    .line 356
    if-ne v1, v8, :cond_c

    .line 357
    .line 358
    iput v10, v4, Ll/orc0;->h:I

    .line 359
    .line 360
    iget-object v6, v0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->k:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;

    .line 361
    .line 362
    iget-object v7, v4, Ll/orc0;->g:Ll/ns2;

    .line 363
    .line 364
    iget-object v7, v7, Ll/ns2;->a:Landroid/view/View;

    .line 365
    .line 366
    invoke-virtual {v6, v7}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 367
    .line 368
    .line 369
    iget-object v6, v0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->p:Ll/pi80;

    .line 370
    .line 371
    iget-object v7, v4, Ll/orc0;->g:Ll/ns2;

    .line 372
    .line 373
    invoke-virtual {v6, v7}, Ll/pi80;->a(Ll/ns2;)V

    .line 374
    .line 375
    .line 376
    invoke-virtual {v4}, Ll/orc0;->b()V

    .line 377
    .line 378
    .line 379
    goto :goto_4

    .line 380
    :cond_c
    iput v8, v4, Ll/orc0;->h:I

    .line 381
    .line 382
    iget-object v6, v0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->k:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;

    .line 383
    .line 384
    iget-object v7, v4, Ll/orc0;->g:Ll/ns2;

    .line 385
    .line 386
    iget-object v7, v7, Ll/ns2;->a:Landroid/view/View;

    .line 387
    .line 388
    invoke-virtual {v6, v7}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->detachViewFromParent(Landroid/view/View;)V

    .line 389
    .line 390
    .line 391
    iget-object v6, v0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->o:Ll/yde0;

    .line 392
    .line 393
    iget-object v7, v0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->h:Ll/dxi0;

    .line 394
    .line 395
    invoke-virtual {v6, v4, v7}, Ll/yde0;->a(Ll/orc0;Ll/dxi0;)V

    .line 396
    .line 397
    .line 398
    goto :goto_4

    .line 399
    :cond_d
    move v6, v11

    .line 400
    move v3, v12

    .line 401
    goto/16 :goto_d

    .line 402
    .line 403
    :cond_e
    if-gez p1, :cond_1e

    .line 404
    .line 405
    move/from16 v6, p1

    .line 406
    .line 407
    move v8, v3

    .line 408
    :goto_5
    iget-object v11, v0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->i:Ljava/util/List;

    .line 409
    .line 410
    invoke-interface {v11}, Ljava/util/List;->size()I

    .line 411
    .line 412
    .line 413
    move-result v12

    .line 414
    sub-int/2addr v12, v10

    .line 415
    invoke-interface {v11, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 416
    .line 417
    .line 418
    move-result-object v11

    .line 419
    check-cast v11, Ll/orc0;

    .line 420
    .line 421
    iget v12, v11, Ll/orc0;->a:I

    .line 422
    .line 423
    iget v13, v11, Ll/orc0;->c:I

    .line 424
    .line 425
    add-int/2addr v12, v13

    .line 426
    iget v13, v0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->q:I

    .line 427
    .line 428
    add-int/2addr v12, v13

    .line 429
    iget v13, v11, Ll/orc0;->f:I

    .line 430
    .line 431
    iget-object v14, v0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->h:Ll/dxi0;

    .line 432
    .line 433
    invoke-virtual {v14}, Ll/dxi0;->m()I

    .line 434
    .line 435
    .line 436
    move-result v14

    .line 437
    sub-int/2addr v14, v10

    .line 438
    if-ne v13, v14, :cond_11

    .line 439
    .line 440
    iget-object v11, v0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->i:Ljava/util/List;

    .line 441
    .line 442
    invoke-interface {v11, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 443
    .line 444
    .line 445
    move-result-object v11

    .line 446
    check-cast v11, Ll/orc0;

    .line 447
    .line 448
    iget v13, v11, Ll/orc0;->a:I

    .line 449
    .line 450
    iget v14, v0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->q:I

    .line 451
    .line 452
    add-int/2addr v13, v14

    .line 453
    if-nez v13, :cond_f

    .line 454
    .line 455
    if-gt v12, v2, :cond_f

    .line 456
    .line 457
    iget v11, v11, Ll/orc0;->f:I

    .line 458
    .line 459
    if-nez v11, :cond_f

    .line 460
    .line 461
    move v6, v3

    .line 462
    :goto_6
    move v8, v10

    .line 463
    goto :goto_7

    .line 464
    :cond_f
    add-int v11, v12, v6

    .line 465
    .line 466
    if-gt v11, v2, :cond_10

    .line 467
    .line 468
    sub-int v6, v2, v12

    .line 469
    .line 470
    goto :goto_6

    .line 471
    :cond_10
    :goto_7
    move/from16 v16, v3

    .line 472
    .line 473
    move v11, v10

    .line 474
    const/4 v3, 0x3

    .line 475
    goto/16 :goto_b

    .line 476
    .line 477
    :cond_11
    add-int/2addr v12, v6

    .line 478
    if-ge v12, v2, :cond_18

    .line 479
    .line 480
    iget v12, v11, Ll/orc0;->f:I

    .line 481
    .line 482
    add-int/2addr v12, v10

    .line 483
    iget-object v13, v0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->h:Ll/dxi0;

    .line 484
    .line 485
    invoke-virtual {v13}, Ll/dxi0;->m()I

    .line 486
    .line 487
    .line 488
    move-result v13

    .line 489
    if-ge v12, v13, :cond_18

    .line 490
    .line 491
    iget-object v13, v0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->o:Ll/yde0;

    .line 492
    .line 493
    invoke-virtual {v13}, Ll/yde0;->c()Ll/orc0;

    .line 494
    .line 495
    .line 496
    move-result-object v13

    .line 497
    if-eqz v13, :cond_12

    .line 498
    .line 499
    new-instance v14, Ljava/lang/StringBuilder;

    .line 500
    .line 501
    const-string v15, "\u5411\u4e0a\u6eda\u52a8from \u6eda\u52a8\u590d\u7528\u6c60\u4e2d\u83b7\u53d6:"

    .line 502
    .line 503
    invoke-direct {v14, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 504
    .line 505
    .line 506
    invoke-virtual {v14, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 507
    .line 508
    .line 509
    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 510
    .line 511
    .line 512
    move-result-object v14

    .line 513
    invoke-static {v9, v14}, Ll/yor;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 514
    .line 515
    .line 516
    :cond_12
    if-nez v13, :cond_14

    .line 517
    .line 518
    invoke-virtual {v0, v12, v4, v2}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->H(III)Ll/orc0;

    .line 519
    .line 520
    .line 521
    move-result-object v13

    .line 522
    new-instance v14, Ljava/lang/StringBuilder;

    .line 523
    .line 524
    const-string v15, "\u5411\u4e0a\u6eda\u52a8from poll\u590d\u7528\u6c60\u4e2d\u83b7\u53d6:"

    .line 525
    .line 526
    invoke-direct {v14, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 527
    .line 528
    .line 529
    invoke-virtual {v14, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 530
    .line 531
    .line 532
    invoke-virtual {v14, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 533
    .line 534
    .line 535
    if-nez v13, :cond_13

    .line 536
    .line 537
    move v15, v10

    .line 538
    goto :goto_8

    .line 539
    :cond_13
    move v15, v3

    .line 540
    :goto_8
    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 541
    .line 542
    .line 543
    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 544
    .line 545
    .line 546
    move-result-object v14

    .line 547
    invoke-static {v9, v14}, Ll/yor;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 548
    .line 549
    .line 550
    :cond_14
    if-nez v13, :cond_15

    .line 551
    .line 552
    invoke-virtual {v0, v12, v4, v2}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->z(III)Ll/orc0;

    .line 553
    .line 554
    .line 555
    move-result-object v13

    .line 556
    new-instance v14, Ljava/lang/StringBuilder;

    .line 557
    .line 558
    const-string v15, "\u5411\u4e0a\u6eda\u52a8from adapter\u521b\u5efa:"

    .line 559
    .line 560
    invoke-direct {v14, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 561
    .line 562
    .line 563
    invoke-virtual {v14, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 564
    .line 565
    .line 566
    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 567
    .line 568
    .line 569
    move-result-object v14

    .line 570
    invoke-static {v9, v14}, Ll/yor;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 571
    .line 572
    .line 573
    :cond_15
    iput v3, v13, Ll/orc0;->b:I

    .line 574
    .line 575
    iget v14, v11, Ll/orc0;->a:I

    .line 576
    .line 577
    iget v11, v11, Ll/orc0;->c:I

    .line 578
    .line 579
    add-int/2addr v14, v11

    .line 580
    iput v14, v13, Ll/orc0;->a:I

    .line 581
    .line 582
    iget v11, v13, Ll/orc0;->h:I

    .line 583
    .line 584
    if-ne v11, v10, :cond_17

    .line 585
    .line 586
    iget-object v11, v0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->k:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;

    .line 587
    .line 588
    iget-object v14, v13, Ll/orc0;->g:Ll/ns2;

    .line 589
    .line 590
    iget-object v14, v14, Ll/ns2;->a:Landroid/view/View;

    .line 591
    .line 592
    invoke-virtual {v11, v14}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->addView(Landroid/view/View;)V

    .line 593
    .line 594
    .line 595
    :cond_16
    move/from16 v16, v3

    .line 596
    .line 597
    :goto_9
    const/4 v3, 0x3

    .line 598
    goto :goto_a

    .line 599
    :cond_17
    const/4 v14, 0x2

    .line 600
    if-ne v11, v14, :cond_16

    .line 601
    .line 602
    iget-object v11, v0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->k:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;

    .line 603
    .line 604
    iget-object v14, v13, Ll/orc0;->g:Ll/ns2;

    .line 605
    .line 606
    iget-object v14, v14, Ll/ns2;->a:Landroid/view/View;

    .line 607
    .line 608
    iget-object v15, v0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->i:Ljava/util/List;

    .line 609
    .line 610
    invoke-interface {v15}, Ljava/util/List;->size()I

    .line 611
    .line 612
    .line 613
    move-result v15

    .line 614
    move/from16 v16, v3

    .line 615
    .line 616
    iget-object v3, v13, Ll/orc0;->g:Ll/ns2;

    .line 617
    .line 618
    iget-object v3, v3, Ll/ns2;->a:Landroid/view/View;

    .line 619
    .line 620
    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 621
    .line 622
    .line 623
    move-result-object v3

    .line 624
    invoke-virtual {v11, v14, v15, v3}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->attachViewToParent(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 625
    .line 626
    .line 627
    goto :goto_9

    .line 628
    :goto_a
    iput v3, v13, Ll/orc0;->h:I

    .line 629
    .line 630
    iput v12, v13, Ll/orc0;->f:I

    .line 631
    .line 632
    invoke-virtual {v0, v13}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->x(Ll/orc0;)V

    .line 633
    .line 634
    .line 635
    iget-object v11, v0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->i:Ljava/util/List;

    .line 636
    .line 637
    invoke-interface {v11, v13}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 638
    .line 639
    .line 640
    iget v11, v13, Ll/orc0;->a:I

    .line 641
    .line 642
    iget v12, v13, Ll/orc0;->c:I

    .line 643
    .line 644
    add-int/2addr v11, v12

    .line 645
    iget v12, v0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->q:I

    .line 646
    .line 647
    add-int/2addr v11, v12

    .line 648
    add-int/2addr v11, v6

    .line 649
    if-ge v11, v2, :cond_19

    .line 650
    .line 651
    move/from16 v11, v16

    .line 652
    .line 653
    goto :goto_b

    .line 654
    :cond_18
    move/from16 v16, v3

    .line 655
    .line 656
    const/4 v3, 0x3

    .line 657
    :cond_19
    move v11, v10

    .line 658
    :goto_b
    if-eqz v11, :cond_1d

    .line 659
    .line 660
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->i:Ljava/util/List;

    .line 661
    .line 662
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 663
    .line 664
    .line 665
    move-result-object v2

    .line 666
    :goto_c
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 667
    .line 668
    .line 669
    move-result v3

    .line 670
    if-eqz v3, :cond_1c

    .line 671
    .line 672
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 673
    .line 674
    .line 675
    move-result-object v3

    .line 676
    check-cast v3, Ll/orc0;

    .line 677
    .line 678
    iget v4, v3, Ll/orc0;->a:I

    .line 679
    .line 680
    iget v7, v3, Ll/orc0;->c:I

    .line 681
    .line 682
    add-int/2addr v4, v7

    .line 683
    iget v7, v0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->q:I

    .line 684
    .line 685
    add-int/2addr v4, v7

    .line 686
    add-int/2addr v4, v6

    .line 687
    if-gtz v4, :cond_1b

    .line 688
    .line 689
    new-instance v4, Ljava/lang/StringBuilder;

    .line 690
    .line 691
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 692
    .line 693
    .line 694
    iget v7, v3, Ll/orc0;->f:I

    .line 695
    .line 696
    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 697
    .line 698
    .line 699
    const-string v7, " scrolltype:"

    .line 700
    .line 701
    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 702
    .line 703
    .line 704
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 705
    .line 706
    .line 707
    const-string v7, " type :"

    .line 708
    .line 709
    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 710
    .line 711
    .line 712
    iget v7, v3, Ll/orc0;->h:I

    .line 713
    .line 714
    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 715
    .line 716
    .line 717
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 718
    .line 719
    .line 720
    move-result-object v4

    .line 721
    invoke-static {v9, v4}, Ll/yor;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 722
    .line 723
    .line 724
    invoke-interface {v2}, Ljava/util/Iterator;->remove()V

    .line 725
    .line 726
    .line 727
    const/4 v14, 0x2

    .line 728
    if-ne v1, v14, :cond_1a

    .line 729
    .line 730
    iput v10, v3, Ll/orc0;->h:I

    .line 731
    .line 732
    iget-object v4, v0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->k:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;

    .line 733
    .line 734
    iget-object v7, v3, Ll/orc0;->g:Ll/ns2;

    .line 735
    .line 736
    iget-object v7, v7, Ll/ns2;->a:Landroid/view/View;

    .line 737
    .line 738
    invoke-virtual {v4, v7}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 739
    .line 740
    .line 741
    iget-object v4, v0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->p:Ll/pi80;

    .line 742
    .line 743
    iget-object v7, v3, Ll/orc0;->g:Ll/ns2;

    .line 744
    .line 745
    invoke-virtual {v4, v7}, Ll/pi80;->a(Ll/ns2;)V

    .line 746
    .line 747
    .line 748
    invoke-virtual {v3}, Ll/orc0;->b()V

    .line 749
    .line 750
    .line 751
    goto :goto_c

    .line 752
    :cond_1a
    iput v14, v3, Ll/orc0;->h:I

    .line 753
    .line 754
    iget-object v4, v0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->k:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;

    .line 755
    .line 756
    iget-object v7, v3, Ll/orc0;->g:Ll/ns2;

    .line 757
    .line 758
    iget-object v7, v7, Ll/ns2;->a:Landroid/view/View;

    .line 759
    .line 760
    invoke-virtual {v4, v7}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->detachViewFromParent(Landroid/view/View;)V

    .line 761
    .line 762
    .line 763
    iget-object v4, v0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->n:Ll/yde0;

    .line 764
    .line 765
    iget-object v7, v0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->h:Ll/dxi0;

    .line 766
    .line 767
    invoke-virtual {v4, v3, v7}, Ll/yde0;->a(Ll/orc0;Ll/dxi0;)V

    .line 768
    .line 769
    .line 770
    goto :goto_c

    .line 771
    :cond_1b
    const/4 v14, 0x2

    .line 772
    goto :goto_c

    .line 773
    :cond_1c
    move v3, v8

    .line 774
    goto :goto_d

    .line 775
    :cond_1d
    move/from16 v3, v16

    .line 776
    .line 777
    goto/16 :goto_5

    .line 778
    .line 779
    :cond_1e
    move/from16 v16, v3

    .line 780
    .line 781
    move/from16 v6, p1

    .line 782
    .line 783
    :goto_d
    iget v1, v0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->q:I

    .line 784
    .line 785
    add-int/2addr v1, v6

    .line 786
    iput v1, v0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->q:I

    .line 787
    .line 788
    return v3

    .line 789
    :cond_1f
    move/from16 v16, v3

    .line 790
    .line 791
    return v16
.end method

.method public final w()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->l:Ll/qrc0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/qrc0;->p:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/c;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->i:Ljava/util/List;

    .line 12
    .line 13
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->i:Ljava/util/List;

    .line 20
    .line 21
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    add-int/lit8 v1, v1, -0x1

    .line 26
    .line 27
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    check-cast v0, Ll/orc0;

    .line 32
    .line 33
    iget v1, v0, Ll/orc0;->a:I

    .line 34
    .line 35
    iget v0, v0, Ll/orc0;->c:I

    .line 36
    .line 37
    add-int/2addr v1, v0

    .line 38
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->q:I

    .line 39
    .line 40
    add-int/2addr v1, v0

    .line 41
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->k:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;

    .line 42
    .line 43
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->getRenderContentHeight()I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-ge v1, v0, :cond_0

    .line 48
    .line 49
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->l:Ll/qrc0;

    .line 50
    .line 51
    iget-object v0, v0, Ll/qrc0;->p:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/c;

    .line 52
    .line 53
    instance-of v0, v0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/c$e;

    .line 54
    .line 55
    if-eqz v0, :cond_1

    .line 56
    .line 57
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->l:Ll/qrc0;

    .line 58
    .line 59
    iget-object v0, v0, Ll/qrc0;->p:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/c;

    .line 60
    .line 61
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/d;->h(Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/c;)V

    .line 62
    .line 63
    .line 64
    return-void

    .line 65
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/d;->e()V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public final x(Ll/orc0;)V
    .locals 0

    .line 1
    iget-object p0, p1, Ll/orc0;->g:Ll/ns2;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const-string p0, "TantanListView"

    .line 7
    .line 8
    const-string p1, "\u9519\u8bef\u7684\u6dfb\u52a0item-------------"

    .line 9
    .line 10
    invoke-static {p0, p1}, Ll/yor;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-static {p1}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public y()V
    .locals 2

    .line 1
    const-string v0, "TantanListView"

    .line 2
    .line 3
    const-string v1, "\u79fb\u51faitem \u6e05\u9664scroll cache "

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/yor;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->n:Ll/yde0;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->h:Ll/dxi0;

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Ll/yde0;->b(Ll/dxi0;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->o:Ll/yde0;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->h:Ll/dxi0;

    .line 18
    .line 19
    invoke-virtual {v0, p0}, Ll/yde0;->b(Ll/dxi0;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final z(III)Ll/orc0;
    .locals 4

    .line 1
    new-instance v0, Ll/orc0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/orc0;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->h:Ll/dxi0;

    .line 7
    .line 8
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->k:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;

    .line 9
    .line 10
    invoke-virtual {v1, p1}, Ll/dxi0;->p(I)I

    .line 11
    .line 12
    .line 13
    move-result v3

    .line 14
    invoke-virtual {v1, p1, v2, v3}, Ll/dxi0;->b(ILandroid/view/ViewGroup;I)Ll/ns2;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->h:Ll/dxi0;

    .line 19
    .line 20
    invoke-virtual {v2, p1}, Ll/dxi0;->p(I)I

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    iput v2, v1, Ll/ns2;->c:I

    .line 25
    .line 26
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->h:Ll/dxi0;

    .line 27
    .line 28
    invoke-virtual {v2, p1}, Ll/dxi0;->d(I)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    iput-object v2, v1, Ll/ns2;->b:Ljava/lang/String;

    .line 33
    .line 34
    iput-object v1, v0, Ll/orc0;->g:Ll/ns2;

    .line 35
    .line 36
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->h:Ll/dxi0;

    .line 37
    .line 38
    invoke-virtual {v2, v1}, Ll/dxi0;->w(Ll/ns2;)V

    .line 39
    .line 40
    .line 41
    const-string v2, "createInfoByAdapter begin"

    .line 42
    .line 43
    invoke-virtual {p0, v0, v2}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->u(Ll/orc0;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->h:Ll/dxi0;

    .line 47
    .line 48
    invoke-virtual {v2, p1}, Ll/dxi0;->p(I)I

    .line 49
    .line 50
    .line 51
    move-result v3

    .line 52
    invoke-virtual {v2, v1, p1, v3}, Ll/dxi0;->a(Ll/ns2;II)V

    .line 53
    .line 54
    .line 55
    const-string p1, "createInfoByAdapter end"

    .line 56
    .line 57
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->u(Ll/orc0;Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0, p2, p3, v0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->r(IILl/orc0;)V

    .line 61
    .line 62
    .line 63
    return-object v0
.end method
