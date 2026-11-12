.class public final Ljmn;
.super Llj;
.source "SourceFile"


# instance fields
.field public A:Lw6j;

.field public B:Lexd;

.field public C:Ll45;

.field public D:Z

.field public E:Z

.field public final F:Lcom/opera/android/settings/SettingsManager;

.field public final G:Lysj;

.field public final H:Lx4i;

.field public final I:Le4i;

.field public final J:Lg7j;

.field public K:Z

.field public final L:Lumi;

.field public final M:Lua7;

.field public N:Z

.field public O:Z

.field public P:I

.field public final r:Lqln;

.field public final s:Lonn;

.field public final t:Lpde;

.field public u:Ls14;

.field public v:Landroid/graphics/Bitmap;

.field public w:Llkn;

.field public x:Laln;

.field public y:Lh06;

.field public z:Lkmn;


# direct methods
.method public constructor <init>(Lgjm;Lqln;Lonn;Lpde;Lcom/opera/android/settings/SettingsManager;Lysj;Lumi;Lx4i;Le4i;)V
    .registers 12

    const v0, 0x7f0d047e

    invoke-static {v0}, Lu7k;->j(I)Lu7k;

    move-result-object v0

    iget-object v0, v0, Lu7k;->a:Ljava/lang/Object;

    check-cast v0, Litl;

    const v1, 0x7f10003f

    iput v1, v0, Litl;->b:I

    invoke-direct {p0, v0}, Lltl;-><init>(Litl;)V

    iput-object p2, p0, Ljmn;->r:Lqln;

    iput-object p3, p0, Ljmn;->s:Lonn;

    iput-object p4, p0, Ljmn;->t:Lpde;

    iput-object p5, p0, Ljmn;->F:Lcom/opera/android/settings/SettingsManager;

    iput-object p6, p0, Ljmn;->G:Lysj;

    iput-object p8, p0, Ljmn;->H:Lx4i;

    iput-object p9, p0, Ljmn;->I:Le4i;

    invoke-virtual {p5}, Lcom/opera/android/settings/SettingsManager;->g()Lg7j;

    move-result-object p2

    iput-object p2, p0, Ljmn;->J:Lg7j;

    iput-object p7, p0, Ljmn;->L:Lumi;

    new-instance p2, Lua7;

    invoke-direct {p2, p0, p1}, Lua7;-><init>(Landroidx/fragment/app/Fragment;Lgjm;)V

    iput-object p2, p0, Ljmn;->M:Lua7;

    return-void
.end method


