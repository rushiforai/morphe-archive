.class public final Lfn3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lywk;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lfn3;->a:B

    iput-object p1, p0, Lfn3;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final G(I)V
    .registers 8

    iget-byte v0, p0, Lfn3;->a:B

    const/4 v1, 0x0

    const/4 v2, 0x6

    const/4 v3, 0x2

    iget-object v4, p0, Lfn3;->b:Ljava/lang/Object;

    const/4 v5, 0x1

    packed-switch v0, :pswitch_data_88

    check-cast v4, Lt6g;

    iget-object p0, v4, Lt6g;->r:Lkze;

    if-eqz p1, :cond_4b

    if-eq p1, v5, :cond_4b

    if-eq p1, v3, :cond_4b

    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {p0, v0}, Lekc;->r(Ljava/lang/Object;)V

    if-ne p1, v2, :cond_50

    iget-boolean p0, v4, Lt6g;->q:Z

    if-nez p0, :cond_50

    iput-boolean v5, v4, Lt6g;->q:Z

    iget-object p0, v4, Lt6g;->k:Lorm;

    sget-object p1, Lgm0;->m:Lgm0;

    check-cast p0, Lx5f;

    invoke-virtual {p0, p1}, Lx5f;->l0(Lgm0;)V

    iget-object p0, v4, Lt6g;->j:Lhxk;

    new-instance p1, Ls6g;

    const/4 v0, 0x4

    invoke-direct {p1, v4, v0}, Ls6g;-><init>(Lt6g;B)V

    check-cast p0, Lkxk;

    iget-object v0, p0, Lkxk;->e:Lcom/opera/android/BrowserActivity;

    iget-object p0, p0, Lkxk;->d:Lwv1;

    iget-object p0, p0, Lwv1;->b:Lb6h;

    invoke-interface {p0}, Lvtb;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lzwk;

    new-instance v2, Ll31;

    const/4 v3, 0x5

    invoke-direct {v2, p1, v3}, Ll31;-><init>(Lkotlin/jvm/functions/Function0;B)V

    invoke-static {v0, p0, v2, v1}, Lxih;->y(Landroid/content/Context;Lzwk;Ljava/lang/Runnable;Ll31;)V

    goto :goto_50

    :cond_4b
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {p0, p1}, Lekc;->r(Ljava/lang/Object;)V

    :cond_50
    :goto_50
    return-void

    :pswitch_51
    check-cast v4, Lgn3;

    iget-object v0, v4, Lgn3;->h:Lzwk;

    if-eqz p1, :cond_7e

    if-eq p1, v5, :cond_7e

    if-eq p1, v3, :cond_7e

    if-ne p1, v2, :cond_73

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Lzwk;->i()Z

    move-result p1

    if-eqz p1, :cond_87

    iget-object p1, v4, Lgn3;->p:Landroidx/fragment/app/r;

    new-instance v2, Lfv2;

    const/16 v3, 0xf

    invoke-direct {v2, p0, v3}, Lfv2;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1, v0, v2, v1}, Lxih;->y(Landroid/content/Context;Lzwk;Ljava/lang/Runnable;Ll31;)V

    goto :goto_87

    :cond_73
    iget-boolean p0, v4, Lgn3;->L:Z

    if-eqz p0, :cond_87

    const/4 p0, 0x0

    iput-boolean p0, v4, Lgn3;->L:Z

    invoke-virtual {v4}, Lgn3;->u()V

    goto :goto_87

    :cond_7e
    iget-boolean p0, v4, Lgn3;->L:Z

    if-nez p0, :cond_87

    iput-boolean v5, v4, Lgn3;->L:Z

    invoke-virtual {v4}, Lgn3;->u()V

    :cond_87
    :goto_87
    return-void

    :pswitch_data_88
    .packed-switch 0x0
        :pswitch_51
    .end packed-switch
.end method

