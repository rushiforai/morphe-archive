.class public final synthetic Lglm;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf7f;
.implements Lkr9;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lglm;->a:B

    iput-object p1, p0, Lglm;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()Lbr9;
    .registers 8

    iget-byte v0, p0, Lglm;->a:B

    iget-object p0, p0, Lglm;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_28

    check-cast p0, Lq0n;

    return-object p0

    :pswitch_a
    check-cast p0, Lqfl;

    return-object p0

    :pswitch_d
    check-cast p0, Lx9e;

    return-object p0

    :pswitch_10
    check-cast p0, Lnfh;

    return-object p0

    :pswitch_13
    check-cast p0, Lrg;

    return-object p0

    :pswitch_16
    new-instance v0, Lnr9;

    move-object v2, p0

    check-cast v2, Lcom/opera/android/uninstall/UninstallSurveyFragment;

    const-string v5, "applyState(Lcom/opera/android/uninstall/UninstallSurveyState;)V"

    const/4 v6, 0x0

    const/4 v1, 0x1

    const-class v3, Lcom/opera/android/uninstall/UninstallSurveyFragment;

    const-string v4, "applyState"

    invoke-direct/range {v0 .. v6}, Lmr9;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-object v0

    nop

    :pswitch_data_28
    .packed-switch 0x0
        :pswitch_16
        :pswitch_13
        :pswitch_10
        :pswitch_d
        :pswitch_a
    .end packed-switch
.end method

