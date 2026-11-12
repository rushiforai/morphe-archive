.class public final Llte;
.super Ly0j;
.source "SourceFile"


# instance fields
.field public final synthetic c:B

.field public final synthetic d:Ljava/lang/Object;

.field public final synthetic e:Lndc;


# direct methods
.method public synthetic constructor <init>(Lndc;Ljava/lang/Object;B)V
    .registers 4

    iput-byte p3, p0, Llte;->c:B

    iput-object p2, p0, Llte;->d:Ljava/lang/Object;

    iput-object p1, p0, Llte;->e:Lndc;

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Ly0j;-><init>(I)V

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .registers 8

    iget-byte p1, p0, Llte;->c:B

    iget-object v0, p0, Llte;->d:Ljava/lang/Object;

    iget-object p0, p0, Llte;->e:Lndc;

    packed-switch p1, :pswitch_data_ee

    :try_start_9
    check-cast p0, Liji;

    iget-object p0, p0, Liji;->c:Ldx3;

    check-cast v0, Landroid/content/Intent;

    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_12
    .catch Landroid/content/ActivityNotFoundException; {:try_start_9 .. :try_end_12} :catch_12

    :catch_12
    return-void

    :pswitch_13
    check-cast v0, Lwii;

    check-cast p0, Liji;

    const-string p1, "android.permission.WRITE_EXTERNAL_STORAGE"

    const/4 v1, 0x2

    if-eqz v0, :cond_a2

    new-instance v2, Lvii;

    const/4 v3, 0x1

    invoke-direct {v2, p0, v3}, Lvii;-><init>(Liji;B)V

    iget-byte p0, v0, Lwii;->a:B

    packed-switch p0, :pswitch_data_f6

    iget-object p0, v0, Lwii;->b:Liji;

    invoke-virtual {p0}, Liji;->E()V

    new-instance v0, Lwii;

    invoke-direct {v0, p0, v3}, Lwii;-><init>(Liji;B)V

    invoke-virtual {p0, v0}, Liji;->j(Lwii;)V

    invoke-virtual {p0}, Liji;->p()Ljava/lang/String;

    move-result-object v0

    iget-object p0, p0, Liji;->e:Lfji;

    invoke-interface {p0}, Lfji;->d()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    iget-object v0, v2, Lvii;->b:Liji;

    iget-object v2, v0, Liji;->c:Ldx3;

    new-instance v3, Lw8d;

    invoke-direct {v3, v1, v0, p0}, Lw8d;-><init>(BLjava/lang/Object;Z)V

    sget-object p0, Llg7;->a:[[I

    invoke-static {v2}, Lr9n;->X(Landroid/content/Context;)Z

    move-result p0

    if-eqz p0, :cond_59

    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v3, p0}, Lw8d;->run(Ljava/lang/Object;)V

    goto :goto_c2

    :cond_59
    iget-object p0, v2, Ldx3;->j:Lqi;

    new-instance v0, Ldz4;

    invoke-direct {v0, v3}, Ldz4;-><init>(Lcom/opera/api/Callback;)V

    invoke-static {p0, p1, v0}, Lf03;->U(Lorg/chromium/ui/base/WindowAndroid;Ljava/lang/String;Lbag;)V

    goto :goto_c2

    :pswitch_64
    iget-object p0, v0, Lwii;->b:Liji;

    invoke-virtual {p0}, Liji;->F()V

    invoke-virtual {p0}, Liji;->p()Ljava/lang/String;

    move-result-object p1

    iget-object v0, p0, Liji;->e:Lfji;

    invoke-interface {v0}, Lfji;->d()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_9c

    iget-object p1, p0, Liji;->c:Ldx3;

    iget-object v0, p0, Liji;->p:Landroid/net/Uri;

    invoke-virtual {p0}, Liji;->p()Ljava/lang/String;

    move-result-object v3

    sget-object v4, Lvml;->d:Lumi;

    new-instance v5, Lvdi;

    invoke-direct {v5, p1, v0, v3, v1}, Lvdi;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v4, v5}, Lumi;->e(Ln5o;)Lnml;

    move-result-object p1

    new-instance v0, Lmgf;

    const/16 v1, 0x16

    invoke-direct {v0, p0, v2, v1}, Lmgf;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p1, v0}, Lnml;->c(Ln5o;)Loml;

    move-result-object p0

    const/4 p1, 0x0

    invoke-virtual {p0, p1, p1}, Loml;->a(Ljava/lang/Object;Ljri;)V

    goto :goto_c2

    :cond_9c
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v2, p0}, Lvii;->run(Ljava/lang/Object;)V

    goto :goto_c2

    :cond_a2
    iget-object v0, p0, Liji;->c:Ldx3;

    new-instance v2, Lw8d;

    const/4 v3, 0x0

    invoke-direct {v2, v1, p0, v3}, Lw8d;-><init>(BLjava/lang/Object;Z)V

    sget-object p0, Llg7;->a:[[I

    invoke-static {v0}, Lr9n;->X(Landroid/content/Context;)Z

    move-result p0

    if-eqz p0, :cond_b8

    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v2, p0}, Lw8d;->run(Ljava/lang/Object;)V

    goto :goto_c2

    :cond_b8
    iget-object p0, v0, Ldx3;->j:Lqi;

    new-instance v0, Ldz4;

    invoke-direct {v0, v2}, Ldz4;-><init>(Lcom/opera/api/Callback;)V

    invoke-static {p0, p1, v0}, Lf03;->U(Lorg/chromium/ui/base/WindowAndroid;Ljava/lang/String;Lbag;)V

    :goto_c2
    return-void

    :pswitch_c3
    check-cast p0, Lpte;

    invoke-static {p0}, Lvtp;->M(Landroidx/fragment/app/Fragment;)Z

    move-result p1

    if-nez p1, :cond_ed

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object p1

    invoke-static {p1}, Lsfe;->U(Landroid/content/Context;)Lz77;

    move-result-object p1

    check-cast v0, Ljava/lang/String;

    iget-object p0, p0, Lpte;->A:Lp85;

    iget-object p0, p0, Lp85;->j:Landroid/view/View;

    check-cast p0, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-object p0, p0, Lcom/opera/android/ui/catalog/widget/OperaListItem;->A:Lbpd;

    invoke-virtual {p0}, Lbpd;->D()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lnrf;->l0(Ljava/lang/String;Ljava/lang/String;)Ltim;

    move-result-object p0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, Lijm;->b:Lijm;

    invoke-virtual {p1, p0, v0}, Lr22;->b(Ljjm;Lijm;)V

    :cond_ed
    return-void

    :pswitch_data_ee
    .packed-switch 0x0
        :pswitch_c3
        :pswitch_13
    .end packed-switch

    :pswitch_data_f6
    .packed-switch 0x0
        :pswitch_64
    .end packed-switch
.end method
