.class public final Lpg5;
.super Ldej;
.source "SourceFile"


# instance fields
.field public final synthetic c:B

.field public final d:Ljava/lang/Object;

.field public e:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Lmej;Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 5

    .line 11
    iput-byte p4, p0, Lpg5;->c:B

    invoke-direct {p0, p1}, Ldej;-><init>(Lmej;)V

    iput-object p2, p0, Lpg5;->d:Ljava/lang/Object;

    iput-object p3, p0, Lpg5;->e:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lmej;Ljava/util/List;)V
    .registers 4

    const/4 v0, 0x1

    iput-byte v0, p0, Lpg5;->c:B

    .line 12
    invoke-direct {p0, p1}, Ldej;-><init>(Lmej;)V

    .line 13
    iput-object p2, p0, Lpg5;->d:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lmej;Log5;Lzg;)V
    .registers 5

    const/4 v0, 0x4

    iput-byte v0, p0, Lpg5;->c:B

    iput-object p2, p0, Lpg5;->d:Ljava/lang/Object;

    iput-object p3, p0, Lpg5;->e:Ljava/lang/Object;

    .line 14
    invoke-direct {p0, p1}, Ldej;-><init>(Lmej;)V

    return-void
.end method

.method public constructor <init>(Lrg5;Lue5;)V
    .registers 4

    const/4 v0, 0x0

    iput-byte v0, p0, Lpg5;->c:B

    invoke-direct {p0, p1}, Ldej;-><init>(Lmej;)V

    iput-object p1, p0, Lpg5;->d:Ljava/lang/Object;

    iput-object p2, p0, Lpg5;->e:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final a(Landroid/content/Context;)Landroid/view/View;
    .registers 26

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-byte v2, v0, Lpg5;->c:B

    iget-object v3, v0, Ldej;->b:Lmej;

    const-string v4, "rootView"

    const-string v5, "Missing required view with ID: "

    const v6, 0x7f0a06c5

    const/4 v7, 0x1

    const/4 v8, 0x0

    iget-object v9, v0, Lpg5;->d:Ljava/lang/Object;

    const/4 v10, 0x0

    packed-switch v2, :pswitch_data_2a0

    check-cast v9, Log5;

    invoke-virtual {v9, v1}, Log5;->d(Landroid/content/Context;)V

    iget-object v2, v0, Lpg5;->e:Ljava/lang/Object;

    check-cast v2, Lzg;

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    const v3, 0x7f0d0480

    invoke-virtual {v1, v3, v10, v8}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    const v3, 0x7f0a08c0

    invoke-static {v3, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object v13, v4

    check-cast v13, Landroidx/recyclerview/widget/RecyclerView;

    if-eqz v13, :cond_b8

    const v3, 0x7f0a090b

    invoke-static {v3, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/LinearLayout;

    if-eqz v4, :cond_b8

    const v3, 0x7f0a092c

    invoke-static {v3, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroidx/core/widget/NestedScrollView;

    if-eqz v4, :cond_b8

    move-object v3, v1

    check-cast v3, Landroid/widget/FrameLayout;

    invoke-static {v6, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    if-eqz v4, :cond_b9

    new-instance v11, Liuh;

    iget-object v1, v2, Lzg;->b:Ljava/lang/Object;

    move-object v12, v1

    check-cast v12, Lqln;

    invoke-virtual {v13}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    new-instance v14, Lwjn;

    invoke-direct {v14, v1, v7}, Lwjn;-><init>(Landroid/content/Context;B)V

    const/high16 v1, 0x41c00000    # 24.0f

    invoke-virtual {v13}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-static {v1, v4}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v15

    const/high16 v1, 0x41400000    # 12.0f

    invoke-virtual {v13}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-static {v1, v4}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v16

    new-instance v1, Lenn;

    invoke-direct {v1, v2, v0}, Lenn;-><init>(Lzg;Lpg5;)V

    move-object/from16 v17, v1

    invoke-direct/range {v11 .. v17}, Liuh;-><init>(Lqln;Landroidx/recyclerview/widget/RecyclerView;Lwjn;IILenn;)V

    iput-object v11, v2, Lzg;->c:Ljava/lang/Object;

    new-instance v0, Lsvk;

    const/16 v1, 0x1d

    invoke-direct {v0, v2, v1}, Lsvk;-><init>(Ljava/lang/Object;B)V

    invoke-static {v13}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object v1

    if-eqz v1, :cond_98

    invoke-static {v1, v13, v0}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    :cond_98
    iget-object v0, v2, Lzg;->c:Ljava/lang/Object;

    check-cast v0, Liuh;

    if-eqz v0, :cond_b6

    iget-object v1, v2, Lzg;->d:Ljava/lang/Object;

    check-cast v1, Ljava/util/ArrayList;

    iget-object v2, v0, Liuh;->c:Ljava/lang/Object;

    check-cast v2, Lujn;

    iget-object v4, v2, Lujn;->e:Ln1;

    invoke-virtual {v4, v1}, Ln1;->Q(Ljava/util/ArrayList;)Ljava/util/List;

    move-result-object v1

    invoke-virtual {v2, v1}, Ldt1;->K(Ljava/util/Collection;)V

    iget-object v0, v0, Liuh;->b:Ljava/lang/Object;

    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0, v8}, Landroidx/recyclerview/widget/RecyclerView;->x0(I)V

    :cond_b6
    move-object v10, v3

    goto :goto_c8

    :cond_b8
    move v6, v3

    :cond_b9
    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v6}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    :goto_c8
    return-object v10

    :pswitch_c9
    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    invoke-static {v1}, Lpt1;->f(Landroid/view/LayoutInflater;)Lpt1;

    move-result-object v1

    iget-object v2, v1, Lpt1;->g:Landroid/view/View;

    check-cast v2, Landroid/view/ViewStub;

    const v3, 0x7f0d035d

    invoke-virtual {v2, v3}, Landroid/view/ViewStub;->setLayoutResource(I)V

    invoke-virtual {v2}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    move-result-object v2

    if-eqz v2, :cond_13d

    check-cast v2, Lcom/opera/android/custom_views/OperaRateBar;

    iget-object v3, v0, Lpg5;->e:Ljava/lang/Object;

    check-cast v3, Lwjh;

    new-instance v4, Lkjh;

    invoke-direct {v4, v3, v7}, Lkjh;-><init>(Lwjh;B)V

    iget-object v5, v2, Lcom/opera/android/custom_views/OperaRateBar;->t:Ljava/util/ArrayList;

    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    check-cast v9, Ls9i;

    iget-object v4, v1, Lpt1;->b:Landroid/view/View;

    check-cast v4, Lcom/opera/android/custom_views/DialogTitle;

    iget-object v5, v1, Lpt1;->c:Landroid/view/View;

    check-cast v5, Lcom/opera/android/custom_views/StylingTextView;

    iget-object v6, v1, Lpt1;->f:Ljava/lang/Object;

    check-cast v6, Lpq3;

    iget-object v7, v6, Lpq3;->c:Lcom/google/android/material/button/MaterialButton;

    iget-object v12, v6, Lpq3;->d:Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {v9, v4, v5, v12, v7}, Ls9i;->a(Lcom/opera/android/custom_views/DialogTitle;Lcom/opera/android/custom_views/StylingTextView;Landroid/widget/Button;Landroid/widget/Button;)V

    new-instance v4, Lj5g;

    const/4 v5, 0x5

    invoke-direct {v4, v0, v2, v5}, Lj5g;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v12, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v2, Lzvd;

    const/16 v4, 0x1b

    invoke-direct {v2, v0, v4}, Lzvd;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v7, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v2, v3, Lwjh;->c:Ljava/lang/Object;

    check-cast v2, Lpde;

    new-instance v10, Lldh;

    const/16 v16, 0x0

    const/16 v17, 0x5

    const/4 v11, 0x1

    const-class v13, Lcom/google/android/material/button/MaterialButton;

    const-string v14, "setEnabled"

    const-string v15, "setEnabled(Z)V"

    invoke-direct/range {v10 .. v17}, Lldh;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    new-instance v3, Liwa;

    const/16 v4, 0x17

    invoke-direct {v3, v10, v4}, Liwa;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v2, v0, v3}, Lekc;->j(Lndc;Lf7f;)V

    iget-object v0, v1, Lpt1;->d:Ljava/lang/Object;

    move-object v10, v0

    check-cast v10, Landroidx/constraintlayout/widget/ConstraintLayout;

    goto :goto_140

    :cond_13d
    invoke-static {v4}, Lt3p;->q(Ljava/lang/String;)V

    :goto_140
    return-object v10

    :pswitch_141
    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v2

    invoke-static {v2}, Lpt1;->f(Landroid/view/LayoutInflater;)Lpt1;

    move-result-object v2

    iget-object v4, v2, Lpt1;->g:Landroid/view/View;

    check-cast v4, Landroid/view/ViewStub;

    const v5, 0x7f0d035e

    invoke-virtual {v4, v5}, Landroid/view/ViewStub;->setLayoutResource(I)V

    invoke-virtual {v4}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    move-result-object v4

    invoke-static {v4}, Lq5g;->a(Landroid/view/View;)Lq5g;

    move-result-object v4

    move-object v10, v9

    check-cast v10, Lxbf;

    iget-object v5, v2, Lpt1;->b:Landroid/view/View;

    move-object v11, v5

    check-cast v11, Lcom/opera/android/custom_views/DialogTitle;

    iget-object v5, v2, Lpt1;->c:Landroid/view/View;

    move-object v12, v5

    check-cast v12, Lcom/opera/android/custom_views/StylingTextView;

    iget-object v5, v2, Lpt1;->f:Ljava/lang/Object;

    check-cast v5, Lpq3;

    iget-object v13, v5, Lpq3;->d:Lcom/google/android/material/button/MaterialButton;

    iget-object v14, v5, Lpq3;->c:Lcom/google/android/material/button/MaterialButton;

    iget-object v5, v4, Lq5g;->c:Ljava/lang/Object;

    check-cast v5, Lhi4;

    iget-object v15, v5, Lhi4;->c:Lcom/google/android/material/textfield/TextInputLayout;

    new-instance v16, Lldh;

    iget-object v5, v0, Lpg5;->e:Ljava/lang/Object;

    move-object/from16 v18, v5

    check-cast v18, Lojh;

    const/16 v22, 0x0

    const/16 v23, 0x4

    const/16 v17, 0x1

    const-class v19, Lojh;

    const-string v20, "onFeedbackOptionSelected"

    const-string v21, "onFeedbackOptionSelected(Lcom/opera/android/rateus/FeedbackOption;)V"

    invoke-direct/range {v16 .. v23}, Lldh;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    invoke-virtual/range {v10 .. v16}, Lxbf;->l(Lcom/opera/android/custom_views/DialogTitle;Lcom/opera/android/custom_views/StylingTextView;Landroid/widget/Button;Landroid/widget/Button;Lcom/google/android/material/textfield/TextInputLayout;Lkotlin/jvm/functions/Function1;)V

    new-instance v5, Lj5g;

    const/4 v6, 0x4

    invoke-direct {v5, v0, v4, v6}, Lj5g;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v13, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v4, Lzvd;

    const/16 v5, 0x1a

    invoke-direct {v4, v0, v5}, Lzvd;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v14, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v4, v0, Lpg5;->e:Ljava/lang/Object;

    check-cast v4, Lojh;

    iget-object v5, v4, Lojh;->b:Lpde;

    new-instance v6, Lrmg;

    const/16 v7, 0xb

    invoke-direct {v6, v2, v7}, Lrmg;-><init>(Ljava/lang/Object;B)V

    new-instance v7, Liwa;

    const/16 v8, 0x16

    invoke-direct {v7, v6, v8}, Liwa;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v5, v0, v7}, Lekc;->j(Lndc;Lf7f;)V

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v5

    iget v5, v5, Landroid/content/res/Configuration;->screenHeightDp:I

    invoke-virtual {v4, v5}, Lojh;->a(I)V

    new-instance v4, Lrmg;

    const/16 v5, 0xc

    invoke-direct {v4, v0, v5}, Lrmg;-><init>(Ljava/lang/Object;B)V

    invoke-interface {v3}, Lndc;->getLifecycle()Ltcc;

    move-result-object v0

    new-instance v3, Ld62;

    invoke-direct {v3, v4, v1}, Ld62;-><init>(Lrmg;Landroid/content/Context;)V

    invoke-virtual {v0, v3}, Ltcc;->a(Lmdc;)V

    iget-object v0, v2, Lpt1;->d:Ljava/lang/Object;

    check-cast v0, Landroidx/constraintlayout/widget/ConstraintLayout;

    return-object v0

    :pswitch_1df
    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    const v2, 0x7f0d02de

    invoke-virtual {v1, v2, v10, v8}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_267

    check-cast v1, Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;

    check-cast v9, Ljava/util/List;

    invoke-interface {v3}, Lmej;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v2

    invoke-interface {v9}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1fc
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_263

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lpx8;

    const v7, 0x7f0d02dd

    invoke-virtual {v2, v7, v1, v8}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v7

    const v9, 0x7f0a02d0

    invoke-static {v9, v7}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v11

    check-cast v11, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v11, :cond_252

    const v9, 0x7f0a0571

    invoke-static {v9, v7}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v12

    check-cast v12, Lcom/opera/android/custom_views/StylingImageView;

    if-eqz v12, :cond_252

    invoke-static {v6, v7}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v9

    check-cast v9, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v9, :cond_253

    check-cast v7, Lcom/opera/android/custom_views/LayoutDirectionRelativeLayout;

    iget v13, v4, Lpx8;->a:I

    invoke-virtual {v12, v13}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    iget-object v12, v4, Lpx8;->b:Lpxh;

    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v13

    invoke-virtual {v12, v13}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object v12

    invoke-virtual {v9, v12}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget v9, v4, Lpx8;->c:I

    invoke-virtual {v11, v9}, Landroid/widget/TextView;->setText(I)V

    new-instance v9, Lwke;

    invoke-direct {v9, v0, v4}, Lwke;-><init>(Lpg5;Lpx8;)V

    invoke-virtual {v7, v9}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {v1, v7}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    goto :goto_1fc

    :cond_252
    move v6, v9

    :cond_253
    invoke-virtual {v7}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v6}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    goto :goto_26a

    :cond_263
    iput-object v1, v0, Lpg5;->e:Ljava/lang/Object;

    move-object v10, v1

    goto :goto_26a

    :cond_267
    invoke-static {v4}, Lt3p;->q(Ljava/lang/String;)V

    :goto_26a
    return-object v10

    :pswitch_26b
    check-cast v9, Lrg5;

    iget-object v1, v9, Lrg5;->a:Ldx3;

    new-instance v2, Lch5;

    new-instance v3, Ltpj;

    invoke-direct {v3, v1}, Landroid/content/ContextWrapper;-><init>(Landroid/content/Context;)V

    invoke-direct {v2, v3}, Lch5;-><init>(Landroid/content/Context;)V

    const v3, 0x7f0a0c99

    invoke-virtual {v2, v3, v1}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    const v3, 0x7f0a0c9d

    invoke-virtual {v2, v3, v1}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    const v3, 0x7f0a0c9c

    invoke-virtual {v2, v3, v1}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    invoke-virtual {v2}, Ld4;->m()V

    new-instance v1, Lng5;

    invoke-direct {v1, v0, v8}, Lng5;-><init>(Lpg5;B)V

    new-instance v0, Lue5;

    const v3, 0x560a7e48

    invoke-direct {v0, v3, v1, v7}, Lue5;-><init>(ILjava/lang/Object;Z)V

    invoke-virtual {v2, v0}, Lch5;->o(Lkotlin/jvm/functions/Function2;)V

    return-object v2

    nop

    :pswitch_data_2a0
    .packed-switch 0x0
        :pswitch_26b
        :pswitch_1df
        :pswitch_141
        :pswitch_c9
    .end packed-switch
.end method
