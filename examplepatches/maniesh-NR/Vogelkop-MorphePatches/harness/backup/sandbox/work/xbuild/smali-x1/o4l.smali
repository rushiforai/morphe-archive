.class public final Lo4l;
.super Lie;
.source "SourceFile"


# instance fields
.field public final k:Lu3l;

.field public final l:I

.field public final m:Lu3l;


# direct methods
.method public constructor <init>(Lge;Lk6l;Lu4l;Ls9i;Lx9l;Lu3l;I)V
    .registers 19

    move/from16 v7, p7

    iget-object v0, p4, Ls9i;->d:Ljava/lang/Object;

    move-object v8, v0

    check-cast v8, Lpde;

    invoke-virtual {v8}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lqyi;

    sget-object v9, Loyi;->a:Loyi;

    invoke-static {v0, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    const/4 v10, 0x0

    if-eqz v1, :cond_34

    sget-object v0, Lu3l;->a:Ls3l;

    new-instance v0, Lr3l;

    invoke-direct {v0, v7}, Lr3l;-><init>(I)V

    sget-object v1, Ly6l;->a:Ly6l;

    invoke-static {p2, v0, v1}, Lexg;->p(Lk6l;Lu3l;Lnxg;)Ljava/util/ArrayList;

    move-result-object v0

    new-instance v1, Ljava/util/LinkedHashSet;

    invoke-direct {v1}, Ljava/util/LinkedHashSet;-><init>()V

    invoke-static {v0, v1}, Lo95;->t(Ljava/lang/Iterable;Ljava/util/Collection;)V

    :goto_2b
    move-object v0, p0

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object/from16 v5, p5

    move-object v6, v1

    move-object v1, p1

    goto :goto_44

    :cond_34
    instance-of v0, v0, Lpyi;

    if-eqz v0, :cond_80

    iget-object v0, p4, Ls9i;->c:Ljava/lang/Object;

    check-cast v0, Lpde;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Ljava/util/LinkedHashSet;

    goto :goto_2b

    :goto_44
    invoke-direct/range {v0 .. v6}, Lie;-><init>(Lge;Lk6l;Lu4l;Ls9i;Lx9l;Ljava/util/LinkedHashSet;)V

    move-object/from16 v1, p6

    iput-object v1, p0, Lo4l;->k:Lu3l;

    iput v7, p0, Lo4l;->l:I

    invoke-virtual {v8}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lqyi;

    invoke-static {v1, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_61

    sget-object v1, Lu3l;->a:Ls3l;

    new-instance v1, Lr3l;

    invoke-direct {v1, v7}, Lr3l;-><init>(I)V

    goto :goto_79

    :cond_61
    instance-of v2, v1, Lpyi;

    if-eqz v2, :cond_7c

    check-cast v1, Lpyi;

    iget-object v1, v1, Lpyi;->b:Lu3l;

    sget-object v2, Lu3l;->a:Ls3l;

    new-instance v2, Lr3l;

    invoke-direct {v2, v7}, Lr3l;-><init>(I)V

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v3, Lp3l;

    invoke-direct {v3, v1, v2}, Lp3l;-><init>(Lu3l;Lu3l;)V

    move-object v1, v3

    :goto_79
    iput-object v1, p0, Lo4l;->m:Lu3l;

    return-void

    :cond_7c
    invoke-static {}, Lh9o;->p()V

    throw v10

    :cond_80
    invoke-static {}, Lh9o;->p()V

    throw v10
.end method


# virtual methods
.method public final e(Landroid/view/Menu;)V
    .registers 11

    invoke-super {p0, p1}, Lie;->e(Landroid/view/Menu;)V

    iget-object v0, p0, Lie;->d:Ls9i;

    iget-object v1, v0, Ls9i;->d:Ljava/lang/Object;

    check-cast v1, Lpde;

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lqyi;

    sget-object v2, Loyi;->a:Loyi;

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    sget-object v3, Ly6l;->a:Ly6l;

    const/4 v4, 0x0

    iget-object v5, p0, Lie;->b:Lk6l;

    if-eqz v2, :cond_99

    sget-object v0, Lu3l;->a:Ls3l;

    new-instance v0, Lr3l;

    iget v1, p0, Lo4l;->l:I

    invoke-direct {v0, v1}, Lr3l;-><init>(I)V

    invoke-static {v5, v0, v3}, Lexg;->p(Lk6l;Lu3l;Lnxg;)Ljava/util/ArrayList;

    move-result-object v0

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v3

    move v5, v4

    :cond_33
    :goto_33
    iget-object v6, p0, Lo4l;->k:Lu3l;

    if-ge v5, v3, :cond_4a

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    add-int/lit8 v5, v5, 0x1

    move-object v8, v7

    check-cast v8, Lb2l;

    invoke-interface {v6, v8}, Lu3l;->a(Lb2l;)Z

    move-result v6

    if-eqz v6, :cond_33

    invoke-virtual {v2, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_33

    :cond_4a
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge v2, v0, :cond_5d

    new-instance v0, Lsd;

    invoke-direct {v0, v1}, Lsd;-><init>(I)V

    invoke-virtual {p0, p1, v0}, Lie;->a(Landroid/view/Menu;Lfe;)V

    goto :goto_62

    :cond_5d
    sget-object v0, Lce;->a:Lce;

    invoke-virtual {p0, p1, v0}, Lie;->a(Landroid/view/Menu;Lfe;)V

    :goto_62
    invoke-static {p1}, Lie;->c(Landroid/view/Menu;)V

    new-instance v0, Lrd;

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lrd;-><init>(IZ)V

    invoke-virtual {p0, p1, v0}, Lie;->a(Landroid/view/Menu;Lfe;)V

    new-instance v0, Lbe;

    invoke-direct {v0, v6}, Lbe;-><init>(Lu3l;)V

    invoke-virtual {p0, p1, v0}, Lie;->a(Landroid/view/Menu;Lfe;)V

    iget-object v0, p0, Lie;->f:Ljava/util/LinkedHashSet;

    invoke-static {v0}, Lexg;->g(Ljava/lang/Iterable;)Z

    move-result v1

    if-eqz v1, :cond_83

    sget-object v1, Lxd;->a:Lxd;

    invoke-virtual {p0, p1, v1}, Lie;->a(Landroid/view/Menu;Lfe;)V

    :cond_83
    invoke-static {v0}, Lexg;->i(Ljava/lang/Iterable;)Z

    move-result v0

    if-eqz v0, :cond_8e

    sget-object v0, Lee;->a:Lee;

    invoke-virtual {p0, p1, v0}, Lie;->a(Landroid/view/Menu;Lfe;)V

    :cond_8e
    new-instance v0, Lmd;

    sget-object v1, Lvr0;->j:Lvr0;

    invoke-direct {v0, v4, v1}, Lmd;-><init>(ZLvr0;)V

    invoke-virtual {p0, p1, v0}, Lie;->a(Landroid/view/Menu;Lfe;)V

    return-void

    :cond_99
    instance-of v1, v1, Lpyi;

    if-eqz v1, :cond_de

    iget-object v1, p0, Lo4l;->m:Lu3l;

    invoke-static {v5, v1, v3}, Lexg;->p(Lk6l;Lu3l;Lnxg;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v0, v2}, Ls9i;->X(Ljava/util/Collection;)Z

    move-result v3

    if-nez v3, :cond_b1

    new-instance v3, Lae;

    invoke-direct {v3, v1}, Lae;-><init>(Lu3l;)V

    invoke-virtual {p0, p1, v3}, Lie;->a(Landroid/view/Menu;Lfe;)V

    :cond_b1
    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_dd

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v3

    :cond_bb
    if-ge v4, v3, :cond_dd

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    add-int/lit8 v4, v4, 0x1

    check-cast v5, Lb2l;

    iget-object v6, v0, Ls9i;->c:Ljava/lang/Object;

    check-cast v6, Lpde;

    invoke-virtual {v6}, Lekc;->g()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/LinkedHashSet;

    invoke-virtual {v6, v5}, Ljava/util/AbstractCollection;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_bb

    new-instance v0, Lpd;

    invoke-direct {v0, v1}, Lpd;-><init>(Lu3l;)V

    invoke-virtual {p0, p1, v0}, Lie;->a(Landroid/view/Menu;Lfe;)V

    :cond_dd
    return-void

    :cond_de
    invoke-static {}, Lh9o;->p()V

    return-void
.end method
