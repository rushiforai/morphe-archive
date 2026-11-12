.class public final Lp9l;
.super La21;
.source "SourceFile"


# instance fields
.field public final synthetic n:Lr9l;


# direct methods
.method public constructor <init>(Leme;Lr9l;Lzkk;Lj1k;Lz77;Lk6l;Li53;Lnr8;Lu4l;Ls9i;Lysj;Lmt3;)V
    .registers 13

    iput-object p2, p0, Lp9l;->n:Lr9l;

    move-object p2, p11

    move-object p11, p1

    move-object p1, p3

    move-object p3, p5

    move-object p5, p7

    move-object p7, p9

    move-object p9, p2

    move-object p2, p4

    move-object p4, p6

    move-object p6, p8

    move-object p8, p10

    move-object p10, p12

    invoke-direct/range {p0 .. p11}, La21;-><init>(Lqdb;Lkotlin/jvm/functions/Function0;Lz77;Lk6l;Li53;Lnr8;Lu4l;Ls9i;Lysj;Lkotlin/jvm/functions/Function0;Lw9l;)V

    return-void
.end method


# virtual methods
.method public final D(I)Z
    .registers 6

    iget-object p0, p0, Lp9l;->n:Lr9l;

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lr9l;->r(Z)Z

    iget-object v1, p0, Lr9l;->c:Lk6l;

    sget-object v2, Lu3l;->a:Ls3l;

    new-instance v2, Lr3l;

    invoke-direct {v2, p1}, Lr3l;-><init>(I)V

    sget-object p1, Lx6l;->a:Lx6l;

    invoke-static {v1, v2, p1}, Lexg;->p(Lk6l;Lu3l;Lnxg;)Ljava/util/ArrayList;

    move-result-object p1

    invoke-static {p1}, Lkotlin/collections/CollectionsKt;->firstOrNull(Ljava/util/List;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lb2l;

    if-eqz p1, :cond_45

    iget-object v1, p0, Lr9l;->x:Lpde;

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Leyj;

    iget v1, v1, Leyj;->D:I

    iget-object v2, p0, Lr9l;->t:Lgal;

    invoke-interface {p1}, Lb9l;->T()Lp6l;

    move-result-object v3

    invoke-virtual {v2, v3}, Lgal;->g(Lp6l;)V

    invoke-virtual {p0}, Lr9l;->f()Lz5l;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v2, Lv5l;

    invoke-direct {v2, p0, p1, v0}, Lv5l;-><init>(Lz5l;Lb2l;B)V

    new-instance p1, Lgv;

    const/4 v0, 0x6

    invoke-direct {p1, p0, v1, v0}, Lgv;-><init>(Ljava/lang/Object;IB)V

    invoke-virtual {p0, v2, p1}, Lz5l;->e(Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function1;)V

    :cond_45
    const/4 p0, 0x1

    return p0
.end method

.method public final E(I)Lb2l;
    .registers 2

    invoke-super {p0, p1}, La21;->E(I)Lb2l;

    move-result-object p1

    iget-object p0, p0, Lp9l;->n:Lr9l;

    invoke-virtual {p0}, Lr9l;->j()Z

    return-object p1
.end method

.method public final X(Ljava/util/List;)Z
    .registers 4

    iget-object p0, p0, Lp9l;->n:Lr9l;

    const/4 v0, 0x1

    invoke-virtual {p0, v0, v0}, Lr9l;->s(ZZ)Z

    move-result v1

    if-eqz v1, :cond_14

    iget-object v1, p0, Lr9l;->w:Ls9i;

    check-cast p1, Ljava/lang/Iterable;

    invoke-virtual {v1, p1}, Ls9i;->d0(Ljava/lang/Iterable;)V

    invoke-virtual {p0}, Lr9l;->u()V

    return v0

    :cond_14
    const/4 p0, 0x0

    return p0
.end method

.method public final k0()V
    .registers 1

    iget-object p0, p0, Lp9l;->n:Lr9l;

    iget-object p0, p0, Lr9l;->D:Lg4l;

    invoke-static {p0}, Lg4l;->e(Lg4l;)V

    return-void
.end method

.method public final m(Lb2l;)V
    .registers 2

    invoke-super {p0, p1}, La21;->m(Lb2l;)V

    iget-object p0, p0, Lp9l;->n:Lr9l;

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Lr9l;->i(Z)Z

    return-void
.end method

.method public final o()V
    .registers 3

    iget-object p0, p0, Lp9l;->n:Lr9l;

    iget-object p0, p0, Lr9l;->D:Lg4l;

    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-static {p0, v1, v0}, Lg4l;->a(Lg4l;Luz3;I)V

    return-void
.end method
