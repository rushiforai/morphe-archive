.class public final Ll/ezq0;
.super Ll/e0r0;
.source "SourceFile"


# instance fields
.field private a:Z

.field private b:I

.field private c:Z

.field private d:Z

.field private e:Z

.field private f:I

.field private g:Z

.field private h:Z

.field private i:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private j:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/e0r0;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/ezq0;->b:I

    .line 6
    .line 7
    iput-boolean v0, p0, Ll/ezq0;->d:Z

    .line 8
    .line 9
    iput v0, p0, Ll/ezq0;->f:I

    .line 10
    .line 11
    iput-boolean v0, p0, Ll/ezq0;->h:Z

    .line 12
    .line 13
    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 14
    .line 15
    iput-object v0, p0, Ll/ezq0;->i:Ljava/util/List;

    .line 16
    .line 17
    const/4 v0, -0x1

    .line 18
    iput v0, p0, Ll/ezq0;->j:I

    .line 19
    .line 20
    return-void
.end method

.method public static o([B)Ll/ezq0;
    .locals 1

    .line 1
    new-instance v0, Ll/ezq0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/ezq0;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p0}, Ll/e0r0;->c([B)Ll/e0r0;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Ll/ezq0;

    .line 11
    .line 12
    return-object p0
.end method

.method public static r(Ll/suq0;)Ll/ezq0;
    .locals 1

    .line 1
    new-instance v0, Ll/ezq0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/ezq0;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p0}, Ll/ezq0;->m(Ll/suq0;)Ll/ezq0;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method


# virtual methods
.method public A()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/ezq0;->g:Z

    .line 2
    .line 3
    return p0
.end method

.method public a()I
    .locals 1

    .line 1
    iget v0, p0, Ll/ezq0;->j:I

    .line 2
    .line 3
    if-gez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/ezq0;->i()I

    .line 6
    .line 7
    .line 8
    :cond_0
    iget p0, p0, Ll/ezq0;->j:I

    .line 9
    .line 10
    return p0
.end method

