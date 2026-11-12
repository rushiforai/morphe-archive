.class public final Lymn;
.super Lbmn;
.source "SourceFile"


# static fields
.field public static n:Lxq3;


# instance fields
.field public final j:Lcom/opera/android/settings/SettingsManager;

.field public final k:Lumn;

.field public final l:Ljava/lang/String;

.field public final m:Lg7j;


# direct methods
.method public constructor <init>(Lqln;Lx5f;Lcom/opera/android/settings/SettingsManager;Leej;Ld8j;Lumn;Lgjm;)V
    .registers 14

    const/4 v1, 0x0

    move-object v0, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p4

    move-object v5, p7

    invoke-direct/range {v0 .. v5}, Lbmn;-><init>(ILqln;Lorm;Leej;Lgjm;)V

    iput-object p3, v0, Lymn;->j:Lcom/opera/android/settings/SettingsManager;

    iput-object p6, v0, Lymn;->k:Lumn;

    invoke-virtual {v2}, Lqln;->i()Ljava/lang/String;

    move-result-object p0

    iput-object p0, v0, Lymn;->l:Ljava/lang/String;

    invoke-virtual {p3}, Lcom/opera/android/settings/SettingsManager;->g()Lg7j;

    move-result-object p0

    iput-object p0, v0, Lymn;->m:Lg7j;

    return-void
.end method


