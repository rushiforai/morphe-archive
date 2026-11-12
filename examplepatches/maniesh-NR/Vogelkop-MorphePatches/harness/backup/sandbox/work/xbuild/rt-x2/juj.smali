.class public final Ljuj;
.super Lltl;
.source "SourceFile"


# instance fields
.field public final r:Ljava/util/ArrayList;

.field public final s:Landroid/net/Uri;

.field public final t:Landroid/net/Uri;

.field public final u:Ldx3;

.field public final v:Lumi;

.field public final w:Lx5f;

.field public final x:I

.field public y:I

.field public z:I


# direct methods
.method public constructor <init>(Landroid/net/Uri;Landroid/net/Uri;Ldx3;Lumi;ZZLx5f;)V
    .registers 9

    const v0, 0x7f0d0424

    invoke-static {v0}, Lu7k;->j(I)Lu7k;

    move-result-object v0

    iget-object v0, v0, Lu7k;->a:Ljava/lang/Object;

    check-cast v0, Litl;

    invoke-direct {p0, v0}, Lltl;-><init>(Litl;)V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Ljuj;->r:Ljava/util/ArrayList;

    iput-object p1, p0, Ljuj;->s:Landroid/net/Uri;

    iput-object p2, p0, Ljuj;->t:Landroid/net/Uri;

    iput-object p3, p0, Ljuj;->u:Ldx3;

    iput-object p4, p0, Ljuj;->v:Lumi;

    iput-object p7, p0, Ljuj;->w:Lx5f;

    if-eqz p6, :cond_27

    const p1, 0x7f0d03b0

    iput p1, p0, Ljuj;->x:I

    return-void

    :cond_27
    if-eqz p5, :cond_2f

    const p1, 0x7f0d03ae

    iput p1, p0, Ljuj;->x:I

    return-void

    :cond_2f
    const p1, 0x7f0d03af

    iput p1, p0, Ljuj;->x:I

    return-void
.end method


# virtual methods
.method public final synthetic G0(Z)V
    .registers 2

    invoke-super {p0, p1}, Lk24;->l0(Z)V

    return-void
.end method

.method public final l0(Z)V
    .registers 5

    iget v0, p0, Ljuj;->y:I

    if-lez v0, :cond_8

    invoke-super {p0, p1}, Lk24;->l0(Z)V

    return-void

    :cond_8
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lsfe;->U(Landroid/content/Context;)Lz77;

    move-result-object v0

    new-instance v1, Lvw;

    const/16 v2, 0xd

    invoke-direct {v1, v2, p0, p1}, Lvw;-><init>(BLjava/lang/Object;Z)V

    new-instance p0, Lrxh;

    const p1, 0x7f14114a

    invoke-direct {p0, p1}, Lrxh;-><init>(I)V

    new-instance p1, Lgkj;

    const/4 v2, 0x0

    invoke-direct {p1, v2, v2}, Lnz0;-><init>(ZZ)V

    const/4 v2, 0x0

    iput-object v2, p1, Lgkj;->a:Ljava/lang/String;

    iput-object v2, p1, Lgkj;->b:Ljava/lang/String;

    iput-object v2, p1, Lgkj;->c:Ljava/lang/String;

    iput-object v2, p1, Lgkj;->d:Ljava/lang/CharSequence;

    iput-object v2, p1, Lgkj;->e:Lekj;

    iput-object v2, p1, Lgkj;->f:Lfkj;

    iput-object v2, p1, Lgkj;->g:Lqp2;

    iput-object v1, p1, Lgkj;->h:Ldkj;

    iput-object v2, p1, Lgkj;->i:Ldkj;

    iput-object v2, p1, Lgkj;->j:Lql;

    const v1, 0x7f140587

    iput v1, p1, Lgkj;->k:I

    const v1, 0x7f1403bf

    iput v1, p1, Lgkj;->l:I

    const v1, 0x7f141149

    iput v1, p1, Lgkj;->m:I

    const/4 v1, 0x1

    iput-boolean v1, p1, Lgkj;->n:Z

    iput-object p0, p1, Lgkj;->o:Lpxh;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p0, Lijm;->b:Lijm;

    invoke-virtual {v0, p1, p0}, Lr22;->b(Ljjm;Lijm;)V

    return-void
