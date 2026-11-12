.class public final synthetic Lgf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Lf73;Lfdn;)V
    .registers 3

    const/16 p2, 0x13

    iput-byte p2, p0, Lgf;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lgf;->b:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    .line 10
    iput-byte p2, p0, Lgf;->a:B

    iput-object p1, p0, Lgf;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 20

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-byte v2, v0, Lgf;->a:B

    const/16 v3, 0x8

    const/4 v4, 0x5

    const/4 v5, 0x3

    const/16 v6, 0x1003

    const/4 v7, 0x2

    const/4 v8, 0x4

    const/4 v9, 0x0

    const/4 v10, 0x1

    const/4 v11, 0x0

    iget-object v0, v0, Lgf;->b:Ljava/lang/Object;

    packed-switch v2, :pswitch_data_3c6

    check-cast v0, Lpjg;

    invoke-virtual {v0}, Lpjg;->run()V

    return-void

    :pswitch_1c
    check-cast v0, Lcom/opera/android/BrowserActivity;

    sget v1, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {v0}, Ldx3;->S()Leq9;

    move-result-object v0

    invoke-virtual {v0, v11}, Leq9;->d(Z)V

    return-void

    :pswitch_28
    check-cast v0, Ltah;

    iget-object v1, v0, Ltah;->g:Ljava/lang/Object;

    check-cast v1, Lxj;

    iget-object v2, v1, Lxj;->b:Ljava/lang/Object;

    check-cast v2, Landroid/view/View;

    iget-object v1, v1, Lxj;->c:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/BrowserActivity;

    sget v3, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {v2}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v2

    if-nez v2, :cond_44

    const-string v0, "BottomNavigationBar action while detached"

    invoke-static {v0, v9}, Lks3;->B(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_82

    :cond_44
    iget-object v2, v1, Lcom/opera/android/BrowserActivity;->V:Lk6l;

    if-eqz v2, :cond_49

    move-object v9, v2

    :cond_49
    iget-object v2, v9, Lk6l;->o:Lb2l;

    if-nez v2, :cond_76

    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    iget-object v2, v1, Lcom/opera/android/BrowserActivity;->g1:Lou3;

    iget-object v2, v2, Lou3;->g:Lcom/opera/android/browser/SessionRestore$State;

    if-nez v2, :cond_56

    move v10, v11

    :cond_56
    invoke-static {v10}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v1}, Lxd5;->getLifecycle()Ltcc;

    move-result-object v1

    check-cast v1, Lqdc;

    iget-object v1, v1, Lqdc;->i:Lqcc;

    filled-new-array {v2, v1}, [Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1, v7}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v1

    const-string v2, "Pending session restore: %b. Activity state: %s"

    invoke-static {v0, v2, v1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "BottomNavigationBar action without active tab"

    invoke-static {v1, v0}, Lks3;->B(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_82

    :cond_76
    iget-object v0, v0, Ltah;->f:Ljava/lang/Object;

    check-cast v0, Lbq3;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Lxp3;

    invoke-direct {v1, v0, v11}, Lxp3;-><init>(Lt0h;B)V

    :goto_82
    return-void

    :pswitch_83
    check-cast v0, Lwo3;

    iget-object v1, v0, Lwo3;->v:Lz77;

    new-instance v2, Lol5;

    new-instance v3, Lva2;

    const/16 v4, 0x15

    invoke-direct {v3, v0, v4}, Lva2;-><init>(Ljava/lang/Object;B)V

    const v0, 0x7f140eb5

    const v4, 0x7f140eb4

    invoke-direct {v2, v0, v4, v3}, Lol5;-><init>(IILnl5;)V

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, Lijm;->b:Lijm;

    invoke-virtual {v1, v2, v0}, Lr22;->b(Ljjm;Lijm;)V

    return-void

    :pswitch_a2
    check-cast v0, Lgn3;

    iget-object v0, v0, Lgn3;->e:Lom3;

    new-array v1, v11, [I

    check-cast v0, Lpm3;

    invoke-virtual {v0, v1}, Lpm3;->a([I)V

    return-void

    :pswitch_ae
    check-cast v0, Lam3;

    iget-object v0, v0, Lam3;->k:Lom3;

    new-array v1, v11, [I

    check-cast v0, Lpm3;

    invoke-virtual {v0, v1}, Lpm3;->a([I)V

    return-void

    :pswitch_ba
    check-cast v0, Lzl3;

    invoke-virtual {v0, v1}, Lzl3;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_c0
    check-cast v0, Lzl3;

    invoke-virtual {v0, v1}, Lzl3;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_c6
    check-cast v0, Lm93;

    new-instance v1, Lf9c;

    new-instance v2, Lva2;

    const/16 v3, 0xe

    invoke-direct {v2, v0, v3}, Lva2;-><init>(Ljava/lang/Object;B)V

    invoke-direct {v1, v2}, Lf9c;-><init>(Lva2;)V

    invoke-static {v1, v6}, Lzhj;->a(Lryl;I)Lzhj;

    move-result-object v1

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v1, v0}, Lzhj;->c(Landroid/content/Context;)V

    return-void

    :pswitch_e0
    check-cast v0, Lv48;

    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    return-void

    :pswitch_e6
    check-cast v0, Lf73;

    iget-object v0, v0, Lf73;->e:Ltah;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, v0, Ltah;->d:Ljava/lang/Object;

    check-cast v2, Lydn;

    invoke-virtual {v2}, Lydn;->p()Lwdn;

    move-result-object v2

    iget-boolean v2, v2, Lwdn;->e:Z

    if-eqz v2, :cond_171

    iget-object v2, v0, Ltah;->f:Ljava/lang/Object;

    check-cast v2, Ly1n;

    if-eqz v2, :cond_103

    invoke-virtual {v2}, Ly1n;->run()V

    :cond_103
    iget-object v2, v0, Ltah;->b:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/Lazy;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lktg;

    iget-object v2, v2, Lktg;->b:Lkze;

    invoke-virtual {v2}, Lekc;->g()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_130

    iget-object v0, v0, Ltah;->g:Ljava/lang/Object;

    check-cast v0, Landroid/view/View;

    const v2, 0x7f1413ef

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x1388

    invoke-static {v0, v1, v2}, Lgtj;->e(Landroid/view/View;Ljava/lang/CharSequence;I)Lgtj;

    move-result-object v0

    invoke-virtual {v0}, Lgtj;->j()V

    goto :goto_171

    :cond_130
    iget-object v2, v0, Ltah;->i:Ljava/lang/Object;

    check-cast v2, Lgmk;

    iget-object v2, v2, Lgmk;->a:Lkze;

    invoke-virtual {v2}, Lekc;->g()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Luvg;

    invoke-virtual {v2}, Ljava/lang/Enum;->ordinal()I

    move-result v2

    if-eqz v2, :cond_16a

    if-eq v2, v10, :cond_16a

    if-eq v2, v7, :cond_16a

    if-eq v2, v5, :cond_16a

    if-eq v2, v8, :cond_14d

    if-eq v2, v4, :cond_16a

    goto :goto_171

    :cond_14d
    new-array v0, v11, [Ln6h;

    new-instance v11, Lwzg;

    const-class v2, Li8d;

    invoke-direct {v11, v9, v2, v8}, Lwzg;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v10, Lzhj;

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v17

    const/4 v12, 0x0

    const/4 v13, 0x2

    const/16 v14, 0x1003

    const/4 v15, 0x0

    const/16 v16, 0x0

    invoke-direct/range {v10 .. v17}, Lzhj;-><init>(Lwzg;Landroid/os/Bundle;IILjava/lang/String;ZLjava/util/List;)V

    invoke-virtual {v10, v1}, Lzhj;->c(Landroid/content/Context;)V

    goto :goto_171

    :cond_16a
    iget-object v0, v0, Ltah;->h:Ljava/lang/Object;

    check-cast v0, Lyug;

    invoke-virtual {v0, v10}, Lyug;->a(I)V

    :cond_171
    :goto_171
    return-void

    :pswitch_172
    check-cast v0, Leu2;

    iget-object v1, v0, Leu2;->w:Lua7;

    new-instance v2, Lku;

    invoke-direct {v2}, Lku;-><init>()V

    new-instance v4, Ldu2;

    invoke-direct {v4, v0, v11}, Ldu2;-><init>(Leu2;B)V

    new-instance v0, Lug;

    invoke-direct {v0, v4, v3}, Lug;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v1, v2, v0}, Lua7;->E(Lr37;Lf7f;)V

    return-void

    :pswitch_189
    check-cast v0, Lbv1;

    iget-object v0, v0, Lbv1;->e:Ljava/lang/Object;

    check-cast v0, Lwr2;

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, v0, Lwr2;->v:Lorm;

    iget-object v0, v0, Lwr2;->s:Lcom/opera/android/autofill/AutofillManager;

    new-instance v3, Lnp2;

    invoke-direct {v3, v2}, Lnp2;-><init>(Lorm;)V

    iput-object v9, v3, Lrr2;->x:Ltr2;

    iput-object v0, v3, Lrr2;->w:Lcom/opera/android/autofill/AutofillManager;

    invoke-virtual {v3}, Landroidx/fragment/app/Fragment;->isVisible()Z

    invoke-virtual {v3}, Landroidx/fragment/app/Fragment;->isVisible()Z

    invoke-static {v3, v6}, Lzhj;->a(Lryl;I)Lzhj;

    move-result-object v0

    invoke-virtual {v0, v1}, Lzhj;->c(Landroid/content/Context;)V

    return-void

    :pswitch_1ae
    check-cast v0, Lpq2;

    iget-object v1, v0, Lpq2;->f:Lru2;

    if-eqz v1, :cond_1b9

    iget-object v0, v0, Lpq2;->d:Loq2;

    invoke-interface {v0, v1}, Loq2;->l(Lru2;)V

    :cond_1b9
    return-void

    :pswitch_1ba
    check-cast v0, Landroidx/recyclerview/widget/i;

    check-cast v0, Lpq2;

    iget-object v1, v0, Lpq2;->f:Lru2;

    if-eqz v1, :cond_1c7

    iget-object v0, v0, Lpq2;->d:Loq2;

    invoke-interface {v0, v1}, Loq2;->l(Lru2;)V

    :cond_1c7
    return-void

    :pswitch_1c8
    check-cast v0, Lmq2;

    iget-object v1, v0, Lmq2;->j:Lhp2;

    invoke-virtual {v1}, Lhp2;->a()Z

    move-result v1

    if-nez v1, :cond_1db

    iget v1, v0, Lmq2;->f:I

    iget-object v2, v0, Lmq2;->c:Ldx3;

    iget-object v0, v0, Lmq2;->g:Liz9;

    invoke-static {v1, v2, v0}, Lj14;->a0(ILandroid/app/Activity;Liz9;)V

    :cond_1db
    return-void

    :pswitch_1dc
    check-cast v0, Lt42;

    iget-object v0, v0, Lx22;->n:Lr22;

    if-eqz v0, :cond_1ed

    invoke-virtual {v0}, Lr22;->g()Lvsn;

    move-result-object v0

    if-eqz v0, :cond_1ed

    iget-object v0, v0, Lvsn;->h:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    :cond_1ed
    return-void

    :pswitch_1ee
    check-cast v0, Lqt;

    iget-object v0, v0, Lqt;->d:Ljava/lang/Object;

    check-cast v0, Lqt3;

    invoke-virtual {v0}, Lqt3;->run()V

    return-void

    :pswitch_1f8
    check-cast v0, Ld10;

    iget-object v2, v0, Ld10;->I:Landroid/util/SparseArray;

    invoke-virtual {v1}, Landroid/view/View;->getId()I

    move-result v1

    invoke-virtual {v2, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lc10;

    if-eqz v1, :cond_26a

    iget v4, v0, Ld10;->K:I

    iget-object v5, v0, Ld10;->H:Ljava/util/ArrayList;

    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Llgh;

    invoke-virtual {v0}, Ld10;->v0()Z

    move-result v5

    iget v6, v4, Llgh;->a:I

    if-ne v6, v10, :cond_234

    move v6, v11

    :goto_21b
    invoke-virtual {v2}, Landroid/util/SparseArray;->size()I

    move-result v7

    if-ge v6, v7, :cond_241

    invoke-virtual {v2, v6}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lc10;

    if-ne v7, v1, :cond_22b

    move v8, v10

    goto :goto_22c

    :cond_22b
    move v8, v11

    :goto_22c
    xor-int/lit8 v9, v5, 0x1

    invoke-virtual {v7, v10, v8, v9}, Lc10;->a(ZZZ)V

    add-int/lit8 v6, v6, 0x1

    goto :goto_21b

    :cond_234
    iget-object v2, v1, Lc10;->c:Landroid/widget/TextView;

    check-cast v2, Landroid/widget/Checkable;

    invoke-interface {v2}, Landroid/widget/Checkable;->isChecked()Z

    move-result v2

    xor-int/lit8 v6, v5, 0x1

    invoke-virtual {v1, v10, v2, v6}, Lc10;->a(ZZZ)V

    :cond_241
    invoke-virtual {v0}, Ll00;->m0()Lx10;

    move-result-object v2

    invoke-virtual {v2}, Lx10;->n()V

    invoke-virtual {v0}, Ll00;->l0()Lw10;

    move-result-object v2

    iget-object v2, v2, Lw10;->u:Lcie;

    invoke-static {v2, v3}, Lcs5;->q0(Lcie;I)V

    iget-object v2, v0, Lxv8;->x:Landroid/widget/TextView;

    invoke-virtual {v0}, Ld10;->t0()Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v3

    xor-int/2addr v3, v10

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setEnabled(Z)V

    if-eqz v5, :cond_26a

    iget v2, v0, Ld10;->K:I

    invoke-static {v1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v4, v2, v1, v10}, Ld10;->x0(Llgh;ILjava/util/List;Z)V

    :cond_26a
    return-void

    :pswitch_26b
    check-cast v0, Lg10;

    invoke-virtual {v0}, Ll00;->k0()Lx10;

    move-result-object v1

    if-eqz v1, :cond_28f

    iget-object v1, v1, Lmq;->d:Lyz;

    check-cast v1, Lw10;

    if-eqz v1, :cond_28f

    iget-object v0, v0, Lg10;->G:Lw00;

    iget-object v1, v1, Lw10;->u:Lcie;

    iput-boolean v10, v0, Lw00;->m:Z

    invoke-static {v1, v5}, Lcs5;->q0(Lcie;I)V

    iget-object v2, v1, Lcie;->P:Ljsd;

    if-eqz v2, :cond_28d

    iget-object v1, v1, Lcie;->w0:Laoo;

    if-eqz v1, :cond_28d

    invoke-virtual {v1, v2}, Laoo;->j(Landroid/view/View;)V

    :cond_28d
    iput-boolean v11, v0, Lw00;->m:Z

    :cond_28f
    return-void

    :pswitch_290
    check-cast v0, Luw;

    invoke-virtual {v0}, Luw;->I0()Lcx;

    move-result-object v0

    iget-object v0, v0, Lcx;->d:Lot2;

    iget-object v0, v0, Lot2;->b:Lgjm;

    new-instance v1, Ljp2;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    invoke-virtual {v0, v1, v11}, Lgjm;->e(Ln37;Z)V

    return-void

    :pswitch_2a3
    check-cast v0, Lcom/google/android/material/textfield/MaterialAutoCompleteTextView;

    invoke-virtual {v0}, Landroid/view/View;->hasFocus()Z

    move-result v1

    if-eqz v1, :cond_2b4

    invoke-virtual {v0}, Lcom/google/android/material/textfield/MaterialAutoCompleteTextView;->isPopupShowing()Z

    move-result v1

    if-nez v1, :cond_2b4

    invoke-virtual {v0}, Lcom/google/android/material/textfield/MaterialAutoCompleteTextView;->showDropDown()V

    :cond_2b4
    return-void

    :pswitch_2b5
    check-cast v0, Ldu;

    iget-object v1, v0, Ldu;->e:Lhs;

    if-eqz v1, :cond_2c0

    iget-object v0, v0, Ldu;->d:Lbs;

    invoke-interface {v0, v1}, Lbs;->x(Lhs;)V

    :cond_2c0
    return-void

    :pswitch_2c1
    check-cast v0, Lcu;

    iget-object v1, v0, Lcu;->e:Lis;

    if-eqz v1, :cond_2cc

    iget-object v0, v0, Lcu;->d:Lbs;

    invoke-interface {v0, v1}, Lbs;->r(Lis;)V

    :cond_2cc
    return-void

    :pswitch_2cd
    check-cast v0, Lau;

    iget-object v1, v0, Lau;->e:Lis;

    if-eqz v1, :cond_2d8

    iget-object v0, v0, Lau;->d:Lbs;

    invoke-interface {v0, v1}, Lbs;->r(Lis;)V

    :cond_2d8
    return-void

    :pswitch_2d9
    check-cast v0, Lct;

    invoke-virtual {v0}, Lct;->G0()Lju;

    move-result-object v0

    iget-object v0, v0, Lju;->d:Lot;

    iget-object v1, v0, Loy;->h:Ljava/lang/Object;

    check-cast v1, Landroid/view/MenuItem;

    if-eqz v1, :cond_2f6

    invoke-virtual {v0}, Loy;->e()Z

    move-result v0

    if-nez v0, :cond_2f6

    invoke-interface {v1}, Landroid/view/MenuItem;->isActionViewExpanded()Z

    move-result v0

    if-nez v0, :cond_2f6

    invoke-interface {v1}, Landroid/view/MenuItem;->expandActionView()Z

    :cond_2f6
    return-void

    :pswitch_2f7
    check-cast v0, Lws;

    iget-object v1, v0, Lws;->d:Lts;

    if-eqz v1, :cond_359

    iget-object v0, v0, Lws;->c:Lzs;

    iget-object v0, v0, Lzs;->a:Lct;

    invoke-virtual {v0}, Lct;->G0()Lju;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v3, v1, Lts;->a:Lkq8;

    iget-object v5, v2, Lju;->o:Ljava/util/HashSet;

    invoke-virtual {v5, v3}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_328

    invoke-virtual {v5, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    iget-object v5, v2, Lju;->e:Ltw2;

    iget-object v5, v5, Ltw2;->b:Ljava/lang/Object;

    check-cast v5, Lorm;

    invoke-static {v3}, Ltw2;->w(Lkq8;)Ljava/lang/String;

    move-result-object v3

    check-cast v5, Lx5f;

    iget-boolean v6, v5, Lx5f;->h:Z

    if-eqz v6, :cond_328

    invoke-virtual {v5, v11, v3, v10}, Lx5f;->j(ILjava/lang/String;Z)V

    :cond_328
    iget-object v3, v2, Lju;->c:Lqb7;

    iget-object v2, v2, Lju;->j:Ljava/util/LinkedHashMap;

    if-eqz v2, :cond_341

    invoke-virtual {v2, v1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    if-eqz v2, :cond_341

    check-cast v2, Ljava/util/Collection;

    new-array v5, v11, [Lst;

    invoke-interface {v2, v5}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v2

    move-object v9, v2

    check-cast v9, [Lst;

    :cond_341
    invoke-virtual {v3, v9}, Lqb7;->E([Lst;)[Lst;

    move-result-object v2

    iget-object v3, v0, Lct;->r:Lua7;

    new-instance v5, Lqs;

    invoke-direct {v5, v1, v2}, Lqs;-><init>(Lts;[Lst;)V

    new-instance v1, Lbt;

    invoke-direct {v1, v0, v11}, Lbt;-><init>(Lct;B)V

    new-instance v0, Lpb;

    invoke-direct {v0, v1, v4}, Lpb;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v3, v5, v0}, Lua7;->E(Lr37;Lf7f;)V

    :cond_359
    return-void

    :pswitch_35a
    check-cast v0, Lqf;

    invoke-virtual {v0}, Ldej;->b()V

    return-void

    :pswitch_360
    check-cast v0, Leqk;

    iget-object v0, v0, Leqk;->e:Lz4k;

    iget-object v0, v0, Lz4k;->b:Ljava/lang/Object;

    check-cast v0, Lhqk;

    iget-object v1, v0, Lhqk;->c:Ls28;

    new-instance v2, Lrl;

    invoke-direct {v2, v8}, Lrl;-><init>(B)V

    invoke-virtual {v1, v2}, Ls28;->b(Ljava/lang/Runnable;)V

    iget-object v1, v0, Lhqk;->y:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_378
    :goto_378
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3a9

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lgqk;

    instance-of v3, v2, Lfqk;

    if-eqz v3, :cond_397

    move-object v3, v2

    check-cast v3, Lfqk;

    iget-object v3, v3, Lfqk;->c:Lcom/opera/android/suggestion/Suggestion;

    iget v3, v3, Lcom/opera/android/suggestion/Suggestion;->a:I

    const/16 v4, 0xb

    if-ne v3, v4, :cond_397

    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    goto :goto_378

    :cond_397
    instance-of v3, v2, Leqk;

    if-eqz v3, :cond_378

    check-cast v2, Leqk;

    iget-object v2, v2, Leqk;->c:Lcom/opera/android/suggestion/Suggestion;

    iget v2, v2, Lcom/opera/android/suggestion/Suggestion;->a:I

    const/16 v3, 0x1d

    if-ne v2, v3, :cond_378

    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    goto :goto_378

    :cond_3a9
    invoke-virtual {v0}, Landroidx/recyclerview/widget/d;->notifyDataSetChanged()V

    iget-object v0, v0, Lhqk;->f:Lx5f;

    iget-boolean v1, v0, Lx5f;->h:Z

    if-eqz v1, :cond_3b7

    const/16 v1, 0xd

    invoke-virtual {v0, v1}, Lx5f;->o(I)V

    :cond_3b7
    return-void

    :pswitch_3b8
    check-cast v0, Lhf;

    iget-boolean v1, v0, Lhf;->f:Z

    if-nez v1, :cond_3c5

    iput-boolean v10, v0, Lhf;->f:Z

    iget-object v0, v0, Lhf;->e:Leek;

    invoke-virtual {v0}, Leek;->invoke()Ljava/lang/Object;

    :cond_3c5
    return-void

    :pswitch_data_3c6
    .packed-switch 0x0
        :pswitch_3b8
        :pswitch_360
        :pswitch_35a
        :pswitch_2f7
        :pswitch_2d9
        :pswitch_2cd
        :pswitch_2c1
        :pswitch_2b5
        :pswitch_2a3
        :pswitch_290
        :pswitch_26b
        :pswitch_1f8
        :pswitch_1ee
        :pswitch_1dc
        :pswitch_1c8
        :pswitch_1ba
        :pswitch_1ae
        :pswitch_189
        :pswitch_172
        :pswitch_e6
        :pswitch_e0
        :pswitch_c6
        :pswitch_c0
        :pswitch_ba
        :pswitch_ae
        :pswitch_a2
        :pswitch_83
        :pswitch_28
        :pswitch_1c
    .end packed-switch
.end method
