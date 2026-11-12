.class public final Le35;
.super Lltl;
.source "SourceFile"


# instance fields
.field public final r:Ljava/util/ArrayList;

.field public s:Landroid/view/LayoutInflater;

.field public t:Landroid/widget/LinearLayout;

.field public u:Lpq3;

.field public v:Lac1;

.field public w:Lcom/opera/android/ui/catalog/widget/OperaListItem;

.field public x:Ls25;

.field public y:I

.field public final z:Lse3;


# direct methods
.method public constructor <init>()V
    .registers 3

    sget v0, Lfki;->a:I

    invoke-static {v0}, Lu7k;->f(I)Lu7k;

    move-result-object v0

    const v1, 0x7f140437

    invoke-virtual {v0, v1}, Lu7k;->s(I)V

    iget-object v0, v0, Lu7k;->a:Ljava/lang/Object;

    check-cast v0, Litl;

    const v1, 0x7f100011

    iput v1, v0, Litl;->b:I

    const/4 v1, 0x1

    iput v1, v0, Litl;->k:I

    iput-boolean v1, v0, Litl;->d:Z

    invoke-direct {p0, v0}, Lltl;-><init>(Litl;)V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Le35;->r:Ljava/util/ArrayList;

    new-instance v0, Lse3;

    invoke-direct {v0, p0}, Lse3;-><init>(Le35;)V

    iput-object v0, p0, Le35;->z:Lse3;

    return-void
.end method

.method public static H0(I)Le35;
    .registers 4

    new-instance v0, Le35;

    invoke-direct {v0}, Le35;-><init>()V

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string v2, "scenario"

    invoke-static {p0}, Lvep;->A(I)I

    move-result p0

    invoke-virtual {v1, v2, p0}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    invoke-virtual {v0, v1}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    return-object v0
.end method


