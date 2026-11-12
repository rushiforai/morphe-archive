.class public final Lp22;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lv5n;


# instance fields
.field public final synthetic a:Lx22;


# direct methods
.method public constructor <init>(Lx22;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lp22;->a:Lx22;

    return-void
.end method


# virtual methods
.method public final a(JLjava/lang/String;Landroid/net/Uri;)V
    .registers 7

    iget-object p0, p0, Lp22;->a:Lx22;

    iget-object v0, p0, Lx22;->n:Lr22;

    if-eqz v0, :cond_b

    invoke-virtual {v0}, Lr22;->g()Lvsn;

    move-result-object v0

    goto :goto_c

    :cond_b
    const/4 v0, 0x0

    :goto_c
    if-eqz v0, :cond_1e

    iget-object v1, v0, Lvsn;->c:Ls62;

    invoke-virtual {v1}, Ls62;->d()Lekc;

    move-result-object v1

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    invoke-static {p1, p2, v1}, Lju4;->a(JLjava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_1f

    :cond_1e
    return-void

    :cond_1f
    iget-object p0, p0, Lx22;->l:Lmrn;

    invoke-virtual {p0, p3}, Lmrn;->i(Ljava/lang/String;)V

    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result p0

    if-lez p0, :cond_2c

    const/4 p0, 0x1

    goto :goto_2d

    :cond_2c
    const/4 p0, 0x0

    :goto_2d
    invoke-virtual {v0, p0}, Lvsn;->d(Z)V

    invoke-virtual {v0, p4}, Lvsn;->a(Landroid/net/Uri;)V

    return-void
.end method

.method public final b(JLjava/lang/String;)V
    .registers 6

    iget-object p0, p0, Lp22;->a:Lx22;

    iget-object v0, p0, Lx22;->n:Lr22;

    if-eqz v0, :cond_b

    invoke-virtual {v0}, Lr22;->g()Lvsn;

    move-result-object v0

    goto :goto_c

    :cond_b
    const/4 v0, 0x0

    :goto_c
    if-eqz v0, :cond_1e

    iget-object v1, v0, Lvsn;->c:Ls62;

    invoke-virtual {v1}, Ls62;->d()Lekc;

    move-result-object v1

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    invoke-static {p1, p2, v1}, Lju4;->a(JLjava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_1f

    :cond_1e
    return-void

    :cond_1f
    iget-object p1, p0, Lx22;->l:Lmrn;

    invoke-virtual {p1, p3}, Lmrn;->i(Ljava/lang/String;)V

    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result p1

    const/4 p2, 0x0

    if-lez p1, :cond_2d

    const/4 p1, 0x1

    goto :goto_2e

    :cond_2d
    move p1, p2

    :goto_2e
    invoke-virtual {v0, p1}, Lvsn;->d(Z)V

    sget-object p1, Lux1;->c:Lux1;

    new-instance p3, Lo22;

    invoke-direct {p3, p0, p2}, Lo22;-><init>(Lx22;B)V

    invoke-virtual {v0, p1, p2, p3}, Lvsn;->h(Lux1;ZLcom/opera/api/Callback;)V

    return-void
.end method

.method public final c(JLjava/lang/String;)V
    .registers 6

    iget-object p0, p0, Lp22;->a:Lx22;

    iget-object v0, p0, Lx22;->n:Lr22;

    if-eqz v0, :cond_b

    invoke-virtual {v0}, Lr22;->g()Lvsn;

    move-result-object v0

    goto :goto_c

    :cond_b
    const/4 v0, 0x0

    :goto_c
    if-eqz v0, :cond_1e

    iget-object v1, v0, Lvsn;->c:Ls62;

    invoke-virtual {v1}, Ls62;->d()Lekc;

    move-result-object v1

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    invoke-static {p1, p2, v1}, Lju4;->a(JLjava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_1f

    :cond_1e
    return-void

    :cond_1f
    iget-object p0, p0, Lx22;->l:Lmrn;

    invoke-virtual {p0, p3}, Lmrn;->i(Ljava/lang/String;)V

    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result p0

    if-lez p0, :cond_2c

    const/4 p0, 0x1

    goto :goto_2d

    :cond_2c
    const/4 p0, 0x0

    :goto_2d
    invoke-virtual {v0, p0}, Lvsn;->d(Z)V

    sget-object p0, Lux1;->c:Lux1;

    invoke-virtual {v0, p0}, Lvsn;->i(Lux1;)V

    return-void
.end method

.method public final d(Ljava/lang/String;)V
    .registers 3

    iget-object p0, p0, Lp22;->a:Lx22;

    iget-object v0, p0, Lx22;->n:Lr22;

    if-eqz v0, :cond_b

    invoke-virtual {v0}, Lr22;->g()Lvsn;

    move-result-object v0

    goto :goto_c

    :cond_b
    const/4 v0, 0x0

    :goto_c
    if-nez v0, :cond_f

    return-void

    :cond_f
    iget-object p0, p0, Lx22;->l:Lmrn;

    invoke-virtual {p0, p1}, Lmrn;->i(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p0

    if-lez p0, :cond_1c

    const/4 p0, 0x1

    goto :goto_1d

    :cond_1c
    const/4 p0, 0x0

    :goto_1d
    invoke-virtual {v0, p0}, Lvsn;->d(Z)V

    return-void
.end method
