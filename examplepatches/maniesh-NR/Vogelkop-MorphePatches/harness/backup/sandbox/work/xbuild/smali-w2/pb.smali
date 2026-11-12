.class public final synthetic Lpb;
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

    iput-byte p2, p0, Lpb;->a:B

    iput-object p1, p0, Lpb;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()Lbr9;
    .registers 10

    iget-byte v0, p0, Lpb;->a:B

    iget-object p0, p0, Lpb;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_ee

    check-cast p0, Lbo3;

    return-object p0

    :pswitch_a
    check-cast p0, Lbo3;

    return-object p0

    :pswitch_d
    check-cast p0, Lbo3;

    return-object p0

    :pswitch_10
    check-cast p0, Lbo3;

    return-object p0

    :pswitch_13
    check-cast p0, Lbo3;

    return-object p0

    :pswitch_16
    check-cast p0, Lbo3;

    return-object p0

    :pswitch_19
    check-cast p0, Lbo3;

    return-object p0

    :pswitch_1c
    new-instance v0, Lnr9;

    move-object v2, p0

    check-cast v2, Lwo3;

    const-string v5, "updateState(Lcom/opera/android/settings/bottom_bar/BottomBarSettingsState;)V"

    const/4 v6, 0x0

    const/4 v1, 0x1

    const-class v3, Lwo3;

    const-string v4, "updateState"

    invoke-direct/range {v0 .. v6}, Lmr9;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-object v0

    :pswitch_2d
    check-cast p0, Lt02;

    return-object p0

    :pswitch_30
    check-cast p0, Lq3;

    return-object p0

    :pswitch_33
    check-cast p0, Lt02;

    return-object p0

    :pswitch_36
    new-instance v0, Lnr9;

    move-object v2, p0

    check-cast v2, Llu2;

    const-string v5, "onFormsLoaded(Lcom/opera/android/autofill/PasswordForms;)V"

    const/4 v6, 0x0

    const/4 v1, 0x1

    const-class v3, Llu2;

    const-string v4, "onFormsLoaded"

    invoke-direct/range {v0 .. v6}, Lmr9;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-object v0

    :pswitch_47
    new-instance v1, Lnr9;

    move-object v3, p0

    check-cast v3, Leu2;

    const-string v6, "onStateUpdated(Lcom/opera/android/autofill/passwords/picker/AutofillPasswordPickerState;)V"

    const/4 v7, 0x0

    const/4 v2, 0x1

    const-class v4, Leu2;

    const-string v5, "onStateUpdated"

    invoke-direct/range {v1 .. v7}, Lmr9;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-object v1

    :pswitch_58
    new-instance v2, Lnr9;

    move-object v4, p0

    check-cast v4, Lqt2;

    const-string v7, "onFormsLoaded(Lcom/opera/android/autofill/PasswordForms;)V"

    const/4 v8, 0x0

    const/4 v3, 0x1

    const-class v5, Lqt2;

    const-string v6, "onFormsLoaded"

    invoke-direct/range {v2 .. v8}, Lmr9;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-object v2

    :pswitch_69
    check-cast p0, Lt02;

    return-object p0

    :pswitch_6c
    new-instance v0, Lnr9;

    move-object v2, p0

    check-cast v2, Lxq2;

    const-string v5, "setState(Lcom/opera/android/autofill/cards/AutofillCardDetailsViewModel$State;)V"

    const/4 v6, 0x0

    const/4 v1, 0x1

    const-class v3, Lxq2;

    const-string v4, "setState"

    invoke-direct/range {v0 .. v6}, Lmr9;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-object v0

    :pswitch_7d
    check-cast p0, Lt02;

    return-object p0

    :pswitch_80
    new-instance v0, Lnr9;

    move-object v2, p0

    check-cast v2, Lkc2;

    const-string v5, "updateState(Lcom/opera/android/settings/assistant/AssistantSettingsState;)V"

    const/4 v6, 0x0

    const/4 v1, 0x1

    const-class v3, Lkc2;

    const-string v4, "updateState"

    invoke-direct/range {v0 .. v6}, Lmr9;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-object v0

    :pswitch_91
    check-cast p0, Ly12;

    return-object p0

    :pswitch_94
    check-cast p0, Lq3;

    return-object p0

    :pswitch_97
    new-instance v0, Lnr9;

    move-object v2, p0

    check-cast v2, Lts1;

    const-string v5, "onStateUpdated(Lcom/opera/android/settings/appicon/AppIconSettingsState;)V"

    const/4 v6, 0x0

    const/4 v1, 0x1

    const-class v3, Lts1;

    const-string v4, "onStateUpdated"

    invoke-direct/range {v0 .. v6}, Lmr9;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-object v0

    :pswitch_a8
    check-cast p0, Lz3;

    return-object p0

    :pswitch_ab
    new-instance v0, Lnr9;

    move-object v2, p0

    check-cast v2, Lru;

    const-string v5, "onSelectedAppSiteUpdated(Lcom/opera/android/autofill/passwords/add/AddPasswordViewModel$SelectedAppSite;)V"

    const/4 v6, 0x0

    const/4 v1, 0x1

    const-class v3, Lru;

    const-string v4, "onSelectedAppSiteUpdated"

    invoke-direct/range {v0 .. v6}, Lmr9;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-object v0

    :pswitch_bc
    check-cast p0, Lz3;

    return-object p0

    :pswitch_bf
    check-cast p0, Lbt;

    return-object p0

    :pswitch_c2
    new-instance v0, Lnr9;

    move-object v2, p0

    check-cast v2, Lct;

    const-string v5, "updateSuggestions(Lcom/opera/android/favorites/add/AddFavoriteSuggestions;)V"

    const/4 v6, 0x0

    const/4 v1, 0x1

    const-class v3, Lct;

    const-string v4, "updateSuggestions"

    invoke-direct/range {v0 .. v6}, Lmr9;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-object v0

    :pswitch_d3
    check-cast p0, Lz3;

    return-object p0

    :pswitch_d6
    check-cast p0, Lz3;

    return-object p0

    :pswitch_d9
    new-instance v0, Lnr9;

    move-object v2, p0

    check-cast v2, Ltf;

    const-string v5, "handleDragState(Lcom/opera/android/settings/bottom_bar/DragState;)V"

    const/4 v6, 0x0

    const/4 v1, 0x1

    const-class v3, Ltf;

    const-string v4, "handleDragState"

    invoke-direct/range {v0 .. v6}, Lmr9;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-object v0

    :pswitch_ea
    check-cast p0, Lz3;

    return-object p0

    nop

    :pswitch_data_ee
    .packed-switch 0x0
        :pswitch_ea
        :pswitch_d9
        :pswitch_d6
        :pswitch_d3
        :pswitch_c2
        :pswitch_bf
        :pswitch_bc
        :pswitch_ab
        :pswitch_a8
        :pswitch_97
        :pswitch_94
        :pswitch_91
        :pswitch_80
        :pswitch_7d
        :pswitch_6c
        :pswitch_69
        :pswitch_58
        :pswitch_47
        :pswitch_36
        :pswitch_33
        :pswitch_30
        :pswitch_2d
        :pswitch_1c
        :pswitch_19
        :pswitch_16
        :pswitch_13
        :pswitch_10
        :pswitch_d
        :pswitch_a
    .end packed-switch
