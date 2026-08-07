.class public final Ll/mzq0;
.super Ll/e0r0;
.source "SourceFile"


# instance fields
.field private a:Z

.field private b:I

.field private c:Z

.field private d:Ljava/lang/String;

.field private e:I


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
    iput v0, p0, Ll/mzq0;->b:I

    .line 6
    .line 7
    const-string v0, ""

    .line 8
    .line 9
    iput-object v0, p0, Ll/mzq0;->d:Ljava/lang/String;

    .line 10
    .line 11
    const/4 v0, -0x1

    .line 12
    iput v0, p0, Ll/mzq0;->e:I

    .line 13
    .line 14
    return-void
.end method

.method public static n([B)Ll/mzq0;
    .locals 1

    .line 1
    new-instance v0, Ll/mzq0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/mzq0;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p0}, Ll/e0r0;->c([B)Ll/e0r0;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Ll/mzq0;

    .line 11
    .line 12
    return-object p0
.end method


# virtual methods
.method public a()I
    .locals 1

    .line 1
    iget v0, p0, Ll/mzq0;->e:I

    .line 2
    .line 3
    if-gez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/mzq0;->i()I

    .line 6
    .line 7
    .line 8
    :cond_0
    iget p0, p0, Ll/mzq0;->e:I

    .line 9
    .line 10
    return p0
.end method

.method public bridge synthetic b(Ll/suq0;)Ll/e0r0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/mzq0;->m(Ll/suq0;)Ll/mzq0;

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
    invoke-virtual {p0}, Ll/mzq0;->o()Z

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
    invoke-virtual {p0}, Ll/mzq0;->q()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    invoke-virtual {p1, v0, v1}, Lcom/xiaomi/push/c;->t(II)V

    .line 13
    .line 14
    .line 15
    :cond_0
    invoke-virtual {p0}, Ll/mzq0;->p()Z

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
    invoke-virtual {p0}, Ll/mzq0;->j()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p1, v0, p0}, Lcom/xiaomi/push/c;->v(ILjava/lang/String;)V

    .line 27
    .line 28
    .line 29
    :cond_1
    return-void
.end method

.method public i()I
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/mzq0;->o()Z

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
    invoke-virtual {p0}, Ll/mzq0;->q()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    invoke-static {v0, v1}, Lcom/xiaomi/push/c;->c(II)I

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
    invoke-virtual {p0}, Ll/mzq0;->p()Z

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
    invoke-virtual {p0}, Ll/mzq0;->j()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-static {v1, v2}, Lcom/xiaomi/push/c;->e(ILjava/lang/String;)I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    add-int/2addr v0, v1

    .line 34
    :cond_1
    iput v0, p0, Ll/mzq0;->e:I

    .line 35
    .line 36
    return v0
.end method

.method public j()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mzq0;->d:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public k(I)Ll/mzq0;
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/mzq0;->a:Z

    .line 3
    .line 4
    iput p1, p0, Ll/mzq0;->b:I

    .line 5
    .line 6
    return-object p0
.end method

.method public l(Ljava/lang/String;)Ll/mzq0;
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/mzq0;->c:Z

    .line 3
    .line 4
    iput-object p1, p0, Ll/mzq0;->d:Ljava/lang/String;

    .line 5
    .line 6
    return-object p0
.end method

.method public m(Ll/suq0;)Ll/mzq0;
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
    const/16 v1, 0x8

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
    invoke-virtual {p1}, Ll/suq0;->e()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {p0, v0}, Ll/mzq0;->l(Ljava/lang/String;)Ll/mzq0;

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_2
    invoke-virtual {p1}, Ll/suq0;->p()I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    invoke-virtual {p0, v0}, Ll/mzq0;->k(I)Ll/mzq0;

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_3
    :goto_1
    return-object p0
.end method

.method public o()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/mzq0;->a:Z

    .line 2
    .line 3
    return p0
.end method

.method public p()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/mzq0;->c:Z

    .line 2
    .line 3
    return p0
.end method

.method public q()I
    .locals 0

    .line 1
    iget p0, p0, Ll/mzq0;->b:I

    .line 2
    .line 3
    return p0
.end method
