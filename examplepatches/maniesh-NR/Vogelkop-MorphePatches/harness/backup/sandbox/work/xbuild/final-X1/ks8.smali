.class public final Lks8;
.super Ly0j;
.source "SourceFile"


# instance fields
.field public final synthetic c:B

.field public final synthetic d:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lks8;->c:B

    iput-object p1, p0, Lks8;->d:Ljava/lang/Object;

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Ly0j;-><init>(I)V

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .registers 6

    iget-byte v0, p0, Lks8;->c:B

    iget-object p0, p0, Lks8;->d:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_c0

    check-cast p0, Landroid/view/View$OnClickListener;

    invoke-interface {p0, p1}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    return-void

    :pswitch_d
    new-instance p1, Lrld;

    check-cast p0, Lgld;

    iget-object v0, p0, Lgld;->D:Lyn4;

    invoke-direct {p1, v0}, Lrld;-><init>(Lyn4;)V

    const/16 v0, 0x1003

    invoke-static {p1, v0}, Lzhj;->a(Lryl;I)Lzhj;

    move-result-object p1

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {p1, p0}, Lzhj;->c(Landroid/content/Context;)V

    return-void

    :pswitch_24
    check-cast p0, Lls8;

    iget-object p1, p0, Lfs8;->f:Lhq8;

    if-eqz p1, :cond_be

    iget-object p1, p0, Les8;->d:Lns8;

    if-eqz p1, :cond_be

    invoke-virtual {p0}, Lfs8;->Y()Lcom/opera/android/favorites/e;

    move-result-object v0

    iget-object p0, p0, Lfs8;->f:Lhq8;

    invoke-virtual {p1, v0, p0}, Lns8;->M(Lcom/opera/android/favorites/e;Lhq8;)V

    iget-object v0, p1, Lns8;->z:Lp6l;

    sget-object v1, Lp6l;->a:Lp6l;

    invoke-virtual {p0, v1}, Lhq8;->i(Lp6l;)Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lhk6;->e:La36;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v1}, La36;->s(Ljava/lang/String;)Lhk6;

    move-result-object v1

    const/4 v2, 0x1

    if-nez v1, :cond_4d

    move v1, v2

    goto :goto_53

    :cond_4d
    iget-object v3, p1, Lns8;->u:Lnv2;

    invoke-virtual {v3, v1}, Lnv2;->a(Lhk6;)Z

    move-result v1

    :goto_53
    const/4 v3, 0x0

    if-nez v1, :cond_98

    new-instance p0, Lrxh;

    const v0, 0x7f140586

    invoke-direct {p0, v0}, Lrxh;-><init>(I)V

    iget-object p1, p1, Lns8;->e:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lsfe;->U(Landroid/content/Context;)Lz77;

    move-result-object p1

    new-instance v0, Lgkj;

    invoke-direct {v0, v3, v3}, Lnz0;-><init>(ZZ)V

    const/4 v1, 0x0

    iput-object v1, v0, Lgkj;->a:Ljava/lang/String;

    iput-object v1, v0, Lgkj;->b:Ljava/lang/String;

    iput-object v1, v0, Lgkj;->c:Ljava/lang/String;

    iput-object v1, v0, Lgkj;->d:Ljava/lang/CharSequence;

    iput-object v1, v0, Lgkj;->e:Lekj;

    iput-object v1, v0, Lgkj;->f:Lfkj;

    iput-object v1, v0, Lgkj;->g:Lqp2;

    iput-object v1, v0, Lgkj;->h:Ldkj;

    iput-object v1, v0, Lgkj;->i:Ldkj;

    iput-object v1, v0, Lgkj;->j:Lql;

    iput v3, v0, Lgkj;->k:I

    const v1, 0x7f140812

    iput v1, v0, Lgkj;->l:I

    iput v3, v0, Lgkj;->m:I

    iput-boolean v2, v0, Lgkj;->n:Z

    iput-object p0, v0, Lgkj;->o:Lpxh;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p0, Lijm;->b:Lijm;

    invoke-virtual {p1, v0, p0}, Lr22;->b(Ljjm;Lijm;)V

    goto :goto_be

    :cond_98
    iget-object p1, p0, Lhq8;->b:Ltq8;

    instance-of p1, p1, Lydh;

    if-eqz p1, :cond_a1

    sget-object p1, Llqm;->G:Llqm;

    goto :goto_a3

    :cond_a1
    sget-object p1, Llqm;->f:Llqm;

    :goto_a3
    invoke-virtual {p0, v0}, Lhq8;->i(Lp6l;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lz5i;->a0(Ljava/lang/String;)Z

    move-result v1

    invoke-virtual {p0, v0}, Lhq8;->i(Lp6l;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0, p1, v3}, Lay3;->a(Ljava/lang/String;Llqm;Z)Lvx3;

    move-result-object p0

    iput v2, p0, Lvx3;->c:I

    sget-object p1, Lwx3;->Go:Lulp;

    iput-object p1, p0, Lvx3;->k:Lwx3;

    iput-boolean v1, p0, Lvx3;->q:Z

    invoke-static {p0}, Lam2;->v(Lvx3;)V

    :cond_be
    :goto_be
    return-void

    nop

    :pswitch_data_c0
    .packed-switch 0x0
        :pswitch_24
        :pswitch_d
    .end packed-switch
.end method
