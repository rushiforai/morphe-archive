.class public final Lncd;
.super Lu5k;
.source "SourceFile"

# interfaces
.implements Lzsh;
.implements Ldy;


# instance fields
.field public final c:Lwy;

.field public final d:Lo4b;

.field public final e:Lhx;

.field public final f:Lplj;

.field public g:I

.field public final h:Lagm;


# direct methods
.method public constructor <init>(Landroidx/recyclerview/widget/RecyclerView;Lwy;Lx5f;Lpde;Ltsd;Lijc;)V
    .registers 9

    sget-object v0, Le6k;->g:Le6k;

    const-class v1, Ln43;

    invoke-direct {p0, v1, p6, v0}, Lu5k;-><init>(Ljava/lang/Class;Lijc;Le6k;)V

    iput-object p2, p0, Lncd;->c:Lwy;

    new-instance p6, Lo4b;

    const/4 v1, 0x2

    invoke-direct {p6, p0, v0, v1}, Lo4b;-><init>(Lu5k;Le6k;B)V

    iput-object p6, p0, Lncd;->d:Lo4b;

    new-instance p6, Lhx;

    const/4 v0, 0x7

    invoke-direct {p6, v0}, Lhx;-><init>(B)V

    new-instance v0, Lu10;

    invoke-direct {v0, p3, p4, p5}, Lu10;-><init>(Lx5f;Lpde;Ltsd;)V

    invoke-virtual {p6, v0}, Lhx;->a(Lea2;)V

    new-instance p3, Lox;

    const/4 p4, 0x0

    invoke-direct {p3, p4}, Lox;-><init>(B)V

    new-instance p4, Lda2;

    const-class p5, Lno;

    const v0, 0x7f0d017b

    invoke-direct {p4, p5, v0, v0, p3}, Lda2;-><init>(Ljava/lang/Class;IILjr9;)V

    invoke-virtual {p6, p4}, Lhx;->a(Lea2;)V

    new-instance p3, Lox;

    const/4 p4, 0x1

    invoke-direct {p3, p4}, Lox;-><init>(B)V

    new-instance p4, Lda2;

    const-class p5, Lin7;

    const v0, 0x7f0d01a0

    invoke-direct {p4, p5, v0, v0, p3}, Lda2;-><init>(Ljava/lang/Class;IILjr9;)V

    invoke-virtual {p6, p4}, Lhx;->a(Lea2;)V

    iput-object p6, p0, Lncd;->e:Lhx;

    new-instance p3, Lplj;

    iget-object p4, p2, Lwy;->x:Lay;

    invoke-virtual {p4}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Locd;

    iget-object p5, p2, Lwy;->b:Lx5f;

    invoke-direct {p3, p2, p4, p5}, Lplj;-><init>(Lwy;Locd;Lx5f;)V

    iput-object p3, p0, Lncd;->f:Lplj;

    new-instance p4, Lagm;

    new-instance p5, Lgv8;

    const/16 p6, 0x1a

    invoke-direct {p5, p0, p1, p6}, Lgv8;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {p4, p5}, Lagm;-><init>(Lkotlin/jvm/functions/Function0;)V

    iput-object p4, p0, Lncd;->h:Lagm;

    iget-object p1, p2, Lwy;->e:Lvzk;

    invoke-virtual {p1, p0}, Lvzk;->h(Ldy;)V

    iget-object p1, p1, Lvzk;->a:Ljava/lang/Object;

    check-cast p1, Lcy;

    invoke-virtual {p1}, Lcy;->c()Lml;

    move-result-object p1

    invoke-virtual {p0, p1}, Lncd;->s(Lml;)V

    iput-object p0, p3, Lplj;->s:Lncd;

    return-void
.end method


# virtual methods
.method public final c()V
    .registers 2

    iget-object p0, p0, Lncd;->f:Lplj;

    iget-object v0, p0, Lplj;->p:Locd;

    invoke-virtual {v0}, Locd;->a()Z

    move-result v0

    if-eqz v0, :cond_16

    iget-object v0, p0, Lplj;->q:Ln43;

    invoke-virtual {v0}, Ln43;->e()Z

    move-result v0

    if-eqz v0, :cond_16

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lplj;->t0(Z)V

    :cond_16
    return-void
.end method

