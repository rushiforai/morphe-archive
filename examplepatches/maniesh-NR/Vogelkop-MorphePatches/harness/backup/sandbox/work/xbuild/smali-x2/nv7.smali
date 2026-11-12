.class public final synthetic Lnv7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lrv7;


# direct methods
.method public synthetic constructor <init>(Lrv7;B)V
    .registers 3

    iput-byte p2, p0, Lnv7;->a:B

    iput-object p1, p0, Lnv7;->b:Lrv7;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 19

    move-object/from16 v0, p0

    iget-byte v1, v0, Lnv7;->a:B

    const/4 v2, 0x0

    const/4 v3, 0x1

    iget-object v4, v0, Lnv7;->b:Lrv7;

    const/4 v5, 0x0

    packed-switch v1, :pswitch_data_24a

    move-object/from16 v0, p1

    check-cast v0, Leri;

    invoke-virtual {v4, v3}, Lrv7;->c(Z)V

    invoke-virtual {v4}, Lrv7;->d()V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_19
    move-object/from16 v0, p1

    check-cast v0, Lhbn;

    iget-object v1, v4, Lrv7;->k:Ligi;

    iget-object v3, v4, Lrv7;->p:Lks6;

    iput-boolean v2, v4, Lrv7;->r:Z

    iget-object v2, v4, Lrv7;->q:Lmv7;

    invoke-static {v2}, Lvml;->a(Ljava/lang/Runnable;)V

    instance-of v6, v0, Lgbn;

    if-eqz v6, :cond_36

    sget-wide v6, Ljbn;->h:J

    invoke-static {v6, v7}, Lpn7;->f(J)J

    move-result-wide v6

    invoke-static {v2, v6, v7}, Lvml;->d(Ljava/lang/Runnable;J)V

    goto :goto_74

    :cond_36
    instance-of v2, v0, Lbbn;

    if-eqz v2, :cond_56

    move-object v2, v0

    check-cast v2, Lbbn;

    iget-object v2, v2, Lbbn;->c:Lode;

    invoke-virtual {v2, v3}, Lekc;->p(Lf7f;)V

    iget-object v6, v1, Ligi;->f:Ljava/lang/Object;

    check-cast v6, Lode;

    invoke-virtual {v6}, Lekc;->g()Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v2, v3}, Lekc;->k(Lf7f;)V

    new-instance v8, Ledb;

    invoke-direct {v8, v7, v2, v3, v6}, Ledb;-><init>(Ljava/lang/Object;Lekc;Lf7f;Lode;)V

    invoke-virtual {v6, v8}, Lekc;->k(Lf7f;)V

    goto :goto_74

    :cond_56
    instance-of v2, v0, Lfbn;

    if-nez v2, :cond_74

    sget-object v2, Lcbn;->a:Lcbn;

    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_74

    instance-of v2, v0, Lebn;

    if-nez v2, :cond_74

    sget-object v2, Ldbn;->a:Ldbn;

    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_74

    if-eqz v0, :cond_74

    invoke-static {}, Lh9o;->p()V

    goto :goto_d4

    :cond_74
    :goto_74
    instance-of v2, v0, Lfbn;

    if-nez v2, :cond_7b

    iput-object v5, v4, Lrv7;->s:Lfbn;

    goto :goto_cf

    :cond_7b
    iget-object v2, v4, Lrv7;->s:Lfbn;

    if-eq v0, v2, :cond_cf

    check-cast v0, Lfbn;

    iget-object v2, v0, Lfbn;->a:Lzan;

    iput-object v0, v4, Lrv7;->s:Lfbn;

    invoke-virtual {v2}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    packed-switch v0, :pswitch_data_252

    invoke-static {}, Lh9o;->p()V

    goto :goto_d4

    :pswitch_90
    iget-object v0, v4, Lrv7;->c:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, v1, Ligi;->b:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/Lazy;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljbn;

    invoke-virtual {v1}, Ljbn;->a()Lekc;

    move-result-object v1

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-static {v1}, Lwwc;->f(Ljava/lang/String;)Ljava/util/Locale;

    move-result-object v1

    invoke-static {v0, v1}, Lz5i;->u0(Landroid/content/Context;Ljava/util/Locale;)V

    goto :goto_cf

    :pswitch_b2
    sget v0, Ljbn;->i:I

    invoke-static {v2}, Lzch;->n(Lzan;)Lrxh;

    move-result-object v0

    if-eqz v0, :cond_cf

    iget-object v1, v4, Lrv7;->o:Lmlj;

    new-instance v2, Lrxh;

    const v3, 0x7f140ebc

    invoke-direct {v2, v3}, Lrxh;-><init>(I)V

    new-instance v3, Llv7;

    const/4 v5, 0x2

    invoke-direct {v3, v4, v5}, Llv7;-><init>(Lrv7;B)V

    const/16 v5, 0x1388

    invoke-virtual {v1, v0, v5, v2, v3}, Lmlj;->b(Lrxh;ILrxh;Lkotlin/jvm/functions/Function0;)V

    :cond_cf
    :goto_cf
    invoke-virtual {v4}, Lrv7;->d()V

    sget-object v5, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_d4
    return-object v5

    :pswitch_d5
    move-object/from16 v1, p1

    check-cast v1, Lfyj;

    iget-object v7, v0, Lnv7;->b:Lrv7;

    iget-object v0, v7, Lrv7;->b:Lpde;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    iget-object v4, v7, Lrv7;->w:Lpv7;

    if-eqz v4, :cond_e8

    iget-object v4, v4, Lpv7;->a:Lfyj;

    goto :goto_e9

    :cond_e8
    move-object v4, v5

    :goto_e9
    invoke-static {v1, v4}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_246

    iget-object v1, v7, Lrv7;->w:Lpv7;

    new-instance v6, Lpv7;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    move-object v8, v0

    check-cast v8, Lfyj;

    iget-object v9, v7, Lrv7;->e:Liv7;

    iget-object v10, v7, Lrv7;->i:Ltsd;

    iget-object v11, v7, Lrv7;->j:Lwzg;

    invoke-direct/range {v6 .. v11}, Lpv7;-><init>(Lrv7;Lfyj;Liv7;Ltsd;Lwzg;)V

    iget-object v0, v7, Lrv7;->n:Lyv7;

    iget-object v4, v6, Lpv7;->b:Lha6;

    iget-object v8, v4, Lha6;->d:Ljava/lang/Object;

    check-cast v8, Lcom/opera/android/widget/UrlFieldEditText;

    iget-object v9, v0, Lyv7;->l:Lcom/opera/android/widget/UrlFieldEditText;

    iget-object v10, v0, Lyv7;->k:Lz61;

    invoke-virtual {v9, v10}, Landroid/view/View;->removeOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    iget-object v9, v0, Lyv7;->l:Lcom/opera/android/widget/UrlFieldEditText;

    iget-object v11, v0, Lyv7;->n:Lxv7;

    invoke-virtual {v9, v11}, Lcom/opera/android/custom_views/ObservableEditText;->n(Lz6f;)V

    iget-object v9, v0, Lyv7;->l:Lcom/opera/android/widget/UrlFieldEditText;

    invoke-virtual {v9, v5}, Landroid/widget/TextView;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    iget-object v9, v0, Lyv7;->l:Lcom/opera/android/widget/UrlFieldEditText;

    invoke-virtual {v9, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v9, v0, Lyv7;->l:Lcom/opera/android/widget/UrlFieldEditText;

    invoke-virtual {v9, v5}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    iget-object v9, v0, Lyv7;->l:Lcom/opera/android/widget/UrlFieldEditText;

    invoke-virtual {v9, v5}, Landroid/view/View;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    iget-object v5, v0, Lyv7;->l:Lcom/opera/android/widget/UrlFieldEditText;

    invoke-virtual {v5}, Lcom/opera/android/widget/UrlFieldEditText;->s()Z

    move-result v5

    iget-object v9, v0, Lyv7;->l:Lcom/opera/android/widget/UrlFieldEditText;

    invoke-virtual {v9}, Landroid/widget/TextView;->getSelectionStart()I

    move-result v12

    invoke-virtual {v9}, Landroid/widget/TextView;->getSelectionEnd()I

    move-result v13

    invoke-virtual {v9}, Landroid/view/View;->isFocused()Z

    move-result v14

    if-eqz v14, :cond_146

    invoke-virtual {v8}, Landroid/view/View;->requestFocus()Z

    :cond_146
    iget-object v14, v9, Lcom/opera/android/widget/UrlFieldEditText;->w:Lpde;

    invoke-virtual {v14}, Lekc;->g()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/Boolean;

    invoke-virtual {v14}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v14

    invoke-virtual {v8, v3}, Lcom/opera/android/widget/UrlFieldEditText;->A(Z)V

    iget-object v15, v9, Lcom/opera/android/widget/UrlFieldEditText;->F:Ljava/lang/CharSequence;

    iput-object v15, v8, Lcom/opera/android/widget/UrlFieldEditText;->F:Ljava/lang/CharSequence;

    iget-object v15, v9, Lcom/opera/android/widget/UrlFieldEditText;->G:Ljava/lang/String;

    iput-object v15, v8, Lcom/opera/android/widget/UrlFieldEditText;->G:Ljava/lang/String;

    iget-object v15, v9, Lcom/opera/android/widget/UrlFieldEditText;->b0:Lwpg;

    iput-object v15, v8, Lcom/opera/android/widget/UrlFieldEditText;->b0:Lwpg;

    invoke-virtual {v9}, Landroid/widget/TextView;->getHint()Ljava/lang/CharSequence;

    move-result-object v15

    if-eqz v15, :cond_16e

    invoke-interface {v15}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v8, v15}, Lcom/opera/android/custom_views/OperaEditText;->g(Ljava/lang/String;)V

    :cond_16e
    invoke-virtual {v8}, Lcom/opera/android/widget/UrlFieldEditText;->D()V

    invoke-virtual {v9}, Lcom/opera/android/widget/UrlFieldEditText;->s()Z

    move-result v15

    if-eqz v15, :cond_18a

    invoke-virtual {v8}, Lcom/opera/android/widget/UrlFieldEditText;->p()V

    invoke-virtual {v8}, Landroid/widget/TextView;->getEditableText()Landroid/text/Editable;

    move-result-object v12

    invoke-virtual {v9}, Lcom/opera/android/widget/UrlFieldEditText;->r()Ljava/lang/CharSequence;

    move-result-object v9

    invoke-interface {v12, v9}, Landroid/text/Editable;->append(Ljava/lang/CharSequence;)Landroid/text/Editable;

    iget-object v9, v8, Lcom/opera/android/widget/UrlFieldEditText;->x:Lywj;

    iput-boolean v3, v9, Lywj;->h:Z

    goto :goto_1a4

    :cond_18a
    invoke-virtual {v9}, Lcom/opera/android/widget/UrlFieldEditText;->r()Ljava/lang/CharSequence;

    move-result-object v9

    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-interface {v9}, Ljava/lang/CharSequence;->length()I

    move-result v15

    if-gt v12, v15, :cond_1a4

    invoke-interface {v9}, Ljava/lang/CharSequence;->length()I

    move-result v9

    if-gt v13, v9, :cond_1a4

    if-ltz v12, :cond_1a4

    if-ltz v13, :cond_1a4

    invoke-virtual {v8, v12, v13}, Landroid/widget/EditText;->setSelection(II)V

    :cond_1a4
    :goto_1a4
    invoke-virtual {v8, v14}, Lcom/opera/android/widget/UrlFieldEditText;->A(Z)V

    iput-object v8, v0, Lyv7;->l:Lcom/opera/android/widget/UrlFieldEditText;

    iput-boolean v3, v8, Lcom/opera/android/widget/UrlFieldEditText;->h0:Z

    iget-object v9, v0, Lyv7;->o:Lxpm;

    iget-object v12, v9, Lxpm;->d:Lg9l;

    iget-object v13, v9, Lxpm;->b:Ljava/util/ArrayList;

    invoke-virtual {v13}, Ljava/util/ArrayList;->size()I

    move-result v14

    move v15, v2

    :goto_1b6
    if-ge v15, v14, :cond_1c8

    invoke-virtual {v13, v15}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v16

    add-int/lit8 v15, v15, 0x1

    move-object/from16 v2, v16

    check-cast v2, Lz6f;

    iget-object v3, v9, Lxpm;->a:Lcom/opera/android/widget/UrlFieldEditText;

    invoke-virtual {v3, v2}, Lcom/opera/android/custom_views/ObservableEditText;->n(Lz6f;)V

    goto :goto_1b6

    :cond_1c8
    iget-object v2, v9, Lxpm;->a:Lcom/opera/android/widget/UrlFieldEditText;

    iget-object v2, v2, Lcom/opera/android/widget/UrlFieldEditText;->w:Lpde;

    invoke-virtual {v2, v12}, Lekc;->p(Lf7f;)V

    iput-object v8, v9, Lxpm;->a:Lcom/opera/android/widget/UrlFieldEditText;

    invoke-virtual {v13}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v3, 0x0

    :goto_1d6
    if-ge v3, v2, :cond_1e4

    invoke-virtual {v13, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    add-int/lit8 v3, v3, 0x1

    check-cast v9, Lz6f;

    invoke-virtual {v8, v9}, Lcom/opera/android/custom_views/ObservableEditText;->m(Lz6f;)V

    goto :goto_1d6

    :cond_1e4
    iget-object v2, v8, Lcom/opera/android/widget/UrlFieldEditText;->w:Lpde;

    invoke-virtual {v2, v12}, Lekc;->k(Lf7f;)V

    invoke-virtual {v0}, Lyv7;->o()V

    iget-object v2, v0, Lyv7;->l:Lcom/opera/android/widget/UrlFieldEditText;

    invoke-virtual {v2, v10}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    iget-object v2, v0, Lyv7;->l:Lcom/opera/android/widget/UrlFieldEditText;

    invoke-virtual {v2, v11}, Lcom/opera/android/custom_views/ObservableEditText;->m(Lz6f;)V

    iget-object v2, v0, Lyv7;->l:Lcom/opera/android/widget/UrlFieldEditText;

    invoke-virtual {v2, v11}, Landroid/widget/TextView;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    iget-object v2, v0, Lyv7;->l:Lcom/opera/android/widget/UrlFieldEditText;

    invoke-virtual {v2, v11}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v2, v0, Lyv7;->l:Lcom/opera/android/widget/UrlFieldEditText;

    invoke-virtual {v2, v11}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    iget-object v0, v0, Lyv7;->l:Lcom/opera/android/widget/UrlFieldEditText;

    invoke-virtual {v0, v11}, Landroid/view/View;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    if-eqz v5, :cond_21d

    iget-object v0, v11, Lxv7;->b:Llgf;

    iget-object v2, v11, Lxv7;->e:Lyv7;

    iget-object v2, v2, Lyv7;->l:Lcom/opera/android/widget/UrlFieldEditText;

    invoke-virtual {v2}, Lcom/opera/android/widget/UrlFieldEditText;->r()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Llgf;->k(Ljava/lang/String;)V

    :cond_21d
    iget-object v0, v4, Lha6;->m:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/StylingImageCheckableWithText;

    if-eqz v0, :cond_22a

    iget-object v2, v7, Lrv7;->m:Lhd;

    iget-boolean v2, v2, Lhd;->b:Z

    invoke-virtual {v0, v2}, Lcom/opera/android/custom_views/StylingImageCheckableWithText;->u(Z)V

    :cond_22a
    iput-object v6, v7, Lrv7;->w:Lpv7;

    invoke-virtual {v7}, Lrv7;->d()V

    if-eqz v1, :cond_246

    iget-object v0, v1, Lpv7;->c:Lfe5;

    const/4 v2, 0x1

    iput-boolean v2, v0, Lfe5;->d:Z

    invoke-virtual {v0}, Lfe5;->b()V

    iget-object v0, v1, Lpv7;->e:Lrv7;

    iget-object v0, v0, Lrv7;->c:Landroid/widget/FrameLayout;

    iget-object v1, v1, Lpv7;->b:Lha6;

    iget-object v1, v1, Lha6;->a:Ljava/lang/Object;

    check-cast v1, Landroid/widget/FrameLayout;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    :cond_246
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    nop

    :pswitch_data_24a
    .packed-switch 0x0
        :pswitch_d5
        :pswitch_19
    .end packed-switch

    :pswitch_data_252
    .packed-switch 0x0
        :pswitch_b2
        :pswitch_b2
        :pswitch_90
        :pswitch_b2
        :pswitch_b2
        :pswitch_b2
        :pswitch_b2
    .end packed-switch
.end method