.end method

.method public final d0(Ljava/lang/Object;)V
    .registers 19

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-byte v2, v0, Lpb;->a:B

    const/4 v3, 0x1

    const/16 v5, 0x8

    const/4 v6, 0x0

    iget-object v0, v0, Lpb;->b:Ljava/lang/Object;

    packed-switch v2, :pswitch_data_730

    check-cast v0, Lbo3;

    invoke-virtual {v0, v1}, Lbo3;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_15
    check-cast v0, Lbo3;

    invoke-virtual {v0, v1}, Lbo3;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_1b
    check-cast v0, Lbo3;

    invoke-virtual {v0, v1}, Lbo3;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_21
    check-cast v0, Lbo3;

    invoke-virtual {v0, v1}, Lbo3;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_27
    check-cast v0, Lbo3;

    invoke-virtual {v0, v1}, Lbo3;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_2d
    check-cast v0, Lbo3;

    invoke-virtual {v0, v1}, Lbo3;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_33
    check-cast v0, Lbo3;

    invoke-virtual {v0, v1}, Lbo3;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_39
    check-cast v1, Lxo3;

    check-cast v0, Lwo3;

    iget-object v2, v0, Lwo3;->F:Lwf;

    iget-object v3, v1, Lxo3;->a:Ljava/util/List;

    invoke-virtual {v2, v3}, Lwf;->P(Ljava/util/List;)V

    iget-object v2, v0, Lwo3;->G:Lwf;

    iget-object v3, v1, Lxo3;->b:Ljava/util/List;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast v3, Ljava/lang/Iterable;

    new-instance v7, Ljava/util/ArrayList;

    const/16 v8, 0xa

    invoke-static {v3, v8}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v8

    invoke-direct {v7, v8}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_5c
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_71

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lpc;

    new-instance v9, Lkv2;

    invoke-direct {v9, v8}, Lkv2;-><init>(Lpc;)V

    invoke-virtual {v7, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_5c

    :cond_71
    invoke-virtual {v2, v7}, Ldt1;->K(Ljava/util/Collection;)V

    iget-object v0, v0, Lwo3;->J:Litd;

    if-nez v0, :cond_7a

    const/4 v4, 0x0

    goto :goto_7b

    :cond_7a
    move-object v4, v0

    :goto_7b
    const v0, 0x7f0a08db

    invoke-virtual {v4, v0}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    invoke-interface {v0}, Landroid/view/MenuItem;->getActionView()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_99

    const v2, 0x7f0a08d8

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_99

    iget-boolean v1, v1, Lxo3;->c:Z

    if-nez v1, :cond_96

    move v5, v6

    :cond_96
    invoke-virtual {v0, v5}, Landroid/view/View;->setVisibility(I)V

    :cond_99
    return-void

    :pswitch_9a
    check-cast v0, Lt02;

    invoke-virtual {v0, v1}, Lt02;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_a0
    check-cast v0, Lq3;

    invoke-virtual {v0, v1}, Lq3;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_a6
    check-cast v0, Lt02;

    invoke-virtual {v0, v1}, Lt02;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_ac
    check-cast v1, La4g;

    check-cast v0, Llu2;

    iget-object v2, v0, Llu2;->x:Lua7;

    invoke-virtual {v2}, Lua7;->p()Ln37;

    move-result-object v2

    check-cast v2, Lj8n;

    iget v2, v2, Lj8n;->a:I

    invoke-virtual {v1, v2}, La4g;->b(I)Lw3g;

    move-result-object v1

    if-nez v1, :cond_c4

    invoke-virtual {v0}, Lryl;->g0()V

    goto :goto_122

    :cond_c4
    iget-object v2, v1, Lw3g;->f:Ljava/lang/String;

    iput-object v1, v0, Llu2;->z:Lw3g;

    invoke-virtual {v0}, Llu2;->H0()Ltn9;

    move-result-object v3

    iget-object v3, v3, Ltn9;->g:Lcom/opera/android/custom_views/StylingTextView;

    iget-object v4, v1, Lw3g;->c:Ljava/lang/String;

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v0}, Llu2;->H0()Ltn9;

    move-result-object v3

    iget-object v3, v3, Ltn9;->f:Lor2;

    iget-object v3, v3, Lor2;->b:Ljava/lang/Object;

    check-cast v3, Lcom/opera/android/custom_views/StylingTextView;

    invoke-static {v1}, Lcqp;->W(Lw3g;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v0}, Llu2;->H0()Ltn9;

    move-result-object v3

    iget-object v3, v3, Ltn9;->h:Lor2;

    iget-object v3, v3, Lor2;->c:Landroid/view/View;

    check-cast v3, Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v4

    if-eqz v4, :cond_f5

    move v5, v6

    :cond_f5
    invoke-virtual {v3, v5}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v0}, Llu2;->H0()Ltn9;

    move-result-object v3

    iget-object v3, v3, Ltn9;->h:Lor2;

    iget-object v3, v3, Lor2;->b:Ljava/lang/Object;

    check-cast v3, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v0}, Llu2;->H0()Ltn9;

    move-result-object v2

    iget-object v2, v2, Ltn9;->c:Lcom/opera/android/custom_views/StylingTextView;

    const-string v3, "fakepass"

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    new-instance v2, Li4g;

    invoke-virtual {v0}, Llu2;->I0()Lmu2;

    move-result-object v3

    iget-object v3, v3, Lmu2;->d:Lx5g;

    iget-object v3, v3, Lx5g;->d:Lw4g;

    iget v4, v0, Llu2;->v:I

    invoke-direct {v2, v3, v1, v4, v0}, Li4g;-><init>(Lw4g;Lw3g;ILh4g;)V

    invoke-virtual {v0}, Llu2;->J0()V

    :goto_122
    return-void

    :pswitch_123
    check-cast v1, Lfu2;

    check-cast v0, Leu2;

    iget-object v2, v0, Leu2;->u:Lzyk;

    invoke-virtual {v2}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lau2;

    iget-object v1, v1, Lfu2;->a:Ljava/util/List;

    invoke-virtual {v2, v1}, Lygc;->H(Ljava/util/List;)V

    iget-object v0, v0, Leu2;->v:Lrf2;

    if-nez v0, :cond_13a

    const/4 v4, 0x0

    goto :goto_13b

    :cond_13a
    move-object v4, v0

    :goto_13b
    iget-object v0, v4, Lrf2;->e:Landroid/view/View;

    check-cast v0, Lcom/opera/android/downloads/DownloadFilterChip;

    iget-object v1, v4, Lrf2;->g:Landroid/view/View;

    check-cast v1, Lcom/opera/android/downloads/DownloadFilterChip;

    iget-object v2, v4, Lrf2;->k:Landroid/view/View;

    check-cast v2, Lcom/opera/android/downloads/DownloadFilterChip;

    invoke-virtual {v0}, Landroid/widget/CompoundButton;->isChecked()Z

    move-result v3

    if-nez v3, :cond_14f

    move v3, v5

    goto :goto_150

    :cond_14f
    move v3, v6

    :goto_150
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v2}, Landroid/widget/CompoundButton;->isChecked()Z

    move-result v0

    if-nez v0, :cond_15b

    move v0, v5

    goto :goto_15c

    :cond_15b
    move v0, v6

    :goto_15c
    invoke-virtual {v2, v0}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v1}, Landroid/widget/CompoundButton;->isChecked()Z

    move-result v0

    if-nez v0, :cond_167

    move v0, v5

    goto :goto_168

    :cond_167
    move v0, v6

    :goto_168
    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, v4, Lrf2;->d:Landroid/view/View;

    check-cast v0, Landroid/widget/LinearLayout;

    iget-object v3, v4, Lrf2;->e:Landroid/view/View;

    check-cast v3, Lcom/opera/android/downloads/DownloadFilterChip;

    invoke-virtual {v3}, Landroid/view/View;->getVisibility()I

    move-result v3

    if-eqz v3, :cond_185

    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    move-result v2

    if-eqz v2, :cond_185

    invoke-virtual {v1}, Landroid/view/View;->getVisibility()I

    move-result v1

    if-nez v1, :cond_186

    :cond_185
    move v5, v6

    :cond_186
    invoke-virtual {v0, v5}, Landroid/view/View;->setVisibility(I)V

    return-void

    :pswitch_18a
    check-cast v1, La4g;

    move-object v9, v0

    check-cast v9, Lqt2;

    iget-object v0, v9, Lqt2;->w:Lzyk;

    if-eqz v1, :cond_25b

    iget-object v2, v9, Lqt2;->x:Lua7;

    invoke-virtual {v2}, Lua7;->p()Ln37;

    move-result-object v2

    check-cast v2, Lzv7;

    iget v2, v2, Lzv7;->a:I

    invoke-virtual {v1, v2}, La4g;->b(I)Lw3g;

    move-result-object v1

    if-eqz v1, :cond_25b

    iget-object v2, v1, Lw3g;->f:Ljava/lang/String;

    iput-object v1, v9, Lqt2;->z:Lw3g;

    invoke-virtual {v9}, Lqt2;->H0()Lnl9;

    move-result-object v3

    iget-object v3, v3, Lnl9;->f:Lcom/opera/android/custom_views/StylingTextView;

    iget-object v5, v1, Lw3g;->c:Ljava/lang/String;

    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v9}, Lqt2;->H0()Lnl9;

    move-result-object v3

    iget-object v3, v3, Lnl9;->e:Lor2;

    iget-object v3, v3, Lor2;->b:Ljava/lang/Object;

    check-cast v3, Lcom/opera/android/custom_views/StylingTextView;

    invoke-static {v1}, Lcqp;->W(Lw3g;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v9}, Lqt2;->H0()Lnl9;

    move-result-object v3

    iget-object v3, v3, Lnl9;->g:Lcom/opera/android/custom_views/OperaTextInputEditText;

    new-instance v5, Lb5g;

    invoke-virtual {v9}, Lqt2;->H0()Lnl9;

    move-result-object v7

    iget-object v15, v7, Lnl9;->h:Lcom/google/android/material/textfield/TextInputLayout;

    iget-object v7, v1, Lw3g;->g:Ljava/lang/String;

    move-object v8, v7

    new-instance v7, Lq2;

    const/4 v13, 0x0

    const/16 v14, 0x8

    move-object v10, v8

    const/4 v8, 0x0

    move-object v11, v10

    const-class v10, Lqt2;

    move-object v12, v11

    const-string v11, "updateSaveButtonStatus"

    move-object/from16 v16, v12

    const-string v12, "updateSaveButtonStatus()V"

    move-object/from16 v4, v16

    invoke-direct/range {v7 .. v14}, Lq2;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    invoke-direct {v5, v15, v4, v2, v7}, Lb5g;-><init>(Lcom/google/android/material/textfield/TextInputLayout;Ljava/lang/String;Ljava/lang/String;Lq2;)V

    invoke-virtual {v3, v5}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    invoke-virtual {v9}, Lqt2;->H0()Lnl9;

    move-result-object v3

    iget-object v3, v3, Lnl9;->c:Lcom/opera/android/custom_views/OperaTextInputEditText;

    new-instance v4, Lz4g;

    invoke-virtual {v9}, Lqt2;->H0()Lnl9;

    move-result-object v5

    iget-object v5, v5, Lnl9;->d:Lcom/google/android/material/textfield/TextInputLayout;

    iget-object v7, v9, Lqt2;->z:Lw3g;

    if-nez v7, :cond_203

    const/4 v7, 0x0

    :cond_203
    invoke-static {v7}, Lcqp;->W(Lw3g;)Ljava/lang/String;

    move-result-object v15

    new-instance v7, Lq2;

    const/4 v13, 0x0

    const/16 v14, 0x9

    const/4 v8, 0x0

    const-string v11, "updateSaveButtonStatus"

    const-string v12, "updateSaveButtonStatus()V"

    invoke-direct/range {v7 .. v14}, Lq2;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    invoke-direct {v4, v5, v15, v7}, Lz4g;-><init>(Lcom/google/android/material/textfield/TextInputLayout;Ljava/lang/String;Lq2;)V

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    invoke-virtual {v9}, Lqt2;->H0()Lnl9;

    move-result-object v3

    iget-object v3, v3, Lnl9;->g:Lcom/opera/android/custom_views/OperaTextInputEditText;

    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v9}, Lqt2;->H0()Lnl9;

    move-result-object v2

    iget-object v2, v2, Lnl9;->c:Lcom/opera/android/custom_views/OperaTextInputEditText;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lst2;

    iget-object v4, v9, Lqt2;->z:Lw3g;

    if-nez v4, :cond_234

    const/4 v4, 0x0

    :cond_234
    iget-object v3, v3, Lst2;->e:La4g;

    if-eqz v3, :cond_23d

    invoke-virtual {v3, v4}, La4g;->c(Lw3g;)Ljava/lang/String;

    move-result-object v4

    goto :goto_23e

    :cond_23d
    const/4 v4, 0x0

    :goto_23e
    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    new-instance v2, Li4g;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lst2;

    iget-object v0, v0, Lst2;->c:Lx5g;

    iget-object v0, v0, Lx5g;->d:Lw4g;

    iget v3, v9, Lqt2;->v:I

    invoke-direct {v2, v0, v1, v3, v9}, Li4g;-><init>(Lw4g;Lw3g;ILh4g;)V

    invoke-virtual {v9}, Lqt2;->H0()Lnl9;

    move-result-object v0

    iget-object v0, v0, Lnl9;->c:Lcom/opera/android/custom_views/OperaTextInputEditText;

    invoke-static {v0, v6}, Lc5g;->a(Landroid/widget/TextView;Z)V

    :cond_25b
    return-void

    :pswitch_25c
    check-cast v0, Lt02;

    invoke-virtual {v0, v1}, Lt02;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_262
    check-cast v1, Lar2;

    check-cast v0, Lxq2;

    iget-object v2, v0, Lxq2;->w:Lwq2;

    invoke-virtual {v0}, Lxq2;->H0()Lyq2;

    move-result-object v3

    iget-object v3, v3, Lyq2;->e:Lcom/opera/android/custom_views/StylingImageView;

    iget v4, v1, Lar2;->a:I

    iget-object v7, v1, Lar2;->h:Ljava/lang/String;

    iget-object v8, v1, Lar2;->g:Ljava/lang/String;

    iput v4, v2, Lwq2;->b:I

    invoke-virtual {v2, v3}, Lwq2;->a(Landroid/view/View;)V

    invoke-virtual {v0}, Lxq2;->H0()Lyq2;

    move-result-object v2

    iget-object v2, v2, Lyq2;->h:Lcom/opera/android/custom_views/StylingTextView;

    iget-object v3, v1, Lar2;->b:Ljava/lang/String;

    invoke-static {v2, v3}, Lna2;->S(Landroid/widget/TextView;Ljava/lang/CharSequence;)V

    invoke-virtual {v0}, Lxq2;->H0()Lyq2;

    move-result-object v2

    iget-object v2, v2, Lyq2;->f:Lor2;

    iget-object v2, v2, Lor2;->c:Landroid/view/View;

    check-cast v2, Landroidx/constraintlayout/widget/ConstraintLayout;

    iget-object v3, v1, Lar2;->c:Ljava/lang/String;

    if-eqz v3, :cond_29a

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v4

    if-eqz v4, :cond_29a

    move v4, v6

    goto :goto_29b

    :cond_29a
    move v4, v5

    :goto_29b
    invoke-virtual {v2, v4}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v0}, Lxq2;->H0()Lyq2;

    move-result-object v2

    iget-object v2, v2, Lyq2;->f:Lor2;

    iget-object v2, v2, Lor2;->b:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v0}, Lxq2;->H0()Lyq2;

    move-result-object v2

    iget-object v2, v2, Lyq2;->c:Lor2;

    iget-object v2, v2, Lor2;->b:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/custom_views/StylingTextView;

    iget-object v3, v1, Lar2;->d:Ljava/lang/String;

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v0}, Lxq2;->H0()Lyq2;

    move-result-object v2

    iget-object v2, v2, Lyq2;->d:Lor2;

    iget-object v2, v2, Lor2;->b:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/custom_views/StylingTextView;

    iget-object v3, v1, Lar2;->e:Ljava/lang/String;

    if-nez v3, :cond_2ca

    const-string v3, "--/--"

    :cond_2ca
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v0}, Lxq2;->H0()Lyq2;

    move-result-object v2

    iget-object v2, v2, Lyq2;->g:Lor2;

    iget-object v2, v2, Lor2;->c:Landroid/view/View;

    check-cast v2, Landroidx/constraintlayout/widget/ConstraintLayout;

    if-eqz v8, :cond_2e1

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v3

    if-eqz v3, :cond_2e1

    move v3, v6

    goto :goto_2e2

    :cond_2e1
    move v3, v5

    :goto_2e2
    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v0}, Lxq2;->H0()Lyq2;

    move-result-object v2

    iget-object v2, v2, Lyq2;->g:Lor2;

    iget-object v2, v2, Lor2;->b:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {v2, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v0}, Lxq2;->H0()Lyq2;

    move-result-object v2

    iget-object v2, v2, Lyq2;->b:Lor2;

    iget-object v2, v2, Lor2;->c:Landroid/view/View;

    check-cast v2, Landroidx/constraintlayout/widget/ConstraintLayout;

    if-eqz v7, :cond_306

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v3

    if-eqz v3, :cond_306

    move v3, v6

    goto :goto_307

    :cond_306
    move v3, v5

    :goto_307
    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v0}, Lxq2;->H0()Lyq2;

    move-result-object v2

    iget-object v2, v2, Lyq2;->b:Lor2;

    iget-object v2, v2, Lor2;->b:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {v2, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-boolean v1, v1, Lar2;->f:Z

    if-eqz v1, :cond_35e

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f04021f

    const v3, 0x7f060ade

    invoke-static {v2, v1, v3}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v1

    invoke-virtual {v0}, Lxq2;->H0()Lyq2;

    move-result-object v2

    iget-object v2, v2, Lyq2;->d:Lor2;

    iget-object v2, v2, Lor2;->f:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setTextColor(I)V

    invoke-virtual {v0}, Lxq2;->H0()Lyq2;

    move-result-object v2

    iget-object v2, v2, Lyq2;->d:Lor2;

    iget-object v2, v2, Lor2;->b:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setTextColor(I)V

    invoke-virtual {v0}, Lxq2;->H0()Lyq2;

    move-result-object v1

    iget-object v1, v1, Lyq2;->d:Lor2;

    iget-object v1, v1, Lor2;->d:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/custom_views/StylingImageButton;

    invoke-virtual {v1, v5}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v0}, Lxq2;->H0()Lyq2;

    move-result-object v0

    iget-object v0, v0, Lyq2;->d:Lor2;

    iget-object v0, v0, Lor2;->e:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/StylingImageView;

    invoke-virtual {v0, v6}, Landroid/view/View;->setVisibility(I)V

    goto :goto_3ae

    :cond_35e
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f0409c4

    const v3, 0x7f0608b0

    invoke-static {v2, v1, v3}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v1

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f0409c1

    const v4, 0x7f060b07

    invoke-static {v3, v2, v4}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v2

    invoke-virtual {v0}, Lxq2;->H0()Lyq2;

    move-result-object v3

    iget-object v3, v3, Lyq2;->d:Lor2;

    iget-object v3, v3, Lor2;->f:Ljava/lang/Object;

    check-cast v3, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {v3, v1}, Landroid/widget/TextView;->setTextColor(I)V

    invoke-virtual {v0}, Lxq2;->H0()Lyq2;

    move-result-object v1

    iget-object v1, v1, Lyq2;->d:Lor2;

    iget-object v1, v1, Lor2;->b:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    invoke-virtual {v0}, Lxq2;->H0()Lyq2;

    move-result-object v1

    iget-object v1, v1, Lyq2;->d:Lor2;

    iget-object v1, v1, Lor2;->d:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/custom_views/StylingImageButton;

    invoke-virtual {v1, v6}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v0}, Lxq2;->H0()Lyq2;

    move-result-object v0

    iget-object v0, v0, Lyq2;->d:Lor2;

    iget-object v0, v0, Lor2;->e:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/StylingImageView;

    invoke-virtual {v0, v5}, Landroid/view/View;->setVisibility(I)V

    :goto_3ae
    return-void

    :pswitch_3af
    check-cast v0, Lt02;

    invoke-virtual {v0, v1}, Lt02;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_3b5
    check-cast v1, Lnc2;

    check-cast v0, Lkc2;

    invoke-virtual {v0}, Lkc2;->H0()Ldl9;

    move-result-object v2

    iget-object v2, v2, Ldl9;->g:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-boolean v3, v1, Lnc2;->b:Z

    iget-boolean v4, v1, Lnc2;->c:Z

    invoke-virtual {v2, v3}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->t(Z)V

    iget-boolean v2, v1, Lnc2;->b:Z

    if-eqz v2, :cond_3ce

    const v3, 0x7f1401d0

    goto :goto_3d1

    :cond_3ce
    const v3, 0x7f1401cf

    :goto_3d1
    invoke-virtual {v0}, Lkc2;->H0()Ldl9;

    move-result-object v7

    iget-object v7, v7, Ldl9;->g:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-object v7, v7, Lcom/opera/android/ui/catalog/widget/OperaListItem;->B:Ldmf;

    new-instance v8, Lrxh;

    invoke-direct {v8, v3}, Lrxh;-><init>(I)V

    invoke-virtual {v7, v8}, Ldmf;->V(Lpxh;)V

    invoke-virtual {v0}, Lkc2;->H0()Ldl9;

    move-result-object v3

    iget-object v3, v3, Ldl9;->d:Landroid/widget/LinearLayout;

    if-eqz v2, :cond_3eb

    move v7, v6

    goto :goto_3ec

    :cond_3eb
    move v7, v5

    :goto_3ec
    invoke-virtual {v3, v7}, Landroid/view/View;->setVisibility(I)V

    if-eqz v2, :cond_426

    invoke-virtual {v0}, Lkc2;->H0()Ldl9;

    move-result-object v2

    iget-object v2, v2, Ldl9;->b:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v4, :cond_3fb

    move v3, v6

    goto :goto_3fc

    :cond_3fb
    move v3, v5

    :goto_3fc
    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v0}, Lkc2;->H0()Ldl9;

    move-result-object v2

    iget-object v2, v2, Ldl9;->c:Lcom/opera/android/custom_views/SeparatorView;

    if-eqz v4, :cond_409

    move v3, v6

    goto :goto_40a

    :cond_409
    move v3, v5

    :goto_40a
    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v0}, Lkc2;->H0()Ldl9;

    move-result-object v2

    iget-object v2, v2, Ldl9;->f:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-boolean v3, v1, Lnc2;->d:Z

    if-nez v3, :cond_418

    move v6, v5

    :cond_418
    invoke-virtual {v2, v6}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v0}, Lkc2;->H0()Ldl9;

    move-result-object v2

    iget-object v2, v2, Ldl9;->f:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-boolean v3, v1, Lnc2;->e:Z

    invoke-virtual {v2, v3}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->t(Z)V

    :cond_426
    invoke-virtual {v0}, Lkc2;->H0()Ldl9;

    move-result-object v2

    iget-object v2, v2, Ldl9;->i:Lcom/opera/android/custom_views/SeparatorView;

    invoke-virtual {v2, v5}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v0}, Lkc2;->H0()Ldl9;

    move-result-object v2

    iget-object v2, v2, Ldl9;->s:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {v2, v5}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v0}, Lkc2;->H0()Ldl9;

    move-result-object v2

    iget-object v2, v2, Ldl9;->s:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-object v1, v1, Lnc2;->f:Lqxh;

    invoke-virtual {v2, v1}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->C(Lpxh;)V

    invoke-virtual {v0}, Lkc2;->H0()Ldl9;

    move-result-object v1

    iget-object v1, v1, Ldl9;->p:Lcom/opera/android/custom_views/SeparatorView;

    invoke-virtual {v1, v5}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v0}, Lkc2;->H0()Ldl9;

    move-result-object v1

    iget-object v1, v1, Ldl9;->m:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {v1, v5}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v0}, Lkc2;->H0()Ldl9;

    move-result-object v1

    iget-object v1, v1, Ldl9;->q:Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {v1, v5}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v0}, Lkc2;->H0()Ldl9;

    move-result-object v1

    iget-object v1, v1, Ldl9;->r:Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {v1, v5}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v0}, Lkc2;->H0()Ldl9;

    move-result-object v1

    iget-object v1, v1, Ldl9;->k:Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {v1, v5}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v0}, Lkc2;->H0()Ldl9;

    move-result-object v1

    iget-object v1, v1, Ldl9;->l:Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {v1, v5}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v0}, Lkc2;->H0()Ldl9;

    move-result-object v1

    iget-object v1, v1, Ldl9;->o:Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {v1, v5}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v0}, Lkc2;->H0()Ldl9;

    move-result-object v0

    iget-object v0, v0, Ldl9;->n:Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {v0, v5}, Landroid/view/View;->setVisibility(I)V

    return-void

    :pswitch_48c
    check-cast v0, Ly12;

    invoke-virtual {v0, v1}, Ly12;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_492
    check-cast v0, Lq3;

    invoke-virtual {v0, v1}, Lq3;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_498
    check-cast v1, Lus1;

    check-cast v0, Lts1;

    iget-object v0, v0, Lts1;->u:Lss1;

    sget-object v2, Lus1;->e:Lus1;

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_4e5

    iget-boolean v2, v1, Lus1;->d:Z

    iput-boolean v2, v0, Lss1;->c:Z

    iget-object v2, v1, Lus1;->b:Lqs1;

    if-eqz v2, :cond_4bc

    iget v3, v0, Lss1;->b:I

    iget v2, v2, Lqs1;->a:I

    if-eq v3, v2, :cond_4bc

    invoke-virtual {v0, v3}, Landroidx/recyclerview/widget/d;->notifyItemChanged(I)V

    invoke-virtual {v0, v2}, Landroidx/recyclerview/widget/d;->notifyItemChanged(I)V

    iput v2, v0, Lss1;->b:I

    :cond_4bc
    iget-boolean v2, v1, Lus1;->c:Z

    if-eqz v2, :cond_4de

    iget-object v2, v0, Lss1;->a:Ljava/util/List;

    check-cast v2, Ljava/lang/Iterable;

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_4c8
    :goto_4c8
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_4de

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lqs1;

    iget-boolean v4, v3, Lqs1;->c:Z

    if-eqz v4, :cond_4c8

    iget v3, v3, Lqs1;->a:I

    invoke-virtual {v0, v3}, Landroidx/recyclerview/widget/d;->notifyItemChanged(I)V

    goto :goto_4c8

    :cond_4de
    iget-object v1, v1, Lus1;->a:Ljava/util/List;

    iput-object v1, v0, Lss1;->a:Ljava/util/List;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/d;->notifyDataSetChanged()V

    :cond_4e5
    return-void

    :pswitch_4e6
    check-cast v0, Lz3;

    invoke-virtual {v0, v1}, Lz3;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_4ec
    check-cast v1, Lwu;

    check-cast v0, Lru;

    invoke-virtual {v0}, Lru;->I0()Lhm9;

    move-result-object v2

    iget-object v2, v2, Lhm9;->c:Lcom/google/android/material/textfield/TextInputLayout;

    if-eqz v1, :cond_4fb

    iget-object v4, v1, Lwu;->b:Landroid/graphics/drawable/Drawable;

    goto :goto_4fc

    :cond_4fb
    const/4 v4, 0x0

    :goto_4fc
    iget-object v2, v2, Lcom/google/android/material/textfield/TextInputLayout;->b:Lr3k;

    invoke-virtual {v2, v4}, Lr3k;->b(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v0}, Lru;->I0()Lhm9;

    move-result-object v2

    iget-object v2, v2, Lhm9;->b:Lcom/google/android/material/textfield/MaterialAutoCompleteTextView;

    iget-object v4, v0, Lru;->z:Lpu;

    if-nez v4, :cond_50c

    const/4 v4, 0x0

    :cond_50c
    invoke-virtual {v2, v4}, Landroid/widget/TextView;->removeTextChangedListener(Landroid/text/TextWatcher;)V

    invoke-virtual {v0}, Lru;->I0()Lhm9;

    move-result-object v2

    iget-object v2, v2, Lhm9;->b:Lcom/google/android/material/textfield/MaterialAutoCompleteTextView;

    if-eqz v1, :cond_520

    iget-object v1, v1, Lwu;->a:Lzt1;

    if-eqz v1, :cond_520

    invoke-interface {v1}, Lzt1;->getName()Ljava/lang/String;

    move-result-object v1

    goto :goto_521

    :cond_520
    const/4 v1, 0x0

    :goto_521
    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v5, ""

    if-nez v1, :cond_52f

    move-object v7, v5

    goto :goto_530

    :cond_52f
    move-object v7, v1

    :goto_530
    invoke-static {v4, v7}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_550

    if-eqz v1, :cond_53d

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v4

    goto :goto_53e

    :cond_53d
    move v4, v6

    :goto_53e
    invoke-virtual {v2}, Landroid/widget/TextView;->getSelectionStart()I

    move-result v7

    if-gt v7, v4, :cond_545

    move v3, v6

    :cond_545
    if-nez v1, :cond_548

    move-object v1, v5

    :cond_548
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    if-eqz v3, :cond_550

    invoke-virtual {v2, v4, v4}, Landroid/widget/EditText;->setSelection(II)V

    :cond_550
    invoke-virtual {v0}, Lru;->I0()Lhm9;

    move-result-object v1

    iget-object v1, v1, Lhm9;->b:Lcom/google/android/material/textfield/MaterialAutoCompleteTextView;

    iget-object v2, v0, Lru;->z:Lpu;

    if-nez v2, :cond_55c

    const/4 v4, 0x0

    goto :goto_55d

    :cond_55c
    move-object v4, v2

    :goto_55d
    invoke-virtual {v1, v4}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    invoke-virtual {v0}, Lru;->I0()Lhm9;

    move-result-object v1

    iget-object v1, v1, Lhm9;->j:Lcom/google/android/material/textfield/TextInputLayout;

    iget-object v1, v1, Lcom/google/android/material/textfield/TextInputLayout;->k:Ll6b;

    iget-boolean v1, v1, Ll6b;->q:Z

    if-eqz v1, :cond_575

    invoke-virtual {v0}, Lru;->I0()Lhm9;

    move-result-object v1

    iget-object v1, v1, Lhm9;->j:Lcom/google/android/material/textfield/TextInputLayout;

    invoke-virtual {v1, v6}, Lcom/google/android/material/textfield/TextInputLayout;->q(Z)V

    :cond_575
    invoke-virtual {v0, v6}, Lru;->M0(Z)V

    return-void

    :pswitch_579
    check-cast v0, Lz3;

    invoke-virtual {v0, v1}, Lz3;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_57f
    check-cast v0, Lbt;

    invoke-virtual {v0, v1}, Lbt;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_585
    check-cast v1, Lvt;

    check-cast v0, Lct;

    iget-object v2, v0, Lct;->u:Lks;

    iget-object v4, v0, Lct;->s:Lwk9;

    if-nez v4, :cond_590

    const/4 v4, 0x0

    :cond_590
    iget-object v4, v4, Lwk9;->v:Ljava/lang/Object;

    check-cast v4, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    invoke-virtual {v4, v6, v6}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->n(ZZ)V

    if-eqz v1, :cond_708

    instance-of v4, v1, Ltt;

    if-eqz v4, :cond_6cb

    iget-object v4, v0, Lct;->s:Lwk9;

    if-nez v4, :cond_5a2

    const/4 v4, 0x0

    :cond_5a2
    iget-object v4, v4, Lwk9;->l:Ljava/lang/Object;

    check-cast v4, Landroid/widget/LinearLayout;

    invoke-virtual {v4, v6}, Landroid/view/View;->setVisibility(I)V

    iget-object v4, v0, Lct;->s:Lwk9;

    if-nez v4, :cond_5ae

    const/4 v4, 0x0

    :cond_5ae
    iget-object v4, v4, Lwk9;->g:Ljava/lang/Object;

    check-cast v4, Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v4, v5}, Landroid/view/View;->setVisibility(I)V

    check-cast v1, Ltt;

    iget-object v4, v0, Lct;->s:Lwk9;

    if-nez v4, :cond_5bc

    const/4 v4, 0x0

    :cond_5bc
    iget-object v4, v4, Lwk9;->v:Ljava/lang/Object;

    check-cast v4, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    iget-boolean v7, v1, Ltt;->a:Z

    invoke-virtual {v4, v7}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setEnabled(Z)V

    iget-object v4, v0, Lct;->s:Lwk9;

    if-nez v4, :cond_5ca

    const/4 v4, 0x0

    :cond_5ca
    iget-object v4, v4, Lwk9;->u:Ljava/lang/Object;

    check-cast v4, Lcom/opera/android/custom_views/StylingTextView;

    iget-boolean v7, v1, Ltt;->b:Z

    if-eqz v7, :cond_5d4

    move v7, v6

    goto :goto_5d5

    :cond_5d4
    move v7, v5

    :goto_5d5
    invoke-virtual {v4, v7}, Landroid/view/View;->setVisibility(I)V

    iget-object v4, v1, Ltt;->c:Ljava/util/ArrayList;

    iget-object v7, v0, Lct;->v:Lks;

    sget-object v8, Lct;->C:[Lxtb;

    aget-object v3, v8, v3

    invoke-virtual {v7, v0}, Lqr;->b(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Les;

    iget-object v7, v0, Lct;->s:Lwk9;

    if-nez v7, :cond_5ec

    const/4 v9, 0x0

    goto :goto_5ed

    :cond_5ec
    move-object v9, v7

    :goto_5ed
    iget-object v9, v9, Lwk9;->m:Ljava/lang/Object;

    check-cast v9, Landroid/widget/LinearLayout;

    if-nez v7, :cond_5f4

    const/4 v7, 0x0

    :cond_5f4
    iget-object v7, v7, Lwk9;->q:Ljava/lang/Object;

    check-cast v7, Lcom/opera/android/custom_views/SeparatorView;

    invoke-static {v3, v9, v7, v4}, Lct;->H0(Lygc;Landroid/widget/LinearLayout;Lcom/opera/android/custom_views/SeparatorView;Ljava/util/List;)Z

    move-result v3

    if-eqz v3, :cond_608

    iget-object v3, v0, Lct;->s:Lwk9;

    if-nez v3, :cond_603

    const/4 v3, 0x0

    :cond_603
    iget-object v3, v3, Lwk9;->q:Ljava/lang/Object;

    check-cast v3, Lcom/opera/android/custom_views/SeparatorView;

    goto :goto_609

    :cond_608
    const/4 v3, 0x0

    :goto_609
    iget-object v4, v1, Ltt;->d:Ljava/util/List;

    iget-object v7, v0, Lct;->w:Lps;

    const/4 v9, 0x2

    aget-object v10, v8, v9

    invoke-virtual {v7, v0}, Lqr;->b(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Los;

    iget-object v10, v0, Lct;->s:Lwk9;

    if-nez v10, :cond_61c

    const/4 v11, 0x0

    goto :goto_61d

    :cond_61c
    move-object v11, v10

    :goto_61d
    iget-object v11, v11, Lwk9;->j:Ljava/lang/Object;

    check-cast v11, Landroid/widget/LinearLayout;

    if-nez v10, :cond_624

    const/4 v10, 0x0

    :cond_624
    iget-object v10, v10, Lwk9;->o:Ljava/lang/Object;

    check-cast v10, Lcom/opera/android/custom_views/SeparatorView;

    invoke-static {v7, v11, v10, v4}, Lct;->H0(Lygc;Landroid/widget/LinearLayout;Lcom/opera/android/custom_views/SeparatorView;Ljava/util/List;)Z

    move-result v4

    if-eqz v4, :cond_637

    iget-object v3, v0, Lct;->s:Lwk9;

    if-nez v3, :cond_633

    const/4 v3, 0x0

    :cond_633
    iget-object v3, v3, Lwk9;->o:Ljava/lang/Object;

    check-cast v3, Lcom/opera/android/custom_views/SeparatorView;

    :cond_637
    iget-object v4, v1, Ltt;->e:Ljava/util/ArrayList;

    iget-object v7, v0, Lct;->x:Lks;

    const/4 v10, 0x3

    aget-object v10, v8, v10

    invoke-virtual {v7, v0}, Lqr;->b(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Les;

    iget-object v10, v0, Lct;->s:Lwk9;

    if-nez v10, :cond_64a

    const/4 v11, 0x0

    goto :goto_64b

    :cond_64a
    move-object v11, v10

    :goto_64b
    iget-object v11, v11, Lwk9;->k:Ljava/lang/Object;

    check-cast v11, Landroid/widget/LinearLayout;

    if-nez v10, :cond_652

    const/4 v10, 0x0

    :cond_652
    iget-object v10, v10, Lwk9;->p:Ljava/lang/Object;

    check-cast v10, Lcom/opera/android/custom_views/SeparatorView;

    invoke-static {v7, v11, v10, v4}, Lct;->H0(Lygc;Landroid/widget/LinearLayout;Lcom/opera/android/custom_views/SeparatorView;Ljava/util/List;)Z

    move-result v4

    if-eqz v4, :cond_665

    iget-object v3, v0, Lct;->s:Lwk9;

    if-nez v3, :cond_661

    const/4 v3, 0x0

    :cond_661
    iget-object v3, v3, Lwk9;->p:Ljava/lang/Object;

    check-cast v3, Lcom/opera/android/custom_views/SeparatorView;

    :cond_665
    iget-object v4, v1, Ltt;->f:Ljava/util/ArrayList;

    iget-object v7, v0, Lct;->y:Lks;

    const/4 v10, 0x4

    aget-object v10, v8, v10

    invoke-virtual {v7, v0}, Lqr;->b(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Les;

    iget-object v10, v0, Lct;->s:Lwk9;

    if-nez v10, :cond_678

    const/4 v11, 0x0

    goto :goto_679

    :cond_678
    move-object v11, v10

    :goto_679
    iget-object v11, v11, Lwk9;->n:Landroid/view/View;

    check-cast v11, Landroid/widget/LinearLayout;

    if-nez v10, :cond_680

    const/4 v10, 0x0

    :cond_680
    iget-object v10, v10, Lwk9;->r:Ljava/lang/Object;

    check-cast v10, Lcom/opera/android/custom_views/SeparatorView;

    new-instance v12, Ljk;

    invoke-direct {v12, v0, v9}, Ljk;-><init>(Ljava/lang/Object;B)V

    invoke-static {v12, v4}, Lkotlin/collections/CollectionsKt;->c0(Ljava/util/Comparator;Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v4

    invoke-static {v7, v11, v10, v4}, Lct;->H0(Lygc;Landroid/widget/LinearLayout;Lcom/opera/android/custom_views/SeparatorView;Ljava/util/List;)Z

    move-result v4

    if-eqz v4, :cond_69c

    iget-object v3, v0, Lct;->s:Lwk9;

    if-nez v3, :cond_698

    const/4 v3, 0x0

    :cond_698
    iget-object v3, v3, Lwk9;->r:Ljava/lang/Object;

    check-cast v3, Lcom/opera/android/custom_views/SeparatorView;

    :cond_69c
    if-eqz v3, :cond_6bd

    iget-object v1, v1, Ltt;->g:Ljava/util/ArrayList;

    iget-object v4, v0, Lct;->z:Lks;

    const/4 v7, 0x5

    aget-object v7, v8, v7

    invoke-virtual {v4, v0}, Lqr;->b(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Les;

    iget-object v7, v0, Lct;->s:Lwk9;

    if-nez v7, :cond_6b0

    const/4 v7, 0x0

    :cond_6b0
    iget-object v7, v7, Lwk9;->b:Landroid/widget/LinearLayout;

    const/4 v9, 0x0

    invoke-static {v4, v7, v9, v1}, Lct;->H0(Lygc;Landroid/widget/LinearLayout;Lcom/opera/android/custom_views/SeparatorView;Ljava/util/List;)Z

    move-result v1

    if-eqz v1, :cond_6ba

    move v5, v6

    :cond_6ba
    invoke-virtual {v3, v5}, Landroid/view/View;->setVisibility(I)V

    :cond_6bd
    aget-object v1, v8, v6

    invoke-virtual {v2, v0}, Lqr;->b(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Les;

    sget-object v1, Ll08;->a:Ll08;

    invoke-virtual {v0, v1}, Lygc;->H(Ljava/util/List;)V

    goto :goto_70b

    :cond_6cb
    const/4 v9, 0x0

    instance-of v3, v1, Lut;

    if-eqz v3, :cond_708

    iget-object v3, v0, Lct;->s:Lwk9;

    if-nez v3, :cond_6d5

    move-object v3, v9

    :cond_6d5
    iget-object v3, v3, Lwk9;->l:Ljava/lang/Object;

    check-cast v3, Landroid/widget/LinearLayout;

    invoke-virtual {v3, v5}, Landroid/view/View;->setVisibility(I)V

    iget-object v3, v0, Lct;->s:Lwk9;

    if-nez v3, :cond_6e1

    move-object v3, v9

    :cond_6e1
    iget-object v3, v3, Lwk9;->v:Ljava/lang/Object;

    check-cast v3, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    invoke-virtual {v3, v6}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setEnabled(Z)V

    iget-object v3, v0, Lct;->s:Lwk9;

    if-nez v3, :cond_6ee

    move-object v4, v9

    goto :goto_6ef

    :cond_6ee
    move-object v4, v3

    :goto_6ef
    iget-object v3, v4, Lwk9;->g:Ljava/lang/Object;

    check-cast v3, Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v3, v6}, Landroid/view/View;->setVisibility(I)V

    sget-object v3, Lct;->C:[Lxtb;

    aget-object v3, v3, v6

    invoke-virtual {v2, v0}, Lqr;->b(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Les;

    check-cast v1, Lut;

    iget-object v1, v1, Lut;->a:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Lygc;->H(Ljava/util/List;)V

    goto :goto_70b

    :cond_708
    invoke-static {}, Lh9o;->p()V

    :goto_70b
    return-void

    :pswitch_70c
    check-cast v0, Lz3;

    invoke-virtual {v0, v1}, Lz3;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_712
    check-cast v0, Lz3;

    invoke-virtual {v0, v1}, Lz3;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_718
    check-cast v1, Lxj7;

    check-cast v0, Ltf;

    iget-object v2, v0, Ltf;->g:Lxj7;

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_729

    iput-object v1, v0, Ltf;->g:Lxj7;

    invoke-virtual {v0}, Ltf;->U()V

    :cond_729
    return-void

    :pswitch_72a
    check-cast v0, Lz3;

    invoke-virtual {v0, v1}, Lz3;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_data_730
    .packed-switch 0x0
        :pswitch_72a
        :pswitch_718
        :pswitch_712
        :pswitch_70c
        :pswitch_585
        :pswitch_57f
        :pswitch_579
        :pswitch_4ec
        :pswitch_4e6
        :pswitch_498
        :pswitch_492
        :pswitch_48c
        :pswitch_3b5
        :pswitch_3af
        :pswitch_262
        :pswitch_25c
        :pswitch_18a
        :pswitch_123
        :pswitch_ac
        :pswitch_a6
        :pswitch_a0
        :pswitch_9a
        :pswitch_39
        :pswitch_33
        :pswitch_2d
        :pswitch_27
        :pswitch_21
        :pswitch_1b
        :pswitch_15
    .end packed-switch
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    iget-byte v0, p0, Lpb;->a:B

    const/4 v1, 0x0

    packed-switch v0, :pswitch_data_2b8

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

    :pswitch_90
    instance-of v0, p1, Lf7f;

    if-eqz v0, :cond_a6

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_a6

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_a6
    return v1

    :pswitch_a7
    instance-of v0, p1, Lf7f;

    if-eqz v0, :cond_bd

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_bd

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_bd
    return v1

    :pswitch_be
    instance-of v0, p1, Lf7f;

    if-eqz v0, :cond_d4

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_d4

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_d4
    return v1

    :pswitch_d5
    instance-of v0, p1, Lf7f;

    if-eqz v0, :cond_eb

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_eb

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_eb
    return v1

    :pswitch_ec
    instance-of v0, p1, Lf7f;

    if-eqz v0, :cond_102

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_102

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_102
    return v1

    :pswitch_103
    instance-of v0, p1, Lf7f;

    if-eqz v0, :cond_119

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_119

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_119
    return v1

    :pswitch_11a
    instance-of v0, p1, Lf7f;

    if-eqz v0, :cond_130

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_130

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_130
    return v1

    :pswitch_131
    instance-of v0, p1, Lf7f;

    if-eqz v0, :cond_147

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_147

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_147
    return v1

    :pswitch_148
    instance-of v0, p1, Lf7f;

    if-eqz v0, :cond_15e

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_15e

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_15e
    return v1

    :pswitch_15f
    instance-of v0, p1, Lf7f;

    if-eqz v0, :cond_175

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_175

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_175
    return v1

    :pswitch_176
    instance-of v0, p1, Lf7f;

    if-eqz v0, :cond_18c

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_18c

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_18c
    return v1

    :pswitch_18d
    instance-of v0, p1, Lf7f;

    if-eqz v0, :cond_1a3

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_1a3

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_1a3
    return v1

    :pswitch_1a4
    instance-of v0, p1, Lf7f;

    if-eqz v0, :cond_1ba

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_1ba

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_1ba
    return v1

    :pswitch_1bb
    instance-of v0, p1, Lf7f;

    if-eqz v0, :cond_1d1

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_1d1

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_1d1
    return v1

    :pswitch_1d2
    instance-of v0, p1, Lf7f;

    if-eqz v0, :cond_1e8

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_1e8

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_1e8
    return v1

    :pswitch_1e9
    instance-of v0, p1, Lf7f;

    if-eqz v0, :cond_1ff

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_1ff

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_1ff
    return v1

    :pswitch_200
    instance-of v0, p1, Lf7f;

    if-eqz v0, :cond_216

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_216

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_216
    return v1

    :pswitch_217
    instance-of v0, p1, Lf7f;

    if-eqz v0, :cond_22d

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_22d

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_22d
    return v1

    :pswitch_22e
    instance-of v0, p1, Lf7f;

    if-eqz v0, :cond_244

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_244

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_244
    return v1

    :pswitch_245
    instance-of v0, p1, Lf7f;

    if-eqz v0, :cond_25b

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_25b

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_25b
    return v1

    :pswitch_25c
    instance-of v0, p1, Lf7f;

    if-eqz v0, :cond_272

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_272

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_272
    return v1

    :pswitch_273
    instance-of v0, p1, Lf7f;

    if-eqz v0, :cond_289

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_289

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_289
    return v1

    :pswitch_28a
    instance-of v0, p1, Lf7f;

    if-eqz v0, :cond_2a0

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_2a0

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_2a0
    return v1

    :pswitch_2a1
    instance-of v0, p1, Lf7f;

    if-eqz v0, :cond_2b7

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_2b7

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_2b7
    return v1

    :pswitch_data_2b8
    .packed-switch 0x0
        :pswitch_2a1
        :pswitch_28a
        :pswitch_273
        :pswitch_25c
        :pswitch_245
        :pswitch_22e
        :pswitch_217
        :pswitch_200
        :pswitch_1e9
        :pswitch_1d2
        :pswitch_1bb
        :pswitch_1a4
        :pswitch_18d
        :pswitch_176
        :pswitch_15f
        :pswitch_148
        :pswitch_131
        :pswitch_11a
        :pswitch_103
        :pswitch_ec
        :pswitch_d5
        :pswitch_be
        :pswitch_a7
        :pswitch_90
        :pswitch_79
        :pswitch_62
        :pswitch_4b
        :pswitch_34
        :pswitch_1d
    .end packed-switch
.end method

.method public final hashCode()I
    .registers 2

    iget-byte v0, p0, Lpb;->a:B

    packed-switch v0, :pswitch_data_114

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

    :pswitch_3b
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_44
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_4d
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_56
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_5f
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_68
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_71
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_7a
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_83
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_8c
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_95
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_9e
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_a7
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_b0
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_b9
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_c2
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_cb
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_d4
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_dd
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_e6
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_ef
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_f8
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_101
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_10a
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    nop

    :pswitch_data_114
    .packed-switch 0x0
        :pswitch_10a
        :pswitch_101
        :pswitch_f8
        :pswitch_ef
        :pswitch_e6
        :pswitch_dd
        :pswitch_d4
        :pswitch_cb
        :pswitch_c2
        :pswitch_b9
        :pswitch_b0
        :pswitch_a7
        :pswitch_9e
        :pswitch_95
        :pswitch_8c
        :pswitch_83
        :pswitch_7a
        :pswitch_71
        :pswitch_68
        :pswitch_5f
        :pswitch_56
        :pswitch_4d
        :pswitch_44
        :pswitch_3b
        :pswitch_32
        :pswitch_29
        :pswitch_20
        :pswitch_17
        :pswitch_e
    .end packed-switch
.end method
