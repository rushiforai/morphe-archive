.class public final Liqn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lv5n;


# instance fields
.field public final synthetic a:Lmqn;

.field public final synthetic b:Lmrn;


# direct methods
.method public constructor <init>(Lmqn;Lmrn;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Liqn;->a:Lmqn;

    iput-object p2, p0, Liqn;->b:Lmrn;

    return-void
.end method


# virtual methods
.method public final a(JLjava/lang/String;Landroid/net/Uri;)V
    .registers 8

    iget-object v0, p0, Liqn;->a:Lmqn;

    iget-object v1, v0, Llqn;->w:Lvsn;

    iget-object v2, v1, Lvsn;->c:Ls62;

    invoke-virtual {v2}, Ls62;->d()Lekc;

    move-result-object v2

    invoke-virtual {v2}, Lekc;->g()Ljava/lang/Object;

    move-result-object v2

    invoke-static {p1, p2, v2}, Lju4;->a(JLjava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_15

    return-void

    :cond_15
    iget-object p0, p0, Liqn;->b:Lmrn;

    invoke-virtual {p0, p3}, Lmrn;->i(Ljava/lang/String;)V

    invoke-virtual {v0, p3}, Llqn;->H0(Ljava/lang/String;)V

    invoke-virtual {v1, p4}, Lvsn;->a(Landroid/net/Uri;)V

    return-void
.end method

.method public final b(JLjava/lang/String;)V
    .registers 7

    iget-object v0, p0, Liqn;->a:Lmqn;

    iget-object v1, v0, Llqn;->w:Lvsn;

    iget-object v2, v1, Lvsn;->c:Ls62;

    invoke-virtual {v2}, Ls62;->d()Lekc;

    move-result-object v2

    invoke-virtual {v2}, Lekc;->g()Ljava/lang/Object;

    move-result-object v2

    invoke-static {p1, p2, v2}, Lju4;->a(JLjava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_15

    return-void

    :cond_15
    iget-object p0, p0, Liqn;->b:Lmrn;

    invoke-virtual {p0, p3}, Lmrn;->i(Ljava/lang/String;)V

    invoke-virtual {v0, p3}, Llqn;->H0(Ljava/lang/String;)V

    sget-object p0, Lux1;->c:Lux1;

    new-instance p1, Ltu;

    const/16 p2, 0xe

    invoke-direct {p1, v0, p2}, Ltu;-><init>(Ljava/lang/Object;B)V

    const/4 p2, 0x0

    invoke-virtual {v1, p0, p2, p1}, Lvsn;->h(Lux1;ZLcom/opera/api/Callback;)V

    return-void
.end method

.method public final c(JLjava/lang/String;)V
    .registers 7

    iget-object v0, p0, Liqn;->a:Lmqn;

    iget-object v1, v0, Llqn;->w:Lvsn;

    iget-object v2, v1, Lvsn;->c:Ls62;

    invoke-virtual {v2}, Ls62;->d()Lekc;

    move-result-object v2

    invoke-virtual {v2}, Lekc;->g()Ljava/lang/Object;

    move-result-object v2

    invoke-static {p1, p2, v2}, Lju4;->a(JLjava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_15

    return-void

    :cond_15
    iget-object p0, p0, Liqn;->b:Lmrn;

    invoke-virtual {p0, p3}, Lmrn;->i(Ljava/lang/String;)V

    invoke-virtual {v0, p3}, Llqn;->H0(Ljava/lang/String;)V

    sget-object p0, Lux1;->c:Lux1;

    invoke-virtual {v1, p0}, Lvsn;->i(Lux1;)V

    return-void
.end method

.method public final d(Ljava/lang/String;)V
    .registers 2

    iget-object p0, p0, Liqn;->b:Lmrn;

    invoke-virtual {p0, p1}, Lmrn;->i(Ljava/lang/String;)V

    return-void
.end method