.method public bridge synthetic b(Ll/suq0;)Ll/e0r0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ezq0;->m(Ll/suq0;)Ll/ezq0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public e(Lcom/xiaomi/push/c;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ezq0;->p()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    invoke-virtual {p0}, Ll/ezq0;->u()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    invoke-virtual {p1, v0, v1}, Lcom/xiaomi/push/c;->M(II)V

    .line 13
    .line 14
    .line 15
    :cond_0
    invoke-virtual {p0}, Ll/ezq0;->v()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    const/4 v0, 0x2

    .line 22
    invoke-virtual {p0}, Ll/ezq0;->t()Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    invoke-virtual {p1, v0, v1}, Lcom/xiaomi/push/c;->y(IZ)V

    .line 27
    .line 28
    .line 29
    :cond_1
    invoke-virtual {p0}, Ll/ezq0;->x()Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_2

    .line 34
    .line 35
    const/4 v0, 0x3

    .line 36
    invoke-virtual {p0}, Ll/ezq0;->w()I

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    invoke-virtual {p1, v0, v1}, Lcom/xiaomi/push/c;->t(II)V

    .line 41
    .line 42
    .line 43
    :cond_2
    invoke-virtual {p0}, Ll/ezq0;->A()Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-eqz v0, :cond_3

    .line 48
    .line 49
    const/4 v0, 0x4

    .line 50
    invoke-virtual {p0}, Ll/ezq0;->z()Z

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    invoke-virtual {p1, v0, v1}, Lcom/xiaomi/push/c;->y(IZ)V

    .line 55
    .line 56
    .line 57
    :cond_3
    invoke-virtual {p0}, Ll/ezq0;->j()Ljava/util/List;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    if-eqz v0, :cond_4

    .line 70
    .line 71
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    check-cast v0, Ljava/lang/String;

    .line 76
    .line 77
    const/4 v1, 0x5

    .line 78
    invoke-virtual {p1, v1, v0}, Lcom/xiaomi/push/c;->v(ILjava/lang/String;)V

    .line 79
    .line 80
    .line 81
    goto :goto_0

    .line 82
    :cond_4
    return-void
.end method

.method public i()I
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/ezq0;->p()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    invoke-virtual {p0}, Ll/ezq0;->u()I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    invoke-static {v0, v2}, Lcom/xiaomi/push/c;->H(II)I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    move v0, v1

    .line 19
    :goto_0
    invoke-virtual {p0}, Ll/ezq0;->v()Z

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    if-eqz v2, :cond_1

    .line 24
    .line 25
    const/4 v2, 0x2

    .line 26
    invoke-virtual {p0}, Ll/ezq0;->t()Z

    .line 27
    .line 28
    .line 29
    move-result v3

    .line 30
    invoke-static {v2, v3}, Lcom/xiaomi/push/c;->h(IZ)I

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    add-int/2addr v0, v2

    .line 35
    :cond_1
    invoke-virtual {p0}, Ll/ezq0;->x()Z

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    if-eqz v2, :cond_2

    .line 40
    .line 41
    const/4 v2, 0x3

    .line 42
    invoke-virtual {p0}, Ll/ezq0;->w()I

    .line 43
    .line 44
    .line 45
    move-result v3

    .line 46
    invoke-static {v2, v3}, Lcom/xiaomi/push/c;->c(II)I

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    add-int/2addr v0, v2

    .line 51
    :cond_2
    invoke-virtual {p0}, Ll/ezq0;->A()Z

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    if-eqz v2, :cond_3

    .line 56
    .line 57
    const/4 v2, 0x4

    .line 58
    invoke-virtual {p0}, Ll/ezq0;->z()Z

    .line 59
    .line 60
    .line 61
    move-result v3

    .line 62
    invoke-static {v2, v3}, Lcom/xiaomi/push/c;->h(IZ)I

    .line 63
    .line 64
    .line 65
    move-result v2

    .line 66
    add-int/2addr v0, v2

    .line 67
    :cond_3
    invoke-virtual {p0}, Ll/ezq0;->j()Ljava/util/List;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 76
    .line 77
    .line 78
    move-result v3

    .line 79
    if-eqz v3, :cond_4

    .line 80
    .line 81
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object v3

    .line 85
    check-cast v3, Ljava/lang/String;

    .line 86
    .line 87
    invoke-static {v3}, Lcom/xiaomi/push/c;->j(Ljava/lang/String;)I

    .line 88
    .line 89
    .line 90
    move-result v3

    .line 91
    add-int/2addr v1, v3

    .line 92
    goto :goto_1

    .line 93
    :cond_4
    add-int/2addr v0, v1

    .line 94
    invoke-virtual {p0}, Ll/ezq0;->j()Ljava/util/List;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 99
    .line 100
    .line 101
    move-result v1

    .line 102
    add-int/2addr v0, v1

    .line 103
    iput v0, p0, Ll/ezq0;->j:I

    .line 104
    .line 105
    return v0
.end method

.method public j()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ezq0;->i:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public k(I)Ll/ezq0;
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/ezq0;->a:Z

    .line 3
    .line 4
    iput p1, p0, Ll/ezq0;->b:I

    .line 5
    .line 6
    return-object p0
.end method

.method public l(Ljava/lang/String;)Ll/ezq0;
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/ezq0;->i:Ljava/util/List;

    .line 5
    .line 6
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    new-instance v0, Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Ll/ezq0;->i:Ljava/util/List;

    .line 18
    .line 19
    :cond_0
    iget-object v0, p0, Ll/ezq0;->i:Ljava/util/List;

    .line 20
    .line 21
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    return-object p0
.end method

.method public m(Ll/suq0;)Ll/ezq0;
    .locals 2

    .line 1
    :cond_0
    :goto_0
    invoke-virtual {p1}, Ll/suq0;->b()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_6

    .line 6
    .line 7
    const/16 v1, 0x8

    .line 8
    .line 9
    if-eq v0, v1, :cond_5

    .line 10
    .line 11
    const/16 v1, 0x10

    .line 12
    .line 13
    if-eq v0, v1, :cond_4

    .line 14
    .line 15
    const/16 v1, 0x18

    .line 16
    .line 17
    if-eq v0, v1, :cond_3

    .line 18
    .line 19
    const/16 v1, 0x20

    .line 20
    .line 21
    if-eq v0, v1, :cond_2

    .line 22
    .line 23
    const/16 v1, 0x2a

    .line 24
    .line 25
    if-eq v0, v1, :cond_1

    .line 26
    .line 27
    invoke-virtual {p0, p1, v0}, Ll/e0r0;->g(Ll/suq0;I)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_0

    .line 32
    .line 33
    goto :goto_1

    .line 34
    :cond_1
    invoke-virtual {p1}, Ll/suq0;->e()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {p0, v0}, Ll/ezq0;->l(Ljava/lang/String;)Ll/ezq0;

    .line 39
    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_2
    invoke-virtual {p1}, Ll/suq0;->l()Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    invoke-virtual {p0, v0}, Ll/ezq0;->s(Z)Ll/ezq0;

    .line 47
    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_3
    invoke-virtual {p1}, Ll/suq0;->p()I

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    invoke-virtual {p0, v0}, Ll/ezq0;->q(I)Ll/ezq0;

    .line 55
    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_4
    invoke-virtual {p1}, Ll/suq0;->l()Z

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    invoke-virtual {p0, v0}, Ll/ezq0;->n(Z)Ll/ezq0;

    .line 63
    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_5
    invoke-virtual {p1}, Ll/suq0;->u()I

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    invoke-virtual {p0, v0}, Ll/ezq0;->k(I)Ll/ezq0;

    .line 71
    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_6
    :goto_1
    return-object p0
.end method

.method public n(Z)Ll/ezq0;
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/ezq0;->c:Z

    .line 3
    .line 4
    iput-boolean p1, p0, Ll/ezq0;->d:Z

    .line 5
    .line 6
    return-object p0
.end method

.method public p()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/ezq0;->a:Z

    .line 2
    .line 3
    return p0
.end method

.method public q(I)Ll/ezq0;
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/ezq0;->e:Z

    .line 3
    .line 4
    iput p1, p0, Ll/ezq0;->f:I

    .line 5
    .line 6
    return-object p0
.end method

.method public s(Z)Ll/ezq0;
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/ezq0;->g:Z

    .line 3
    .line 4
    iput-boolean p1, p0, Ll/ezq0;->h:Z

    .line 5
    .line 6
    return-object p0
.end method

.method public t()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/ezq0;->d:Z

    .line 2
    .line 3
    return p0
.end method

.method public u()I
    .locals 0

    .line 1
    iget p0, p0, Ll/ezq0;->b:I

    .line 2
    .line 3
    return p0
.end method

.method public v()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/ezq0;->c:Z

    .line 2
    .line 3
    return p0
.end method

.method public w()I
    .locals 0

    .line 1
    iget p0, p0, Ll/ezq0;->f:I

    .line 2
    .line 3
    return p0
.end method

.method public x()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/ezq0;->e:Z

    .line 2
    .line 3
    return p0
.end method

.method public y()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ezq0;->i:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public z()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/ezq0;->h:Z

    .line 2
    .line 3
    return p0
.end method