# virtual methods
.method public final G0(II)V
    .registers 6

    iget-boolean v0, p0, Ljmn;->D:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    iget-object v0, p0, Ljmn;->z:Lkmn;

    iget-object v0, v0, Lkmn;->i:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    int-to-long v1, p1

    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setStartDelay(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    int-to-long v0, p2

    invoke-virtual {p1, v0, v1}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    new-instance p2, Lemn;

    const/4 v0, 0x3

    invoke-direct {p2, p0, v0}, Lemn;-><init>(Ljmn;B)V

    invoke-virtual {p1, p2}, Landroid/view/ViewPropertyAnimator;->withStartAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    new-instance p2, Lemn;

    const/4 v0, 0x1

    invoke-direct {p2, p0, v0}, Lemn;-><init>(Ljmn;B)V

    invoke-virtual {p1, p2}, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    return-void
.end method

.method public final H0()I
    .registers 2

    iget-object p0, p0, Ljmn;->M:Lua7;

    invoke-virtual {p0}, Lua7;->p()Ln37;

    move-result-object p0

    check-cast p0, Ldmn;

    iget-object p0, p0, Ldmn;->a:Lwln;

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    packed-switch p0, :pswitch_data_2e

    new-instance p0, Ljava/lang/RuntimeException;

    const/4 v0, 0x0

    invoke-direct {p0, v0, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p0

    :pswitch_18
    const/16 p0, 0xe

    return p0

    :pswitch_1b
    const/16 p0, 0xb

    return p0

    :pswitch_1e
    const/16 p0, 0xa

    return p0

    :pswitch_21
    const/16 p0, 0x9

    return p0

    :pswitch_24
    const/16 p0, 0x8

    return p0

    :pswitch_27
    const/4 p0, 0x5

    return p0

    :pswitch_29
    const/4 p0, 0x1

    return p0

    :pswitch_2b
    const/4 p0, 0x0

    return p0

    nop

    :pswitch_data_2e
    .packed-switch 0x0
        :pswitch_2b
        :pswitch_29
        :pswitch_27
        :pswitch_24
        :pswitch_21
        :pswitch_1e
        :pswitch_1b
        :pswitch_18
    .end packed-switch
.end method

.method public final I0(Landroid/view/View;)V
    .registers 14

    iget-object v0, p0, Ljmn;->C:Ll45;

    if-eqz v0, :cond_f

    iget-object v1, v0, Ll45;->c:Ljava/lang/Object;

    check-cast v1, Llmn;

    invoke-interface {v1}, Llmn;->b()V

    sget-object v1, Ll45;->g:Ldpj;

    iput-object v1, v0, Ll45;->c:Ljava/lang/Object;

    :cond_f
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const/high16 v1, 0x41000000    # 8.0f

    invoke-static {v1, v0}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v6

    const/high16 v1, 0x40000000    # 2.0f

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    const/4 v9, 0x1

    invoke-static {v9, v1, v0}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v0

    float-to-int v7, v0

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lf03;->q(Landroid/content/Context;)I

    move-result v0

    const/4 v1, -0x1

    invoke-static {v1, v6, v0}, Lj14;->E(III)Landroid/graphics/drawable/ShapeDrawable;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/View;->setElevation(F)V

    const v0, 0x3df5c28f    # 0.12f

    invoke-virtual {p1, v0}, Landroid/view/View;->setAlpha(F)V

    new-instance v8, Landroid/animation/TimeAnimator;

    invoke-direct {v8}, Landroid/animation/TimeAnimator;-><init>()V

    new-instance v0, Limn;

    invoke-direct {v0, p1}, Limn;-><init>(Landroid/view/View;)V

    invoke-virtual {v8, v0}, Landroid/animation/TimeAnimator;->setTimeListener(Landroid/animation/TimeAnimator$TimeListener;)V

    invoke-virtual {v8}, Landroid/animation/TimeAnimator;->start()V

    iget-object v0, p0, Ljmn;->t:Lpde;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/util/Size;

    invoke-virtual {v0}, Landroid/util/Size;->getWidth()I

    move-result v1

    invoke-virtual {v0}, Landroid/util/Size;->getHeight()I

    move-result v0

    new-instance v5, Lo2c;

    const/4 v10, 0x0

    invoke-direct {v5, v10, v1, v0, v10}, Lo2c;-><init>(ZIIZ)V

    new-instance v0, Ll45;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v11, p0, Ljmn;->u:Ls14;

    new-instance v2, Ljl6;

    move-object v3, p0

    move-object v4, p1

    invoke-direct/range {v2 .. v8}, Ljl6;-><init>(Ljmn;Landroid/view/View;Lo2c;IILandroid/animation/TimeAnimator;)V

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iget-object p0, v3, Ljmn;->r:Lqln;

    iput-object p0, v0, Ll45;->a:Ljava/lang/Object;

    iput-object v5, v0, Ll45;->b:Ljava/lang/Object;

    iput-object v2, v0, Ll45;->c:Ljava/lang/Object;

    iget-object p0, v2, Ljl6;->g:Ljava/lang/Object;

    check-cast p0, Ljmn;

    invoke-virtual {p0, v10}, Ljmn;->K0(Z)V

    iget-object p1, p0, Ljmn;->B:Lexd;

    if-eqz p1, :cond_8f

    sget-object v2, Lhjm;->a:Lhjm;

    invoke-virtual {p1, v2}, Llz3;->b(Lhjm;)Z

    :cond_8f
    const/4 p1, 0x0

    iput-object p1, p0, Ljmn;->y:Lh06;

    invoke-virtual {p0}, Ljmn;->O0()V

    new-instance p0, Lilm;

    const/16 p1, 0xc

    invoke-direct {p0, v0, p1}, Lilm;-><init>(Ljava/lang/Object;B)V

    new-instance p1, Ls2g;

    const/16 v2, 0xf

    invoke-direct {p1, v0, v1, p0, v2}, Ls2g;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object p0, v11, Ls14;->f:Ljava/lang/Object;

    check-cast p0, Lqmn;

    instance-of v1, p0, Lomn;

    if-eqz v1, :cond_af

    invoke-virtual {p1, p0}, Ls2g;->run(Ljava/lang/Object;)V

    goto :goto_ca

    :cond_af
    iget-object p0, v11, Ls14;->e:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-boolean p0, v11, Ls14;->b:Z

    if-nez p0, :cond_ca

    iput-boolean v9, v11, Ls14;->b:Z

    iget-object p0, v11, Ls14;->d:Ljava/lang/Object;

    check-cast p0, Lmmn;

    new-instance p1, Lilm;

    const/16 v1, 0xd

    invoke-direct {p1, v11, v1}, Lilm;-><init>(Ljava/lang/Object;B)V

    invoke-interface {p0, p1}, Lmmn;->d(Lilm;)V

    :cond_ca
    :goto_ca
    iput-object v0, v3, Ljmn;->C:Ll45;

    return-void
.end method

.method public final J0(Lkkn;)V
    .registers 8

    iget-object v0, p0, Ljmn;->v:Landroid/graphics/Bitmap;

    const/4 v1, 0x0

    if-nez v0, :cond_47

    iget-object v0, p0, Ljmn;->w:Llkn;

    if-nez v0, :cond_d

    invoke-virtual {p0}, Ljmn;->L0()V

    return-void

    :cond_d
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object v0

    invoke-static {v0}, Lr9n;->o(Landroidx/fragment/app/r;)I

    move-result v0

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object v2

    invoke-static {v2}, Lr9n;->m(Landroidx/fragment/app/r;)I

    move-result v2

    sget-object v3, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v0, v2, v3}, Lz5i;->u(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v3

    iput-object v3, p0, Ljmn;->v:Landroid/graphics/Bitmap;

    if-nez v3, :cond_2b

    invoke-virtual {p0}, Ljmn;->L0()V

    return-void

    :cond_2b
    new-instance v3, Landroid/graphics/Canvas;

    iget-object v4, p0, Ljmn;->v:Landroid/graphics/Bitmap;

    invoke-direct {v3, v4}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    iget-object v4, p0, Ljmn;->w:Llkn;

    invoke-virtual {v4}, Landroid/graphics/drawable/Drawable;->copyBounds()Landroid/graphics/Rect;

    move-result-object v4

    iget-object v5, p0, Ljmn;->w:Llkn;

    invoke-virtual {v5, v1, v1, v0, v2}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    iget-object v0, p0, Ljmn;->w:Llkn;

    invoke-virtual {v0, v3}, Llkn;->draw(Landroid/graphics/Canvas;)V

    iget-object v0, p0, Ljmn;->w:Llkn;

    invoke-virtual {v0, v4}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    :cond_47
    const/4 v0, 0x1

    iput-boolean v0, p0, Ljmn;->N:Z

    new-instance v2, Lw0a;

    const/4 v3, 0x6

    invoke-direct {v2, v3}, Lw0a;-><init>(B)V

    iget-object v3, p0, Ljmn;->G:Lysj;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v4, Lijm;->b:Lijm;

    invoke-virtual {v3, v2, v4}, Lr22;->b(Ljjm;Lijm;)V

    new-instance v3, Lfmn;

    invoke-direct {v3, p0, p1, v1}, Lfmn;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object p1, p0, Ljmn;->L:Lumi;

    invoke-interface {p1, v3}, Ltcl;->c(Ljava/lang/Runnable;)Lnml;

    move-result-object v1

    new-instance v3, Lfmn;

    invoke-direct {v3, p0, v2, v0}, Lfmn;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-interface {p1, v3}, Ltcl;->d(Ljava/lang/Runnable;)Lnml;

    move-result-object p0

    invoke-virtual {v1, p0}, Lnml;->b(Lnml;)V

    const/4 p0, 0x0

    invoke-virtual {v1, p0}, Lnml;->a(Ljava/lang/Object;)Loml;

    return-void
.end method

.method public final K0(Z)V
    .registers 6

    iget-object v0, p0, Ljmn;->z:Lkmn;

    iget-object v0, v0, Lkmn;->g:Landroid/widget/FrameLayout;

    const/4 v1, 0x0

    const/16 v2, 0x8

    if-eqz p1, :cond_b

    move v3, v2

    goto :goto_c

    :cond_b
    move v3, v1

    :goto_c
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Ljmn;->z:Lkmn;

    iget-object v0, v0, Lkmn;->l:Landroid/widget/LinearLayout;

    if-eqz p1, :cond_17

    move v3, v2

    goto :goto_18

    :cond_17
    move v3, v1

    :goto_18
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Ljmn;->z:Lkmn;

    iget-object v0, v0, Lkmn;->h:Landroidx/constraintlayout/widget/ConstraintLayout;

    if-eqz p1, :cond_23

    move v3, v1

    goto :goto_24

    :cond_23
    move v3, v2

    :goto_24
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    iget-object p0, p0, Ljmn;->z:Lkmn;

    iget-object p0, p0, Lkmn;->o:Lcom/google/android/material/button/MaterialButton;

    if-nez p1, :cond_2e

    move v1, v2

    :cond_2e
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method public final L0()V
    .registers 3

    const v0, 0x7f140f3f

    const/16 v1, 0x9c4

    iget-object p0, p0, Ljmn;->G:Lysj;

    invoke-static {v0, v1, p0}, Lam2;->i(IILysj;)Lglj;

    move-result-object v0

    sget-object v1, Lijm;->b:Lijm;

    invoke-virtual {p0, v0, v1}, Lr22;->b(Ljjm;Lijm;)V

    return-void
.end method

.method public final M0()V
    .registers 6

    iget-object v0, p0, Ljmn;->x:Laln;

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_10

    invoke-interface {v0}, Laln;->b()Lg7j;

    move-result-object v0

    iget-object v3, p0, Ljmn;->J:Lg7j;

    if-eq v0, v3, :cond_10

    move v0, v1

    goto :goto_11

    :cond_10
    move v0, v2

    :goto_11
    iget-object v3, p0, Ljmn;->z:Lkmn;

    iget-object v3, v3, Lkmn;->a:Landroid/widget/FrameLayout;

    invoke-virtual {v3}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v3

    iget v3, v3, Landroid/content/res/Configuration;->orientation:I

    const/4 v4, 0x2

    if-eq v3, v4, :cond_23

    move v1, v2

    :cond_23
    iget-object v3, p0, Ljmn;->z:Lkmn;

    const/16 v4, 0x8

    if-eqz v0, :cond_45

    if-eqz v1, :cond_38

    iget-object v0, v3, Lkmn;->e:Landroid/widget/Space;

    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    iget-object p0, p0, Ljmn;->z:Lkmn;

    iget-object p0, p0, Lkmn;->d:Landroid/widget/Space;

    invoke-virtual {p0, v2}, Landroid/view/View;->setVisibility(I)V

    return-void

    :cond_38
    iget-object v0, v3, Lkmn;->e:Landroid/widget/Space;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    iget-object p0, p0, Ljmn;->z:Lkmn;

    iget-object p0, p0, Lkmn;->d:Landroid/widget/Space;

    invoke-virtual {p0, v4}, Landroid/view/View;->setVisibility(I)V

    return-void

    :cond_45
    iget-object v0, v3, Lkmn;->e:Landroid/widget/Space;

    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    iget-object p0, p0, Ljmn;->z:Lkmn;

    iget-object p0, p0, Lkmn;->d:Landroid/widget/Space;

    invoke-virtual {p0, v4}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method public final N0(Laln;)V
    .registers 3

    invoke-interface {p1}, Laln;->getId()Ljava/lang/String;

    move-result-object p1

    iget-object v0, p0, Ljmn;->r:Lqln;

    iget-object v0, v0, Lqln;->j:Lvzk;

    iget-object v0, v0, Lvzk;->d:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result p1

    const v0, 0x7f0a0cca

    if-eqz p1, :cond_30

    invoke-virtual {p0, v0}, Lltl;->r0(I)Landroid/view/MenuItem;

    move-result-object p1

    const v0, 0x7f080552

    invoke-interface {p1, v0}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    move-result-object p1

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lf03;->C(Landroid/content/Context;)I

    move-result p0

    invoke-static {p0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p0

    invoke-interface {p1, p0}, Landroid/view/MenuItem;->setIconTintList(Landroid/content/res/ColorStateList;)Landroid/view/MenuItem;

    return-void

    :cond_30
    invoke-virtual {p0, v0}, Lltl;->r0(I)Landroid/view/MenuItem;

    move-result-object p1

    const v0, 0x7f080551

    invoke-interface {p1, v0}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    move-result-object p1

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lf03;->v(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object p0

    invoke-interface {p1, p0}, Landroid/view/MenuItem;->setIconTintList(Landroid/content/res/ColorStateList;)Landroid/view/MenuItem;

    return-void
.end method

.method public final O0()V
    .registers 4

    iget-object v0, p0, Lltl;->l:Landroidx/appcompat/widget/Toolbar;

    invoke-virtual {v0}, Landroid/view/View;->isInLayout()Z

    move-result v0

    if-eqz v0, :cond_14

    iget-object v0, p0, Lltl;->l:Landroidx/appcompat/widget/Toolbar;

    new-instance v1, Lemn;

    const/4 v2, 0x2

    invoke-direct {v1, p0, v2}, Lemn;-><init>(Ljmn;B)V

    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    return-void

    :cond_14
    const v0, 0x7f0a0cce

    invoke-virtual {p0, v0}, Lltl;->r0(I)Landroid/view/MenuItem;

    move-result-object v0

    iget-object p0, p0, Ljmn;->y:Lh06;

    if-eqz p0, :cond_29

    iget-object v1, p0, Lh06;->e:Ljava/lang/String;

    if-nez v1, :cond_27

    iget-object p0, p0, Lh06;->c:Ljava/lang/String;

    if-eqz p0, :cond_29

    :cond_27
    const/4 p0, 0x1

    goto :goto_2a

    :cond_29
    const/4 p0, 0x0

    :goto_2a
    invoke-interface {v0, p0}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    return-void
.end method

.method public final P0(Landroid/content/res/Configuration;)V
    .registers 4

    iget p1, p1, Landroid/content/res/Configuration;->orientation:I

    const/4 v0, 0x2

    if-ne p1, v0, :cond_2c

    iget-object p1, p0, Ljmn;->z:Lkmn;

    iget-object p1, p1, Lkmn;->c:Landroid/widget/LinearLayout;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    iget-object p1, p0, Ljmn;->z:Lkmn;

    iget-object p1, p1, Lkmn;->q:Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    check-cast p1, Landroid/widget/LinearLayout$LayoutParams;

    iput v0, p1, Landroid/widget/LinearLayout$LayoutParams;->width:I

    const/high16 v1, 0x3f800000    # 1.0f

    iput v1, p1, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    iget-object p1, p0, Ljmn;->z:Lkmn;

    iget-object p1, p1, Lkmn;->l:Landroid/widget/LinearLayout;

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    check-cast p1, Landroid/widget/LinearLayout$LayoutParams;

    iput v0, p1, Landroid/widget/LinearLayout$LayoutParams;->width:I

    iput v1, p1, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    goto :goto_55

    :cond_2c
    const/4 v0, 0x1

    if-ne p1, v0, :cond_55

    iget-object p1, p0, Ljmn;->z:Lkmn;

    iget-object p1, p1, Lkmn;->c:Landroid/widget/LinearLayout;

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    iget-object p1, p0, Ljmn;->z:Lkmn;

    iget-object p1, p1, Lkmn;->q:Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    check-cast p1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v0, -0x1

    iput v0, p1, Landroid/widget/LinearLayout$LayoutParams;->width:I

    const/high16 v1, -0x40800000    # -1.0f

    iput v1, p1, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    iget-object p1, p0, Ljmn;->z:Lkmn;

    iget-object p1, p1, Lkmn;->l:Landroid/widget/LinearLayout;

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    check-cast p1, Landroid/widget/LinearLayout$LayoutParams;

    iput v0, p1, Landroid/widget/LinearLayout$LayoutParams;->width:I

    iput v1, p1, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    :cond_55
    :goto_55
    invoke-virtual {p0}, Ljmn;->M0()V

    return-void
.end method

.method public final Q0()V
    .registers 5

    iget-object v0, p0, Ljmn;->z:Lkmn;

    iget-object v0, v0, Lkmn;->k:Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {v0}, Lcom/google/android/material/button/MaterialButton;->z()Z

    move-result v1

    if-eqz v1, :cond_34

    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f07013a

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    invoke-virtual {v0}, Lcom/google/android/material/button/MaterialButton;->z()Z

    move-result v2

    if-eqz v2, :cond_34

    iget-object v0, v0, Lcom/google/android/material/button/MaterialButton;->e:Lhdd;

    iget-boolean v2, v0, Lhdd;->r:Z

    if-eqz v2, :cond_25

    iget v2, v0, Lhdd;->i:I

    if-eq v2, v1, :cond_34

    :cond_25
    iput v1, v0, Lhdd;->i:I

    const/4 v2, 0x1

    iput-boolean v2, v0, Lhdd;->r:Z

    iget-object v2, v0, Lhdd;->b:Lqaj;

    int-to-float v1, v1

    invoke-interface {v2, v1}, Lqaj;->a(F)Lsaj;

    move-result-object v1

    invoke-virtual {v0, v1}, Lhdd;->b(Lqaj;)V

    :cond_34
    iget v0, p0, Ljmn;->P:I

    const/4 v1, 0x0

    if-nez v0, :cond_61

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lr9n;->H(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_61

    iget-object v0, p0, Ljmn;->z:Lkmn;

    iget-object v0, v0, Lkmn;->k:Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f150225

    invoke-static {v3, v2, v1}, Lsaj;->g(ILandroid/content/Context;I)Lala;

    move-result-object v2

    invoke-virtual {v2}, Lala;->i()Lsaj;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/google/android/material/button/MaterialButton;->k(Lsaj;)V

    iget-object p0, p0, Ljmn;->z:Lkmn;

    iget-object p0, p0, Lkmn;->m:Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    return-void

    :cond_61
    iget-object v0, p0, Ljmn;->z:Lkmn;

    iget-object v0, v0, Lkmn;->k:Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f150307

    invoke-static {v3, v2, v1}, Lsaj;->g(ILandroid/content/Context;I)Lala;

    move-result-object v1

    invoke-virtual {v1}, Lala;->i()Lsaj;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/material/button/MaterialButton;->k(Lsaj;)V

    iget-object p0, p0, Ljmn;->z:Lkmn;

    iget-object p0, p0, Lkmn;->m:Lcom/google/android/material/button/MaterialButton;

    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method public final g0()V
    .registers 4

    iget-boolean v0, p0, Ljmn;->N:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    iget-object v0, p0, Ljmn;->F:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v0}, Lcom/opera/android/settings/SettingsManager;->g()Lg7j;

    move-result-object v1

    iget-object v2, p0, Ljmn;->J:Lg7j;

    if-eq v1, v2, :cond_13

    const/4 v1, 0x0

    invoke-virtual {v0, v2, v1}, Lcom/opera/android/settings/SettingsManager;->U(Lg7j;Z)V

    :cond_13
    invoke-super {p0}, Lryl;->g0()V

    return-void
.end method

.method public final l0(Z)V
    .registers 3

    iget-object v0, p0, Ljmn;->B:Lexd;

    if-eqz v0, :cond_a

    sget-object p0, Lhjm;->a:Lhjm;

    invoke-virtual {v0, p0}, Llz3;->b(Lhjm;)Z

    return-void

    :cond_a
    invoke-super {p0, p1}, Lk24;->l0(Z)V

    return-void
.end method

.method public final onConfigurationChanged(Landroid/content/res/Configuration;)V
    .registers 2

    invoke-super {p0, p1}, Lltl;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    invoke-virtual {p0, p1}, Ljmn;->P0(Landroid/content/res/Configuration;)V

    return-void
.end method

.method public final onCreate(Landroid/os/Bundle;)V
    .registers 3

    invoke-super {p0, p1}, Lltl;->onCreate(Landroid/os/Bundle;)V

    iget-object p1, p0, Ljmn;->M:Lua7;

    invoke-virtual {p1}, Lua7;->p()Ln37;

    move-result-object p1

    check-cast p1, Ldmn;

    iget-object p1, p1, Ldmn;->a:Lwln;

    iget-object p0, p0, Ljmn;->s:Lonn;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lnnn;

    invoke-direct {v0, p1}, Lnnn;-><init>(Lwln;)V

    iput-object v0, p0, Lonn;->h:Lnnn;

    return-void
.end method

.method public final onDetach()V
    .registers 7

    invoke-super {p0}, Lk24;->onDetach()V

    iget-object v0, p0, Ljmn;->x:Laln;

    iget-object v1, p0, Ljmn;->s:Lonn;

    if-eqz v0, :cond_11

    invoke-interface {v0}, Laln;->getId()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Lonn;->b(Ljava/lang/String;)V

    goto :goto_16

    :cond_11
    const-string v0, "failed_to_load"

    invoke-virtual {v1, v0}, Lonn;->b(Ljava/lang/String;)V

    :goto_16
    iget-boolean v0, p0, Ljmn;->E:Z

    iget-object v1, p0, Ljmn;->M:Lua7;

    iget-object v2, p0, Ljmn;->r:Lqln;

    if-nez v0, :cond_51

    iget-object v0, p0, Ljmn;->x:Laln;

    if-eqz v0, :cond_51

    invoke-virtual {v1}, Lua7;->p()Ln37;

    move-result-object v0

    check-cast v0, Ldmn;

    iget-object v0, v0, Ldmn;->b:Lcmn;

    iget-boolean v0, v0, Lcmn;->d:Z

    if-nez v0, :cond_51

    iget-object v0, p0, Ljmn;->x:Laln;

    invoke-interface {v0}, Laln;->getId()Ljava/lang/String;

    move-result-object v0

    iget-object v3, v2, Lqln;->j:Lvzk;

    iget-object v3, v3, Lvzk;->d:Ljava/lang/Object;

    check-cast v3, Ljava/util/ArrayList;

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_51

    iget-object v0, v2, Lqln;->f:Lami;

    iget-object v3, p0, Ljmn;->x:Laln;

    invoke-interface {v3}, Laln;->getId()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Lrl;

    const/4 v5, 0x4

    invoke-direct {v4, v5}, Lrl;-><init>(B)V

    invoke-virtual {v0, v3, v4}, Lami;->f(Ljava/lang/String;Ljava/lang/Runnable;)V

    :cond_51
    iget-boolean v0, p0, Ljmn;->E:Z

    const/4 v3, 0x0

    if-nez v0, :cond_63

    iget-object v0, p0, Ljmn;->F:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v0}, Lcom/opera/android/settings/SettingsManager;->g()Lg7j;

    move-result-object v4

    iget-object v5, p0, Ljmn;->J:Lg7j;

    if-eq v4, v5, :cond_63

    invoke-virtual {v0, v5, v3}, Lcom/opera/android/settings/SettingsManager;->U(Lg7j;Z)V

    :cond_63
    iget-object v0, p0, Ljmn;->x:Laln;

    if-eqz v0, :cond_85

    iget-boolean v0, p0, Ljmn;->E:Z

    if-eqz v0, :cond_85

    invoke-virtual {v2}, Lqln;->g()Z

    move-result v0

    if-eqz v0, :cond_85

    iget-object v0, p0, Ljmn;->x:Laln;

    invoke-interface {v0}, Laln;->f()I

    move-result v0

    invoke-static {v0}, Lam2;->c(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2}, Lqln;->f()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_87

    :cond_85
    move v0, v3

    goto :goto_88

    :cond_87
    const/4 v0, 0x1

    :goto_88
    if-eqz v0, :cond_8d

    invoke-virtual {v2, v3}, Lqln;->o(Z)V

    :cond_8d
    sget-object v2, Lijm;->b:Lijm;

    const/16 v3, 0x9c4

    iget-object v4, p0, Ljmn;->G:Lysj;

    if-eqz v0, :cond_a3

    new-instance v0, Lglj;

    const v5, 0x7f141442

    invoke-direct {v0, v5, v3}, Lglj;-><init>(II)V

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v4, v0, v2}, Lr22;->b(Ljjm;Lijm;)V

    :cond_a3
    iget-boolean p0, p0, Ljmn;->E:Z

    if-eqz p0, :cond_cb

    invoke-virtual {v1}, Lua7;->p()Ln37;

    move-result-object p0

    check-cast p0, Ldmn;

    iget-object p0, p0, Ldmn;->a:Lwln;

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    packed-switch p0, :pswitch_data_cc

    new-instance p0, Ljava/lang/RuntimeException;

    const/4 v0, 0x0

    invoke-direct {p0, v0, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p0

    :pswitch_bd
    new-instance p0, Lglj;

    const v0, 0x7f141453

    invoke-direct {p0, v0, v3}, Lglj;-><init>(II)V

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v4, p0, v2}, Lr22;->b(Ljjm;Lijm;)V

    :cond_cb
    :pswitch_cb
    return-void

    :pswitch_data_cc
    .packed-switch 0x0
        :pswitch_cb
        :pswitch_cb
        :pswitch_cb
        :pswitch_bd
        :pswitch_cb
        :pswitch_cb
        :pswitch_bd
        :pswitch_bd
    .end packed-switch
.end method

.method public final onMenuItemClick(Landroid/view/MenuItem;)Z
    .registers 13

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    const v3, 0x7f0a0cce

    if-ne v0, v3, :cond_122

    iget-object p1, p0, Lltl;->l:Landroidx/appcompat/widget/Toolbar;

    invoke-virtual {p1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    iget-object v0, p0, Ljmn;->B:Lexd;

    if-eqz v0, :cond_1a

    sget-object v3, Lhjm;->a:Lhjm;

    invoke-virtual {v0, v3}, Llz3;->b(Lhjm;)Z

    :cond_1a
    iget-object v0, p0, Ljmn;->y:Lh06;

    if-eqz v0, :cond_121

    iget-object v3, v0, Lh06;->e:Ljava/lang/String;

    if-nez v3, :cond_26

    iget-object v3, v0, Lh06;->c:Ljava/lang/String;

    if-eqz v3, :cond_121

    :cond_26
    new-instance v4, Lexd;

    iget-object v3, p0, Ljmn;->z:Lkmn;

    iget-object v5, v3, Lkmn;->f:Landroid/widget/FrameLayout;

    new-instance v9, Ll11;

    const/high16 v3, 0x41000000    # 8.0f

    invoke-virtual {v5}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    invoke-static {v3, v6}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v3

    invoke-direct {v9, p1, v2, v3}, Ll11;-><init>(Landroid/view/View;II)V

    const v6, 0x7f0d0226

    const-wide/16 v7, 0x1

    invoke-direct/range {v4 .. v9}, Lexd;-><init>(Landroid/view/ViewGroup;IJLhxj;)V

    iget-object p1, v4, Llz3;->b:Lcom/opera/android/bubbleview/BubbleView;

    const v3, 0x7f0a06b5

    invoke-virtual {p1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iget-object v3, v0, Lh06;->a:Ljava/lang/String;

    iget-object v5, v0, Lh06;->b:Ljava/lang/String;

    invoke-static {p1, v3, v5}, Lexd;->g(Landroid/widget/TextView;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v3

    iget-object v5, v0, Lh06;->d:Ljava/lang/String;

    iget-object v6, v0, Lh06;->a:Ljava/lang/String;

    if-eqz v5, :cond_60

    invoke-static {p1, v6, v5}, Lexd;->g(Landroid/widget/TextView;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v6

    :cond_60
    iget-object v7, v0, Lh06;->e:Ljava/lang/String;

    iget-object v8, v0, Lh06;->f:Ljava/lang/String;

    invoke-static {p1, v7, v8}, Lexd;->g(Landroid/widget/TextView;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v7

    iget-object v0, v0, Lh06;->c:Ljava/lang/String;

    invoke-static {p1, v0, v5}, Lexd;->g(Landroid/widget/TextView;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v0

    const/4 v5, 0x2

    const v8, 0x7f14144d

    if-eqz v3, :cond_96

    if-eqz v7, :cond_96

    if-eqz v0, :cond_96

    invoke-interface {v7}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_96

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    new-array v3, v5, [Ljava/lang/CharSequence;

    aput-object v6, v3, v1

    aput-object v7, v3, v2

    invoke-static {v0, v8, v3}, Lphj;->X(Landroid/content/Context;I[Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    move-result-object v0

    goto/16 :goto_10f

    :cond_96
    if-eqz v3, :cond_b1

    if-eqz v7, :cond_b1

    if-eqz v0, :cond_b1

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v6

    const/4 v8, 0x3

    new-array v8, v8, [Ljava/lang/CharSequence;

    aput-object v3, v8, v1

    aput-object v7, v8, v2

    aput-object v0, v8, v5

    const v0, 0x7f14144e

    invoke-static {v6, v0, v8}, Lphj;->X(Landroid/content/Context;I[Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    move-result-object v0

    goto :goto_10f

    :cond_b1
    if-eqz v3, :cond_d8

    if-eqz v7, :cond_c4

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    new-array v6, v5, [Ljava/lang/CharSequence;

    aput-object v3, v6, v1

    aput-object v7, v6, v2

    invoke-static {v0, v8, v6}, Lphj;->X(Landroid/content/Context;I[Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    move-result-object v0

    goto :goto_10f

    :cond_c4
    if-eqz v0, :cond_d8

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v6

    new-array v7, v5, [Ljava/lang/CharSequence;

    aput-object v3, v7, v1

    aput-object v0, v7, v2

    const v0, 0x7f14144f

    invoke-static {v6, v0, v7}, Lphj;->X(Landroid/content/Context;I[Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    move-result-object v0

    goto :goto_10f

    :cond_d8
    if-eqz v7, :cond_fe

    if-eqz v0, :cond_ee

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    new-array v6, v5, [Ljava/lang/CharSequence;

    aput-object v7, v6, v1

    aput-object v0, v6, v2

    const v0, 0x7f14144a

    invoke-static {v3, v0, v6}, Lphj;->X(Landroid/content/Context;I[Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    move-result-object v0

    goto :goto_10f

    :cond_ee
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    new-array v3, v2, [Ljava/lang/CharSequence;

    aput-object v7, v3, v1

    const v1, 0x7f141449

    invoke-static {v0, v1, v3}, Lphj;->X(Landroid/content/Context;I[Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    move-result-object v0

    goto :goto_10f

    :cond_fe
    if-eqz v0, :cond_112

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    new-array v6, v2, [Ljava/lang/CharSequence;

    aput-object v0, v6, v1

    const v0, 0x7f14144c

    invoke-static {v3, v0, v6}, Lphj;->X(Landroid/content/Context;I[Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    move-result-object v0

    :goto_10f
    invoke-static {p1, v0}, Lphj;->u0(Landroid/widget/TextView;Ljava/lang/CharSequence;)V

    :cond_112
    iput-object v4, p0, Ljmn;->B:Lexd;

    new-instance p1, Lq22;

    invoke-direct {p1, p0, v5}, Lq22;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v4, p1}, Llz3;->a(Lkz3;)V

    iget-object p0, p0, Ljmn;->B:Lexd;

    invoke-virtual {p0}, Llz3;->f()V

    :cond_121
    return v2

    :cond_122
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p1

    const v0, 0x7f0a0cca

    if-ne p1, v0, :cond_162

    iget-object p1, p0, Ljmn;->x:Laln;

    if-nez p1, :cond_130

    return v2

    :cond_130
    invoke-interface {p1}, Laln;->getId()Ljava/lang/String;

    move-result-object p1

    iget-object v0, p0, Ljmn;->r:Lqln;

    iget-object v1, v0, Lqln;->j:Lvzk;

    iget-object v1, v1, Lvzk;->d:Ljava/lang/Object;

    check-cast v1, Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result p1

    iget-object v1, p0, Ljmn;->x:Laln;

    if-eqz p1, :cond_14c

    invoke-interface {v1}, Laln;->getId()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Lqln;->m(Ljava/lang/String;)V

    goto :goto_15c

    :cond_14c
    invoke-interface {v1}, Laln;->getId()Ljava/lang/String;

    move-result-object p1

    iget-object v0, v0, Lqln;->j:Lvzk;

    iget-object v1, v0, Lvzk;->d:Ljava/lang/Object;

    check-cast v1, Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v0}, Lvzk;->i0()V

    :goto_15c
    iget-object p1, p0, Ljmn;->x:Laln;

    invoke-virtual {p0, p1}, Ljmn;->N0(Laln;)V

    return v2

    :cond_162
    return v1
.end method

.method public final x0(Litd;)V
    .registers 2

    invoke-virtual {p0}, Ljmn;->O0()V

    return-void
.end method

.method public final y0(Landroid/view/LayoutInflater;Lcom/opera/android/StatusBarDrawingFrameLayout;)V
    .registers 26

    move-object/from16 v0, p0

    const v1, 0x7f0a01a6

    move-object/from16 v2, p2

    invoke-virtual {v2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    const v2, 0x7f0a0114

    invoke-static {v2, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object v6, v3

    check-cast v6, Lcom/opera/android/widget/AspectRatioLayout;

    if-eqz v6, :cond_1ff

    const v2, 0x7f0a0182

    invoke-static {v2, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object v7, v3

    check-cast v7, Landroid/widget/LinearLayout;

    if-eqz v7, :cond_1ff

    const v2, 0x7f0a0183

    invoke-static {v2, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object v8, v3

    check-cast v8, Landroid/widget/Space;

    if-eqz v8, :cond_1ff

    const v2, 0x7f0a0185

    invoke-static {v2, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object v9, v3

    check-cast v9, Landroid/widget/Space;

    if-eqz v9, :cond_1ff

    move-object v5, v1

    check-cast v5, Landroid/widget/FrameLayout;

    const v2, 0x7f0a0269

    invoke-static {v2, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object v11, v3

    check-cast v11, Landroid/widget/FrameLayout;

    if-eqz v11, :cond_1ff

    const v2, 0x7f0a03aa

    invoke-static {v2, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object v12, v3

    check-cast v12, Landroidx/constraintlayout/widget/ConstraintLayout;

    if-eqz v12, :cond_1ff

    const v2, 0x7f0a03ac

    invoke-static {v2, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    if-eqz v3, :cond_1ff

    const v2, 0x7f0a03ad

    invoke-static {v2, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    if-eqz v3, :cond_1ff

    const v2, 0x7f0a03b7

    invoke-static {v2, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    if-eqz v3, :cond_1ff

    const v2, 0x7f0a0835

    invoke-static {v2, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object v13, v3

    check-cast v13, Landroid/widget/TextView;

    if-eqz v13, :cond_1ff

    const v2, 0x7f0a085d

    invoke-static {v2, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v14

    if-eqz v14, :cond_1ff

    const v2, 0x7f0a097f

    invoke-static {v2, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object v15, v3

    check-cast v15, Lcom/google/android/material/button/MaterialButton;

    if-eqz v15, :cond_1ff

    const v2, 0x7f0a0980

    invoke-static {v2, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object/from16 v16, v3

    check-cast v16, Landroid/widget/LinearLayout;

    if-eqz v16, :cond_1ff

    const v2, 0x7f0a0981

    invoke-static {v2, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object/from16 v17, v3

    check-cast v17, Lcom/google/android/material/button/MaterialButton;

    if-eqz v17, :cond_1ff

    const v2, 0x7f0a0bba

    invoke-static {v2, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object/from16 v18, v3

    check-cast v18, Lcom/opera/android/custom_views/LayoutDirectionToolbar;

    if-eqz v18, :cond_1ff

    const v2, 0x7f0a0bfb

    invoke-static {v2, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object/from16 v19, v3

    check-cast v19, Lcom/google/android/material/button/MaterialButton;

    if-eqz v19, :cond_1ff

    const v2, 0x7f0a0c56

    invoke-static {v2, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object/from16 v20, v3

    check-cast v20, Lcom/google/android/material/button/MaterialButton;

    if-eqz v20, :cond_1ff

    const v2, 0x7f0a0cd0

    invoke-static {v2, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object/from16 v21, v3

    check-cast v21, Landroidx/constraintlayout/widget/ConstraintLayout;

    if-eqz v21, :cond_1ff

    const v2, 0x7f0a0cd1

    invoke-static {v2, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    if-eqz v3, :cond_1ff

    const v2, 0x7f0a0cd2

    invoke-static {v2, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object/from16 v22, v3

    check-cast v22, Lcom/opera/android/ui/catalog/widget/OperaSwitch;

    if-eqz v22, :cond_1ff

    new-instance v4, Lkmn;

    move-object v10, v5

    invoke-direct/range {v4 .. v22}, Lkmn;-><init>(Landroid/widget/FrameLayout;Lcom/opera/android/widget/AspectRatioLayout;Landroid/widget/LinearLayout;Landroid/widget/Space;Landroid/widget/Space;Landroid/widget/FrameLayout;Landroid/widget/FrameLayout;Landroidx/constraintlayout/widget/ConstraintLayout;Landroid/widget/TextView;Landroid/view/View;Lcom/google/android/material/button/MaterialButton;Landroid/widget/LinearLayout;Lcom/google/android/material/button/MaterialButton;Lcom/opera/android/custom_views/LayoutDirectionToolbar;Lcom/google/android/material/button/MaterialButton;Lcom/google/android/material/button/MaterialButton;Landroidx/constraintlayout/widget/ConstraintLayout;Lcom/opera/android/ui/catalog/widget/OperaSwitch;)V

    iput-object v4, v0, Ljmn;->z:Lkmn;

    const v1, 0x7f0a0a8f

    invoke-virtual {v5, v1}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_112

    check-cast v2, Latj;

    goto :goto_127

    :cond_112
    invoke-virtual {v5}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    instance-of v3, v2, Landroid/view/View;

    const/4 v4, 0x0

    if-eqz v3, :cond_11e

    check-cast v2, Landroid/view/View;

    goto :goto_11f

    :cond_11e
    move-object v2, v4

    :goto_11f
    if-eqz v2, :cond_126

    invoke-static {v2}, Lxug;->k(Landroid/view/View;)Latj;

    move-result-object v2

    goto :goto_127

    :cond_126
    move-object v2, v4

    :goto_127
    if-nez v2, :cond_131

    new-instance v2, Latj;

    invoke-direct {v2, v5}, Latj;-><init>(Landroid/view/View;)V

    invoke-virtual {v5, v1, v2}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    :cond_131
    iget-object v1, v0, Ljmn;->z:Lkmn;

    iget-object v1, v1, Lkmn;->k:Lcom/google/android/material/button/MaterialButton;

    iget-object v3, v2, Latj;->c:Ljava/util/LinkedHashSet;

    invoke-interface {v3, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_140

    invoke-virtual {v2}, Latj;->b()V

    :cond_140
    iget-object v1, v0, Ljmn;->M:Lua7;

    invoke-virtual {v1}, Lua7;->p()Ln37;

    move-result-object v2

    check-cast v2, Ldmn;

    iget-object v2, v2, Ldmn;->b:Lcmn;

    iget v3, v2, Lcmn;->c:I

    iput v3, v0, Ljmn;->P:I

    new-instance v4, Ls14;

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v6

    iget-object v7, v2, Lcmn;->a:Ljava/lang/String;

    iget-object v8, v2, Lcmn;->b:Ljava/lang/String;

    invoke-virtual {v1}, Lua7;->p()Ln37;

    move-result-object v1

    check-cast v1, Ldmn;

    iget-object v1, v1, Ldmn;->a:Lwln;

    sget-object v2, Lwln;->g:Lwln;

    const/4 v3, 0x1

    const/4 v10, 0x0

    if-ne v1, v2, :cond_16c

    move v9, v3

    goto :goto_16d

    :cond_16c
    move v9, v10

    :goto_16d
    iget-object v5, v0, Ljmn;->r:Lqln;

    invoke-direct/range {v4 .. v9}, Ls14;-><init>(Lqln;Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;Z)V

    iput-object v4, v0, Ljmn;->u:Ls14;

    new-instance v1, Lw6j;

    iget-object v2, v0, Ljmn;->z:Lkmn;

    iget-object v2, v2, Lkmn;->j:Landroid/view/View;

    new-instance v4, Lemn;

    invoke-direct {v4, v0, v10}, Lemn;-><init>(Ljmn;B)V

    invoke-direct {v1, v2, v4}, Lw6j;-><init>(Landroid/view/View;Lemn;)V

    iput-object v1, v0, Ljmn;->A:Lw6j;

    iget-object v1, v0, Ljmn;->z:Lkmn;

    iget-object v1, v1, Lkmn;->j:Landroid/view/View;

    new-instance v2, Lgmn;

    invoke-direct {v2, v0, v10}, Lgmn;-><init>(Ljmn;B)V

    invoke-static {v1}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object v4

    if-eqz v4, :cond_196

    invoke-static {v4, v1, v2}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    :cond_196
    iget-object v1, v0, Ljmn;->z:Lkmn;

    iget-object v1, v1, Lkmn;->o:Lcom/google/android/material/button/MaterialButton;

    new-instance v2, Lhmn;

    invoke-direct {v2, v0, v10}, Lhmn;-><init>(Ljmn;B)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v1, v0, Ljmn;->z:Lkmn;

    iget-object v1, v1, Lkmn;->k:Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {v1, v10}, Landroid/view/View;->setEnabled(Z)V

    iget-object v1, v0, Ljmn;->z:Lkmn;

    iget-object v1, v1, Lkmn;->k:Lcom/google/android/material/button/MaterialButton;

    new-instance v2, Lhmn;

    invoke-direct {v2, v0, v3}, Lhmn;-><init>(Ljmn;B)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v1, v0, Ljmn;->z:Lkmn;

    iget-object v1, v1, Lkmn;->m:Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {v1, v10}, Landroid/view/View;->setEnabled(Z)V

    iget-object v1, v0, Ljmn;->z:Lkmn;

    iget-object v1, v1, Lkmn;->m:Lcom/google/android/material/button/MaterialButton;

    new-instance v2, Lhmn;

    const/4 v4, 0x2

    invoke-direct {v2, v0, v4}, Lhmn;-><init>(Ljmn;B)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {v0}, Ljmn;->Q0()V

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object v1

    new-instance v2, Lg9l;

    const/16 v4, 0xf

    invoke-direct {v2, v0, v4}, Lg9l;-><init>(Ljava/lang/Object;B)V

    iget-object v4, v0, Ljmn;->t:Lpde;

    invoke-virtual {v4, v1, v2}, Lekc;->j(Lndc;Lf7f;)V

    iget-object v1, v0, Ljmn;->z:Lkmn;

    iget-object v1, v1, Lkmn;->a:Landroid/widget/FrameLayout;

    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljmn;->P0(Landroid/content/res/Configuration;)V

    iget-object v1, v0, Ljmn;->z:Lkmn;

    iget-object v1, v1, Lkmn;->n:Lcom/opera/android/custom_views/LayoutDirectionToolbar;

    new-instance v2, Lgmn;

    invoke-direct {v2, v0, v3}, Lgmn;-><init>(Ljmn;B)V

    invoke-static {v1}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object v0

    if-nez v0, :cond_1fb

    return-void

    :cond_1fb
    invoke-static {v0, v1, v2}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    return-void

    :cond_1ff
    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    const-string v1, "Missing required view with ID: "

    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    return-void
.end method
