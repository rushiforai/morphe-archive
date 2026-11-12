.class public final Lo2b;
.super Llj;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0008\u0007\u0018\u00002\u00020\u0001:\u0001\u0004B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003\u00a8\u0006\u0005"
    }
    d2 = {
        "Lo2b;",
        "Llj;",
        "<init>",
        "()V",
        "s9i",
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
.field public r:Landroid/view/ViewGroup;

.field public s:Ls9i;

.field public final t:Lzyk;

.field public u:I


# direct methods
.method public constructor <init>()V
    .registers 3

    sget v0, Lfki;->a:I

    invoke-static {v0}, Lu7k;->f(I)Lu7k;

    move-result-object v0

    const v1, 0x7f14086a

    invoke-virtual {v0, v1}, Lu7k;->s(I)V

    iget-object v0, v0, Lu7k;->a:Ljava/lang/Object;

    check-cast v0, Litl;

    invoke-direct {p0, v0}, Lltl;-><init>(Litl;)V

    new-instance v0, Lt2;

    const/16 v1, 0x19

    invoke-direct {v0, p0, v1}, Lt2;-><init>(Ljava/lang/Object;B)V

    invoke-static {v0}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object v0

    iput-object v0, p0, Lo2b;->t:Lzyk;

    return-void
.end method


# virtual methods
.method public final G0(Landroid/view/LayoutInflater;Z)V
    .registers 23

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-object v2, v0, Lo2b;->r:Landroid/view/ViewGroup;

    const/4 v3, 0x0

    if-nez v2, :cond_a

    move-object v2, v3

    :cond_a
    invoke-virtual {v2}, Landroid/view/ViewGroup;->removeAllViews()V

    iget-object v2, v0, Lo2b;->r:Landroid/view/ViewGroup;

    const-string v4, "Missing required view with ID: "

    const v5, 0x7f0a086f

    const v6, 0x7f0a0818

    const v7, 0x7f0a062a

    const v8, 0x7f0a0579

    const v9, 0x7f0a056f

    const v10, 0x7f0a026e

    const v11, 0x7f0a017a

    const/4 v12, 0x0

    if-eqz p2, :cond_9c

    if-nez v2, :cond_2c

    move-object v2, v3

    :cond_2c
    const v13, 0x7f0d0217

    invoke-virtual {v1, v13, v2, v12}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    invoke-static {v11, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v14, v2

    check-cast v14, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v14, :cond_8b

    invoke-static {v10, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/LinearLayout;

    if-eqz v2, :cond_89

    invoke-static {v9, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    if-eqz v2, :cond_87

    invoke-static {v8, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object/from16 v16, v2

    check-cast v16, Lcom/google/android/material/button/MaterialButton;

    if-eqz v16, :cond_85

    invoke-static {v7, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroidx/constraintlayout/widget/ConstraintLayout;

    if-eqz v2, :cond_83

    invoke-static {v6, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v15, v2

    check-cast v15, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v15, :cond_81

    invoke-static {v5, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object/from16 v17, v2

    check-cast v17, Landroid/widget/TextView;

    if-eqz v17, :cond_8c

    check-cast v1, Landroidx/constraintlayout/widget/ConstraintLayout;

    new-instance v13, Ls9i;

    const/16 v18, 0x12

    const/16 v19, 0x0

    invoke-direct/range {v13 .. v19}, Ls9i;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;BZ)V

    goto/16 :goto_f2

    :cond_81
    move v5, v6

    goto :goto_8c

    :cond_83
    move v5, v7

    goto :goto_8c

    :cond_85
    move v5, v8

    goto :goto_8c

    :cond_87
    move v5, v9

    goto :goto_8c

    :cond_89
    move v5, v10

    goto :goto_8c

    :cond_8b
    move v5, v11

    :cond_8c
    :goto_8c
    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v5}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    return-void

    :cond_9c
    if-nez v2, :cond_9f

    move-object v2, v3

    :cond_9f
    const v13, 0x7f0d0216

    invoke-virtual {v1, v13, v2, v12}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    invoke-static {v11, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v14, v2

    check-cast v14, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v14, :cond_195

    invoke-static {v10, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/LinearLayout;

    if-eqz v2, :cond_193

    invoke-static {v9, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    if-eqz v2, :cond_191

    invoke-static {v8, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object/from16 v16, v2

    check-cast v16, Lcom/google/android/material/button/MaterialButton;

    if-eqz v16, :cond_18f

    invoke-static {v7, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroidx/constraintlayout/widget/ConstraintLayout;

    if-eqz v2, :cond_18d

    invoke-static {v6, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v15, v2

    check-cast v15, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v15, :cond_18b

    invoke-static {v5, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object/from16 v17, v2

    check-cast v17, Landroid/widget/TextView;

    if-eqz v17, :cond_196

    check-cast v1, Landroidx/constraintlayout/widget/ConstraintLayout;

    new-instance v13, Ls9i;

    const/16 v18, 0x12

    const/16 v19, 0x0

    invoke-direct/range {v13 .. v19}, Ls9i;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;BZ)V

    :goto_f2
    iput-object v13, v0, Lo2b;->s:Ls9i;

    const v1, 0x7f14086d

    invoke-virtual {v0, v1}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lowj;

    new-instance v4, Ljng;

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v5

    new-instance v6, Lrl;

    const/4 v7, 0x4

    invoke-direct {v6, v7}, Lrl;-><init>(B)V

    const/4 v8, 0x2

    invoke-direct {v4, v8, v5, v6}, Ljng;-><init>(ILandroid/content/Context;Ljava/lang/Runnable;)V

    const-string v5, "<ps>"

    const-string v6, "</ps>"

    invoke-direct {v2, v5, v6, v4}, Lowj;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/text/style/CharacterStyle;)V

    filled-new-array {v2}, [Lowj;

    move-result-object v2

    invoke-static {v1, v2}, Ln1h;->d(Ljava/lang/String;[Lowj;)Landroid/text/SpannableString;

    move-result-object v1

    iget-object v2, v0, Lo2b;->s:Ls9i;

    if-nez v2, :cond_121

    move-object v2, v3

    :cond_121
    iget-object v2, v2, Ls9i;->e:Ljava/lang/Object;

    check-cast v2, Landroid/widget/TextView;

    invoke-static {v2, v1}, Lphj;->u0(Landroid/widget/TextView;Ljava/lang/CharSequence;)V

    iget-object v1, v0, Lo2b;->t:Lzyk;

    invoke-virtual {v1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lq2b;

    iget-object v1, v1, Lq2b;->c:Lpde;

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ln3b;

    iget-object v2, v0, Lo2b;->s:Ls9i;

    if-nez v2, :cond_13d

    move-object v2, v3

    :cond_13d
    iget-object v4, v2, Ls9i;->b:Ljava/lang/Object;

    check-cast v4, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-boolean v5, v1, Ln3b;->a:Z

    invoke-virtual {v4, v5}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setChecked(Z)V

    iget-object v4, v2, Ls9i;->c:Ljava/lang/Object;

    check-cast v4, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-boolean v5, v1, Ln3b;->b:Z

    invoke-virtual {v4, v5}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setChecked(Z)V

    iget-object v2, v2, Ls9i;->d:Ljava/lang/Object;

    check-cast v2, Lcom/google/android/material/button/MaterialButton;

    iget-boolean v1, v1, Ln3b;->c:Z

    invoke-virtual {v2, v1}, Landroid/view/View;->setEnabled(Z)V

    iget-object v1, v0, Lo2b;->s:Ls9i;

    if-nez v1, :cond_15e

    move-object v2, v3

    goto :goto_15f

    :cond_15e
    move-object v2, v1

    :goto_15f
    iget-object v2, v2, Ls9i;->b:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance v4, Ln2b;

    invoke-direct {v4, v0, v12}, Ln2b;-><init>(Lo2b;B)V

    iput-object v4, v2, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u:Lvlf;

    if-nez v1, :cond_16e

    move-object v2, v3

    goto :goto_16f

    :cond_16e
    move-object v2, v1

    :goto_16f
    iget-object v2, v2, Ls9i;->c:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance v4, Ln2b;

    const/4 v5, 0x1

    invoke-direct {v4, v0, v5}, Ln2b;-><init>(Lo2b;B)V

    iput-object v4, v2, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u:Lvlf;

    if-eqz v1, :cond_17e

    move-object v3, v1

    :cond_17e
    iget-object v1, v3, Ls9i;->d:Ljava/lang/Object;

    check-cast v1, Lcom/google/android/material/button/MaterialButton;

    new-instance v2, Lsma;

    invoke-direct {v2, v0, v7}, Lsma;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void

    :cond_18b
    move v5, v6

    goto :goto_196

    :cond_18d
    move v5, v7

    goto :goto_196

    :cond_18f
    move v5, v8

    goto :goto_196

    :cond_191
    move v5, v9

    goto :goto_196

    :cond_193
    move v5, v10

    goto :goto_196

    :cond_195
    move v5, v11

    :cond_196
    :goto_196
    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v5}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    return-void
.end method

.method public final onConfigurationChanged(Landroid/content/res/Configuration;)V
    .registers 4

    invoke-super {p0, p1}, Lltl;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    iget v0, p0, Lo2b;->u:I

    iget p1, p1, Landroid/content/res/Configuration;->orientation:I

    if-eq v0, p1, :cond_18

    iput p1, p0, Lo2b;->u:I

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object p1

    iget v0, p0, Lo2b;->u:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_15

    const/4 v1, 0x0

    :cond_15
    invoke-virtual {p0, p1, v1}, Lo2b;->G0(Landroid/view/LayoutInflater;Z)V

    :cond_18
    return-void
.end method

.method public final v0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)V
    .registers 6

    iput-object p2, p0, Lo2b;->r:Landroid/view/ViewGroup;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget v0, v0, Landroid/content/res/Configuration;->orientation:I

    iput v0, p0, Lo2b;->u:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_13

    move v0, v1

    goto :goto_14

    :cond_13
    const/4 v0, 0x0

    :goto_14
    invoke-virtual {p0, p1, v0}, Lo2b;->G0(Landroid/view/LayoutInflater;Z)V

    iget-object p1, p0, Lo2b;->t:Lzyk;

    invoke-virtual {p1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lq2b;

    iget-object p1, p1, Lq2b;->c:Lpde;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object v0

    new-instance v2, Liwa;

    invoke-direct {v2, p0, v1}, Liwa;-><init>(Ljava/lang/Object;B)V

    const/4 p0, 0x0

    invoke-static {p1, v0, p2, p0, v2}, Lxf8;->i0(Lekc;Lndc;Landroid/view/ViewGroup;Ljava/util/List;Lf7f;)V

    return-void
.end method