# virtual methods
.method public final G0([Lr25;I)V
    .registers 7

    iget-object v0, p0, Le35;->s:Landroid/view/LayoutInflater;

    iget-object v1, p0, Le35;->t:Landroid/widget/LinearLayout;

    const v2, 0x7f0d037f

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v1, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iput-object v0, p0, Le35;->w:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-object v1, p0, Le35;->t:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    iget-object v0, p0, Le35;->w:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-static {p2, v0}, Lu35;->k(ILcom/opera/android/ui/catalog/widget/OperaListItem;)V

    iget-object p2, p0, Le35;->w:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance v0, Lb35;

    const/4 v1, 0x2

    invoke-direct {v0, p0, v1}, Lb35;-><init>(Le35;B)V

    invoke-virtual {p2, v0}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    array-length p2, p1

    :goto_26
    if-ge v3, p2, :cond_4a

    aget-object v0, p1, v3

    new-instance v1, Lc35;

    invoke-direct {v1, p0, v0}, Lc35;-><init>(Le35;Lr25;)V

    iget-object v0, p0, Le35;->r:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lc35;

    iget-object v0, v0, Lc35;->b:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_26

    :cond_4a
    return-void
.end method

.method public final I0(Ljava/lang/Class;)Lc35;
    .registers 6

    iget-object p0, p0, Le35;->r:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    :cond_7
    if-ge v1, v0, :cond_1a

    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v1, v1, 0x1

    check-cast v2, Lc35;

    iget-object v3, v2, Lc35;->a:Lr25;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-ne v3, p1, :cond_7

    return-object v2

    :cond_1a
    invoke-static {}, Lhai;->d()V

    const/4 p0, 0x0

    return-object p0
.end method

.method public final J0()V
    .registers 6

    iget-object v0, p0, Le35;->w:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v0, :cond_9

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    :cond_9
    iget-object p0, p0, Le35;->r:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    move v2, v1

    :cond_11
    :goto_11
    if-ge v2, v0, :cond_25

    invoke-virtual {p0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v2, v2, 0x1

    check-cast v3, Lc35;

    iget-boolean v4, v3, Lc35;->e:Z

    if-eqz v4, :cond_11

    iget-object v3, v3, Lc35;->b:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {v3, v1}, Landroid/view/View;->setVisibility(I)V

    goto :goto_11

    :cond_25
    return-void
.end method

.method public final l0(Z)V
    .registers 3

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/r;

    move-result-object p1

    invoke-virtual {p0}, Lryl;->g0()V

    iget p0, p0, Le35;->y:I

    const/4 v0, 0x1

    if-ne p0, v0, :cond_f

    invoke-virtual {p1, v0}, Landroid/app/Activity;->moveTaskToBack(Z)Z

    :cond_f
    return-void
.end method

.method public final onMenuItemClick(Landroid/view/MenuItem;)Z
    .registers 3

    iget-object p0, p0, Le35;->v:Lac1;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p1

    iget-object v0, p0, Lac1;->e:Ljava/lang/Object;

    check-cast v0, Landroid/view/MenuItem;

    invoke-interface {v0}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    if-ne p1, v0, :cond_22

    iget p1, p0, Lac1;->b:I

    iget-object p0, p0, Lac1;->d:Ljava/lang/Object;

    check-cast p0, Li35;

    if-nez p1, :cond_1f

    invoke-interface {p0}, Li35;->a0()V

    goto :goto_22

    :cond_1f
    invoke-interface {p0}, Li35;->l()V

    :cond_22
    :goto_22
    const/4 p0, 0x1

    return p0
.end method

.method public final u0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)V
    .registers 4

    invoke-static {p1, p2}, Lpq3;->b(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Lpq3;

    move-result-object p1

    iput-object p1, p0, Le35;->u:Lpq3;

    iget-object p1, p1, Lpq3;->d:Lcom/google/android/material/button/MaterialButton;

    const p2, 0x7f140fa2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    iget-object p1, p0, Le35;->u:Lpq3;

    iget-object p1, p1, Lpq3;->d:Lcom/google/android/material/button/MaterialButton;

    new-instance p2, Lb35;

    const/4 v0, 0x0

    invoke-direct {p2, p0, v0}, Lb35;-><init>(Le35;B)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Le35;->u:Lpq3;

    iget-object p1, p1, Lpq3;->c:Lcom/google/android/material/button/MaterialButton;

    const p2, 0x7f1403bf

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    iget-object p1, p0, Le35;->u:Lpq3;

    iget-object p1, p1, Lpq3;->c:Lcom/google/android/material/button/MaterialButton;

    new-instance p2, Lb35;

    const/4 v0, 0x1

    invoke-direct {p2, p0, v0}, Lb35;-><init>(Le35;B)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public final v0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)V
    .registers 38

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    iput-object v1, v0, Le35;->s:Landroid/view/LayoutInflater;

    const v3, 0x7f0d0381

    const/4 v4, 0x0

    invoke-virtual {v1, v3, v2, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    if-eqz v1, :cond_27c

    check-cast v1, Landroid/widget/LinearLayout;

    iput-object v1, v0, Le35;->t:Landroid/widget/LinearLayout;

    const/4 v1, 0x3

    invoke-static {v1}, Lvep;->B(I)[I

    move-result-object v2

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    move-result-object v3

    const-string v5, "scenario"

    invoke-virtual {v3, v5}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    move-result v3

    aget v2, v2, v3

    iput v2, v0, Le35;->y:I

    invoke-static {v2}, Lvep;->A(I)I

    move-result v2

    const/16 v8, 0xe

    const/4 v13, 0x2

    iget-object v14, v0, Le35;->r:Ljava/util/ArrayList;

    const/4 v15, 0x1

    if-eqz v2, :cond_1ba

    if-eq v2, v15, :cond_c9

    if-ne v2, v13, :cond_262

    new-instance v2, Lq25;

    invoke-direct {v2, v4}, Lq25;-><init>(B)V

    const/16 p1, 0xa

    new-instance v5, Lz25;

    invoke-direct {v5, v4}, Lz25;-><init>(B)V

    new-instance v16, Ly25;

    invoke-direct/range {v16 .. v16}, Ly25;-><init>()V

    const/16 p2, 0x8

    new-instance v7, Lo25;

    invoke-direct {v7, v13}, Lo25;-><init>(B)V

    const/16 v17, 0x6

    new-instance v9, Lo25;

    invoke-direct {v9, v4}, Lo25;-><init>(B)V

    const/16 v18, 0x5

    new-instance v10, Lt25;

    invoke-direct {v10, v15}, Lt25;-><init>(B)V

    const/16 v19, 0x4

    new-instance v11, Lt25;

    invoke-direct {v11, v4}, Lt25;-><init>(B)V

    const/16 v20, 0xb

    new-instance v3, Lx25;

    invoke-direct {v3, v4}, Lx25;-><init>(B)V

    new-instance v21, Ln25;

    invoke-direct/range {v21 .. v21}, Ln25;-><init>()V

    move/from16 v22, v1

    new-instance v1, Lq25;

    invoke-direct {v1, v15}, Lq25;-><init>(B)V

    const/16 v23, 0x9

    new-instance v6, Lz25;

    invoke-direct {v6, v15}, Lz25;-><init>(B)V

    new-instance v24, Lv25;

    invoke-direct/range {v24 .. v24}, Lv25;-><init>()V

    move/from16 v25, v13

    new-instance v13, Lo25;

    invoke-direct {v13, v15}, Lo25;-><init>(B)V

    const/16 v26, 0x7

    new-instance v12, Lx25;

    invoke-direct {v12, v15}, Lx25;-><init>(B)V

    move/from16 v27, v15

    new-array v15, v8, [Lr25;

    aput-object v2, v15, v4

    aput-object v5, v15, v27

    aput-object v16, v15, v25

    aput-object v7, v15, v22

    aput-object v9, v15, v19

    aput-object v10, v15, v18

    aput-object v11, v15, v17

    aput-object v3, v15, v26

    aput-object v21, v15, p2

    aput-object v1, v15, v23

    aput-object v6, v15, p1

    aput-object v24, v15, v20

    const/16 v1, 0xc

    aput-object v13, v15, v1

    const/16 v1, 0xd

    aput-object v12, v15, v1

    :goto_ba
    if-ge v4, v8, :cond_262

    aget-object v1, v15, v4

    new-instance v2, Lc35;

    invoke-direct {v2, v0, v1}, Lc35;-><init>(Le35;Lr25;)V

    invoke-virtual {v14, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v4, v4, 0x1

    goto :goto_ba

    :cond_c9
    move/from16 v22, v1

    move/from16 v25, v13

    move/from16 v27, v15

    const/16 p2, 0x8

    const/16 v17, 0x6

    const/16 v18, 0x5

    const/16 v19, 0x4

    const/16 v23, 0x9

    const/16 v26, 0x7

    new-instance v1, Lq25;

    invoke-direct {v1, v4}, Lq25;-><init>(B)V

    new-instance v2, Lz25;

    invoke-direct {v2, v4}, Lz25;-><init>(B)V

    new-instance v3, Ly25;

    invoke-direct {v3}, Ly25;-><init>()V

    new-instance v5, Lq25;

    move/from16 v6, v27

    invoke-direct {v5, v6}, Lq25;-><init>(B)V

    new-instance v7, Lz25;

    invoke-direct {v7, v6}, Lz25;-><init>(B)V

    new-instance v9, Lx25;

    invoke-direct {v9, v4}, Lx25;-><init>(B)V

    new-instance v10, Ln25;

    invoke-direct {v10}, Ln25;-><init>()V

    move/from16 v11, v26

    new-array v12, v11, [Lr25;

    aput-object v1, v12, v4

    aput-object v2, v12, v6

    aput-object v3, v12, v25

    aput-object v5, v12, v22

    aput-object v7, v12, v19

    aput-object v9, v12, v18

    aput-object v10, v12, v17

    move v1, v4

    :goto_113
    if-ge v1, v11, :cond_123

    aget-object v2, v12, v1

    new-instance v3, Lc35;

    invoke-direct {v3, v0, v2}, Lc35;-><init>(Le35;Lr25;)V

    invoke-virtual {v14, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    const/4 v11, 0x7

    goto :goto_113

    :cond_123
    new-instance v1, Lo25;

    invoke-direct {v1, v4}, Lo25;-><init>(B)V

    new-instance v2, Lt25;

    const/4 v6, 0x1

    invoke-direct {v2, v6}, Lt25;-><init>(B)V

    new-instance v28, Lq25;

    new-instance v3, Lrxh;

    const v5, 0x7f141440

    invoke-direct {v3, v5}, Lrxh;-><init>(I)V

    const v32, 0x7f080593

    sget-object v33, La35;->o:La35;

    const-string v29, "Wallpaper"

    const/16 v31, 0x0

    move-object/from16 v30, v3

    invoke-direct/range {v28 .. v33}, Lq25;-><init>(Ljava/lang/String;Lrxh;Lrxh;ILa35;)V

    new-instance v3, Lt25;

    invoke-direct {v3, v4}, Lt25;-><init>(B)V

    new-instance v5, Lo25;

    move/from16 v6, v25

    invoke-direct {v5, v6}, Lo25;-><init>(B)V

    new-instance v6, Lo25;

    const/4 v7, 0x1

    invoke-direct {v6, v7}, Lo25;-><init>(B)V

    new-instance v9, Lx25;

    invoke-direct {v9, v7}, Lx25;-><init>(B)V

    new-instance v29, Ly25;

    new-instance v7, Lrxh;

    const v10, 0x7f140438

    invoke-direct {v7, v10}, Lrxh;-><init>(I)V

    const v33, 0x7f08063b

    sget-object v34, La35;->p:La35;

    const-string v30, "OnboardingProfile"

    const/16 v32, 0x0

    move-object/from16 v31, v7

    invoke-direct/range {v29 .. v34}, Ly25;-><init>(Ljava/lang/String;Lrxh;Lrxh;ILa35;)V

    new-instance v7, Lv25;

    invoke-direct {v7}, Lv25;-><init>()V

    move/from16 v10, v23

    new-array v10, v10, [Lr25;

    aput-object v1, v10, v4

    const/16 v27, 0x1

    aput-object v2, v10, v27

    const/16 v25, 0x2

    aput-object v28, v10, v25

    aput-object v3, v10, v22

    aput-object v5, v10, v19

    aput-object v6, v10, v18

    aput-object v9, v10, v17

    const/16 v26, 0x7

    aput-object v29, v10, v26

    aput-object v7, v10, p2

    const v1, 0x7f140f58

    invoke-virtual {v0, v10, v1}, Le35;->G0([Lr25;I)V

    const-class v1, Lq25;

    invoke-virtual {v0, v1}, Le35;->I0(Ljava/lang/Class;)Lc35;

    move-result-object v1

    const/4 v6, 0x1

    invoke-virtual {v1, v6}, Lc35;->a(Z)V

    const-class v1, Lz25;

    invoke-virtual {v0, v1}, Le35;->I0(Ljava/lang/Class;)Lc35;

    move-result-object v1

    invoke-virtual {v1, v6}, Lc35;->a(Z)V

    const-class v1, Ly25;

    invoke-virtual {v0, v1}, Le35;->I0(Ljava/lang/Class;)Lc35;

    move-result-object v1

    invoke-virtual {v1, v6}, Lc35;->a(Z)V

    goto/16 :goto_262

    :cond_1ba
    move/from16 v22, v1

    move v6, v15

    const/16 p1, 0xa

    const/16 p2, 0x8

    const/16 v17, 0x6

    const/16 v18, 0x5

    const/16 v19, 0x4

    const/16 v20, 0xb

    new-instance v1, Lv25;

    invoke-direct {v1}, Lv25;-><init>()V

    new-instance v2, Lt25;

    invoke-direct {v2, v4}, Lt25;-><init>(B)V

    new-instance v3, Lt25;

    invoke-direct {v3, v6}, Lt25;-><init>(B)V

    move/from16 v5, v22

    new-array v7, v5, [Lr25;

    aput-object v1, v7, v4

    aput-object v2, v7, v6

    const/16 v25, 0x2

    aput-object v3, v7, v25

    move v1, v4

    :goto_1e5
    if-ge v1, v5, :cond_1f5

    aget-object v2, v7, v1

    new-instance v3, Lc35;

    invoke-direct {v3, v0, v2}, Lc35;-><init>(Le35;Lr25;)V

    invoke-virtual {v14, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    const/4 v5, 0x3

    goto :goto_1e5

    :cond_1f5
    new-instance v1, Lo25;

    invoke-direct {v1, v4}, Lo25;-><init>(B)V

    new-instance v2, Lo25;

    const/4 v6, 0x2

    invoke-direct {v2, v6}, Lo25;-><init>(B)V

    new-instance v3, Lo25;

    const/4 v6, 0x1

    invoke-direct {v3, v6}, Lo25;-><init>(B)V

    new-instance v5, Lx25;

    invoke-direct {v5, v6}, Lx25;-><init>(B)V

    new-instance v7, Lq25;

    invoke-direct {v7, v4}, Lq25;-><init>(B)V

    new-instance v9, Lz25;

    invoke-direct {v9, v4}, Lz25;-><init>(B)V

    new-instance v10, Ly25;

    invoke-direct {v10}, Ly25;-><init>()V

    new-instance v11, Lq25;

    invoke-direct {v11, v6}, Lq25;-><init>(B)V

    new-instance v12, Lx25;

    invoke-direct {v12, v4}, Lx25;-><init>(B)V

    new-instance v13, Ln25;

    invoke-direct {v13}, Ln25;-><init>()V

    new-instance v15, Lz25;

    invoke-direct {v15, v6}, Lz25;-><init>(B)V

    move/from16 v16, v4

    move/from16 v4, v20

    new-array v4, v4, [Lr25;

    aput-object v1, v4, v16

    aput-object v2, v4, v6

    const/16 v25, 0x2

    aput-object v3, v4, v25

    const/16 v22, 0x3

    aput-object v5, v4, v22

    aput-object v7, v4, v19

    aput-object v9, v4, v18

    aput-object v10, v4, v17

    const/16 v26, 0x7

    aput-object v11, v4, v26

    aput-object v12, v4, p2

    const/16 v23, 0x9

    aput-object v13, v4, v23

    aput-object v15, v4, p1

    const v1, 0x7f140f57

    invoke-virtual {v0, v4, v1}, Le35;->G0([Lr25;I)V

    const-class v1, Lv25;

    invoke-virtual {v0, v1}, Le35;->I0(Ljava/lang/Class;)Lc35;

    move-result-object v1

    const/4 v6, 0x1

    invoke-virtual {v1, v6}, Lc35;->a(Z)V

    :cond_262
    :goto_262
    iget-object v1, v0, Le35;->v:Lac1;

    invoke-virtual {v14}, Ljava/util/ArrayList;->size()I

    move-result v2

    iput v2, v1, Lac1;->a:I

    invoke-virtual {v1}, Lac1;->k()V

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/r;

    move-result-object v1

    check-cast v1, Lcom/opera/android/BrowserActivity;

    new-instance v2, Liu2;

    invoke-direct {v2, v0, v8}, Liu2;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v1, v2}, Lcom/opera/android/BrowserActivity;->m1(Lcom/opera/api/Callback;)V

    return-void

    :cond_27c
    const-string v0, "rootView"

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    return-void
.end method

.method public final x0(Litd;)V
    .registers 4

    new-instance p1, Lac1;

    iget-object v0, p0, Lltl;->l:Landroidx/appcompat/widget/Toolbar;

    new-instance v1, Leme;

    invoke-direct {v1, p0}, Leme;-><init>(Ljava/lang/Object;)V

    invoke-direct {p1, v0, v1}, Lac1;-><init>(Landroidx/appcompat/widget/Toolbar;Li35;)V

    iput-object p1, p0, Le35;->v:Lac1;

    return-void
.end method
