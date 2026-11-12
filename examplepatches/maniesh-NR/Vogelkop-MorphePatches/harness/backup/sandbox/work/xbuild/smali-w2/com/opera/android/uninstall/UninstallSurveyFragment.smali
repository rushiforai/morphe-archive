.class public final Lcom/opera/android/uninstall/UninstallSurveyFragment;
.super Lltl;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u0007\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003\u00a8\u0006\u0004"
    }
    d2 = {
        "Lcom/opera/android/uninstall/UninstallSurveyFragment;",
        "Lltl;",
        "<init>",
        "()V",
        "app"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public final r:Lzyk;

.field public s:Lpt1;

.field public t:Lso5;

.field public u:Lso5;

.field public v:Z


# direct methods
.method public constructor <init>()V
    .registers 3

    const v0, 0x7f0d0447

    invoke-static {v0}, Lu7k;->j(I)Lu7k;

    move-result-object v0

    iget-object v0, v0, Lu7k;->a:Ljava/lang/Object;

    check-cast v0, Litl;

    const/4 v1, 0x1

    iput-boolean v1, v0, Litl;->e:Z

    invoke-direct {p0, v0}, Lltl;-><init>(Litl;)V

    new-instance v0, Lyse;

    const/16 v1, 0x14

    invoke-direct {v0, p0, v1}, Lyse;-><init>(Landroidx/fragment/app/Fragment;B)V

    invoke-static {v0}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object v0

    iput-object v0, p0, Lcom/opera/android/uninstall/UninstallSurveyFragment;->r:Lzyk;

    return-void
.end method

.method public static H0(Lnlm;)Ljava/lang/Integer;
    .registers 5

    iget-object v0, p0, Lnlm;->b:Lr22;

    const/4 v1, -0x1

    if-eqz v0, :cond_27

    iget-object v0, v0, Lr22;->d:Ljava/lang/Object;

    check-cast v0, Ljava/util/List;

    if-eqz v0, :cond_27

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const/4 v2, 0x0

    :goto_10
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_27

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ldlm;

    iget-object v3, v3, Ldlm;->a:Lclm;

    iget-boolean v3, v3, Lclm;->a:Z

    if-eqz v3, :cond_24

    move v1, v2

    goto :goto_27

    :cond_24
    add-int/lit8 v2, v2, 0x1

    goto :goto_10

    :cond_27
    :goto_27
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    if-ltz v1, :cond_3a

    iget-object p0, p0, Lnlm;->c:Ljava/util/Set;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {p0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_3a

    return-object v0

    :cond_3a
    const/4 p0, 0x0

    return-object p0
.end method


# virtual methods
.method public final G0()V
    .registers 6

    sget-object v0, Lfpj;->a:Ldpj;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v1}, Ldpj;->k(Landroid/content/Context;)Lfpj;

    move-result-object v0

    sget-object v1, Lfpj;->b:Lfpj;

    const/4 v2, 0x0

    if-ne v0, v1, :cond_14

    const/4 v0, 0x1

    goto :goto_15

    :cond_14
    move v0, v2

    :goto_15
    iget-boolean v1, p0, Lcom/opera/android/uninstall/UninstallSurveyFragment;->v:Z

    if-eq v0, v1, :cond_4c

    const/4 v1, 0x0

    if-eqz v0, :cond_21

    iget-object v3, p0, Lcom/opera/android/uninstall/UninstallSurveyFragment;->u:Lso5;

    if-nez v3, :cond_26

    goto :goto_25

    :cond_21
    iget-object v3, p0, Lcom/opera/android/uninstall/UninstallSurveyFragment;->t:Lso5;

    if-nez v3, :cond_26

    :goto_25
    move-object v3, v1

    :cond_26
    iget-object v4, p0, Lcom/opera/android/uninstall/UninstallSurveyFragment;->s:Lpt1;

    if-nez v4, :cond_2b

    move-object v4, v1

    :cond_2b
    iget-object v4, v4, Lpt1;->e:Ljava/lang/Object;

    check-cast v4, Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-virtual {v3, v4}, Lso5;->a(Landroidx/constraintlayout/widget/ConstraintLayout;)V

    iget-object v3, p0, Lcom/opera/android/uninstall/UninstallSurveyFragment;->s:Lpt1;

    if-eqz v3, :cond_37

    move-object v1, v3

    :cond_37
    iget-object v1, v1, Lpt1;->f:Ljava/lang/Object;

    check-cast v1, Lvs;

    iget-object v1, v1, Lvs;->e:Ljava/lang/Object;

    check-cast v1, Lb7k;

    iget-object v1, v1, Lb7k;->c:Ljava/lang/Object;

    check-cast v1, Landroid/widget/ImageView;

    if-eqz v0, :cond_47

    const/16 v2, 0x8

    :cond_47
    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    iput-boolean v0, p0, Lcom/opera/android/uninstall/UninstallSurveyFragment;->v:Z

    :cond_4c
    return-void
.end method

.method public final I0()Lrlm;
    .registers 1

    iget-object p0, p0, Lcom/opera/android/uninstall/UninstallSurveyFragment;->r:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lrlm;

    return-object p0
.end method

.method public final J0()V
    .registers 2

    iget-object v0, p0, Lcom/opera/android/uninstall/UninstallSurveyFragment;->s:Lpt1;

    if-nez v0, :cond_5

    const/4 v0, 0x0

    :cond_5
    iget-object v0, v0, Lpt1;->f:Ljava/lang/Object;

    check-cast v0, Lvs;

    iget-object v0, v0, Lvs;->d:Ljava/lang/Object;

    check-cast v0, Lvs;

    iget-object v0, v0, Lvs;->d:Ljava/lang/Object;

    check-cast v0, Lb7k;

    iget-object v0, v0, Lb7k;->c:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/OperaTextInputEditText;

    invoke-virtual {v0}, Landroid/view/View;->clearFocus()V

    sget-object v0, Lq9n;->c:Ll5b;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getView()Landroid/view/View;

    move-result-object p0

    invoke-static {p0}, Lq9n;->u(Landroid/view/View;)Z

    return-void
.end method

.method public final l0(Z)V
    .registers 2

    invoke-virtual {p0}, Lcom/opera/android/uninstall/UninstallSurveyFragment;->I0()Lrlm;

    move-result-object p0

    iget-object p0, p0, Lrlm;->b:Lw6j;

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lw6j;->l(Z)V

    return-void
.end method

.method public final onConfigurationChanged(Landroid/content/res/Configuration;)V
    .registers 2

    invoke-super {p0, p1}, Lltl;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    invoke-virtual {p0}, Lcom/opera/android/uninstall/UninstallSurveyFragment;->G0()V

    return-void
.end method

.method public final onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 7

    invoke-super {p0, p1, p2}, Lk24;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lcom/opera/android/uninstall/UninstallSurveyFragment;->I0()Lrlm;

    move-result-object p1

    iget-object p1, p1, Lrlm;->c:Lpde;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object p2

    iget-object v0, p0, Lcom/opera/android/uninstall/UninstallSurveyFragment;->s:Lpt1;

    const/4 v1, 0x0

    if-nez v0, :cond_13

    move-object v0, v1

    :cond_13
    iget-object v0, v0, Lpt1;->d:Ljava/lang/Object;

    check-cast v0, Landroidx/constraintlayout/widget/ConstraintLayout;

    new-instance v2, Lglm;

    const/4 v3, 0x0

    invoke-direct {v2, p0, v3}, Lglm;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1, p2, v0, v1, v2}, Lxf8;->i0(Lekc;Lndc;Landroid/view/ViewGroup;Ljava/util/List;Lf7f;)V

    return-void