.method public final k(Landroid/view/ViewGroup;I)Lab2;
    .registers 3

    iget p1, p0, Lncd;->g:I

    if-eq p2, p1, :cond_6

    const/4 p0, 0x0

    return-object p0

    :cond_6
    iget-object p0, p0, Lncd;->h:Lagm;

    invoke-virtual {p0}, Lagm;->r()Lab2;

    move-result-object p0

    return-object p0
.end method

.method public final onDestroy()V
    .registers 3

    iget-object v0, p0, Lncd;->c:Lwy;

    iget-object v0, v0, Lwy;->e:Lvzk;

    iget-object v0, v0, Lvzk;->c:Ljava/lang/Object;

    check-cast v0, Ljava/util/Set;

    invoke-interface {v0, p0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    iget-object p0, p0, Lncd;->f:Lplj;

    const/4 v0, 0x0

    iput-object v0, p0, Lplj;->s:Lncd;

    iput-object v0, p0, Lplj;->r:Luo;

    new-instance v0, Lin7;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lia2;-><init>(B)V

    invoke-virtual {p0, v0}, Lplj;->s0(Ln43;)V

    return-void
.end method

.method public final q(Lja2;ILca2;)I
    .registers 5

    iget-object v0, p0, Lncd;->e:Lhx;

    invoke-virtual {v0, p1, p2, p3}, Lhx;->q(Lja2;ILca2;)I

    move-result p1

    if-eqz p1, :cond_15

    iget p2, p0, Lncd;->g:I

    if-eq p2, p1, :cond_15

    iput p1, p0, Lncd;->g:I

    iget-object p0, p0, Lncd;->h:Lagm;

    const/4 p2, 0x0

    iput-object p2, p0, Lagm;->c:Ljava/lang/Object;

    iput-object p2, p0, Lagm;->d:Ljava/lang/Object;

    :cond_15
    return p1
.end method

.method public final s(Lml;)V
    .registers 5

    iget-object p1, p1, Lml;->g:Lkl;

    if-eqz p1, :cond_12

    new-instance v0, Luo;

    iget-object v1, p0, Lncd;->c:Lwy;

    iget-object v1, v1, Lwy;->q:Lw7h;

    invoke-virtual {v1, p1}, Lw7h;->a(Ldl;)Lbz;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Luo;-><init>(Lbz;Ldl;)V

    goto :goto_13

    :cond_12
    const/4 v0, 0x0

    :goto_13
    iget-object p0, p0, Lncd;->f:Lplj;

    iget-object p1, p0, Lplj;->r:Luo;

    invoke-static {v0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_42

    iget-object p1, p0, Lplj;->r:Luo;

    const/4 v1, 0x1

    if-nez p1, :cond_24

    move p1, v1

    goto :goto_25

    :cond_24
    const/4 p1, 0x0

    :goto_25
    iput-object v0, p0, Lplj;->r:Luo;

    if-nez v0, :cond_32

    new-instance p1, Lin7;

    invoke-direct {p1, v1}, Lia2;-><init>(B)V

    invoke-virtual {p0, p1}, Lplj;->s0(Ln43;)V

    return-void

    :cond_32
    if-eqz p1, :cond_42

    new-instance p1, Lno;

    iget-object v1, p0, Lplj;->o:Lwy;

    iget-object v1, v1, Lwy;->l:Lyl;

    sget-object v2, Ll08;->a:Ll08;

    invoke-direct {p1, v0, v1, p0, v2}, Lno;-><init>(Luo;Lkm;Lk8;Ljava/util/List;)V

    invoke-virtual {p0, p1}, Lplj;->s0(Ln43;)V

    :cond_42
    return-void
.end method

.method public final t()Lja2;
    .registers 1

    iget-object p0, p0, Lncd;->f:Lplj;

    iget-object p0, p0, Lplj;->q:Ln43;

    return-object p0
.end method

.method public final u()Lk6k;
    .registers 1

    iget-object p0, p0, Lncd;->d:Lo4b;

    return-object p0
.end method

.method public final z()Z
    .registers 1

    iget-object p0, p0, Lncd;->f:Lplj;

    iget-object p0, p0, Lplj;->q:Ln43;

    instance-of p0, p0, Lin7;

    xor-int/lit8 p0, p0, 0x1

    return p0
.end method
