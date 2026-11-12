.class public final Lpk5;
.super Lbmn;
.source "SourceFile"


# static fields
.field public static m:Lxq3;

.field public static n:Lxq3;


# instance fields
.field public final synthetic j:B

.field public final k:Lqln;

.field public final l:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lqln;Lnk5;Lorm;Leej;Lgjm;)V
    .registers 13

    const/4 v0, 0x0

    iput-byte v0, p0, Lpk5;->j:B

    const/4 v2, 0x3

    move-object v1, p0

    move-object v3, p1

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    .line 17
    invoke-direct/range {v1 .. v6}, Lbmn;-><init>(ILqln;Lorm;Leej;Lgjm;)V

    .line 18
    iput-object v3, v1, Lpk5;->k:Lqln;

    .line 19
    iput-object p2, v1, Lpk5;->l:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lqln;Lx5f;Ld8j;Leej;Lgjm;)V
    .registers 13

    const/4 v0, 0x1

    iput-byte v0, p0, Lpk5;->j:B

    const/4 v2, 0x2

    move-object v1, p0

    move-object v3, p1

    move-object v4, p2

    move-object v5, p4

    move-object v6, p5

    invoke-direct/range {v1 .. v6}, Lbmn;-><init>(ILqln;Lorm;Leej;Lgjm;)V

    iput-object v3, v1, Lpk5;->k:Lqln;

    iput-object p3, v1, Lpk5;->l:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final b(Landroid/content/Context;Lqf;Ljvg;)Landroid/widget/FrameLayout;
    .registers 24

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    iget-byte v2, v0, Lpk5;->j:B

    const-string v3, "Missing required view with ID: "

    const v4, 0x7f0a06c5

    const v5, 0x7f0a090b

    const v6, 0x7f0a08c0

    const/4 v7, 0x0

    const/4 v8, 0x0

    packed-switch v2, :pswitch_data_180

    invoke-static/range {p1 .. p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v2

    const v9, 0x7f0d0479

    invoke-virtual {v2, v9, v8, v7}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v2

    const v7, 0x7f0a02b3

    invoke-static {v7, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v9

    move-object v12, v9

    check-cast v12, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v12, :cond_a7

    invoke-static {v6, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v7

    move-object v13, v7

    check-cast v13, Landroidx/recyclerview/widget/RecyclerView;

    if-eqz v13, :cond_a5

    invoke-static {v5, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/LinearLayout;

    if-eqz v6, :cond_a3

    const v5, 0x7f0a092c

    invoke-static {v5, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroidx/core/widget/NestedScrollView;

    if-eqz v6, :cond_a3

    const v5, 0x7f0a0a1b

    invoke-static {v5, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v6

    move-object v14, v6

    check-cast v14, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v14, :cond_a3

    move-object v11, v2

    check-cast v11, Landroid/widget/FrameLayout;

    invoke-static {v4, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    if-eqz v5, :cond_a8

    const v4, 0x7f0a0cc7

    invoke-static {v4, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    move-object v15, v5

    check-cast v15, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v15, :cond_a8

    new-instance v10, Lq5g;

    invoke-direct/range {v10 .. v15}, Lq5g;-><init>(Landroid/widget/FrameLayout;Lcom/opera/android/ui/catalog/widget/OperaListItem;Landroidx/recyclerview/widget/RecyclerView;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;)V

    invoke-virtual {v0, v13, v1}, Lbmn;->a(Landroidx/recyclerview/widget/RecyclerView;Ljvg;)V

    iget-object v2, v0, Lpk5;->k:Lqln;

    invoke-virtual {v2}, Lqln;->g()Z

    move-result v3

    invoke-virtual {v15, v3}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setChecked(Z)V

    invoke-virtual {v2}, Lqln;->g()Z

    move-result v2

    invoke-virtual {v0, v15, v2}, Lpk5;->i(Lcom/opera/android/ui/catalog/widget/OperaListItem;Z)V

    new-instance v2, Lvdi;

    const/16 v3, 0xf

    invoke-direct {v2, v1, v10, v0, v3}, Lvdi;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object v2, v15, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u:Lvlf;

    new-instance v2, Llk5;

    const/4 v3, 0x1

    invoke-direct {v2, v1, v3}, Llk5;-><init>(Ljvg;B)V

    invoke-virtual {v14, v2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v1, Lobn;

    const/4 v2, 0x7

    move-object/from16 v3, p2

    invoke-direct {v1, v0, v3, v2}, Lobn;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v12, v1}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    move-object v8, v11

    goto :goto_b7

    :cond_a3
    move v4, v5

    goto :goto_a8

    :cond_a5
    move v4, v6

    goto :goto_a8

    :cond_a7
    move v4, v7

    :cond_a8
    :goto_a8
    invoke-virtual {v2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    :goto_b7
    return-object v8

    :pswitch_b8
    iget-object v2, v0, Lpk5;->l:Ljava/lang/Object;

    check-cast v2, Lnk5;

    invoke-static/range {p1 .. p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v9

    const v10, 0x7f0d00d1

    invoke-virtual {v9, v10, v8, v7}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v9

    const v10, 0x7f0a0132

    invoke-static {v10, v9}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v11

    move-object v15, v11

    check-cast v15, Landroid/widget/FrameLayout;

    if-eqz v15, :cond_16e

    const v10, 0x7f0a0134

    invoke-static {v10, v9}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v11

    move-object/from16 v19, v11

    check-cast v19, Lcom/opera/android/custom_views/CircleImageView;

    if-eqz v19, :cond_16e

    const v10, 0x7f0a01c0

    invoke-static {v10, v9}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v11

    if-eqz v11, :cond_16e

    invoke-static {v11}, Lpq3;->a(Landroid/view/View;)Lpq3;

    move-result-object v13

    const v10, 0x7f0a06b5

    invoke-static {v10, v9}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v11

    move-object/from16 v16, v11

    check-cast v16, Landroid/widget/TextView;

    if-eqz v16, :cond_16e

    invoke-static {v6, v9}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v10

    move-object/from16 v18, v10

    check-cast v18, Landroidx/recyclerview/widget/RecyclerView;

    if-eqz v18, :cond_16c

    invoke-static {v5, v9}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/LinearLayout;

    if-eqz v6, :cond_16a

    move-object v14, v9

    check-cast v14, Landroid/widget/FrameLayout;

    invoke-static {v4, v9}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    move-object/from16 v17, v5

    check-cast v17, Landroid/widget/TextView;

    if-eqz v17, :cond_16f

    new-instance v12, Lkf;

    invoke-direct/range {v12 .. v19}, Lkf;-><init>(Lpq3;Landroid/widget/FrameLayout;Landroid/widget/FrameLayout;Landroid/widget/TextView;Landroid/widget/TextView;Landroidx/recyclerview/widget/RecyclerView;Lcom/opera/android/custom_views/CircleImageView;)V

    move-object/from16 v3, v16

    move-object/from16 v5, v17

    move-object/from16 v10, v18

    move-object/from16 v11, v19

    iget-object v4, v2, Lnk5;->a:Ljava/lang/String;

    invoke-virtual {v5, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v4, v2, Lnk5;->b:Ljava/lang/String;

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v3, v2, Lnk5;->d:Landroid/graphics/Bitmap;

    invoke-virtual {v11, v3}, Landroidx/appcompat/widget/AppCompatImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    invoke-static {v14}, Lfsp;->m(Landroid/view/View;)Lpde;

    move-result-object v3

    new-instance v4, Lk9;

    const/16 v5, 0x1c

    invoke-direct {v4, v12, v5}, Lk9;-><init>(Ljava/lang/Object;B)V

    invoke-static {v3, v14, v4}, Lxf8;->j0(Likc;Landroid/view/View;Lf7f;)V

    iget-object v3, v2, Lnk5;->e:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v3

    const/16 v4, 0x8

    if-eqz v3, :cond_151

    invoke-virtual {v10, v4}, Landroid/view/View;->setVisibility(I)V

    goto :goto_154

    :cond_151
    invoke-virtual {v0, v10, v1}, Lbmn;->a(Landroidx/recyclerview/widget/RecyclerView;Ljvg;)V

    :goto_154
    iget-object v0, v13, Lpq3;->d:Lcom/google/android/material/button/MaterialButton;

    iget-object v2, v2, Lnk5;->c:Ljava/lang/String;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    new-instance v2, Llk5;

    invoke-direct {v2, v1, v7}, Llk5;-><init>(Ljvg;B)V

    invoke-virtual {v0, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, v13, Lpq3;->c:Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    move-object v8, v14

    goto :goto_17e

    :cond_16a
    move v4, v5

    goto :goto_16f

    :cond_16c
    move v4, v6

    goto :goto_16f

    :cond_16e
    move v4, v10

    :cond_16f
    :goto_16f
    invoke-virtual {v9}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    :goto_17e
    return-object v8

    nop

    :pswitch_data_180
    .packed-switch 0x0
        :pswitch_b8
    .end packed-switch
.end method

.method public final c(Landroid/content/Context;)Lvjn;
    .registers 4

    iget-byte p0, p0, Lpk5;->j:B

    packed-switch p0, :pswitch_data_14

    new-instance p0, Lvjn;

    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Lvjn;-><init>(Landroid/content/Context;ZZ)V

    return-object p0

    :pswitch_d
    new-instance p0, Lvjn;

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, v0}, Lvjn;-><init>(Landroid/content/Context;ZZ)V

    return-object p0

    :pswitch_data_14
    .packed-switch 0x0
        :pswitch_d
    .end packed-switch
.end method

.method public final d()Ljava/util/List;
    .registers 4

    iget-byte v0, p0, Lpk5;->j:B

    packed-switch v0, :pswitch_data_56

    iget-object p0, p0, Lbmn;->b:Lqln;

    iget-object p0, p0, Lqln;->n:Lay;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lize;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/List;

    return-object p0

    :pswitch_16
    iget-object v0, p0, Lpk5;->l:Ljava/lang/Object;

    check-cast v0, Lnk5;

    iget-object v0, v0, Lnk5;->e:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_25

    sget-object p0, Ll08;->a:Ll08;

    goto :goto_54

    :cond_25
    check-cast v0, Ljava/lang/Iterable;

    new-instance v1, Ljava/util/ArrayList;

    const/16 v2, 0xa

    invoke-static {v0, v2}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_36
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4a

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-static {v2}, Lvq8;->m(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_36

    :cond_4a
    invoke-static {v1}, Lkotlin/collections/CollectionsKt;->n0(Ljava/lang/Iterable;)Ljava/util/Set;

    move-result-object v0

    iget-object p0, p0, Lpk5;->k:Lqln;

    invoke-virtual {p0, v0}, Lqln;->k(Ljava/util/Set;)Ljava/util/ArrayList;

    move-result-object p0

    :goto_54
    return-object p0

    nop

    :pswitch_data_56
    .packed-switch 0x0
        :pswitch_16
    .end packed-switch
.end method

.method public final i(Lcom/opera/android/ui/catalog/widget/OperaListItem;Z)V
    .registers 3

    if-eqz p2, :cond_14

    iget-object p0, p0, Lpk5;->k:Lqln;

    invoke-virtual {p0}, Lqln;->f()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lam2;->a(Ljava/lang/String;)I

    move-result p0

    invoke-static {p0}, Lam2;->b(I)I

    move-result p0

    invoke-static {p0, p1}, Lu35;->k(ILcom/opera/android/ui/catalog/widget/OperaListItem;)V

    return-void

    :cond_14
    const p0, 0x7f141443

    invoke-static {p0, p1}, Lu35;->k(ILcom/opera/android/ui/catalog/widget/OperaListItem;)V

    return-void
.end method
