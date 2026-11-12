.class public final synthetic Ly0c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lf1c;


# direct methods
.method public synthetic constructor <init>(Lf1c;B)V
    .registers 3

    iput-byte p2, p0, Ly0c;->a:B

    iput-object p1, p0, Ly0c;->b:Lf1c;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 10

    iget-byte v0, p0, Ly0c;->a:B

    const/16 v1, 0x1003

    iget-object p0, p0, Ly0c;->b:Lf1c;

    packed-switch v0, :pswitch_data_158

    new-instance v2, Lu3m;

    iget-object v0, p0, Lf1c;->A:Lode;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Set;

    if-nez v0, :cond_1a

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    :cond_1a
    new-instance v3, Lb10;

    const/16 v4, 0xf

    invoke-direct {v3, v4}, Lb10;-><init>(B)V

    new-instance v4, Lzlb;

    const/4 v5, 0x1

    invoke-direct {v4, v0, v3, v5}, Lzlb;-><init>(Ljava/lang/Iterable;Ljava/lang/Object;B)V

    instance-of v0, v4, Ljava/util/Collection;

    if-eqz v0, :cond_33

    new-instance v0, Ljava/util/HashSet;

    check-cast v4, Ljava/util/Collection;

    invoke-direct {v0, v4}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    goto :goto_40

    :cond_33
    invoke-virtual {v4}, Lzlb;->iterator()Ljava/util/Iterator;

    move-result-object v0

    new-instance v3, Ljava/util/HashSet;

    invoke-direct {v3}, Ljava/util/HashSet;-><init>()V

    invoke-static {v3, v0}, Lipe;->f(Ljava/util/Collection;Ljava/util/Iterator;)Z

    move-object v0, v3

    :goto_40
    new-instance v4, Ljava/util/HashSet;

    invoke-direct {v4}, Ljava/util/HashSet;-><init>()V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lv3m;->c(Landroid/content/Context;)Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_51
    :goto_51
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_67

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lszb;

    invoke-virtual {v0, v6}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_51

    invoke-virtual {v4, v6}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_51

    :cond_67
    new-instance v0, Lx0c;

    invoke-direct {v0, p0, v5}, Lx0c;-><init>(Lf1c;B)V

    const/4 v6, 0x0

    const/4 v7, 0x0

    const v3, 0x7f140f52

    move-object v5, v0

    invoke-direct/range {v2 .. v7}, Lu3m;-><init>(ILjava/util/Set;Ls3m;Lszb;Ljava/util/ArrayList;)V

    invoke-static {v2, v1}, Lzhj;->a(Lryl;I)Lzhj;

    move-result-object p0

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p0, p1}, Lzhj;->c(Landroid/content/Context;)V

    return-void

    :pswitch_81
    iget-object p0, p0, Lf1c;->v:Lg0c;

    iget-object p1, p0, Lg0c;->b:Lwv1;

    iget-object p1, p1, Lwv1;->b:Lb6h;

    invoke-interface {p1}, Lvtb;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lv3m;

    new-instance v2, Lu3m;

    iget-object p0, p0, Lg0c;->a:Lcom/opera/android/BrowserActivity;

    invoke-static {p0}, Lv3m;->c(Landroid/content/Context;)Ljava/util/Set;

    move-result-object v4

    new-instance v5, Lf0c;

    invoke-direct {v5, p1}, Lf0c;-><init>(Lv3m;)V

    invoke-virtual {p1}, Lv3m;->d()Lszb;

    move-result-object v6

    iget-object v0, p1, Lv3m;->a:Landroid/content/Context;

    invoke-static {v0}, Lv3m;->c(Landroid/content/Context;)Ljava/util/Set;

    move-result-object v0

    new-instance v3, Lf15;

    const/4 v7, 0x5

    invoke-direct {v3, p1, v7}, Lf15;-><init>(Ljava/lang/Object;B)V

    invoke-static {v0, v3}, Lsfe;->Q(Ljava/lang/Iterable;Lsrg;)Lzlb;

    move-result-object p1

    invoke-static {p1}, Lnb6;->J(Ljava/lang/Iterable;)Ljava/util/ArrayList;

    move-result-object v7

    const v3, 0x7f140f9b

    invoke-direct/range {v2 .. v7}, Lu3m;-><init>(ILjava/util/Set;Ls3m;Lszb;Ljava/util/ArrayList;)V

    invoke-static {v2, v1}, Lzhj;->a(Lryl;I)Lzhj;

    move-result-object p1

    invoke-virtual {p1, p0}, Lzhj;->c(Landroid/content/Context;)V

    return-void

    :pswitch_c0
    iget-object p1, p0, Lf1c;->x:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p1}, Lcom/opera/android/settings/SettingsManager;->E()Lz4m;

    move-result-object p1

    iget-object v0, p0, Lf1c;->B:Lcr2;

    iget-object v0, v0, Lcr2;->g:Landroid/view/ViewGroup;

    check-cast v0, Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lsfe;->U(Landroid/content/Context;)Lz77;

    move-result-object v0

    new-instance v1, Lbg7;

    iget-object v2, p0, Lf1c;->y:Lq6e;

    new-instance v3, Lge5;

    const/16 v4, 0x1d

    invoke-direct {v3, p0, p1, v4}, Lge5;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {v1, v2, p1, v3}, Lbg7;-><init>(Lq6e;Lz4m;Lge5;)V

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p0, Lijm;->b:Lijm;

    invoke-virtual {v0, v1, p0}, Lr22;->b(Ljjm;Lijm;)V

    return-void

    :pswitch_eb
    iget-object p1, p0, Lf1c;->v:Lg0c;

    iget-object p1, p1, Lg0c;->a:Lcom/opera/android/BrowserActivity;

    :try_start_ef
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    const-string v1, "com.android.settings.TTS_SETTINGS"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    const/high16 v1, 0x10000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_101
    .catch Landroid/content/ActivityNotFoundException; {:try_start_ef .. :try_end_101} :catch_102

    goto :goto_116

    :catch_102
    iget-object p0, p0, Lltl;->n:Lqm9;

    new-instance p1, Lglj;

    new-instance v0, Lrxh;

    const v1, 0x7f140beb

    invoke-direct {v0, v1}, Lrxh;-><init>(I)V

    const/16 v1, 0x9c4

    invoke-direct {p1, v0, v1}, Lglj;-><init>(Lpxh;I)V

    invoke-virtual {p0, p1}, Lqm9;->f(Lo93;)V

    :goto_116
    return-void

    :pswitch_117
    iget-object p0, p0, Lf1c;->v:Lg0c;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-class p1, Lrbn;

    invoke-static {p1}, Lzhj;->b(Ljava/lang/Class;)Lzhj;

    move-result-object p1

    iget-object p0, p0, Lg0c;->a:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p1, p0}, Lzhj;->c(Landroid/content/Context;)V

    return-void

    :pswitch_128
    iget-object p0, p0, Lf1c;->v:Lg0c;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p1, La0c;

    invoke-direct {p1}, La0c;-><init>()V

    invoke-static {p1, v1}, Lzhj;->a(Lryl;I)Lzhj;

    move-result-object p1

    iget-object p0, p0, Lg0c;->a:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p1, p0}, Lzhj;->c(Landroid/content/Context;)V

    return-void

    :pswitch_13c
    iget-object p0, p0, Lf1c;->v:Lg0c;

    new-instance p1, Lp3m;

    iget-object v0, p0, Lg0c;->b:Lwv1;

    iget-object v0, v0, Lwv1;->b:Lb6h;

    invoke-interface {v0}, Lvtb;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lv3m;

    invoke-direct {p1, v0}, Lp3m;-><init>(Lv3m;)V

    invoke-static {p1, v1}, Lzhj;->a(Lryl;I)Lzhj;

    move-result-object p1

    iget-object p0, p0, Lg0c;->a:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p1, p0}, Lzhj;->c(Landroid/content/Context;)V

    return-void

    nop

    :pswitch_data_158
    .packed-switch 0x0
        :pswitch_13c
        :pswitch_128
        :pswitch_117
        :pswitch_eb
        :pswitch_c0
        :pswitch_81
    .end packed-switch
.end method