.end method

.method public final y0(Landroid/view/LayoutInflater;Lcom/opera/android/StatusBarDrawingFrameLayout;)V
    .registers 20

    move-object/from16 v0, p0

    const v1, 0x7f0a02a9

    move-object/from16 v2, p2

    invoke-virtual {v2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    const v2, 0x7f0a0186

    invoke-static {v2, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Lcom/opera/android/custom_views/SideMarginContainer;

    const-string v4, "Missing required view with ID: "

    if-eqz v3, :cond_1d3

    const v2, 0x7f0a0108

    invoke-static {v2, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object v7, v3

    check-cast v7, Landroidx/constraintlayout/widget/ConstraintLayout;

    if-eqz v7, :cond_1d3

    const v2, 0x7f0a026e

    invoke-static {v2, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    if-eqz v3, :cond_1d3

    const v2, 0x7f0a02eb

    invoke-static {v2, v3}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    move-object v10, v5

    check-cast v10, Landroid/widget/TextView;

    if-eqz v10, :cond_1c3

    const v2, 0x7f0a04cd

    invoke-static {v2, v3}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    if-eqz v5, :cond_1c3

    const v2, 0x7f0a00f5

    invoke-static {v2, v5}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v6

    move-object v13, v6

    check-cast v13, Landroid/widget/LinearLayout;

    if-eqz v13, :cond_1b3

    const v2, 0x7f0a07ce

    invoke-static {v2, v5}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v6

    if-eqz v6, :cond_1b3

    const v2, 0x7f0a0c73

    invoke-static {v2, v6}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    check-cast v8, Lcom/opera/android/custom_views/OperaTextInputEditText;

    if-eqz v8, :cond_1a3

    new-instance v14, Lb7k;

    check-cast v6, Landroid/widget/FrameLayout;

    const/4 v2, 0x6

    invoke-direct {v14, v2, v6, v8}, Lb7k;-><init>(BLandroid/view/View;Ljava/lang/Object;)V

    const v2, 0x7f0a088d

    invoke-static {v2, v5}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v6

    move-object v15, v6

    check-cast v15, Landroid/widget/TextView;

    if-eqz v15, :cond_1b3

    new-instance v11, Lvs;

    move-object v12, v5

    check-cast v12, Landroid/widget/LinearLayout;

    const/16 v16, 0x17

    invoke-direct/range {v11 .. v16}, Lvs;-><init>(Landroid/view/ViewGroup;Landroid/view/View;Ljava/lang/Object;Ljava/lang/Object;B)V

    const v2, 0x7f0a0514

    invoke-static {v2, v3}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    if-eqz v5, :cond_1c3

    const v2, 0x7f0a047f

    invoke-static {v2, v5}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    if-eqz v6, :cond_193

    const v2, 0x7f0a0481

    invoke-static {v2, v5}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    if-eqz v6, :cond_193

    const v2, 0x7f0a0913

    invoke-static {v2, v5}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/ImageView;

    if-eqz v6, :cond_193

    new-instance v12, Lb7k;

    check-cast v5, Landroidx/constraintlayout/widget/ConstraintLayout;

    const/4 v2, 0x5

    invoke-direct {v12, v2, v5, v6}, Lb7k;-><init>(BLandroid/view/View;Ljava/lang/Object;)V

    const v2, 0x7f0a06bc

    invoke-static {v2, v3}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/Space;

    if-eqz v5, :cond_1c3

    move-object v5, v8

    new-instance v8, Lvs;

    move-object v9, v3

    check-cast v9, Landroidx/constraintlayout/widget/ConstraintLayout;

    const/16 v13, 0x16

    move-object v2, v5

    invoke-direct/range {v8 .. v13}, Lvs;-><init>(Landroid/view/ViewGroup;Landroid/view/View;Ljava/lang/Object;Ljava/lang/Object;B)V

    move-object v6, v1

    check-cast v6, Landroidx/constraintlayout/widget/ConstraintLayout;

    const v3, 0x7f0a086c

    invoke-static {v3, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    move-object v9, v5

    check-cast v9, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    if-eqz v9, :cond_191

    const v3, 0x7f0a0953

    invoke-static {v3, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    move-object v10, v5

    check-cast v10, Lcom/google/android/material/button/MaterialButton;

    if-eqz v10, :cond_191

    const v3, 0x7f0a0b84

    invoke-static {v3, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    move-object v11, v5

    check-cast v11, Landroid/view/ViewStub;

    if-eqz v11, :cond_191

    const v3, 0x7f0a0bba

    invoke-static {v3, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    check-cast v5, Lcom/opera/android/custom_views/LayoutDirectionToolbar;

    if-eqz v5, :cond_191

    new-instance v5, Lpt1;

    const/16 v12, 0x1a

    invoke-direct/range {v5 .. v12}, Lpt1;-><init>(Landroid/view/ViewGroup;Landroid/view/View;Ljava/lang/Object;Landroid/view/View;Landroid/view/View;Landroid/view/View;B)V

    new-instance v1, Lflm;

    const/4 v3, 0x0

    invoke-direct {v1, v0, v3}, Lflm;-><init>(Lcom/opera/android/uninstall/UninstallSurveyFragment;B)V

    invoke-virtual {v9, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v1, Lflm;

    const/4 v3, 0x1

    invoke-direct {v1, v0, v3}, Lflm;-><init>(Lcom/opera/android/uninstall/UninstallSurveyFragment;B)V

    invoke-virtual {v10, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v1, Lh63;

    const/16 v3, 0x9

    invoke-direct {v1, v0, v3}, Lh63;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    iput-object v5, v0, Lcom/opera/android/uninstall/UninstallSurveyFragment;->s:Lpt1;

    new-instance v1, Lso5;

    invoke-direct {v1}, Lso5;-><init>()V

    iget-object v2, v0, Lcom/opera/android/uninstall/UninstallSurveyFragment;->s:Lpt1;

    const/4 v3, 0x0

    if-nez v2, :cond_12b

    move-object v2, v3

    :cond_12b
    iget-object v2, v2, Lpt1;->e:Ljava/lang/Object;

    check-cast v2, Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-virtual {v1, v2}, Lso5;->d(Landroidx/constraintlayout/widget/ConstraintLayout;)V

    iput-object v1, v0, Lcom/opera/android/uninstall/UninstallSurveyFragment;->t:Lso5;

    new-instance v4, Lso5;

    invoke-direct {v4}, Lso5;-><init>()V

    iget-object v1, v0, Lcom/opera/android/uninstall/UninstallSurveyFragment;->s:Lpt1;

    if-eqz v1, :cond_13e

    move-object v3, v1

    :cond_13e
    iget-object v1, v3, Lpt1;->e:Ljava/lang/Object;

    check-cast v1, Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-virtual {v4, v1}, Lso5;->d(Landroidx/constraintlayout/widget/ConstraintLayout;)V

    const/4 v8, 0x6

    const/4 v9, 0x0

    const v5, 0x7f0a0953

    const/4 v6, 0x6

    const/4 v7, 0x0

    invoke-virtual/range {v4 .. v9}, Lso5;->f(IIIII)V

    const/4 v6, 0x7

    const v7, 0x7f0a086c

    invoke-virtual/range {v4 .. v9}, Lso5;->f(IIIII)V

    const/4 v8, 0x3

    const/4 v6, 0x3

    const/4 v7, 0x0

    invoke-virtual/range {v4 .. v9}, Lso5;->f(IIIII)V

    const/4 v8, 0x4

    const/4 v6, 0x4

    invoke-virtual/range {v4 .. v9}, Lso5;->f(IIIII)V

    new-instance v1, Lixh;

    const/high16 v2, 0x41800000    # 16.0f

    invoke-direct {v1, v2}, Lixh;-><init>(F)V

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v1, v2}, Ly7h;->k(Landroid/content/Context;)I

    move-result v9

    const v5, 0x7f0a086c

    const/4 v6, 0x6

    const v7, 0x7f0a0953

    const/4 v8, 0x7

    invoke-virtual/range {v4 .. v9}, Lso5;->f(IIIII)V

    const/4 v9, 0x0

    const/4 v6, 0x7

    const/4 v7, 0x0

    invoke-virtual/range {v4 .. v9}, Lso5;->f(IIIII)V

    const/4 v8, 0x3

    const/4 v6, 0x3

    invoke-virtual/range {v4 .. v9}, Lso5;->f(IIIII)V

    const/4 v8, 0x4

    const/4 v6, 0x4

    invoke-virtual/range {v4 .. v9}, Lso5;->f(IIIII)V

    iput-object v4, v0, Lcom/opera/android/uninstall/UninstallSurveyFragment;->u:Lso5;

    invoke-virtual {v0}, Lcom/opera/android/uninstall/UninstallSurveyFragment;->G0()V

    return-void

    :cond_191
    move v2, v3

    goto :goto_1d3

    :cond_193
    invoke-virtual {v5}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    return-void

    :cond_1a3
    invoke-virtual {v6}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    return-void

    :cond_1b3
    invoke-virtual {v5}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    return-void

    :cond_1c3
    invoke-virtual {v3}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    return-void

    :cond_1d3
    :goto_1d3
    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    return-void
.end method
