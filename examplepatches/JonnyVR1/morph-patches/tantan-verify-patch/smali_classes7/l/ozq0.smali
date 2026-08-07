.class public final Ll/ozq0;
.super Ll/e0r0;
.source "SourceFile"


# instance fields
.field private a:Z

.field private b:Ll/asq0;

.field private c:Z

.field private d:Ll/gzq0;

.field private e:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/e0r0;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ll/asq0;->c:Ll/asq0;

    .line 5
    .line 6
    iput-object v0, p0, Ll/ozq0;->b:Ll/asq0;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Ll/ozq0;->d:Ll/gzq0;

    .line 10
    .line 11
    const/4 v0, -0x1

    .line 12
    iput v0, p0, Ll/ozq0;->e:I

    .line 13
    .line 14
    return-void
.end method

.method public static o([B)Ll/ozq0;
    .locals 1

    .line 1
    new-instance v0, Ll/ozq0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/ozq0;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p0}, Ll/e0r0;->c([B)Ll/e0r0;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Ll/ozq0;

    .line 11
    .line 12
    return-object p0
.end method


# virtual methods
.method public a()I
    .locals 1

    .line 1
    iget v0, p0, Ll/ozq0;->e:I

    .line 2
    .line 3
    if-gez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/ozq0;->i()I

    .line 6
    .line 7
    .line 8
    :cond_0
    iget p0, p0, Ll/ozq0;->e:I

    .line 9
    .line 10
    return p0
.end method

.method public bridge synthetic b(Ll/suq0;)Ll/e0r0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ozq0;->m(Ll/suq0;)Ll/ozq0;

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
    invoke-virtual {p0}, Ll/ozq0;->p()Z

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
    invoke-virtual {p0}, Ll/ozq0;->j()Ll/asq0;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {p1, v0, v1}, Lcom/xiaomi/push/c;->w(ILl/asq0;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    invoke-virtual {p0}, Ll/ozq0;->q()Z

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
    invoke-virtual {p0}, Ll/ozq0;->k()Ll/gzq0;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p1, v0, p0}, Lcom/xiaomi/push/c;->x(ILl/e0r0;)V

    .line 27
    .line 28
    .line 29
    :cond_1
    return-void
.end method

.method public i()I
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/ozq0;->p()Z

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
    invoke-virtual {p0}, Ll/ozq0;->j()Ll/asq0;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-static {v0, v1}, Lcom/xiaomi/push/c;->f(ILl/asq0;)I

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
    invoke-virtual {p0}, Ll/ozq0;->q()Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-eqz v1, :cond_1

    .line 23
    .line 24
    const/4 v1, 0x2

    .line 25
    invoke-virtual {p0}, Ll/ozq0;->k()Ll/gzq0;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-static {v1, v2}, Lcom/xiaomi/push/c;->g(ILl/e0r0;)I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    add-int/2addr v0, v1

    .line 34
    :cond_1
    iput v0, p0, Ll/ozq0;->e:I

    .line 35
    .line 36
    return v0
.end method

.method public j()Ll/asq0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ozq0;->b:Ll/asq0;

    .line 2
    .line 3
    return-object p0
.end method

.method public k()Ll/gzq0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ozq0;->d:Ll/gzq0;

    .line 2
    .line 3
    return-object p0
.end method

.method public l(Ll/asq0;)Ll/ozq0;
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/ozq0;->a:Z

    .line 3
    .line 4
    iput-object p1, p0, Ll/ozq0;->b:Ll/asq0;

    .line 5
    .line 6
    return-object p0
.end method

.method public m(Ll/suq0;)Ll/ozq0;
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
    if-eqz v0, :cond_3

    .line 6
    .line 7
    const/16 v1, 0xa

    .line 8
    .line 9
    if-eq v0, v1, :cond_2

    .line 10
    .line 11
    const/16 v1, 0x12

    .line 12
    .line 13
    if-eq v0, v1, :cond_1

    .line 14
    .line 15
    invoke-virtual {p0, p1, v0}, Ll/e0r0;->g(Ll/suq0;I)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    goto :goto_1

    .line 22
    :cond_1
    new-instance v0, Ll/gzq0;

    .line 23
    .line 24
    invoke-direct {v0}, Ll/gzq0;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p1, v0}, Ll/suq0;->k(Ll/e0r0;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0, v0}, Ll/ozq0;->n(Ll/gzq0;)Ll/ozq0;

    .line 31
    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_2
    invoke-virtual {p1}, Ll/suq0;->f()Ll/asq0;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {p0, v0}, Ll/ozq0;->l(Ll/asq0;)Ll/ozq0;

    .line 39
    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_3
    :goto_1
    return-object p0
.end method

.method public n(Ll/gzq0;)Ll/ozq0;
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Ll/ozq0;->c:Z

    .line 6
    .line 7
    iput-object p1, p0, Ll/ozq0;->d:Ll/gzq0;

    .line 8
    .line 9
    return-object p0
.end method

.method public p()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/ozq0;->a:Z

    .line 2
    .line 3
    return p0
.end method

.method public q()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/ozq0;->c:Z

    .line 2
    .line 3
    return p0
.end method
