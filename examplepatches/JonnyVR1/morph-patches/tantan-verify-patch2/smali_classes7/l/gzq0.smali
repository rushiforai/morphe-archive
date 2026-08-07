.class public final Ll/gzq0;
.super Ll/e0r0;
.source "SourceFile"


# instance fields
.field private a:Z

.field private b:Z

.field private c:Z

.field private d:I

.field private e:Z

.field private f:I

.field private g:Z

.field private h:I

.field private i:I


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
    iput-boolean v0, p0, Ll/gzq0;->b:Z

    .line 6
    .line 7
    iput v0, p0, Ll/gzq0;->d:I

    .line 8
    .line 9
    iput v0, p0, Ll/gzq0;->f:I

    .line 10
    .line 11
    iput v0, p0, Ll/gzq0;->h:I

    .line 12
    .line 13
    const/4 v0, -0x1

    .line 14
    iput v0, p0, Ll/gzq0;->i:I

    .line 15
    .line 16
    return-void
.end method

.method public static m([B)Ll/gzq0;
    .locals 1

    .line 1
    new-instance v0, Ll/gzq0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/gzq0;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p0}, Ll/e0r0;->c([B)Ll/e0r0;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Ll/gzq0;

    .line 11
    .line 12
    return-object p0
.end method


# virtual methods
.method public a()I
    .locals 1

    .line 1
    iget v0, p0, Ll/gzq0;->i:I

    .line 2
    .line 3
    if-gez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/gzq0;->i()I

    .line 6
    .line 7
    .line 8
    :cond_0
    iget p0, p0, Ll/gzq0;->i:I

    .line 9
    .line 10
    return p0
.end method

.method public bridge synthetic b(Ll/suq0;)Ll/e0r0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/gzq0;->k(Ll/suq0;)Ll/gzq0;

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
    invoke-virtual {p0}, Ll/gzq0;->p()Z

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
    invoke-virtual {p0}, Ll/gzq0;->n()Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    invoke-virtual {p1, v0, v1}, Lcom/xiaomi/push/c;->y(IZ)V

    .line 13
    .line 14
    .line 15
    :cond_0
    invoke-virtual {p0}, Ll/gzq0;->s()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    const/4 v0, 0x3

    .line 22
    invoke-virtual {p0}, Ll/gzq0;->q()I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    invoke-virtual {p1, v0, v1}, Lcom/xiaomi/push/c;->t(II)V

    .line 27
    .line 28
    .line 29
    :cond_1
    invoke-virtual {p0}, Ll/gzq0;->u()Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_2

    .line 34
    .line 35
    const/4 v0, 0x4

    .line 36
    invoke-virtual {p0}, Ll/gzq0;->t()I

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
    invoke-virtual {p0}, Ll/gzq0;->w()Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-eqz v0, :cond_3

    .line 48
    .line 49
    const/4 v0, 0x5

    .line 50
    invoke-virtual {p0}, Ll/gzq0;->v()I

    .line 51
    .line 52
    .line 53
    move-result p0

    .line 54
    invoke-virtual {p1, v0, p0}, Lcom/xiaomi/push/c;->t(II)V

    .line 55
    .line 56
    .line 57
    :cond_3
    return-void
.end method

.method public i()I
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/gzq0;->p()Z

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
    invoke-virtual {p0}, Ll/gzq0;->n()Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    invoke-static {v0, v1}, Lcom/xiaomi/push/c;->h(IZ)I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const/4 v0, 0x0

    .line 18
    :goto_0
    invoke-virtual {p0}, Ll/gzq0;->s()Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-eqz v1, :cond_1

    .line 23
    .line 24
    const/4 v1, 0x3

    .line 25
    invoke-virtual {p0}, Ll/gzq0;->q()I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    invoke-static {v1, v2}, Lcom/xiaomi/push/c;->c(II)I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    add-int/2addr v0, v1

    .line 34
    :cond_1
    invoke-virtual {p0}, Ll/gzq0;->u()Z

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    if-eqz v1, :cond_2

    .line 39
    .line 40
    const/4 v1, 0x4

    .line 41
    invoke-virtual {p0}, Ll/gzq0;->t()I

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    invoke-static {v1, v2}, Lcom/xiaomi/push/c;->c(II)I

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    add-int/2addr v0, v1

    .line 50
    :cond_2
    invoke-virtual {p0}, Ll/gzq0;->w()Z

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    if-eqz v1, :cond_3

    .line 55
    .line 56
    const/4 v1, 0x5

    .line 57
    invoke-virtual {p0}, Ll/gzq0;->v()I

    .line 58
    .line 59
    .line 60
    move-result v2

    .line 61
    invoke-static {v1, v2}, Lcom/xiaomi/push/c;->c(II)I

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    add-int/2addr v0, v1

    .line 66
    :cond_3
    iput v0, p0, Ll/gzq0;->i:I

    .line 67
    .line 68
    return v0
.end method

.method public j(I)Ll/gzq0;
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/gzq0;->c:Z

    .line 3
    .line 4
    iput p1, p0, Ll/gzq0;->d:I

    .line 5
    .line 6
    return-object p0
.end method

.method public k(Ll/suq0;)Ll/gzq0;
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
    if-eqz v0, :cond_5

    .line 6
    .line 7
    const/16 v1, 0x8

    .line 8
    .line 9
    if-eq v0, v1, :cond_4

    .line 10
    .line 11
    const/16 v1, 0x18

    .line 12
    .line 13
    if-eq v0, v1, :cond_3

    .line 14
    .line 15
    const/16 v1, 0x20

    .line 16
    .line 17
    if-eq v0, v1, :cond_2

    .line 18
    .line 19
    const/16 v1, 0x28

    .line 20
    .line 21
    if-eq v0, v1, :cond_1

    .line 22
    .line 23
    invoke-virtual {p0, p1, v0}, Ll/e0r0;->g(Ll/suq0;I)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-nez v0, :cond_0

    .line 28
    .line 29
    goto :goto_1

    .line 30
    :cond_1
    invoke-virtual {p1}, Ll/suq0;->p()I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    invoke-virtual {p0, v0}, Ll/gzq0;->r(I)Ll/gzq0;

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_2
    invoke-virtual {p1}, Ll/suq0;->p()I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    invoke-virtual {p0, v0}, Ll/gzq0;->o(I)Ll/gzq0;

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_3
    invoke-virtual {p1}, Ll/suq0;->p()I

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    invoke-virtual {p0, v0}, Ll/gzq0;->j(I)Ll/gzq0;

    .line 51
    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_4
    invoke-virtual {p1}, Ll/suq0;->l()Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    invoke-virtual {p0, v0}, Ll/gzq0;->l(Z)Ll/gzq0;

    .line 59
    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_5
    :goto_1
    return-object p0
.end method

.method public l(Z)Ll/gzq0;
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/gzq0;->a:Z

    .line 3
    .line 4
    iput-boolean p1, p0, Ll/gzq0;->b:Z

    .line 5
    .line 6
    return-object p0
.end method

.method public n()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/gzq0;->b:Z

    .line 2
    .line 3
    return p0
.end method

.method public o(I)Ll/gzq0;
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/gzq0;->e:Z

    .line 3
    .line 4
    iput p1, p0, Ll/gzq0;->f:I

    .line 5
    .line 6
    return-object p0
.end method

.method public p()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/gzq0;->a:Z

    .line 2
    .line 3
    return p0
.end method

.method public q()I
    .locals 0

    .line 1
    iget p0, p0, Ll/gzq0;->d:I

    .line 2
    .line 3
    return p0
.end method

.method public r(I)Ll/gzq0;
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/gzq0;->g:Z

    .line 3
    .line 4
    iput p1, p0, Ll/gzq0;->h:I

    .line 5
    .line 6
    return-object p0
.end method

.method public s()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/gzq0;->c:Z

    .line 2
    .line 3
    return p0
.end method

.method public t()I
    .locals 0

    .line 1
    iget p0, p0, Ll/gzq0;->f:I

    .line 2
    .line 3
    return p0
.end method

.method public u()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/gzq0;->e:Z

    .line 2
    .line 3
    return p0
.end method

.method public v()I
    .locals 0

    .line 1
    iget p0, p0, Ll/gzq0;->h:I

    .line 2
    .line 3
    return p0
.end method

.method public w()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/gzq0;->g:Z

    .line 2
    .line 3
    return p0
.end method
