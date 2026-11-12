.class public abstract Lcx4;
.super Lex4;
.source "SourceFile"

# interfaces
.implements Ls6j;


# instance fields
.field public final f:Lhx5;

.field public final g:Lkak;


# direct methods
.method public constructor <init>(Lekc;I)V
    .registers 7

    invoke-direct {p0, p2}, Lex4;-><init>(I)V

    new-instance v0, Lhx5;

    iget-object v1, p0, Lv6j;->b:Lhx5;

    new-instance v2, Lbo3;

    const/16 v3, 0x13

    invoke-direct {v2, p0, v3}, Lbo3;-><init>(Ljava/lang/Object;B)V

    invoke-direct {v0, v1, v2}, Lhx5;-><init>(Lekc;Lkotlin/jvm/functions/Function1;)V

    iput-object v0, p0, Lcx4;->f:Lhx5;

    new-instance v0, Lu59;

    const/16 v1, 0x17

    invoke-direct {v0, p0, v1}, Lu59;-><init>(Ljava/lang/Object;B)V

    new-instance v1, Lkak;

    invoke-direct {v1, p2, p1, v0}, Lkak;-><init>(ILekc;Ljak;)V

    iput-object v1, p0, Lcx4;->g:Lkak;

    return-void
.end method


# virtual methods
.method public final c()Lhx5;
    .registers 1

    iget-object p0, p0, Lcx4;->f:Lhx5;

    return-object p0
.end method

.method public final e()V
    .registers 2

    invoke-super {p0}, Lv6j;->e()V

    iget-object p0, p0, Lcx4;->g:Lkak;

    iget-object v0, p0, Lkak;->b:Lekc;

    iget-object p0, p0, Lkak;->d:Lqzg;

    invoke-virtual {v0, p0}, Lekc;->k(Lf7f;)V

    return-void
.end method

.method public final f()V
    .registers 2

    iget-object p0, p0, Lcx4;->g:Lkak;

    iget-object v0, p0, Lkak;->b:Lekc;

    iget-object p0, p0, Lkak;->d:Lqzg;

    invoke-virtual {v0, p0}, Lekc;->p(Lf7f;)V

    return-void
.end method

.method public final g(Lr6j;)V
    .registers 2

    iget-object p0, p0, Lcx4;->g:Lkak;

    iget-object p1, p0, Lkak;->b:Lekc;

    invoke-virtual {p1}, Lekc;->g()Ljava/lang/Object;

    move-result-object p1

    if-nez p1, :cond_b

    return-void

    :cond_b
    iget-object p0, p0, Lkak;->c:Ljak;

    invoke-interface {p0, p1}, Ljak;->y(Ljava/lang/Object;)V

    return-void
.end method

.method public h(Lr6j;Ljava/lang/Object;I)Lr6j;
    .registers 11

    check-cast p2, Lh1c;

    new-instance v2, Lx6j;

    new-instance v0, La7b;

    const/4 v1, 0x1

    invoke-direct {v0, p2, v1}, La7b;-><init>(Ljava/lang/Object;B)V

    const-class p2, Lg0c;

    invoke-direct {v2, p2, v0}, Lx6j;-><init>(Ljava/lang/Class;Lkotlin/jvm/functions/Function2;)V

    new-instance v5, Lnna;

    const/16 p2, 0xd

    invoke-direct {v5, p0, p2}, Lnna;-><init>(Ljava/lang/Object;B)V

    const/16 v6, 0x18

    const v3, 0x7f140ff5

    const/4 v4, 0x0

    move-object v0, p1

    move v1, p3

    invoke-static/range {v0 .. v6}, Lr6j;->b(Lr6j;ILx6j;IILkotlin/jvm/functions/Function1;I)Lr6j;

    move-result-object p0

    return-object p0
.end method