.method public final d0(Ljava/lang/Object;)V
    .registers 20

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-byte v2, v0, Lglm;->a:B

    iget-object v0, v0, Lglm;->b:Ljava/lang/Object;

    packed-switch v2, :pswitch_data_1be

    check-cast v0, Lq0n;

    invoke-virtual {v0, v1}, Lq0n;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_11
    check-cast v0, Lqfl;

    invoke-virtual {v0, v1}, Lqfl;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_17
    check-cast v0, Lx9e;

    invoke-virtual {v0, v1}, Lx9e;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_1d
    check-cast v0, Lnfh;

    invoke-virtual {v0, v1}, Lnfh;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_23
    check-cast v0, Lrg;

    invoke-virtual {v0, v1}, Lrg;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_29
    check-cast v1, Lnlm;

    check-cast v0, Lcom/opera/android/uninstall/UninstallSurveyFragment;

    iget-object v2, v0, Lcom/opera/android/uninstall/UninstallSurveyFragment;->s:Lpt1;

    const/4 v3, 0x0

    if-nez v2, :cond_33

    move-object v2, v3

    :cond_33
    iget-object v4, v2, Lpt1;->c:Landroid/view/View;

    check-cast v4, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    iget-object v5, v2, Lpt1;->b:Landroid/view/View;

    check-cast v5, Landroid/view/ViewStub;

    iget-object v6, v2, Lpt1;->f:Ljava/lang/Object;

    check-cast v6, Lvs;

    iget-object v7, v1, Lnlm;->d:Lpxh;

    iget-boolean v8, v1, Lnlm;->i:Z

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    invoke-virtual {v7, v9}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object v7

    invoke-virtual {v4, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-boolean v7, v1, Lnlm;->e:Z

    invoke-virtual {v4, v7}, Landroid/view/View;->setEnabled(Z)V

    invoke-virtual {v4, v8}, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;->R(Z)V

    iget-object v2, v2, Lpt1;->g:Landroid/view/View;

    check-cast v2, Lcom/google/android/material/button/MaterialButton;

    iget-object v4, v1, Lnlm;->f:Lrxh;

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    invoke-virtual {v4, v7}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-boolean v2, v1, Lnlm;->h:Z

    iget-object v4, v6, Lvs;->b:Landroid/view/ViewGroup;

    check-cast v4, Landroidx/constraintlayout/widget/ConstraintLayout;

    const/16 v7, 0x8

    if-eqz v2, :cond_7f

    invoke-virtual {v4, v7}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v5}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_1bc

    invoke-virtual {v5}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    goto/16 :goto_1bc

    :cond_7f
    const/4 v2, 0x0

    invoke-virtual {v4, v2}, Landroid/view/View;->setVisibility(I)V

    iget-object v4, v6, Lvs;->e:Ljava/lang/Object;

    check-cast v4, Lb7k;

    iget-object v4, v4, Lb7k;->b:Landroid/view/View;

    check-cast v4, Landroidx/constraintlayout/widget/ConstraintLayout;

    iget-boolean v5, v1, Lnlm;->a:Z

    if-eqz v5, :cond_91

    move v5, v2

    goto :goto_92

    :cond_91
    move v5, v7

    :goto_92
    invoke-virtual {v4, v5}, Landroid/view/View;->setVisibility(I)V

    iget-object v4, v6, Lvs;->d:Ljava/lang/Object;

    check-cast v4, Lvs;

    iget-object v5, v1, Lnlm;->b:Lr22;

    const/4 v9, 0x1

    if-eqz v5, :cond_a0

    move v10, v9

    goto :goto_a1

    :cond_a0
    move v10, v2

    :goto_a1
    iget-object v11, v4, Lvs;->b:Landroid/view/ViewGroup;

    check-cast v11, Landroid/widget/LinearLayout;

    iget-object v12, v4, Lvs;->d:Ljava/lang/Object;

    check-cast v12, Lb7k;

    iget-object v13, v12, Lb7k;->b:Landroid/view/View;

    check-cast v13, Landroid/widget/FrameLayout;

    iget-object v14, v4, Lvs;->c:Ljava/lang/Object;

    check-cast v14, Landroid/widget/LinearLayout;

    if-eqz v10, :cond_b5

    move v15, v2

    goto :goto_b6

    :cond_b5
    move v15, v7

    :goto_b6
    invoke-virtual {v11, v15}, Landroid/view/View;->setVisibility(I)V

    if-eqz v10, :cond_1ad

    iget-object v4, v4, Lvs;->e:Ljava/lang/Object;

    check-cast v4, Landroid/widget/TextView;

    iget-object v10, v5, Lr22;->b:Ljava/lang/Object;

    check-cast v10, Lrxh;

    iget-object v11, v5, Lr22;->a:Ljava/lang/Object;

    check-cast v11, Lklm;

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object v15

    invoke-virtual {v10, v15}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object v10

    invoke-virtual {v4, v10}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v14}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v11}, Ljava/lang/Enum;->name()Ljava/lang/String;

    move-result-object v10

    invoke-static {v4, v10}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_ef

    invoke-virtual {v14}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v10

    sub-int/2addr v10, v9

    invoke-virtual {v14, v2, v10}, Landroid/view/ViewGroup;->removeViews(II)V

    invoke-virtual {v11}, Ljava/lang/Enum;->name()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v14, v10}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    :cond_ef
    iget-object v10, v5, Lr22;->c:Ljava/lang/Object;

    check-cast v10, Lblm;

    invoke-virtual {v10}, Ljava/lang/Enum;->ordinal()I

    move-result v10

    if-eqz v10, :cond_104

    if-ne v10, v9, :cond_ff

    const v10, 0x7f1508f4

    goto :goto_107

    :cond_ff
    invoke-static {}, Lh9o;->p()V

    goto/16 :goto_1bc

    :cond_104
    const v10, 0x7f150908

    :goto_107
    iget-object v5, v5, Lr22;->d:Ljava/lang/Object;

    check-cast v5, Ljava/util/List;

    check-cast v5, Ljava/lang/Iterable;

    invoke-interface {v5}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v5

    move v11, v2

    :goto_112
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_173

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    add-int/lit8 v16, v11, 0x1

    if-ltz v11, :cond_16d

    check-cast v15, Ldlm;

    if-nez v4, :cond_13e

    new-instance v2, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v7

    invoke-direct {v2, v7, v3, v10}, Lcom/opera/android/ui/catalog/widget/OperaListItem;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    iget-object v7, v15, Ldlm;->b:Lrxh;

    invoke-virtual {v2, v7}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->E(Lpxh;)V

    new-instance v7, Lso4;

    move-object/from16 v17, v3

    const/16 v3, 0xa

    invoke-direct {v7, v0, v11, v15, v3}, Lso4;-><init>(Ljava/lang/Object;ILjava/lang/Object;B)V

    iput-object v7, v2, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u:Lvlf;

    goto :goto_146

    :cond_13e
    move-object/from16 v17, v3

    invoke-virtual {v14, v11}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    :goto_146
    iget-object v3, v1, Lnlm;->c:Ljava/util/Set;

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-interface {v3, v7}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v3

    invoke-virtual {v2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->isChecked()Z

    move-result v7

    if-eq v3, v7, :cond_159

    invoke-virtual {v2, v3}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setChecked(Z)V

    :cond_159
    xor-int/lit8 v3, v8, 0x1

    invoke-virtual {v2, v3}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setEnabled(Z)V

    if-nez v4, :cond_168

    invoke-virtual {v14}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v3

    sub-int/2addr v3, v9

    invoke-virtual {v14, v2, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;I)V

    :cond_168
    move/from16 v11, v16

    move-object/from16 v3, v17

    goto :goto_112

    :cond_16d
    move-object/from16 v17, v3

    invoke-static {}, Lj95;->n()V

    throw v17

    :cond_173
    invoke-static {v1}, Lcom/opera/android/uninstall/UninstallSurveyFragment;->H0(Lnlm;)Ljava/lang/Integer;

    move-result-object v0

    if-eqz v0, :cond_17b

    move v0, v9

    goto :goto_17c

    :cond_17b
    const/4 v0, 0x0

    :goto_17c
    iget-object v2, v12, Lb7k;->c:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/custom_views/OperaTextInputEditText;

    invoke-virtual {v13}, Landroid/view/View;->getVisibility()I

    move-result v3

    if-nez v3, :cond_188

    move v3, v9

    goto :goto_189

    :cond_188
    const/4 v3, 0x0

    :goto_189
    if-eq v3, v0, :cond_1a9

    if-eqz v0, :cond_18f

    const/4 v3, 0x0

    goto :goto_191

    :cond_18f
    const/16 v3, 0x8

    :goto_191
    invoke-virtual {v13, v3}, Landroid/view/View;->setVisibility(I)V

    if-eqz v0, :cond_1a0

    sget-object v0, Lq9n;->c:Ll5b;

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, v2}, Lq9n;->G(Landroid/content/Context;Landroid/view/View;)Z

    goto :goto_1a9

    :cond_1a0
    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    if-eqz v0, :cond_1a9

    invoke-interface {v0}, Landroid/text/Editable;->clear()V

    :cond_1a9
    :goto_1a9
    xor-int/2addr v8, v9

    invoke-virtual {v2, v8}, Landroid/view/View;->setEnabled(Z)V

    :cond_1ad
    iget-object v0, v6, Lvs;->c:Ljava/lang/Object;

    check-cast v0, Landroid/widget/TextView;

    iget-boolean v1, v1, Lnlm;->g:Z

    if-eqz v1, :cond_1b7

    const/4 v7, 0x0

    goto :goto_1b9

    :cond_1b7
    const/16 v7, 0x8

    :goto_1b9
    invoke-virtual {v0, v7}, Landroid/view/View;->setVisibility(I)V

    :cond_1bc
    :goto_1bc
    return-void

    nop

    :pswitch_data_1be
    .packed-switch 0x0
        :pswitch_29
        :pswitch_23
        :pswitch_1d
        :pswitch_17
        :pswitch_11
    .end packed-switch
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    iget-byte v0, p0, Lglm;->a:B

    const/4 v1, 0x0

    packed-switch v0, :pswitch_data_90

    instance-of v0, p1, Lf7f;

    if-eqz v0, :cond_1c

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_1c

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_1c
    return v1

    :pswitch_1d
    instance-of v0, p1, Lf7f;

    if-eqz v0, :cond_33

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_33

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_33
    return v1

    :pswitch_34
    instance-of v0, p1, Lf7f;

    if-eqz v0, :cond_4a

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_4a

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_4a
    return v1

    :pswitch_4b
    instance-of v0, p1, Lf7f;

    if-eqz v0, :cond_61

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_61

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_61
    return v1

    :pswitch_62
    instance-of v0, p1, Lf7f;

    if-eqz v0, :cond_78

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_78

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_78
    return v1

    :pswitch_79
    instance-of v0, p1, Lf7f;

    if-eqz v0, :cond_8f

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_8f

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_8f
    return v1

    :pswitch_data_90
    .packed-switch 0x0
        :pswitch_79
        :pswitch_62
        :pswitch_4b
        :pswitch_34
        :pswitch_1d
    .end packed-switch
.end method

.method public final hashCode()I
    .registers 2

    iget-byte v0, p0, Lglm;->a:B

    packed-switch v0, :pswitch_data_3c

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_e
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_17
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_20
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_29
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_32
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    nop

    :pswitch_data_3c
    .packed-switch 0x0
        :pswitch_32
        :pswitch_29
        :pswitch_20
        :pswitch_17
        :pswitch_e
    .end packed-switch
.end method
