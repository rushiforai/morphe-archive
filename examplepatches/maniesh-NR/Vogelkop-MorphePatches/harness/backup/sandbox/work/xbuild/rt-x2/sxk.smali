.class public final synthetic Lsxk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Luxk;


# direct methods
.method public synthetic constructor <init>(Luxk;B)V
    .registers 3

    iput-byte p2, p0, Lsxk;->a:B

    iput-object p1, p0, Lsxk;->b:Luxk;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 8

    iget-byte v0, p0, Lsxk;->a:B

    const/4 v1, 0x2

    sget-object v2, Lijm;->b:Lijm;

    const/4 v3, 0x0

    const/4 v4, 0x1

    iget-object p0, p0, Lsxk;->b:Luxk;

    packed-switch v0, :pswitch_data_182

    sget-object p1, Luxk;->w:[Lxtb;

    invoke-virtual {p0}, Luxk;->I0()Ldyk;

    move-result-object p0

    iget-object p1, p0, Ldyk;->m:Lsom;

    iput-boolean v4, p1, Lsom;->j:Z

    iget-object p0, p0, Ldyk;->e:Lzxk;

    invoke-virtual {p0}, Lzxk;->b()V

    return-void

    :pswitch_1c
    sget-object v0, Luxk;->w:[Lxtb;

    invoke-virtual {p0}, Luxk;->I0()Ldyk;

    move-result-object p0

    iget-object v0, p0, Ldyk;->j:Lkxk;

    iget-object v3, p0, Ldyk;->i:Lzwk;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Lzwk;->h()Z

    move-result v3

    if-nez v3, :cond_5a

    iget-object p0, p0, Ldyk;->f:Ldb;

    invoke-virtual {p0}, Ldb;->b()Ljh0;

    move-result-object p0

    sget-object v3, Ljh0;->d:Ljh0;

    if-eq p0, v3, :cond_5a

    new-instance p0, Lthk;

    const/4 p1, 0x4

    invoke-direct {p0, p1}, Lthk;-><init>(B)V

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p1, La06;

    invoke-direct {p1}, La06;-><init>()V

    new-instance v2, Lkoj;

    invoke-direct {v2, p0, v1}, Lkoj;-><init>(Ljava/lang/Object;B)V

    iput-object v2, p1, La06;->u:Ljava/lang/Runnable;

    const/16 p0, 0x1003

    invoke-static {p1, p0}, Lzhj;->a(Lryl;I)Lzhj;

    move-result-object p0

    iget-object p1, v0, Lkxk;->e:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p0, p1}, Lzhj;->c(Landroid/content/Context;)V

    goto :goto_80

    :cond_5a
    iget-object p0, v0, Lkxk;->g:Ldu3;

    invoke-virtual {p0}, Ldu3;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lqim;

    iget-object p0, p0, Lqim;->d:Lnej;

    iget-object v0, v0, Lkxk;->d:Lwv1;

    iget-object v0, v0, Lwv1;->b:Lb6h;

    invoke-interface {v0}, Lvtb;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lzwk;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Lzwk;->h()Z

    move-result v0

    new-instance v1, Lwwk;

    invoke-direct {v1, p1, v0}, Lwwk;-><init>(Landroid/view/View;Z)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p0, v1, v2}, Lr22;->b(Ljjm;Lijm;)V

    :goto_80
    return-void

    :pswitch_81
    sget-object p1, Luxk;->w:[Lxtb;

    invoke-virtual {p0}, Luxk;->I0()Ldyk;

    move-result-object p0

    iget-object p0, p0, Ldyk;->j:Lkxk;

    iget-object p0, p0, Lkxk;->e:Lcom/opera/android/BrowserActivity;

    invoke-static {p0}, Lna2;->T(Landroid/content/Context;)V

    return-void

    :pswitch_8f
    sget-object p1, Luxk;->w:[Lxtb;

    invoke-virtual {p0}, Luxk;->I0()Ldyk;

    move-result-object p0

    iget-object p1, p0, Ldyk;->j:Lkxk;

    new-instance v0, Ldnj;

    const/16 v1, 0x16

    invoke-direct {v0, p0, v1}, Ldnj;-><init>(Ljava/lang/Object;B)V

    iget-object p0, p1, Lkxk;->e:Lcom/opera/android/BrowserActivity;

    iget-object p1, p1, Lkxk;->d:Lwv1;

    iget-object p1, p1, Lwv1;->b:Lb6h;

    invoke-interface {p1}, Lvtb;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lzwk;

    new-instance v1, Ll31;

    const/4 v2, 0x5

    invoke-direct {v1, v0, v2}, Ll31;-><init>(Lkotlin/jvm/functions/Function0;B)V

    invoke-static {p0, p1, v1, v3}, Lxih;->y(Landroid/content/Context;Lzwk;Ljava/lang/Runnable;Ll31;)V

    return-void

    :pswitch_b4
    sget-object p1, Luxk;->w:[Lxtb;

    invoke-virtual {p0}, Luxk;->I0()Ldyk;

    move-result-object p0

    iget-object p0, p0, Ldyk;->j:Lkxk;

    iget-object p1, p0, Lkxk;->e:Lcom/opera/android/BrowserActivity;

    iget-object v0, p0, Lkxk;->a:Lji;

    invoke-virtual {v0}, Lji;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ldb;

    invoke-virtual {v0}, Ldb;->c()Ljava/lang/String;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    const v5, 0x7f14121b

    invoke-virtual {p1, v5, v0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_dd

    new-instance v0, Lqxh;

    invoke-direct {v0, p1}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    goto :goto_de

    :cond_dd
    move-object v0, v3

    :goto_de
    new-instance p1, Ljxk;

    invoke-direct {p1, p0, v1}, Ljxk;-><init>(Lkxk;B)V

    iget-object p0, p0, Lkxk;->g:Ldu3;

    invoke-virtual {p0}, Ldu3;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lqim;

    iget-object p0, p0, Lqim;->c:Lz77;

    new-instance v1, Lgkj;

    const/4 v5, 0x0

    invoke-direct {v1, v5, v5}, Lnz0;-><init>(ZZ)V

    iput-object v3, v1, Lgkj;->a:Ljava/lang/String;

    iput-object v3, v1, Lgkj;->b:Ljava/lang/String;

    iput-object v3, v1, Lgkj;->c:Ljava/lang/String;

    iput-object v3, v1, Lgkj;->d:Ljava/lang/CharSequence;

    iput-object v3, v1, Lgkj;->e:Lekj;

    iput-object v3, v1, Lgkj;->f:Lfkj;

    iput-object v3, v1, Lgkj;->g:Lqp2;

    iput-object p1, v1, Lgkj;->h:Ldkj;

    iput-object v3, v1, Lgkj;->i:Ldkj;

    iput-object v3, v1, Lgkj;->j:Lql;

    const p1, 0x7f14121a

    iput p1, v1, Lgkj;->k:I

    const p1, 0x7f1403bf

    iput p1, v1, Lgkj;->l:I

    iput v5, v1, Lgkj;->m:I

    iput-boolean v4, v1, Lgkj;->n:Z

    iput-object v0, v1, Lgkj;->o:Lpxh;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p0, v1, v2}, Lr22;->b(Ljjm;Lijm;)V

    return-void

    :pswitch_11e
    sget-object p1, Luxk;->w:[Lxtb;

    invoke-virtual {p0}, Luxk;->I0()Ldyk;

    move-result-object p0

    iget-object p0, p0, Ldyk;->j:Lkxk;

    iget-object p1, p0, Lkxk;->f:Landroidx/fragment/app/w;

    iget-object p0, p0, Lkxk;->a:Lji;

    invoke-virtual {p0}, Lji;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ldb;

    invoke-static {p1, p0, v3, v4}, Lxih;->w(Landroidx/fragment/app/w;Ldb;Lfv2;Z)V

    return-void

    :pswitch_134
    sget-object p1, Luxk;->w:[Lxtb;

    invoke-virtual {p0}, Luxk;->I0()Ldyk;

    move-result-object p0

    iget-object p0, p0, Ldyk;->j:Lkxk;

    iget-object p1, p0, Lkxk;->f:Landroidx/fragment/app/w;

    iget-object p0, p0, Lkxk;->a:Lji;

    invoke-virtual {p0}, Lji;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ldb;

    invoke-static {p1, p0, v3, v4}, Lxih;->w(Landroidx/fragment/app/w;Ldb;Lfv2;Z)V

    return-void

    :pswitch_14a
    sget-object p1, Luxk;->w:[Lxtb;

    invoke-virtual {p0}, Luxk;->I0()Ldyk;

    move-result-object p0

    iget-object p1, p0, Ldyk;->n:Lode;

    invoke-virtual {p1}, Lekc;->g()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcyk;

    instance-of v0, p1, Lbyk;

    if-eqz v0, :cond_17d

    iget-object v0, p0, Ldyk;->j:Lkxk;

    check-cast p1, Lbyk;

    new-instance v1, Lu7k;

    invoke-direct {v1, p0}, Lu7k;-><init>(Ljava/lang/Object;)V

    iget-object p0, v0, Lkxk;->g:Ldu3;

    invoke-virtual {p0}, Ldu3;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lqim;

    iget-object p0, p0, Lqim;->d:Lnej;

    new-instance v0, Lxq3;

    const/16 v3, 0xc

    invoke-direct {v0, p1, v1, v3}, Lxq3;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p0, v0, v2}, Lr22;->b(Ljjm;Lijm;)V

    goto :goto_180

    :cond_17d
    invoke-virtual {p0}, Ldyk;->g()V

    :goto_180
    return-void

    nop

    :pswitch_data_182
    .packed-switch 0x0
        :pswitch_14a
        :pswitch_134
        :pswitch_11e
        :pswitch_b4
        :pswitch_8f
        :pswitch_81
        :pswitch_1c
    .end packed-switch
.end method
