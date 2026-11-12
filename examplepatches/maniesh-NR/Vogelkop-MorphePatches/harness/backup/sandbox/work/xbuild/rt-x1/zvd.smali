.class public final synthetic Lzvd;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lzvd;->a:B

    iput-object p1, p0, Lzvd;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 15

    iget-byte v0, p0, Lzvd;->a:B

    const/16 v1, 0x1d

    const/4 v2, 0x2

    sget-object v3, Lijm;->b:Lijm;

    const/4 v4, 0x0

    const/4 v5, 0x3

    const/4 v6, 0x0

    const/4 v7, 0x1

    iget-object p0, p0, Lzvd;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_2f4

    check-cast p0, Lknh;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    new-instance v0, Lsk;

    const/16 v1, 0xa

    invoke-direct {v0, p0, v1}, Lsk;-><init>(Ljava/lang/Object;B)V

    const p0, 0x7f140578

    const v1, 0x7f140bbb

    invoke-static {p1, v6, p0, v1, v0}, Lg25;->b(Landroid/content/Context;IIILandroid/content/DialogInterface$OnClickListener;)Lg25;

    return-void

    :pswitch_27
    check-cast p0, Llmh;

    iget-object p0, p0, Llmh;->c:Leek;

    invoke-virtual {p0}, Leek;->invoke()Ljava/lang/Object;

    return-void

    :pswitch_2f
    check-cast p0, Lpg5;

    invoke-virtual {p0}, Ldej;->b()V

    return-void

    :pswitch_35
    check-cast p0, Lpg5;

    invoke-virtual {p0}, Ldej;->b()V

    return-void

    :pswitch_3b
    check-cast p0, Lljh;

    invoke-virtual {p0}, Luim;->h0()V

    return-void

    :pswitch_41
    check-cast p0, Lljh;

    invoke-virtual {p0}, Luim;->h0()V

    return-void

    :pswitch_47
    check-cast p0, Ltzg;

    invoke-virtual {p0}, Lzp1;->dismiss()V

    return-void

    :pswitch_4d
    check-cast p0, Ltn;

    iget-object p1, p0, Ltn;->b:Ljava/lang/Object;

    check-cast p1, Lor2;

    iget-object p1, p1, Lor2;->e:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/premium/ui/view/SubscriptionPlanList;

    invoke-virtual {p1}, Lcom/opera/android/premium/ui/view/SubscriptionPlanList;->a()Lamk;

    move-result-object p1

    if-eqz p1, :cond_79

    iget-object p0, p0, Ltn;->d:Ljava/lang/Object;

    check-cast p0, Lr9g;

    iget-object p0, p0, Lr9g;->b:Ljava/lang/Object;

    check-cast p0, Ltah;

    iget-object v0, p0, Ltah;->e:Ljava/lang/Object;

    check-cast v0, Lxb;

    iget-object v0, v0, Lxb;->e:Ljze;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ldpf;

    new-instance v1, Livg;

    invoke-direct {v1, p0, p1}, Livg;-><init>(Ltah;Lamk;)V

    invoke-virtual {v0, v1}, Ldpf;->a(Lhpf;)V

    :cond_79
    return-void

    :pswitch_7a
    check-cast p0, Lcvg;

    iget-object p0, p0, Lcvg;->t:Ltah;

    invoke-virtual {p0, v2}, Ltah;->L(I)V

    iget-object p0, p0, Ltah;->g:Ljava/lang/Object;

    check-cast p0, Lc0i;

    invoke-virtual {p0}, Lc0i;->a()V

    return-void

    :pswitch_89
    check-cast p0, Lxtg;

    invoke-virtual {p0}, Lxtg;->G0()V

    return-void

    :pswitch_8f
    check-cast p0, Lzig;

    invoke-virtual {p0}, Lzig;->f()V

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    const v1, 0x7f0a03e6

    if-ne v0, v1, :cond_a3

    iget-object p0, p0, Lzig;->r:Landroid/animation/ValueAnimator;

    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    goto :goto_b1

    :cond_a3
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    const v0, 0x7f0a03e5

    if-ne p1, v0, :cond_b1

    iget-object p0, p0, Lzig;->s:Landroid/animation/ValueAnimator;

    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    :cond_b1
    :goto_b1
    return-void

    :pswitch_b2
    check-cast p0, Lnig;

    iget-object p0, p0, Lnig;->d:Luig;

    iget-object p1, p0, Luig;->o0:Lgig;

    if-eqz p1, :cond_e8

    invoke-interface {p1, v1}, Lgig;->C(I)Z

    move-result p1

    if-eqz p1, :cond_e8

    iget-object p1, p0, Luig;->o0:Lgig;

    invoke-interface {p1}, Lgig;->L()Lnyl;

    move-result-object p1

    iget-object v0, p0, Luig;->o0:Lgig;

    invoke-virtual {p1}, Lnyl;->a()Lmyl;

    move-result-object p1

    invoke-virtual {p1, v5}, Lmyl;->d(I)Lmyl;

    move-result-object p1

    invoke-virtual {p1}, Lmyl;->g()Lmyl;

    move-result-object p1

    invoke-virtual {p1, v4}, Lmyl;->i(Ljava/lang/String;)Lmyl;

    move-result-object p1

    invoke-virtual {p1}, Lmyl;->k()Lmyl;

    move-result-object p1

    invoke-virtual {p1}, Lmyl;->b()Lnyl;

    move-result-object p1

    invoke-interface {v0, p1}, Lgig;->m(Lnyl;)V

    iget-object p0, p0, Luig;->q:Landroid/widget/PopupWindow;

    invoke-virtual {p0}, Landroid/widget/PopupWindow;->dismiss()V

    :cond_e8
    return-void

    :pswitch_e9
    check-cast p0, Lpig;

    iget-object p1, p0, Lpig;->e:Luig;

    invoke-virtual {p0}, Landroidx/recyclerview/widget/i;->getBindingAdapterPosition()I

    move-result p0

    sget-object v0, Luig;->D0:[F

    iget-object v0, p1, Luig;->E:Landroid/view/View;

    if-nez p0, :cond_100

    iget-object p0, p1, Luig;->m:Lky7;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1, p0, v0}, Luig;->b(Landroidx/recyclerview/widget/d;Landroid/view/View;)V

    goto :goto_110

    :cond_100
    if-ne p0, v7, :cond_10b

    iget-object p0, p1, Luig;->o:Lnig;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1, p0, v0}, Luig;->b(Landroidx/recyclerview/widget/d;Landroid/view/View;)V

    goto :goto_110

    :cond_10b
    iget-object p0, p1, Luig;->q:Landroid/widget/PopupWindow;

    invoke-virtual {p0}, Landroid/widget/PopupWindow;->dismiss()V

    :goto_110
    return-void

    :pswitch_111
    check-cast p0, Lnig;

    iget-object p0, p0, Lnig;->d:Luig;

    iget-object p1, p0, Luig;->o0:Lgig;

    if-eqz p1, :cond_152

    invoke-interface {p1, v1}, Lgig;->C(I)Z

    move-result p1

    if-eqz p1, :cond_152

    iget-object p1, p0, Luig;->o0:Lgig;

    invoke-interface {p1}, Lgig;->L()Lnyl;

    move-result-object p1

    iget-object v0, p0, Luig;->o0:Lgig;

    sget-object v1, Ltym;->a:Ljava/lang/String;

    invoke-virtual {p1}, Lnyl;->a()Lmyl;

    move-result-object p1

    invoke-virtual {p1, v7}, Lmyl;->d(I)Lmyl;

    move-result-object p1

    invoke-virtual {p1, v7, v6}, Lmyl;->l(IZ)Lmyl;

    move-result-object p1

    invoke-virtual {p1}, Lmyl;->b()Lnyl;

    move-result-object p1

    invoke-interface {v0, p1}, Lgig;->m(Lnyl;)V

    iget-object p1, p0, Luig;->l:Lqig;

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f14070e

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    iget-object p1, p1, Lqig;->b:[Ljava/lang/String;

    aput-object v0, p1, v7

    iget-object p0, p0, Luig;->q:Landroid/widget/PopupWindow;

    invoke-virtual {p0}, Landroid/widget/PopupWindow;->dismiss()V

    :cond_152
    return-void

    :pswitch_153
    check-cast p0, Luig;

    iget-object p1, p0, Luig;->n0:Ljava/lang/String;

    iget-object v0, p0, Luig;->l0:Landroid/graphics/drawable/Drawable;

    iget-object v1, p0, Luig;->m0:Ljava/lang/String;

    iget-object v2, p0, Luig;->k0:Landroid/graphics/drawable/Drawable;

    iget-boolean v3, p0, Luig;->p0:Z

    xor-int/lit8 v4, v3, 0x1

    if-eq v3, v4, :cond_18b

    iput-boolean v4, p0, Luig;->p0:Z

    iget-object v4, p0, Luig;->C:Landroid/widget/ImageView;

    if-eqz v4, :cond_178

    if-nez v3, :cond_172

    invoke-virtual {v4, v2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v4, v1}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    goto :goto_178

    :cond_172
    invoke-virtual {v4, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v4, p1}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    :cond_178
    :goto_178
    iget-object p0, p0, Luig;->D:Landroid/widget/ImageView;

    if-eqz p0, :cond_18b

    if-nez v3, :cond_185

    invoke-virtual {p0, v2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p0, v1}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    goto :goto_18b

    :cond_185
    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p0, p1}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    :cond_18b
    :goto_18b
    return-void

    :pswitch_18c
    check-cast p0, Lg9g;

    iget-object p0, p0, Lg9g;->w:Ljava/lang/String;

    sget-object p1, Llqm;->u:Llqm;

    invoke-static {p0, p1, v6}, Lay3;->a(Ljava/lang/String;Llqm;Z)Lvx3;

    move-result-object p0

    iput v5, p0, Lvx3;->b:I

    invoke-static {p0, v7, p0}, Lo18;->t(Lvx3;ZLvx3;)V

    return-void

    :pswitch_19c
    check-cast p0, Lt5g;

    iget-object p1, p0, Lt5g;->w:Lua7;

    new-instance v0, Lku;

    invoke-direct {v0}, Lku;-><init>()V

    new-instance v1, Ls5g;

    invoke-direct {v1, p0, v7}, Ls5g;-><init>(Lt5g;B)V

    new-instance p0, Lt7d;

    invoke-direct {p0, v1, v5}, Lt7d;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {p1, v0, p0}, Lua7;->E(Lr37;Lf7f;)V

    return-void

    :pswitch_1b3
    check-cast p0, La5g;

    iget-object p1, p0, La5g;->f:Landroid/widget/EditText;

    if-eqz p1, :cond_1e3

    invoke-virtual {p1}, Landroid/widget/TextView;->getSelectionEnd()I

    move-result p1

    iget-object v0, p0, La5g;->f:Landroid/widget/EditText;

    if-eqz v0, :cond_1ca

    invoke-virtual {v0}, Landroid/widget/TextView;->getTransformationMethod()Landroid/text/method/TransformationMethod;

    move-result-object v0

    instance-of v0, v0, Landroid/text/method/PasswordTransformationMethod;

    if-eqz v0, :cond_1ca

    move v6, v7

    :cond_1ca
    iget-object v0, p0, La5g;->f:Landroid/widget/EditText;

    if-eqz v6, :cond_1d2

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setTransformationMethod(Landroid/text/method/TransformationMethod;)V

    goto :goto_1d9

    :cond_1d2
    invoke-static {}, Landroid/text/method/PasswordTransformationMethod;->getInstance()Landroid/text/method/PasswordTransformationMethod;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTransformationMethod(Landroid/text/method/TransformationMethod;)V

    :goto_1d9
    if-ltz p1, :cond_1e0

    iget-object v0, p0, La5g;->f:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setSelection(I)V

    :cond_1e0
    invoke-virtual {p0}, La38;->p()V

    :cond_1e3
    return-void

    :pswitch_1e4
    check-cast p0, Lq4g;

    iget-object p0, p0, Lq4g;->G:Lz77;

    new-instance p1, Lwen;

    invoke-direct {p1}, Lwen;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p0, p1, v3}, Lr22;->b(Ljjm;Lijm;)V

    return-void

    :pswitch_1f4
    check-cast p0, Lq2f;

    sget-object v0, Lhjm;->a:Lhjm;

    invoke-virtual {p0, v0}, Lq2f;->f(Lhjm;)V

    iget-object p0, p0, Lq2f;->e:Landroid/view/View$OnClickListener;

    if-eqz p0, :cond_202

    invoke-interface {p0, p1}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    :cond_202
    return-void

    :pswitch_203
    check-cast p0, Lgim;

    invoke-interface {p0, p1}, Lgim;->b(Landroid/view/View;)V

    return-void

    :pswitch_209
    check-cast p0, Ldnf;

    invoke-virtual {p0}, Ldnf;->g()V

    return-void

    :pswitch_20f
    check-cast p0, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-object p1, p0, Lcom/opera/android/ui/catalog/widget/OperaListItem;->w:Li41;

    invoke-virtual {p1}, Li41;->W()V

    iget-object p0, p0, Lcom/opera/android/ui/catalog/widget/OperaListItem;->x:Luup;

    invoke-virtual {p0}, Luup;->x()V

    return-void

    :pswitch_21c
    check-cast p0, La3f;

    invoke-virtual {p0}, La3f;->I0()Ld3f;

    move-result-object p0

    iget-object p0, p0, Lj93;->c:Ld8j;

    check-cast p0, Lg8j;

    invoke-virtual {p0}, Lg8j;->k()V

    return-void

    :pswitch_22a
    check-cast p0, Lr2f;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    iget-object v0, p0, Lr2f;->e:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    iget-boolean p0, p0, Lr2f;->d:Z

    invoke-static {p1}, Lsfe;->U(Landroid/content/Context;)Lz77;

    move-result-object p1

    new-instance v1, Lmm2;

    invoke-direct {v1, v0, p0}, Lmm2;-><init>(Ljava/lang/String;Z)V

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1, v1, v3}, Lr22;->b(Ljjm;Lijm;)V

    return-void

    :pswitch_246
    check-cast p0, Ls2f;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    iget-object v0, p0, Ls2f;->c:Ljava/lang/String;

    iget-boolean p0, p0, Ls2f;->d:Z

    invoke-static {p1}, Lsfe;->U(Landroid/content/Context;)Lz77;

    move-result-object p1

    new-instance v1, Lmm2;

    invoke-direct {v1, v0, p0}, Lmm2;-><init>(Ljava/lang/String;Z)V

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1, v1, v3}, Lr22;->b(Ljjm;Lijm;)V

    return-void

    :pswitch_260
    check-cast p0, Live;

    iget-object p1, p0, Lab2;->b:Lja2;

    check-cast p1, Lj82;

    if-eqz p1, :cond_2a3

    iget-object v0, p0, Live;->m:Lhve;

    invoke-virtual {p0}, Lgu8;->e0()Loqe;

    move-result-object v1

    invoke-virtual {v0, p0, p1}, Lr9i;->r(Llx8;Lj82;)V

    iget-object p0, v0, Lhve;->h:Luqe;

    check-cast v1, Lfre;

    iget-object p1, v1, Lfre;->D:Ljb8;

    iget-object p1, p1, Ljb8;->k:Ljava/lang/String;

    iget-object p0, p0, Luqe;->h:Luy8;

    iget-object v0, p0, Luy8;->F:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2a3

    iget-object p0, p0, Luy8;->K:Ly0f;

    iget-object p0, p0, Ly0f;->a:Lx5f;

    iget-boolean v0, p0, Lx5f;->h:Z

    if-eqz v0, :cond_2a3

    iget-object v0, p0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v1

    new-instance v3, Lck0;

    invoke-direct {v3, v0, v1}, Lck0;-><init>(Lzpa;Lx56;)V

    new-instance v0, Lj5f;

    sget-object v4, Lod0;->c:Lod0;

    invoke-direct {v0, p1, v4, v2}, Lj5f;-><init>(Ljava/lang/String;Lod0;I)V

    invoke-virtual {v3, v0}, Lck0;->j(Lkotlin/jvm/functions/Function1;)V

    invoke-virtual {p0, v1}, Lx5f;->U0(Lx56;)V

    :cond_2a3
    return-void

    :pswitch_2a4
    check-cast p0, Lhue;

    invoke-virtual {p0}, Landroidx/recyclerview/widget/i;->getBindingAdapterPosition()I

    move-result p1

    const/4 v0, -0x1

    if-eq p1, v0, :cond_2b2

    iget-object p0, p0, Lhue;->b:Lkue;

    invoke-virtual {p0, p1}, Lkue;->a(I)V

    :cond_2b2
    return-void

    :pswitch_2b3
    check-cast p0, Lkue;

    iget-object p0, p0, Lkue;->g:Lz4k;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-array p1, v6, [Ln6h;

    new-instance v6, Lwzg;

    const/4 v0, 0x4

    const-class v1, Lpte;

    invoke-direct {v6, v4, v1, v0}, Lwzg;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object p0, p0, Lz4k;->b:Ljava/lang/Object;

    check-cast p0, Lc5k;

    iget-object p0, p0, Lo8k;->c:Lcom/opera/android/browser/OperaPageRootView;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    new-instance v5, Lzhj;

    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v12

    const/4 v7, 0x0

    const/4 v8, 0x1

    const/4 v9, -0x1

    const/4 v10, 0x0

    const/4 v11, 0x0

    invoke-direct/range {v5 .. v12}, Lzhj;-><init>(Lwzg;Landroid/os/Bundle;IILjava/lang/String;ZLjava/util/List;)V

    invoke-virtual {v5, p0}, Lzhj;->c(Landroid/content/Context;)V

    return-void

    :pswitch_2e0
    check-cast p0, Lyvd;

    invoke-virtual {p0}, Ldej;->b()V

    iget-object p1, p0, Lyvd;->i:Ljava/lang/Object;

    check-cast p1, Lvk2;

    iget-object p0, p0, Ldwd;->d:Lhb9;

    check-cast p0, Ljb9;

    iget-object p0, p0, Ljb9;->g:Ljava/lang/String;

    invoke-virtual {p1, p0}, Lvk2;->run(Ljava/lang/Object;)V

    return-void

    nop

    :pswitch_data_2f4
    .packed-switch 0x0
        :pswitch_2e0
        :pswitch_2b3
        :pswitch_2a4
        :pswitch_260
        :pswitch_246
        :pswitch_22a
        :pswitch_21c
        :pswitch_20f
        :pswitch_209
        :pswitch_203
        :pswitch_1f4
        :pswitch_1e4
        :pswitch_1b3
        :pswitch_19c
        :pswitch_18c
        :pswitch_153
        :pswitch_111
        :pswitch_e9
        :pswitch_b2
        :pswitch_8f
        :pswitch_89
        :pswitch_7a
        :pswitch_4d
        :pswitch_47
        :pswitch_41
        :pswitch_3b
        :pswitch_35
        :pswitch_2f
        :pswitch_27
    .end packed-switch
.end method