.end method

.method public final onDestroy()V
    .registers 11

    invoke-super {p0}, Lryl;->onDestroy()V

    iget v0, p0, Ljuj;->y:I

    iget v1, p0, Ljuj;->z:I

    iget-object v2, p0, Ljuj;->w:Lx5f;

    iget-boolean v3, v2, Lx5f;->h:Z

    if-nez v3, :cond_e

    return-void

    :cond_e
    iget-object v3, v2, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v4

    invoke-virtual {v4, v3}, Lx56;->B(Lzpa;)Lqd0;

    move-result-object v5

    invoke-virtual {v5, v3}, Lqd0;->x(Lzpa;)Lxb0;

    move-result-object v3

    new-instance v5, Lgq0;

    const/4 v6, -0x1

    const/4 v7, 0x3

    const/16 v8, 0x98b

    invoke-direct {v5, v8, v6, v7}, Ljf0;-><init>(III)V

    iget-object p0, p0, Ljuj;->r:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v6

    const/4 v7, 0x1

    if-nez v6, :cond_32

    const/4 v6, 0x2

    invoke-virtual {v5, v6, v7, p0}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_32
    int-to-long v8, v0

    invoke-virtual {v5, v7, v7, v8, v9}, Ljf0;->p(IIJ)V

    const/4 p0, 0x0

    int-to-long v0, v1

    invoke-virtual {v5, p0, v7, v0, v1}, Ljf0;->p(IIJ)V

    const/16 p0, 0x14

    invoke-virtual {v3, p0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    if-eqz v0, :cond_51

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_51

    new-instance v1, Lhf0;

    invoke-direct {v1, v3, p0, v0}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_5a

    :cond_51
    invoke-static {v3, p0, v7}, Lam2;->q(Lxb0;II)Ljava/util/ArrayList;

    move-result-object v0

    new-instance v1, Lhf0;

    invoke-direct {v1, v3, p0, v0}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_5a
    invoke-virtual {v1, v5}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v2, v4}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final s0()I
    .registers 1

    const p0, 0x7f14044d

    return p0
.end method

.method public final t0(Landroid/content/Context;)I
    .registers 2

    const p0, 0x7f080522

    return p0
.end method

.method public final y0(Landroid/view/LayoutInflater;Lcom/opera/android/StatusBarDrawingFrameLayout;)V
    .registers 6

    const v0, 0x7f0a0269

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/view/ViewGroup;

    iget v0, p0, Ljuj;->x:I

    const/4 v1, 0x1

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    sget-object p2, Lr5n;->a:Ljava/util/WeakHashMap;

    const p2, 0x7f0a0a93

    invoke-static {p1, p2}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/view/View;

    check-cast p2, Landroid/widget/ImageView;

    sget-object v0, Lyne;->b:Ldeg;

    iget-object v1, p0, Ljuj;->t:Landroid/net/Uri;

    invoke-virtual {v0, v1}, Ldeg;->f(Landroid/net/Uri;)V

    invoke-virtual {v0, v1}, Ldeg;->g(Landroid/net/Uri;)Ldwh;

    move-result-object v0

    const/4 v2, 0x0

    invoke-virtual {v0, p2, v2}, Ldwh;->g(Landroid/widget/ImageView;Ld94;)V

    const p2, 0x7f0a0a97

    invoke-static {p1, p2}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/view/View;

    check-cast p2, Landroid/widget/Button;

    invoke-static {v1}, Ls29;->g(Landroid/net/Uri;)Z

    move-result v0

    if-eqz v0, :cond_4a

    new-instance v0, Ljava/io/File;

    invoke-virtual {v1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Lw7d;->x(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v1

    :cond_4a
    new-instance v0, Lj5g;

    const/16 v2, 0x11

    invoke-direct {v0, p0, v1, v2}, Lj5g;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p2, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const p2, 0x7f0a0a96

    invoke-static {p1, p2}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    check-cast p1, Landroid/widget/Button;

    new-instance p2, Lh4i;

    const/16 v0, 0xb

    invoke-direct {p2, p0, v0}, Lh4i;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method