.method public final c0()V
    .registers 10

    iget-byte v0, p0, Lfn3;->a:B

    sget-object v1, Leb0;->c:Leb0;

    sget-object v2, Leb0;->b:Leb0;

    iget-object v3, p0, Lfn3;->b:Ljava/lang/Object;

    const/4 v4, 0x0

    const/4 v5, 0x1

    packed-switch v0, :pswitch_data_fc

    check-cast v3, Lt6g;

    iget-object p0, v3, Lt6g;->r:Lkze;

    iget-object v0, v3, Lt6g;->k:Lorm;

    iget-object v3, v3, Lt6g;->i:Lzwk;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Lzwk;->f()Z

    move-result v6

    if-eqz v6, :cond_93

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v6, 0x3

    invoke-static {v6}, Lzwk;->c(I)Z

    move-result v7

    if-eqz v7, :cond_8e

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v7, Lcak;->d:Lavj;

    invoke-static {v5}, Lavj;->b(I)Z

    move-result v7

    if-eqz v7, :cond_39

    invoke-static {v6}, Lzwk;->c(I)Z

    move-result v7

    if-nez v7, :cond_3b

    :cond_39
    move v7, v4

    goto :goto_3f

    :cond_3b
    invoke-static {v6}, LJ/N;->MnqdMkOU(I)Z

    move-result v7

    :goto_3f
    if-eqz v7, :cond_93

    sget-object v7, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {p0, v7}, Lekc;->r(Ljava/lang/Object;)V

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v5}, Lavj;->b(I)Z

    move-result p0

    if-nez p0, :cond_51

    move p0, v4

    goto :goto_55

    :cond_51
    invoke-static {v6}, LJ/N;->M_kS3iaM(I)Z

    move-result p0

    :goto_55
    if-eqz p0, :cond_6b

    sget-object p0, Lgm0;->p:Lgm0;

    move-object v5, v0

    check-cast v5, Lx5f;

    invoke-virtual {v5, p0}, Lx5f;->l0(Lgm0;)V

    sget-object p0, Lw2b;->d:Lw2b;

    sget-object v5, Lc3b;->d:Lc3b;

    sget-object v7, Lv2b;->c:Lv2b;

    move-object v8, v0

    check-cast v8, Lx5f;

    invoke-virtual {v8, p0, v5, v7, v2}, Lx5f;->I(Lw2b;Lc3b;Lv2b;Leb0;)V

    :cond_6b
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v6}, Lzwk;->c(I)Z

    move-result p0

    if-eqz p0, :cond_78

    invoke-static {v6}, LJ/N;->MwNBJ0s3(I)Z

    move-result v4

    :cond_78
    if-eqz v4, :cond_93

    sget-object p0, Lgm0;->q:Lgm0;

    move-object v2, v0

    check-cast v2, Lx5f;

    invoke-virtual {v2, p0}, Lx5f;->l0(Lgm0;)V

    sget-object p0, Lw2b;->d:Lw2b;

    sget-object v2, Lc3b;->d:Lc3b;

    sget-object v3, Lv2b;->c:Lv2b;

    check-cast v0, Lx5f;

    invoke-virtual {v0, p0, v2, v3, v1}, Lx5f;->I(Lw2b;Lc3b;Lv2b;Leb0;)V

    goto :goto_93

    :cond_8e
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {p0, v0}, Lekc;->r(Ljava/lang/Object;)V

    :cond_93
    :goto_93
    return-void

    :pswitch_94
    check-cast v3, Lgn3;

    iget-object v0, v3, Lgn3;->g:Lx5f;

    iget-object v6, v3, Lgn3;->h:Lzwk;

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v7, Lcak;->d:Lavj;

    invoke-static {v5}, Lavj;->b(I)Z

    move-result v7

    if-eqz v7, :cond_ab

    invoke-static {v5}, Lzwk;->c(I)Z

    move-result v7

    if-nez v7, :cond_ad

    :cond_ab
    move v7, v4

    goto :goto_b1

    :cond_ad
    invoke-static {v5}, LJ/N;->MnqdMkOU(I)Z

    move-result v7

    :goto_b1
    if-eqz v7, :cond_fb

    iget-boolean v7, v3, Lgn3;->L:Z

    if-eqz v7, :cond_bc

    iput-boolean v4, v3, Lgn3;->L:Z

    invoke-virtual {v3}, Lgn3;->u()V

    :cond_bc
    invoke-virtual {v6, p0}, Lzwk;->j(Lywk;)V

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v5}, Lavj;->b(I)Z

    move-result p0

    if-nez p0, :cond_ca

    move p0, v4

    goto :goto_ce

    :cond_ca
    invoke-static {v5}, LJ/N;->M_kS3iaM(I)Z

    move-result p0

    :goto_ce
    if-eqz p0, :cond_de

    sget-object p0, Lz80;->j:Lz80;

    invoke-virtual {v0, p0}, Lx5f;->X(Lz80;)V

    sget-object p0, Lw2b;->c:Lw2b;

    sget-object v3, Lc3b;->d:Lc3b;

    sget-object v7, Lv2b;->b:Lv2b;

    invoke-virtual {v0, p0, v3, v7, v2}, Lx5f;->I(Lw2b;Lc3b;Lv2b;Leb0;)V

    :cond_de
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v5}, Lzwk;->c(I)Z

    move-result p0

    if-eqz p0, :cond_eb

    invoke-static {v5}, LJ/N;->MwNBJ0s3(I)Z

    move-result v4

    :cond_eb
    if-eqz v4, :cond_fb

    sget-object p0, Lz80;->k:Lz80;

    invoke-virtual {v0, p0}, Lx5f;->X(Lz80;)V

    sget-object p0, Lw2b;->c:Lw2b;

    sget-object v2, Lc3b;->d:Lc3b;

    sget-object v3, Lv2b;->b:Lv2b;

    invoke-virtual {v0, p0, v2, v3, v1}, Lx5f;->I(Lw2b;Lc3b;Lv2b;Leb0;)V

    :cond_fb
    return-void

    :pswitch_data_fc
    .packed-switch 0x0
        :pswitch_94
    .end packed-switch
.end method
