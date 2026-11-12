.class public abstract Ld1g;
.super Lf1g;
.source "SourceFile"

# interfaces
.implements Ls6j;


# instance fields
.field public final c:Lhx5;

.field public final d:Lkak;

.field public e:Z


# direct methods
.method public constructor <init>(Lekc;I)V
    .registers 7

    invoke-direct {p0, p2}, Lv6j;-><init>(I)V

    new-instance v0, Lhx5;

    iget-object v1, p0, Lv6j;->b:Lhx5;

    new-instance v2, Lo5f;

    const/16 v3, 0x14

    invoke-direct {v2, p0, v3}, Lo5f;-><init>(Ljava/lang/Object;B)V

    invoke-direct {v0, v1, v2}, Lhx5;-><init>(Lekc;Lkotlin/jvm/functions/Function1;)V

    iput-object v0, p0, Ld1g;->c:Lhx5;

    new-instance v0, Lisd;

    const/16 v1, 0xb

    invoke-direct {v0, p0, v1}, Lisd;-><init>(Ljava/lang/Object;B)V

    new-instance v1, Lkak;

    invoke-direct {v1, p2, p1, v0}, Lkak;-><init>(ILekc;Ljak;)V

    iput-object v1, p0, Ld1g;->d:Lkak;

    const/4 p1, 0x1

    iput-boolean p1, p0, Ld1g;->e:Z

    return-void
.end method


# virtual methods
.method public a(Lhx4;Ljava/lang/Object;)Lix4;
    .registers 3

    iget-boolean p0, p0, Ld1g;->e:Z

    if-nez p0, :cond_e

    iget-object p0, p1, Lhx4;->c:Ljava/util/LinkedHashSet;

    invoke-interface {p0}, Ljava/util/Set;->clear()V

    invoke-virtual {p1}, Lhx4;->a()Lix4;

    move-result-object p0

    return-object p0

    :cond_e
    invoke-virtual {p1}, Lhx4;->a()Lix4;

    move-result-object p0

    return-object p0
.end method

.method public final c()Lhx5;
    .registers 1

    iget-object p0, p0, Ld1g;->c:Lhx5;

    return-object p0
.end method

.method public final e()V
    .registers 2

    invoke-super {p0}, Lv6j;->e()V

    iget-object p0, p0, Ld1g;->d:Lkak;

    iget-object v0, p0, Lkak;->b:Lekc;

    iget-object p0, p0, Lkak;->d:Lqzg;

    invoke-virtual {v0, p0}, Lekc;->k(Lf7f;)V

    return-void
.end method

.method public final f()V
    .registers 2

    iget-object p0, p0, Ld1g;->d:Lkak;

    iget-object v0, p0, Lkak;->b:Lekc;

    iget-object p0, p0, Lkak;->d:Lqzg;

    invoke-virtual {v0, p0}, Lekc;->p(Lf7f;)V

    return-void
.end method

.method public g(ILjava/lang/Object;)Lr6j;
    .registers 12

    check-cast p2, Ltu1;

    new-instance v0, Lr6j;

    new-instance v2, Lx6j;

    new-instance p2, Lve5;

    const/16 v1, 0x1b

    invoke-direct {p2, v1}, Lve5;-><init>(B)V

    const-class v1, Ld8j;

    invoke-direct {v2, v1, p2}, Lx6j;-><init>(Ljava/lang/Class;Lkotlin/jvm/functions/Function2;)V

    new-instance v7, Lz3;

    const/16 p2, 0x17

    invoke-direct {v7, p0, p2}, Lz3;-><init>(Ljava/lang/Object;B)V

    const/16 v8, 0x60

    const v3, 0x7f140f6e

    const v4, 0x7f140f6f

    const v5, 0x7f0804f0

    const/4 v6, 0x0

    move v1, p1

    invoke-direct/range {v0 .. v8}, Lr6j;-><init>(ILx6j;IIIZLkotlin/jvm/functions/Function1;I)V

    return-object v0
.end method
