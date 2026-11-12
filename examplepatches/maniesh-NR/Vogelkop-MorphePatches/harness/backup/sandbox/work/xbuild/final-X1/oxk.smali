.class public final synthetic Loxk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lpxk;


# direct methods
.method public synthetic constructor <init>(Lpxk;B)V
    .registers 3

    iput-byte p2, p0, Loxk;->a:B

    iput-object p1, p0, Loxk;->b:Lpxk;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 7

    iget-byte p1, p0, Loxk;->a:B

    sget-object v0, Lijm;->b:Lijm;

    const/4 v1, 0x0

    iget-object p0, p0, Loxk;->b:Lpxk;

    packed-switch p1, :pswitch_data_e0

    iget-object p0, p0, Lpxk;->d:Lu7k;

    iget-object p0, p0, Lu7k;->a:Ljava/lang/Object;

    check-cast p0, Ldyk;

    iget-object p0, p0, Ldyk;->j:Lkxk;

    iget-object p1, p0, Lkxk;->a:Lji;

    invoke-virtual {p1}, Lji;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ldb;

    invoke-virtual {p1}, Ldb;->d()Z

    move-result p1

    const/4 v2, 0x1

    if-eqz p1, :cond_6c

    new-instance p1, Lrxh;

    const v3, 0x7f1411ea

    invoke-direct {p1, v3}, Lrxh;-><init>(I)V

    new-instance v3, Ljxk;

    invoke-direct {v3, p0, v2}, Ljxk;-><init>(Lkxk;B)V

    iget-object p0, p0, Lkxk;->g:Ldu3;

    invoke-virtual {p0}, Ldu3;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lqim;

    iget-object p0, p0, Lqim;->c:Lz77;

    new-instance v4, Lgkj;

    invoke-direct {v4, v1, v1}, Lnz0;-><init>(ZZ)V

    const/4 v1, 0x0

    iput-object v1, v4, Lgkj;->a:Ljava/lang/String;

    iput-object v1, v4, Lgkj;->b:Ljava/lang/String;

    iput-object v1, v4, Lgkj;->c:Ljava/lang/String;

    iput-object v1, v4, Lgkj;->d:Ljava/lang/CharSequence;

    iput-object v1, v4, Lgkj;->e:Lekj;

    iput-object v1, v4, Lgkj;->f:Lfkj;

    iput-object v1, v4, Lgkj;->g:Lqp2;

    iput-object v3, v4, Lgkj;->h:Ldkj;

    iput-object v1, v4, Lgkj;->i:Ldkj;

    iput-object v1, v4, Lgkj;->j:Lql;

    const v1, 0x7f140567

    iput v1, v4, Lgkj;->k:I

    const v1, 0x7f1403bf

    iput v1, v4, Lgkj;->l:I

    const v1, 0x7f1411eb

    iput v1, v4, Lgkj;->m:I

    iput-boolean v2, v4, Lgkj;->n:Z

    iput-object p1, v4, Lgkj;->o:Lpxh;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p0, v4, v0}, Lr22;->b(Ljjm;Lijm;)V

    goto :goto_7f

    :cond_6c
    iget-object p0, p0, Lkxk;->f:Landroidx/fragment/app/w;

    invoke-static {p0, p0}, Lu35;->f(Landroidx/fragment/app/w;Landroidx/fragment/app/w;)Landroidx/fragment/app/a;

    move-result-object p0

    new-instance p1, Lc27;

    invoke-direct {p1}, Lc27;-><init>()V

    const-string v0, "sync-auth-del"

    invoke-virtual {p0, v1, p1, v0, v2}, Landroidx/fragment/app/a;->e(ILandroidx/fragment/app/Fragment;Ljava/lang/String;I)V

    invoke-virtual {p0}, Landroidx/fragment/app/a;->h()I

    :goto_7f
    return-void

    :pswitch_80
    iget-object p0, p0, Lpxk;->d:Lu7k;

    iget-object p0, p0, Lu7k;->a:Ljava/lang/Object;

    check-cast p0, Ldyk;

    iget-object p0, p0, Ldyk;->j:Lkxk;

    iget-object p1, p0, Lkxk;->a:Lji;

    invoke-virtual {p1}, Lji;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ldb;

    iget-object v2, p0, Lkxk;->c:Lj4c;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lbf9;

    iget-object v3, p0, Lkxk;->g:Ldu3;

    invoke-virtual {v3}, Ldu3;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lqim;

    iget-object v3, v3, Lqim;->c:Lz77;

    new-instance v4, Ljxk;

    invoke-direct {v4, p0, v1}, Ljxk;-><init>(Lkxk;B)V

    new-instance p0, Lhy4;

    invoke-direct {p0, p1, v2, v4}, Lhy4;-><init>(Ldb;Lbf9;Luif;)V

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v3, p0, v0}, Lr22;->b(Ljjm;Lijm;)V

    return-void

    :pswitch_b3
    iget-object p0, p0, Lpxk;->d:Lu7k;

    iget-object p0, p0, Lu7k;->a:Ljava/lang/Object;

    check-cast p0, Ldyk;

    iget-object p0, p0, Ldyk;->j:Lkxk;

    iget-object p1, p0, Lkxk;->a:Lji;

    invoke-virtual {p1}, Lji;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ldb;

    iget-object v0, p0, Lkxk;->b:Lwv1;

    iget-object v0, v0, Lwv1;->b:Lb6h;

    invoke-interface {v0}, Lvtb;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lxb;

    iget-object p0, p0, Lkxk;->e:Lcom/opera/android/BrowserActivity;

    iget-object v0, v0, Lxb;->e:Ljze;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ldpf;

    new-instance v1, Lz8b;

    invoke-direct {v1, p0, p1}, Lz8b;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Ldpf;->a(Lhpf;)V

    return-void

    :pswitch_data_e0
    .packed-switch 0x0
        :pswitch_b3
        :pswitch_80
    .end packed-switch
.end method
