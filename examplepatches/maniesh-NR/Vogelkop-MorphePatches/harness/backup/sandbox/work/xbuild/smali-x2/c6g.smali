.class public final synthetic Lc6g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lf6g;


# direct methods
.method public synthetic constructor <init>(Lf6g;B)V
    .registers 3

    iput-byte p2, p0, Lc6g;->a:B

    iput-object p1, p0, Lc6g;->b:Lf6g;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 12

    iget-byte p1, p0, Lc6g;->a:B

    const/4 v0, 0x3

    const/16 v1, 0xf

    const/4 v2, 0x2

    sget-object v3, Lijm;->b:Lijm;

    const/4 v4, 0x0

    const/4 v5, 0x1

    iget-object p0, p0, Lc6g;->b:Lf6g;

    packed-switch p1, :pswitch_data_1ca

    invoke-virtual {p0}, Lf6g;->J0()Lm6g;

    move-result-object p0

    iput-boolean v5, p0, Lm6g;->n:Z

    iget-object p0, p0, Lm6g;->k:Ln6g;

    iget-object p0, p0, Ln6g;->a:Landroid/content/Context;

    invoke-static {p0}, Lmdb;->b(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object p1

    const-string v0, "com.opera.android.action.PASSWORD_MANAGER"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    const v0, 0x7f080719

    invoke-static {v0, p0}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    const/high16 v1, 0x42d80000    # 108.0f

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-static {v1, v2}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v1

    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v1, v1, v2}, Lz5i;->u(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v2

    const/4 v3, -0x1

    invoke-virtual {v2, v3}, Landroid/graphics/Bitmap;->eraseColor(I)V

    invoke-virtual {v0, v4, v4, v1, v1}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    new-instance v1, Landroid/graphics/Canvas;

    invoke-direct {v1, v2}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    new-instance v0, Landroidx/core/graphics/drawable/IconCompat;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Landroidx/core/graphics/drawable/IconCompat;-><init>(I)V

    iput-object v2, v0, Landroidx/core/graphics/drawable/IconCompat;->b:Ljava/lang/Object;

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f140c73

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    const-string v2, "OFA_SHORTCUT_PASSWORDS"

    invoke-static {p0, v2, v1, v0, p1}, Lm5h;->y(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Landroidx/core/graphics/drawable/IconCompat;Landroid/content/Intent;)V

    return-void

    :pswitch_61
    invoke-virtual {p0}, Lf6g;->J0()Lm6g;

    move-result-object p0

    iget-object p0, p0, Lm6g;->d:Lot2;

    iget-object p0, p0, Lot2;->b:Lgjm;

    new-instance p1, Lih3;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p0, p1, v4}, Lgjm;->e(Ln37;Z)V

    return-void

    :pswitch_72
    invoke-virtual {p0}, Lf6g;->J0()Lm6g;

    move-result-object p0

    iget-object p1, p0, Lm6g;->e:Lhxk;

    iget-object p0, p0, Lm6g;->f:Lk6g;

    iget-object p0, p0, Lk6g;->i:Lv9j;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lh6g;

    const v0, 0x7f0a0a04

    if-eqz p0, :cond_97

    iget-object p0, p0, Lh6g;->e:Llxk;

    iget-boolean p0, p0, Llxk;->a:Z

    if-ne p0, v5, :cond_97

    filled-new-array {v0}, [I

    move-result-object p0

    check-cast p1, Lkxk;

    invoke-virtual {p1, p0}, Lkxk;->a([I)V

    goto :goto_a3

    :cond_97
    const p0, 0x7f0a0b20

    filled-new-array {p0, v0}, [I

    move-result-object p0

    check-cast p1, Lkxk;

    invoke-virtual {p1, p0}, Lkxk;->a([I)V

    :goto_a3
    return-void

    :pswitch_a4
    invoke-virtual {p0}, Lf6g;->J0()Lm6g;

    move-result-object p0

    iget-object p1, p0, Lm6g;->d:Lot2;

    new-instance v0, Ll6g;

    invoke-direct {v0, p0, v2}, Ll6g;-><init>(Lm6g;B)V

    new-instance p0, Lpyc;

    iget-object v2, p1, Lot2;->k:Lwv1;

    iget-object v2, v2, Lwv1;->b:Lb6h;

    invoke-interface {v2}, Lvtb;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/opera/android/settings/SettingsManager;

    new-instance v4, Lt02;

    invoke-direct {v4, v0, v1}, Lt02;-><init>(Ljava/lang/Object;B)V

    new-instance v0, Lqyc;

    invoke-direct {v0, v2, v4}, Lqyc;-><init>(Lcom/opera/android/settings/SettingsManager;Lt02;)V

    invoke-direct {p0, v0}, Ltim;-><init>(Luim;)V

    iget-object p1, p1, Lot2;->c:Ldu3;

    invoke-virtual {p1}, Ldu3;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lqim;

    iget-object p1, p1, Lqim;->c:Lz77;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1, p0, v3}, Lr22;->b(Ljjm;Lijm;)V

    return-void

    :pswitch_d9
    invoke-virtual {p0}, Lf6g;->J0()Lm6g;

    move-result-object p0

    iget-object p1, p0, Lm6g;->d:Lot2;

    new-instance v0, Ll6g;

    invoke-direct {v0, p0, v5}, Ll6g;-><init>(Lm6g;B)V

    iget-object p0, p1, Lot2;->c:Ldu3;

    invoke-virtual {p0}, Ldu3;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lqim;

    iget-object p0, p0, Lqim;->c:Lz77;

    new-instance p1, Luii;

    invoke-direct {p1}, Luii;-><init>()V

    new-instance v1, Lnt2;

    invoke-direct {v1, v0, p1}, Lnt2;-><init>(Ll6g;Luii;)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p0, v1, v3}, Lr22;->b(Ljjm;Lijm;)V

    return-void

    :pswitch_ff
    invoke-virtual {p0}, Lf6g;->J0()Lm6g;

    move-result-object p1

    new-instance v0, Lb6g;

    invoke-direct {v0, p0, v5}, Lb6g;-><init>(Lf6g;B)V

    iget-object p1, p1, Lm6g;->m:Ljvg;

    new-instance v1, Ld3b;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    new-instance v2, Lo5f;

    const/16 v3, 0x19

    invoke-direct {v2, v0, v3}, Lo5f;-><init>(Ljava/lang/Object;B)V

    new-instance v0, Liwa;

    const/16 v3, 0x10

    invoke-direct {v0, v2, v3}, Liwa;-><init>(Ljava/lang/Object;B)V

    iget-object v2, p1, Ljvg;->b:Ljava/lang/Object;

    check-cast v2, Lgjm;

    iget-object p1, p1, Ljvg;->c:Ljava/lang/Object;

    check-cast p1, Latl;

    invoke-virtual {v2, v1, p1, v0}, Lgjm;->c(Lr37;Lndc;Lf7f;)V

    iget-object p0, p0, Lf6g;->u:Lorm;

    sget-object p1, Lgm0;->b:Lgm0;

    check-cast p0, Lx5f;

    invoke-virtual {p0, p1}, Lx5f;->l0(Lgm0;)V

    return-void

    :pswitch_132
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lsj2;->g(Landroid/content/Context;)Z

    move-result p1

    iget-object v1, p0, Lf6g;->t:Lz77;

    if-nez p1, :cond_14a

    new-instance p0, Lwen;

    invoke-direct {p0}, Lwen;-><init>()V

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v1, p0, v3}, Lr22;->b(Ljjm;Lijm;)V

    goto :goto_15a

    :cond_14a
    new-instance p1, Lwen;

    new-instance v4, Lb6g;

    invoke-direct {v4, p0, v2}, Lb6g;-><init>(Lf6g;B)V

    invoke-direct {p1, v4, v0}, Lwen;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v1, p1, v3}, Lr22;->b(Ljjm;Lijm;)V

    :goto_15a
    return-void

    :pswitch_15b
    invoke-virtual {p0}, Lf6g;->J0()Lm6g;

    move-result-object p0

    iget-object p1, p0, Lm6g;->d:Lot2;

    new-instance v2, Lo5f;

    const/16 v6, 0x18

    invoke-direct {v2, p0, v6}, Lo5f;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p0, Llqh;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v6, Lrxh;

    const v7, 0x7f140f83

    invoke-direct {v6, v7}, Lrxh;-><init>(I)V

    new-instance v7, Lmt2;

    invoke-direct {v7, p0, v4}, Lmt2;-><init>(Llqh;B)V

    new-instance v8, Lmt2;

    invoke-direct {v8, p0, v5}, Lmt2;-><init>(Llqh;B)V

    new-instance v9, Lqp2;

    invoke-direct {v9, v0}, Lqp2;-><init>(B)V

    new-instance v0, Lxj;

    invoke-direct {v0, v2, p0, v1}, Lxj;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance p0, Lgkj;

    invoke-direct {p0, v4, v4}, Lnz0;-><init>(ZZ)V

    const/4 v1, 0x0

    iput-object v1, p0, Lgkj;->a:Ljava/lang/String;

    iput-object v1, p0, Lgkj;->b:Ljava/lang/String;

    iput-object v1, p0, Lgkj;->c:Ljava/lang/String;

    iput-object v1, p0, Lgkj;->d:Ljava/lang/CharSequence;

    iput-object v1, p0, Lgkj;->e:Lekj;

    iput-object v0, p0, Lgkj;->f:Lfkj;

    iput-object v9, p0, Lgkj;->g:Lqp2;

    iput-object v7, p0, Lgkj;->h:Ldkj;

    iput-object v8, p0, Lgkj;->i:Ldkj;

    iput-object v1, p0, Lgkj;->j:Lql;

    const v0, 0x7f140567

    iput v0, p0, Lgkj;->k:I

    const v0, 0x7f1403bf

    iput v0, p0, Lgkj;->l:I

    const v0, 0x7f140c56

    iput v0, p0, Lgkj;->m:I

    iput-boolean v5, p0, Lgkj;->n:Z

    iput-object v6, p0, Lgkj;->o:Lpxh;

    iget-object p1, p1, Lot2;->a:Lcom/opera/android/BrowserActivity;

    const-string v0, "com.opera.android.ui.DIALOG_QUEUE_SERVICE"

    invoke-virtual {p1, v0}, Lt5d;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lz77;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1, p0, v3}, Lr22;->b(Ljjm;Lijm;)V

    return-void

    :pswitch_data_1ca
    .packed-switch 0x0
        :pswitch_15b
        :pswitch_132
        :pswitch_ff
        :pswitch_d9
        :pswitch_a4
        :pswitch_72
        :pswitch_61
    .end packed-switch
.end method
