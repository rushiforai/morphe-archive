.class public final Lx9k;
.super Landroidx/viewpager/widget/PagerAdapter;
.source "SourceFile"


# instance fields
.field public final a:Ljava/util/List;

.field public final b:Z


# direct methods
.method public constructor <init>(Ljava/util/List;Z)V
    .registers 3

    invoke-direct {p0}, Landroidx/viewpager/widget/PagerAdapter;-><init>()V

    iput-object p1, p0, Lx9k;->a:Ljava/util/List;

    iput-boolean p2, p0, Lx9k;->b:Z

    return-void
.end method


# virtual methods
.method public final destroyItem(Landroid/view/ViewGroup;ILjava/lang/Object;)V
    .registers 4

    check-cast p3, Landroid/view/View;

    invoke-virtual {p1, p3}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    return-void
.end method

.method public final getCount()I
    .registers 1

    iget-object p0, p0, Lx9k;->a:Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p0

    return p0
.end method

.method public final getItemPosition(Ljava/lang/Object;)I
    .registers 8

    check-cast p1, Landroid/view/View;

    const v0, 0x7f0a079a

    invoke-virtual {p1, v0}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const v1, 0x7f0a0798

    invoke-virtual {p1, v1}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const v3, 0x7f0a0799

    invoke-virtual {p1, v3}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    iget-boolean v4, p0, Lx9k;->b:Z

    if-ne v4, v3, :cond_51

    const/4 v3, 0x0

    :goto_2e
    iget-object v4, p0, Lx9k;->a:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v5

    if-ge v3, v5, :cond_51

    invoke-interface {v4, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lz65;

    iget-object v4, v4, Lz65;->f:Lkl0;

    iget-byte v4, v4, Lkl0;->a:B

    if-ne v4, v0, :cond_4e

    if-ne v3, v2, :cond_46

    const/4 p0, -0x1

    return p0

    :cond_46
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-virtual {p1, v1, p0}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    return v3

    :cond_4e
    add-int/lit8 v3, v3, 0x1

    goto :goto_2e

    :cond_51
    const/4 p0, -0x2

    return p0
.end method

.method public final instantiateItem(Landroid/view/ViewGroup;I)Ljava/lang/Object;
    .registers 22

    move-object/from16 v0, p0

    iget-object v1, v0, Lx9k;->a:Ljava/util/List;

    move/from16 v2, p2

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lz65;

    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    iget-byte v4, v1, Lz65;->j:B

    const v5, 0x7f0a0b6e

    const/4 v6, 0x0

    const v7, 0x7f0a02d0

    const v8, 0x7f0a056f

    const v9, 0x7f0a06c5

    const-string v10, "Missing required view with ID: "

    const/4 v11, 0x0

    iget-boolean v0, v0, Lx9k;->b:Z

    packed-switch v4, :pswitch_data_28c

    iget-object v4, v1, Lz65;->k:Ljava/lang/Object;

    check-cast v4, Lt2f;

    if-eqz v0, :cond_70

    invoke-static {v3}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v3

    const v5, 0x7f0d03d2

    invoke-virtual {v3, v5, v11, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v3

    invoke-static {v7, v3}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    check-cast v5, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v5, :cond_5f

    invoke-static {v8, v3}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v6

    if-eqz v6, :cond_5e

    invoke-static {v6}, Lom9;->b(Landroid/view/View;)Lom9;

    move-result-object v6

    invoke-static {v9, v3}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v7

    check-cast v7, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v7, :cond_5c

    check-cast v3, Lcom/opera/android/custom_views/FadingScrollView;

    new-instance v8, Li3j;

    iget-object v6, v6, Lom9;->b:Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-direct {v8, v3, v6, v7, v5}, Li3j;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_a6

    :cond_5c
    move v7, v9

    goto :goto_5f

    :cond_5e
    move v7, v8

    :cond_5f
    :goto_5f
    invoke-virtual {v3}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3, v7}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v10, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lt3p;->q(Ljava/lang/String;)V

    goto/16 :goto_264

    :cond_70
    invoke-static {v3}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v3

    const v12, 0x7f0d03d1

    invoke-virtual {v3, v12, v11, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v3

    invoke-static {v7, v3}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v6

    check-cast v6, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v6, :cond_cf

    invoke-static {v8, v3}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v7

    if-eqz v7, :cond_cd

    invoke-static {v7}, Lom9;->b(Landroid/view/View;)Lom9;

    move-result-object v7

    invoke-static {v5, v3}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    check-cast v8, Lcom/opera/android/custom_views/FadingScrollView;

    if-eqz v8, :cond_d0

    invoke-static {v9, v3}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    check-cast v5, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v5, :cond_cb

    check-cast v3, Landroidx/constraintlayout/widget/ConstraintLayout;

    new-instance v8, Li3j;

    iget-object v7, v7, Lom9;->b:Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-direct {v8, v3, v7, v5, v6}, Li3j;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    :goto_a6
    iget-object v3, v8, Li3j;->a:Ljava/lang/Object;

    move-object v11, v3

    check-cast v11, Landroid/view/ViewGroup;

    iget-object v3, v8, Li3j;->d:Ljava/lang/Object;

    check-cast v3, Lcom/opera/android/custom_views/StylingTextView;

    iget-object v5, v8, Li3j;->c:Ljava/lang/Object;

    check-cast v5, Lcom/opera/android/custom_views/StylingTextView;

    iget-object v6, v4, Lt2f;->a:Ljava/lang/String;

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v4, v4, Lt2f;->b:Ljava/lang/String;

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v4, v8, Li3j;->b:Ljava/lang/Object;

    check-cast v4, Landroidx/constraintlayout/widget/ConstraintLayout;

    new-instance v5, Lwm3;

    invoke-direct {v5, v4, v0, v3, v11}, Lwm3;-><init>(Landroid/view/View;ZLcom/opera/android/custom_views/StylingTextView;Landroid/view/ViewGroup;)V

    invoke-static {v4, v5}, Lkff;->a(Landroid/view/View;Ljava/lang/Runnable;)Lkff;

    goto/16 :goto_264

    :cond_cb
    move v5, v9

    goto :goto_d0

    :cond_cd
    move v5, v8

    goto :goto_d0

    :cond_cf
    move v5, v7

    :cond_d0
    :goto_d0
    invoke-virtual {v3}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3, v5}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v10, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lt3p;->q(Ljava/lang/String;)V

    goto/16 :goto_264

    :pswitch_e1
    iget-object v4, v1, Lz65;->k:Ljava/lang/Object;

    check-cast v4, Ldm6;

    if-eqz v0, :cond_133

    invoke-static {v3}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v3

    const v5, 0x7f0d03cb

    invoke-virtual {v3, v5, v11, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v3

    invoke-static {v7, v3}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    move-object/from16 v17, v5

    check-cast v17, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v17, :cond_122

    invoke-static {v8, v3}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    if-eqz v5, :cond_121

    invoke-static {v5}, Lzt5;->b(Landroid/view/View;)Lzt5;

    move-result-object v5

    invoke-static {v9, v3}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v6

    move-object/from16 v16, v6

    check-cast v16, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v16, :cond_11f

    move-object v13, v3

    check-cast v13, Lcom/opera/android/custom_views/FadingScrollView;

    new-instance v12, Lwjh;

    iget-object v14, v5, Lzt5;->b:Landroidx/constraintlayout/widget/ConstraintLayout;

    iget-object v15, v5, Lzt5;->c:Landroid/widget/TextView;

    const/16 v18, 0x12

    invoke-direct/range {v12 .. v18}, Lwjh;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    goto :goto_172

    :cond_11f
    move v7, v9

    goto :goto_122

    :cond_121
    move v7, v8

    :cond_122
    :goto_122
    invoke-virtual {v3}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3, v7}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v10, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lt3p;->q(Ljava/lang/String;)V

    goto/16 :goto_264

    :cond_133
    invoke-static {v3}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v3

    const v12, 0x7f0d03c9

    invoke-virtual {v3, v12, v11, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v3

    invoke-static {v7, v3}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v6

    move-object/from16 v17, v6

    check-cast v17, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v17, :cond_1a4

    invoke-static {v8, v3}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v6

    if-eqz v6, :cond_1a2

    invoke-static {v6}, Lzt5;->b(Landroid/view/View;)Lzt5;

    move-result-object v6

    invoke-static {v5, v3}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v7

    check-cast v7, Lcom/opera/android/custom_views/FadingScrollView;

    if-eqz v7, :cond_1a5

    invoke-static {v9, v3}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    move-object/from16 v16, v5

    check-cast v16, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v16, :cond_1a0

    move-object v13, v3

    check-cast v13, Landroidx/constraintlayout/widget/ConstraintLayout;

    new-instance v12, Lwjh;

    iget-object v14, v6, Lzt5;->b:Landroidx/constraintlayout/widget/ConstraintLayout;

    iget-object v15, v6, Lzt5;->c:Landroid/widget/TextView;

    const/16 v18, 0x12

    invoke-direct/range {v12 .. v18}, Lwjh;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    :goto_172
    iget-object v3, v12, Lwjh;->b:Ljava/lang/Object;

    move-object v11, v3

    check-cast v11, Landroid/view/ViewGroup;

    iget-object v3, v12, Lwjh;->f:Ljava/lang/Object;

    check-cast v3, Lcom/opera/android/custom_views/StylingTextView;

    iget-object v5, v12, Lwjh;->d:Ljava/lang/Object;

    check-cast v5, Landroid/widget/TextView;

    iget-object v6, v4, Ldm6;->a:Ljava/lang/String;

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v5, v12, Lwjh;->e:Ljava/lang/Object;

    check-cast v5, Lcom/opera/android/custom_views/StylingTextView;

    iget-object v6, v4, Ldm6;->b:Ljava/lang/String;

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v4, v4, Ldm6;->c:Ljava/lang/String;

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v4, v12, Lwjh;->c:Ljava/lang/Object;

    check-cast v4, Landroidx/constraintlayout/widget/ConstraintLayout;

    new-instance v5, Lwm3;

    invoke-direct {v5, v4, v0, v3, v11}, Lwm3;-><init>(Landroid/view/View;ZLcom/opera/android/custom_views/StylingTextView;Landroid/view/ViewGroup;)V

    invoke-static {v4, v5}, Lkff;->a(Landroid/view/View;Ljava/lang/Runnable;)Lkff;

    goto/16 :goto_264

    :cond_1a0
    move v5, v9

    goto :goto_1a5

    :cond_1a2
    move v5, v8

    goto :goto_1a5

    :cond_1a4
    move v5, v7

    :cond_1a5
    :goto_1a5
    invoke-virtual {v3}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3, v5}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v10, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lt3p;->q(Ljava/lang/String;)V

    goto/16 :goto_264

    :pswitch_1b6
    iget-object v4, v1, Lz65;->k:Ljava/lang/Object;

    check-cast v4, Ly65;

    if-eqz v0, :cond_1fa

    invoke-static {v3}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v3

    const v5, 0x7f0d03c8

    invoke-virtual {v3, v5, v11, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v3

    invoke-static {v7, v3}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    check-cast v5, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v5, :cond_1ea

    invoke-static {v8, v3}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/ImageView;

    if-eqz v6, :cond_1e9

    invoke-static {v9, v3}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v7

    check-cast v7, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v7, :cond_1e7

    check-cast v3, Lcom/opera/android/custom_views/FadingScrollView;

    new-instance v8, Lvzk;

    invoke-direct {v8, v3, v6, v7, v5}, Lvzk;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_22c

    :cond_1e7
    move v7, v9

    goto :goto_1ea

    :cond_1e9
    move v7, v8

    :cond_1ea
    :goto_1ea
    invoke-virtual {v3}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3, v7}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v10, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lt3p;->q(Ljava/lang/String;)V

    goto :goto_264

    :cond_1fa
    invoke-static {v3}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v3

    const v12, 0x7f0d03c7

    invoke-virtual {v3, v12, v11, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v3

    invoke-static {v7, v3}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v6

    check-cast v6, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v6, :cond_254

    invoke-static {v8, v3}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/ImageView;

    if-eqz v7, :cond_252

    invoke-static {v5, v3}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    check-cast v8, Lcom/opera/android/custom_views/FadingScrollView;

    if-eqz v8, :cond_255

    invoke-static {v9, v3}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    check-cast v5, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v5, :cond_250

    check-cast v3, Landroidx/constraintlayout/widget/ConstraintLayout;

    new-instance v8, Lvzk;

    invoke-direct {v8, v3, v7, v5, v6}, Lvzk;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    :goto_22c
    iget-object v3, v8, Lvzk;->a:Ljava/lang/Object;

    move-object v11, v3

    check-cast v11, Landroid/view/ViewGroup;

    iget-object v3, v8, Lvzk;->d:Ljava/lang/Object;

    check-cast v3, Lcom/opera/android/custom_views/StylingTextView;

    iget-object v5, v8, Lvzk;->c:Ljava/lang/Object;

    check-cast v5, Lcom/opera/android/custom_views/StylingTextView;

    iget-object v6, v4, Ly65;->a:Ljava/lang/String;

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v4, v4, Ly65;->b:Ljava/lang/String;

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v4, v8, Lvzk;->b:Ljava/lang/Object;

    check-cast v4, Landroid/widget/ImageView;

    new-instance v5, Lwm3;

    invoke-direct {v5, v4, v0, v3, v11}, Lwm3;-><init>(Landroid/view/View;ZLcom/opera/android/custom_views/StylingTextView;Landroid/view/ViewGroup;)V

    invoke-static {v4, v5}, Lkff;->a(Landroid/view/View;Ljava/lang/Runnable;)Lkff;

    goto :goto_264

    :cond_250
    move v5, v9

    goto :goto_255

    :cond_252
    move v5, v8

    goto :goto_255

    :cond_254
    move v5, v7

    :cond_255
    :goto_255
    invoke-virtual {v3}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3, v5}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v10, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lt3p;->q(Ljava/lang/String;)V

    :goto_264
    move-object/from16 v3, p1

    invoke-virtual {v3, v11}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    const v3, 0x7f0a0799

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v11, v3, v0}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    iget-object v0, v1, Lz65;->f:Lkl0;

    iget-byte v0, v0, Lkl0;->a:B

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const v1, 0x7f0a079a

    invoke-virtual {v11, v1, v0}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    const v0, 0x7f0a0798

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v11, v0, v1}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    return-object v11

    :pswitch_data_28c
    .packed-switch 0x0
        :pswitch_1b6
        :pswitch_e1
    .end packed-switch
.end method

.method public final isViewFromObject(Landroid/view/View;Ljava/lang/Object;)Z
    .registers 3

    if-ne p1, p2, :cond_4

    const/4 p0, 0x1

    return p0

    :cond_4
    const/4 p0, 0x0

    return p0
.end method