# virtual methods
.method public final b(Landroid/content/Context;Lqf;Ljvg;)Landroid/widget/FrameLayout;
    .registers 22

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p3

    iget-object v3, v0, Lymn;->k:Lumn;

    iget-object v4, v3, Lumn;->k:Lxmn;

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v5

    const v6, 0x7f0d047a

    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-virtual {v5, v6, v7, v8}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v5

    const v6, 0x7f0a0134

    invoke-static {v6, v5}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v9

    move-object/from16 v17, v9

    check-cast v17, Lcom/opera/android/custom_views/CircleImageView;

    if-eqz v17, :cond_106

    const v6, 0x7f0a0135

    invoke-static {v6, v5}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v9

    move-object v13, v9

    check-cast v13, Landroid/widget/FrameLayout;

    if-eqz v13, :cond_106

    const v6, 0x7f0a01c0

    invoke-static {v6, v5}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v9

    if-eqz v9, :cond_106

    invoke-static {v9}, Lpq3;->a(Landroid/view/View;)Lpq3;

    move-result-object v11

    iget-object v6, v11, Lpq3;->c:Lcom/google/android/material/button/MaterialButton;

    iget-object v9, v11, Lpq3;->d:Lcom/google/android/material/button/MaterialButton;

    const v10, 0x7f0a06b5

    invoke-static {v10, v5}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v12

    move-object v14, v12

    check-cast v14, Landroid/widget/TextView;

    if-eqz v14, :cond_105

    const v10, 0x7f0a08c0

    invoke-static {v10, v5}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v12

    move-object/from16 v16, v12

    check-cast v16, Landroidx/recyclerview/widget/RecyclerView;

    if-eqz v16, :cond_105

    const v10, 0x7f0a090b

    invoke-static {v10, v5}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v12

    check-cast v12, Landroid/widget/LinearLayout;

    if-eqz v12, :cond_105

    const v10, 0x7f0a092c

    invoke-static {v10, v5}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v12

    check-cast v12, Landroidx/core/widget/NestedScrollView;

    if-eqz v12, :cond_105

    move-object v12, v5

    check-cast v12, Landroid/widget/FrameLayout;

    const v10, 0x7f0a06c5

    invoke-static {v10, v5}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v15

    check-cast v15, Landroid/widget/TextView;

    if-eqz v15, :cond_105

    new-instance v10, Lg7d;

    invoke-direct/range {v10 .. v17}, Lg7d;-><init>(Lpq3;Landroid/widget/FrameLayout;Landroid/widget/FrameLayout;Landroid/widget/TextView;Landroid/widget/TextView;Landroidx/recyclerview/widget/RecyclerView;Lcom/opera/android/custom_views/CircleImageView;)V

    move-object v5, v12

    move-object/from16 v12, v16

    iget-object v7, v3, Lumn;->b:Ljava/lang/String;

    if-nez v7, :cond_90

    iget v7, v4, Lxmn;->a:I

    invoke-virtual {v1, v7}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v7

    :cond_90
    invoke-virtual {v15, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v7, v3, Lumn;->c:Ljava/lang/String;

    if-nez v7, :cond_9d

    iget v4, v4, Lxmn;->b:I

    invoke-virtual {v1, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v7

    :cond_9d
    invoke-virtual {v14, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v0, v12, v2}, Lbmn;->a(Landroidx/recyclerview/widget/RecyclerView;Ljvg;)V

    iget-object v4, v3, Lumn;->d:Ljava/lang/String;

    if-nez v4, :cond_ae

    const v4, 0x7f14059a

    invoke-virtual {v1, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    :cond_ae
    invoke-virtual {v9, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    new-instance v4, Llk5;

    const/4 v7, 0x2

    invoke-direct {v4, v2, v7}, Llk5;-><init>(Ljvg;B)V

    invoke-virtual {v9, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v4, v3, Lumn;->e:Ljava/lang/String;

    if-nez v4, :cond_c5

    const v4, 0x7f14051c

    invoke-virtual {v1, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    :cond_c5
    invoke-virtual {v6, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    new-instance v4, Llk5;

    const/4 v7, 0x3

    invoke-direct {v4, v2, v7}, Llk5;-><init>(Ljvg;B)V

    invoke-virtual {v6, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-boolean v2, v3, Lumn;->h:Z

    if-eqz v2, :cond_dc

    const/4 v2, 0x4

    invoke-virtual {v15, v2}, Landroid/view/View;->setTextAlignment(I)V

    invoke-virtual {v14, v2}, Landroid/view/View;->setTextAlignment(I)V

    :cond_dc
    iget-object v2, v3, Lumn;->f:Landroid/graphics/Bitmap;

    if-eqz v2, :cond_104

    invoke-virtual {v15}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v3, 0x42400000    # 48.0f

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-static {v3, v4}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v3

    iput v3, v2, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    invoke-virtual {v15, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v13, v8}, Landroid/view/View;->setVisibility(I)V

    new-instance v2, Lvs5;

    const/4 v3, 0x5

    invoke-direct {v2, v0, v1, v10, v3}, Lvs5;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v13, v2}, Lq9n;->e(Landroid/view/View;Lr8n;)V

    invoke-virtual {v2, v13}, Lvs5;->a(Landroid/view/View;)V

    :cond_104
    return-object v5

    :cond_105
    move v6, v10

    :cond_106
    invoke-virtual {v5}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v6}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    const-string v1, "Missing required view with ID: "

    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    return-object v7
.end method

.method public final d()Ljava/util/List;
    .registers 6

    iget-object v0, p0, Lbmn;->b:Lqln;

    invoke-virtual {v0}, Lqln;->i()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/util/LinkedHashSet;

    invoke-direct {v2}, Ljava/util/LinkedHashSet;-><init>()V

    invoke-virtual {v2, v1}, Ljava/util/AbstractCollection;->add(Ljava/lang/Object;)Z

    iget-object p0, p0, Lymn;->k:Lumn;

    iget-object p0, p0, Lumn;->a:Ljava/util/LinkedHashSet;

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_16
    :goto_16
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2c

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-static {v3, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_16

    invoke-virtual {v2, v3}, Ljava/util/AbstractCollection;->add(Ljava/lang/Object;)Z

    goto :goto_16

    :cond_2c
    invoke-virtual {v0, v2}, Lqln;->k(Ljava/util/Set;)Ljava/util/ArrayList;

    move-result-object p0

    return-object p0
.end method

.method public final e(Ljava/lang/String;)V
    .registers 9

    invoke-super {p0, p1}, Lbmn;->e(Ljava/lang/String;)V

    iget-object v0, p0, Lymn;->k:Lumn;

    iget-object v1, v0, Lumn;->j:Ljava/util/ArrayList;

    iget-object v0, v0, Lumn;->a:Ljava/util/LinkedHashSet;

    if-eqz v1, :cond_61

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result v3

    if-ne v2, v3, :cond_61

    iget-object v2, p0, Lymn;->l:Ljava/lang/String;

    invoke-virtual {p1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    iget-object v3, p0, Lymn;->m:Lg7j;

    const/4 v4, 0x0

    iget-object p0, p0, Lymn;->j:Lcom/opera/android/settings/SettingsManager;

    if-eqz v2, :cond_26

    invoke-virtual {p0, v3, v4}, Lcom/opera/android/settings/SettingsManager;->U(Lg7j;Z)V

    return-void

    :cond_26
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    move v2, v4

    :goto_2b
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    const/4 v6, -0x1

    if-eqz v5, :cond_48

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    if-ltz v2, :cond_43

    check-cast v5, Ljava/lang/String;

    invoke-static {v5, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_49

    add-int/lit8 v2, v2, 0x1

    goto :goto_2b

    :cond_43
    invoke-static {}, Lj95;->n()V

    const/4 p0, 0x0

    throw p0

    :cond_48
    move v2, v6

    :cond_49
    if-ne v2, v6, :cond_4f

    invoke-virtual {p0, v3, v4}, Lcom/opera/android/settings/SettingsManager;->U(Lg7j;Z)V

    return-void

    :cond_4f
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lg7j;

    if-eqz p1, :cond_58

    move-object v3, p1

    :cond_58
    invoke-virtual {p0}, Lcom/opera/android/settings/SettingsManager;->g()Lg7j;

    move-result-object p1

    if-eq v3, p1, :cond_61

    invoke-virtual {p0, v3, v4}, Lcom/opera/android/settings/SettingsManager;->U(Lg7j;Z)V

    :cond_61
    return-void
.end method

.method public final g(Landroid/view/View;Lqf;)V
    .registers 5

    iget-object v0, p0, Lymn;->k:Lumn;

    iget-object v0, v0, Lumn;->i:Ljava/lang/String;

    if-eqz v0, :cond_1d

    sget-object v1, Lru0;->f:Lru0;

    invoke-virtual {p0, v1, v0}, Lbmn;->f(Lru0;Ljava/lang/String;)V

    invoke-virtual {p2}, Ldej;->b()V

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p0

    const/4 p2, 0x2

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    sget-object v0, Llqm;->p:Llqm;

    invoke-static {p0, v0, p2, p1}, Llk6;->a(Landroid/net/Uri;Llqm;ILandroid/content/Context;)Z

    return-void

    :cond_1d
    invoke-super {p0, p1, p2}, Lbmn;->g(Landroid/view/View;Lqf;)V

    return-void
.end method
