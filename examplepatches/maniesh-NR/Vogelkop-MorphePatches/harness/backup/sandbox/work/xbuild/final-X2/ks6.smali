.class public final synthetic Lks6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf7f;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lks6;->a:B

    iput-object p1, p0, Lks6;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final d0(Ljava/lang/Object;)V
    .registers 19

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-byte v2, v0, Lks6;->a:B

    const/16 v4, 0x8

    const/4 v5, 0x1

    const/4 v6, 0x0

    packed-switch v2, :pswitch_data_52e

    iget-object v0, v0, Lks6;->b:Ljava/lang/Object;

    check-cast v0, Li7d;

    check-cast v1, Lavl;

    invoke-virtual {v0}, Li7d;->r0()V

    return-void

    :pswitch_17
    iget-object v0, v0, Lks6;->b:Ljava/lang/Object;

    check-cast v0, Lov0;

    check-cast v1, Lvr8;

    iget-object v2, v1, Lvr8;->b:Llaj;

    iget-object v3, v0, Lov0;->d:Ljava/lang/Object;

    check-cast v3, Landroid/widget/TextView;

    invoke-virtual {v2, v3}, Llaj;->a(Landroid/widget/TextView;)V

    iget-object v2, v1, Lvr8;->f:Lcxh;

    invoke-virtual {v3}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcxh;->a(Landroid/content/Context;)I

    move-result v2

    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object v2, v1, Lvr8;->b:Llaj;

    iget-object v0, v0, Lov0;->c:Ljava/lang/Object;

    check-cast v0, Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {v2, v0}, Llaj;->a(Landroid/widget/TextView;)V

    iget-object v2, v1, Lvr8;->i:Lcxh;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcxh;->a(Landroid/content/Context;)I

    move-result v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object v1, v1, Lvr8;->j:Lfxh;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcxh;->a(Landroid/content/Context;)I

    move-result v1

    invoke-static {v1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/material/button/MaterialButton;->F(Landroid/content/res/ColorStateList;)V

    return-void

    :pswitch_5b
    iget-object v0, v0, Lks6;->b:Ljava/lang/Object;

    check-cast v0, Ls14;

    check-cast v1, Lmoc;

    if-eqz v1, :cond_71

    iget-object v2, v0, Ls14;->d:Ljava/lang/Object;

    check-cast v2, Lbml;

    new-instance v3, Lzr9;

    const/16 v4, 0x15

    invoke-direct {v3, v0, v1, v4}, Lzr9;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v2, v3}, Lno7;->b(Ljava/lang/Runnable;)V

    :cond_71
    return-void

    :pswitch_72
    iget-object v0, v0, Lks6;->b:Ljava/lang/Object;

    check-cast v0, Ltkc;

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    iget-object v2, v0, Ltkc;->l:Lqdc;

    if-eqz v1, :cond_83

    sget-object v1, Lqcc;->e:Lqcc;

    goto :goto_85

    :cond_83
    sget-object v1, Lqcc;->c:Lqcc;

    :goto_85
    invoke-virtual {v2, v1}, Lqdc;->g(Lqcc;)V

    invoke-virtual {v0}, Lu5k;->A()V

    return-void

    :pswitch_8c
    iget-object v0, v0, Lks6;->b:Ljava/lang/Object;

    check-cast v0, Lmkc;

    check-cast v1, Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, v6, v1}, Landroid/graphics/drawable/LayerDrawable;->setDrawable(ILandroid/graphics/drawable/Drawable;)V

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    return-void

    :pswitch_99
    iget-object v0, v0, Lks6;->b:Ljava/lang/Object;

    check-cast v0, Lua7;

    check-cast v1, Lgkc;

    iget-object v2, v0, Lua7;->c:Ljava/lang/Object;

    check-cast v2, Ljava/util/HashMap;

    monitor-enter v2

    :try_start_a4
    new-instance v3, Ljava/util/HashMap;

    iget-object v0, v0, Lua7;->c:Ljava/lang/Object;

    check-cast v0, Ljava/util/HashMap;

    invoke-direct {v3, v0}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    monitor-exit v2
    :try_end_ae
    .catchall {:try_start_a4 .. :try_end_ae} :catchall_d6

    invoke-virtual {v3}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_b6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_d3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/concurrent/Executor;

    new-instance v4, Lzr9;

    const/16 v5, 0x14

    invoke-direct {v4, v2, v1, v5}, Lzr9;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-interface {v3, v4}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    goto :goto_b6

    :cond_d3
    return-void

    :goto_d4
    :try_start_d4
    monitor-exit v2
    :try_end_d5
    .catchall {:try_start_d4 .. :try_end_d5} :catchall_d6

    throw v0

    :catchall_d6
    move-exception v0

    goto :goto_d4

    :pswitch_d8
    iget-object v0, v0, Lks6;->b:Ljava/lang/Object;

    check-cast v0, Lafe;

    invoke-interface {v0, v1}, Lafe;->setValue(Ljava/lang/Object;)V

    return-void

    :pswitch_e0
    iget-object v0, v0, Lks6;->b:Ljava/lang/Object;

    check-cast v0, Lk9c;

    check-cast v1, Landroid/content/res/Configuration;

    iget-object v2, v0, Ldej;->b:Lmej;

    invoke-interface {v2}, Lmej;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    iget-object v3, v0, Lk9c;->d:Lcom/opera/android/custom_views/MaxHeightLayoutDirectionFrameLayout;

    invoke-static {v2, v3}, Lk9c;->d(Landroid/content/res/Resources;Lcom/opera/android/custom_views/MaxHeightLayoutDirectionFrameLayout;)V

    iget-object v2, v0, Lk9c;->e:Lcom/opera/android/widget/AspectRatioFrameLayout;

    iget-object v0, v0, Lk9c;->f:Lcom/opera/android/widget/AspectRatioImageView;

    invoke-static {v1, v2, v0}, Lk9c;->e(Landroid/content/res/Configuration;Lcom/opera/android/widget/AspectRatioFrameLayout;Lcom/opera/android/widget/AspectRatioImageView;)V

    return-void

    :pswitch_fd
    iget-object v0, v0, Lks6;->b:Ljava/lang/Object;

    check-cast v0, Lf1c;

    check-cast v1, Lh1c;

    iget-object v2, v0, Lf1c;->z:Lv3m;

    iget-object v7, v0, Lf1c;->B:Lcr2;

    iget-object v7, v7, Lcr2;->d:Landroid/view/View;

    check-cast v7, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-object v8, v1, Lh1c;->a:Ljava/lang/String;

    invoke-static {v7, v8}, Lv0g;->m(Lcom/opera/android/ui/catalog/widget/OperaListItem;Ljava/lang/String;)V

    iget-object v7, v0, Lf1c;->B:Lcr2;

    iget-object v7, v7, Lcr2;->n:Landroid/view/View;

    check-cast v7, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-object v8, v1, Lh1c;->b:Ljava/lang/String;

    invoke-static {v7, v8}, Lv0g;->m(Lcom/opera/android/ui/catalog/widget/OperaListItem;Ljava/lang/String;)V

    iget-object v7, v0, Lf1c;->B:Lcr2;

    iget-object v7, v7, Lcr2;->l:Landroid/view/View;

    check-cast v7, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-object v8, v1, Lh1c;->c:Lz4m;

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v9

    iget-object v10, v0, Lf1c;->y:Lq6e;

    invoke-virtual {v8, v10, v9}, Lz4m;->d(Lq6e;Landroid/content/Context;)Ljava/lang/String;

    move-result-object v9

    invoke-static {v7, v9}, Lv0g;->m(Lcom/opera/android/ui/catalog/widget/OperaListItem;Ljava/lang/String;)V

    iget-object v7, v1, Lh1c;->d:Le5m;

    iget-boolean v9, v7, Le5m;->b:Z

    iget-object v11, v0, Lf1c;->B:Lcr2;

    iget-object v11, v11, Lcr2;->i:Landroid/view/View;

    check-cast v11, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {v11, v9}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->t(Z)V

    iget-object v11, v7, Le5m;->c:Lszb;

    iget-object v12, v0, Lf1c;->B:Lcr2;

    iget-object v12, v12, Lcr2;->c:Landroid/view/View;

    check-cast v12, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v13

    invoke-virtual {v11, v13}, Lszb;->g(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Lv0g;->m(Lcom/opera/android/ui/catalog/widget/OperaListItem;Ljava/lang/String;)V

    if-eqz v9, :cond_155

    invoke-virtual {v2, v11}, Lv3m;->i(Lszb;)V

    :cond_155
    iget-object v9, v0, Lf1c;->w:Lb1c;

    iget-object v1, v1, Lh1c;->e:Ljava/util/Set;

    sget-object v12, Lszb;->j:Lszb;

    iget-object v13, v9, Lb1c;->c:Ljava/util/Set;

    invoke-interface {v13, v1}, Ljava/util/Set;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_16b

    iget-object v13, v9, Lb1c;->d:Lszb;

    invoke-virtual {v11, v13}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_1cb

    :cond_16b
    iput-object v1, v9, Lb1c;->c:Ljava/util/Set;

    iput-object v11, v9, Lb1c;->d:Lszb;

    new-instance v13, Ljava/util/ArrayList;

    invoke-direct {v13}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_178
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_1b8

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Li0c;

    iget-object v15, v14, Li0c;->a:Lszb;

    sget-object v3, Lszb;->i:Lszb;

    if-eq v15, v3, :cond_192

    if-eq v15, v12, :cond_192

    invoke-virtual {v11, v15}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    xor-int/2addr v3, v5

    goto :goto_1a1

    :cond_192
    invoke-virtual {v11, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1a0

    invoke-virtual {v11, v12}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1a0

    move v3, v5

    goto :goto_1a1

    :cond_1a0
    move v3, v6

    :goto_1a1
    new-instance v15, La1c;

    iget-object v6, v9, Lb1c;->e:Lf1c;

    iget-object v5, v14, Li0c;->a:Lszb;

    invoke-virtual {v6}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v6

    invoke-virtual {v5, v6}, Lszb;->g(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v15, v14, v5, v3}, La1c;-><init>(Li0c;Ljava/lang/String;Z)V

    invoke-virtual {v13, v15}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const/4 v5, 0x1

    const/4 v6, 0x0

    goto :goto_178

    :cond_1b8
    new-instance v1, Lmn;

    invoke-direct {v1, v4}, Lmn;-><init>(B)V

    invoke-static {v1}, Ljava/util/Comparator;->comparing(Ljava/util/function/Function;)Ljava/util/Comparator;

    move-result-object v1

    invoke-virtual {v13, v1}, Ljava/util/ArrayList;->sort(Ljava/util/Comparator;)V

    iget-object v1, v9, Lb1c;->b:Lvl9;

    iget-object v3, v9, Lygc;->a:Lxd2;

    invoke-virtual {v3, v13, v1}, Lxd2;->b(Ljava/util/List;Lvl9;)V

    :cond_1cb
    iget-object v1, v0, Lf1c;->B:Lcr2;

    iget-object v1, v1, Lcr2;->f:Landroid/view/View;

    check-cast v1, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-boolean v3, v7, Le5m;->d:Z

    invoke-virtual {v1, v3}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->t(Z)V

    iget-object v1, v2, Lv3m;->a:Landroid/content/Context;

    invoke-static {v1}, Lv3m;->f(Landroid/content/Context;)Z

    move-result v1

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v8}, Ljava/lang/Enum;->ordinal()I

    move-result v3

    if-eqz v3, :cond_1fe

    const/4 v5, 0x1

    if-ne v3, v5, :cond_1f9

    invoke-virtual {v8, v10, v2}, Lz4m;->d(Lq6e;Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    filled-new-array {v3}, [Ljava/lang/Object;

    move-result-object v3

    const v5, 0x7f1410dc

    invoke-virtual {v2, v5, v3}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    goto :goto_1ff

    :cond_1f9
    invoke-static {}, Lh9o;->p()V

    goto/16 :goto_28b

    :cond_1fe
    const/4 v3, 0x0

    :goto_1ff
    iget-object v2, v0, Lf1c;->B:Lcr2;

    iget-object v2, v2, Lcr2;->m:Landroid/view/View;

    check-cast v2, Lcom/opera/android/ui/catalog/widget/OperaIconedMessage;

    invoke-virtual {v2, v3}, Lcom/opera/android/ui/catalog/widget/OperaIconedMessage;->a(Ljava/lang/String;)V

    iget-object v2, v0, Lf1c;->B:Lcr2;

    iget-object v2, v2, Lcr2;->m:Landroid/view/View;

    check-cast v2, Lcom/opera/android/ui/catalog/widget/OperaIconedMessage;

    if-eqz v1, :cond_218

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_218

    const/4 v3, 0x0

    goto :goto_219

    :cond_218
    move v3, v4

    :goto_219
    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    iget-boolean v2, v8, Lz4m;->a:Z

    iget-object v3, v0, Lf1c;->B:Lcr2;

    iget-object v3, v3, Lcr2;->i:Landroid/view/View;

    check-cast v3, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v1, :cond_22a

    if-eqz v2, :cond_22a

    const/4 v1, 0x0

    goto :goto_22b

    :cond_22a
    move v1, v4

    :goto_22b
    invoke-virtual {v3, v1}, Landroid/view/View;->setVisibility(I)V

    if-eqz v2, :cond_23d

    iget-object v1, v0, Lf1c;->B:Lcr2;

    iget-object v1, v1, Lcr2;->i:Landroid/view/View;

    check-cast v1, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {v1}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->isChecked()Z

    move-result v1

    if-eqz v1, :cond_23d

    const/4 v4, 0x0

    :cond_23d
    const/4 v6, 0x0

    :goto_23e
    iget-object v1, v0, Lf1c;->B:Lcr2;

    iget-object v1, v1, Lcr2;->g:Landroid/view/ViewGroup;

    check-cast v1, Landroid/widget/LinearLayout;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    if-ge v6, v1, :cond_28b

    iget-object v1, v0, Lf1c;->B:Lcr2;

    iget-object v1, v1, Lcr2;->g:Landroid/view/ViewGroup;

    check-cast v1, Landroid/widget/LinearLayout;

    invoke-virtual {v1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getId()I

    move-result v2

    const v3, 0x7f0a0bec

    if-eq v2, v3, :cond_285

    const v3, 0x7f0a05e9

    if-eq v2, v3, :cond_285

    const v3, 0x7f0a05e7

    if-eq v2, v3, :cond_285

    const v3, 0x7f0a05e8

    if-eq v2, v3, :cond_285

    const v3, 0x7f0a0095

    if-eq v2, v3, :cond_285

    const v3, 0x7f0a0147

    if-eq v2, v3, :cond_285

    const v3, 0x7f0a0148

    if-eq v2, v3, :cond_285

    const v3, 0x7f0a03c4

    if-eq v2, v3, :cond_285

    const v3, 0x7f0a098a

    if-ne v2, v3, :cond_288

    :cond_285
    invoke-virtual {v1, v4}, Landroid/view/View;->setVisibility(I)V

    :cond_288
    add-int/lit8 v6, v6, 0x1

    goto :goto_23e

    :cond_28b
    :goto_28b
    return-void

    :pswitch_28c
    iget-object v0, v0, Lks6;->b:Ljava/lang/Object;

    check-cast v0, Lsvb;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v0}, Lsvb;->a()V

    return-void

    :pswitch_296
    iget-object v0, v0, Lks6;->b:Ljava/lang/Object;

    check-cast v0, Lp12;

    check-cast v1, Llmm;

    sget-object v2, Llmm;->a:Llmm;

    if-ne v1, v2, :cond_2ad

    iget-object v0, v0, Lp12;->b:Ljava/lang/Object;

    check-cast v0, Lgjm;

    new-instance v1, Lo5g;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lgjm;->e(Ln37;Z)V

    :cond_2ad
    return-void

    :pswitch_2ae
    iget-object v0, v0, Lks6;->b:Ljava/lang/Object;

    check-cast v0, Lv8a;

    check-cast v1, Lu3l;

    invoke-virtual {v0}, Lv8a;->b()V

    return-void

    :pswitch_2b8
    iget-object v0, v0, Lks6;->b:Ljava/lang/Object;

    check-cast v0, Lne5;

    check-cast v1, Lpxj;

    invoke-virtual {v0, v1}, Lne5;->n(Lpxj;)V

    return-void

    :pswitch_2c2
    iget-object v0, v0, Lks6;->b:Ljava/lang/Object;

    check-cast v0, Ld5a;

    check-cast v1, Leyj;

    iget-object v0, v0, Ld5a;->b:Ljava/lang/Object;

    check-cast v0, Ln4l;

    iget-object v0, v0, Ln4l;->f:Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v0, :cond_2dd

    iget-object v1, v1, Leyj;->p:Lb8h;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v1, v2}, Lb8h;->f(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/opera/android/custom_views/StylingImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_2dd
    return-void

    :pswitch_2de
    iget-object v0, v0, Lks6;->b:Ljava/lang/Object;

    check-cast v0, Lhx5;

    invoke-virtual {v0, v1}, Lekc;->r(Ljava/lang/Object;)V

    return-void

    :pswitch_2e6
    iget-object v0, v0, Lks6;->b:Ljava/lang/Object;

    check-cast v0, Ljd9;

    check-cast v1, Lgfh;

    instance-of v2, v1, Lefh;

    if-eqz v2, :cond_2fb

    iget-object v0, v0, Ljd9;->p:Lx79;

    iget-object v0, v0, Lx79;->e:Ljava/lang/Object;

    check-cast v0, Landroidx/constraintlayout/widget/ConstraintLayout;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    goto :goto_366

    :cond_2fb
    instance-of v2, v1, Lcfh;

    if-eqz v2, :cond_328

    check-cast v1, Lcfh;

    iget-object v2, v0, Ljd9;->p:Lx79;

    iget-object v2, v2, Lx79;->e:Ljava/lang/Object;

    check-cast v2, Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-virtual {v2, v4}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v2

    iget-object v1, v1, Lcfh;->a:Lbfh;

    invoke-static {v1}, Lmfh;->q(Lbfh;)Lrxh;

    move-result-object v1

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v1, v3}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object v1

    const/4 v3, 0x0

    invoke-static {v2, v1, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    invoke-virtual {v0}, Lryl;->g0()V

    goto :goto_366

    :cond_328
    instance-of v2, v1, Lffh;

    if-eqz v2, :cond_366

    check-cast v1, Lffh;

    iget-object v2, v0, Ljd9;->p:Lx79;

    iget-object v2, v2, Lx79;->e:Ljava/lang/Object;

    check-cast v2, Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-virtual {v2, v4}, Landroid/view/View;->setVisibility(I)V

    iget-object v1, v1, Lffh;->a:Lhmi;

    if-eqz v1, :cond_366

    iget-boolean v2, v0, Ljd9;->n:Z

    if-nez v2, :cond_366

    iget-object v1, v1, Lhmi;->d:Lfmi;

    instance-of v2, v1, Ldmi;

    if-eqz v2, :cond_366

    check-cast v1, Ldmi;

    iget-object v1, v1, Ldmi;->a:Ljava/lang/String;

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v2

    sget-object v3, Lvml;->d:Lumi;

    new-instance v4, Ldg7;

    const/16 v5, 0x18

    invoke-direct {v4, v0, v5}, Ldg7;-><init>(Ljava/lang/Object;B)V

    const/4 v5, 0x0

    invoke-static {v2, v3, v1, v5, v4}, Lc09;->t(Landroid/content/Context;Lumi;Ljava/lang/String;ZLcom/opera/api/Callback;)Z

    move-result v1

    if-eqz v1, :cond_366

    new-instance v1, Lgd9;

    const/4 v5, 0x1

    invoke-direct {v1, v0, v5}, Lgd9;-><init>(Ljd9;B)V

    invoke-static {v1}, Lvml;->c(Ljava/lang/Runnable;)V

    :cond_366
    :goto_366
    return-void

    :pswitch_367
    iget-object v0, v0, Lks6;->b:Ljava/lang/Object;

    check-cast v0, Lz1h;

    invoke-virtual {v0, v1}, Lz1h;->b(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_36f
    iget-object v0, v0, Lks6;->b:Ljava/lang/Object;

    check-cast v0, Lxw8;

    check-cast v1, Ljava/lang/Integer;

    iget-object v2, v0, Lxw8;->B:Ligi;

    if-eqz v2, :cond_38c

    iget-object v2, v2, Ligi;->d:Ljava/lang/Object;

    check-cast v2, Lqv8;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    iget v3, v2, Lqv8;->f:I

    if-eq v3, v1, :cond_38c

    iput v1, v2, Lqv8;->f:I

    iget-object v0, v0, Lxw8;->g:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->a0()V

    :cond_38c
    return-void

    :pswitch_38d
    iget-object v0, v0, Lks6;->b:Ljava/lang/Object;

    check-cast v0, Lxv8;

    check-cast v1, Ljava/lang/Boolean;

    iget-boolean v2, v0, Lxv8;->z:Z

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3c1

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    iput-boolean v1, v0, Lxv8;->z:Z

    iget-object v2, v0, Lxv8;->A:Lcom/opera/android/widget/ClickAwareCardView;

    if-eqz v1, :cond_3bd

    iget-object v0, v0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f0402f3

    const v3, 0x7f06063b

    invoke-static {v1, v0, v3}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v0

    invoke-virtual {v2, v0}, Landroid/view/View;->setBackgroundColor(I)V

    goto :goto_3c1

    :cond_3bd
    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/view/View;->setBackgroundColor(I)V

    :cond_3c1
    :goto_3c1
    return-void

    :pswitch_3c2
    iget-object v0, v0, Lks6;->b:Ljava/lang/Object;

    check-cast v0, Llu8;

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v0}, Llu8;->j0()V

    return-void

    :pswitch_3cc
    iget-object v0, v0, Lks6;->b:Ljava/lang/Object;

    check-cast v0, Leu8;

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_408

    iget-object v0, v0, Leu8;->c:Low8;

    const-class v1, Lmq;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-class v2, Lja2;

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    iget-object v3, v0, Lha2;->a:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v4

    const/16 v16, 0x1

    add-int/lit8 v4, v4, -0x1

    :goto_3ef
    if-ltz v4, :cond_408

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lja2;

    if-nez v2, :cond_3ff

    invoke-virtual {v1, v5}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_405

    :cond_3ff
    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    invoke-virtual {v0, v4}, Landroidx/recyclerview/widget/d;->notifyItemRemoved(I)V

    :cond_405
    add-int/lit8 v4, v4, -0x1

    goto :goto_3ef

    :cond_408
    return-void

    :pswitch_409
    iget-object v0, v0, Lks6;->b:Ljava/lang/Object;

    check-cast v0, Lrs8;

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    iget-boolean v2, v0, Lrs8;->k:Z

    if-eq v1, v2, :cond_420

    iput-boolean v1, v0, Lrs8;->k:Z

    if-eqz v1, :cond_420

    iget-object v0, v0, Lrs8;->h:Lps8;

    invoke-virtual {v0}, Lps8;->run()V

    :cond_420
    return-void

    :pswitch_421
    iget-object v0, v0, Lks6;->b:Ljava/lang/Object;

    check-cast v0, Lar8;

    check-cast v1, Ltta;

    iget-object v2, v0, Lar8;->y:Lns8;

    invoke-virtual {v2, v1}, Lns8;->V(Ltta;)V

    iget-object v0, v0, Lar8;->v:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v1, v0, Landroidx/recyclerview/widget/RecyclerView;->m:Landroidx/recyclerview/widget/d;

    if-eqz v1, :cond_442

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroidx/recyclerview/widget/RecyclerView;->y0(Landroidx/recyclerview/widget/d;)V

    iget-object v2, v0, Landroidx/recyclerview/widget/RecyclerView;->c:Landroidx/recyclerview/widget/g;

    invoke-virtual {v2}, Landroidx/recyclerview/widget/g;->c()Lro9;

    move-result-object v2

    invoke-virtual {v2}, Lro9;->f()V

    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->y0(Landroidx/recyclerview/widget/d;)V

    :cond_442
    return-void

    :pswitch_443
    iget-object v0, v0, Lks6;->b:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/webcore/FastResizeWebViewContainer;

    check-cast v1, Lbq8;

    sget v1, Lcom/opera/android/webcore/FastResizeWebViewContainer;->i:I

    invoke-virtual {v0}, Lcom/opera/android/webcore/FastResizeWebViewContainer;->b()V

    return-void

    :pswitch_44f
    iget-object v0, v0, Lks6;->b:Ljava/lang/Object;

    check-cast v0, Ld21;

    check-cast v1, Leyj;

    invoke-virtual {v0}, Ld21;->a()V

    return-void

    :pswitch_459
    iget-object v0, v0, Lks6;->b:Ljava/lang/Object;

    check-cast v0, Law7;

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    invoke-virtual {v0, v1}, Law7;->I0(Z)V

    return-void

    :pswitch_467
    iget-object v0, v0, Lks6;->b:Ljava/lang/Object;

    check-cast v0, Lrv7;

    check-cast v1, Ljava/lang/String;

    if-eqz v1, :cond_474

    iget-object v0, v0, Lrv7;->n:Lyv7;

    invoke-virtual {v0, v1}, Lyv7;->k(Ljava/lang/String;)V

    :cond_474
    return-void

    :pswitch_475
    iget-object v0, v0, Lks6;->b:Ljava/lang/Object;

    check-cast v0, Lhi7;

    check-cast v1, Lfi7;

    iget-object v0, v0, Lhi7;->e:Ligi;

    iget-object v0, v0, Ligi;->b:Ljava/lang/Object;

    check-cast v0, Landroid/widget/FrameLayout;

    iget v2, v1, Lfi7;->a:I

    iget v1, v1, Lfi7;->b:I

    const/4 v3, 0x0

    invoke-virtual {v0, v3, v2, v3, v1}, Landroid/view/View;->setPadding(IIII)V

    return-void

    :pswitch_48a
    move v3, v6

    iget-object v0, v0, Lks6;->b:Ljava/lang/Object;

    check-cast v0, Lwg7;

    check-cast v1, Ljava/util/List;

    iget-object v2, v0, Lwg7;->L:Lcom/opera/android/undo/UndoBar;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-interface {v1}, Ljava/util/Collection;->stream()Ljava/util/stream/Stream;

    move-result-object v1

    new-instance v4, Lzx1;

    const/16 v5, 0x12

    invoke-direct {v4, v2, v5}, Lzx1;-><init>(Ljava/lang/Object;B)V

    invoke-interface {v1, v4}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    move-result-object v1

    invoke-static {}, Ljava/util/stream/Collectors;->toList()Ljava/util/stream/Collector;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    iget-object v2, v0, Lwg7;->L:Lcom/opera/android/undo/UndoBar;

    const/4 v5, 0x1

    invoke-virtual {v2, v5}, Lcom/opera/android/undo/UndoBar;->a(Z)V

    iget-object v2, v0, Lwg7;->z:Lze7;

    invoke-virtual {v0}, Lwg7;->L0()Lvvj;

    move-result-object v4

    check-cast v1, Ljava/util/List;

    invoke-virtual {v2, v1, v4}, Lze7;->J(Ljava/util/List;Lvvj;)V

    iget-boolean v1, v0, Lwg7;->H:Z

    if-nez v1, :cond_517

    iput-boolean v5, v0, Lwg7;->H:Z

    iget-object v1, v0, Lwg7;->I:Lpt1;

    iget-object v1, v1, Lpt1;->f:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/downloads/DownloadsPanel;

    iget-object v2, v0, Lwg7;->A:Lyz7;

    iget-object v2, v2, Lyz7;->c:Lx93;

    iget-object v1, v1, Lcom/opera/android/downloads/DownloadsPanel;->a:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v1, v2}, Landroidx/recyclerview/widget/RecyclerView;->y0(Landroidx/recyclerview/widget/d;)V

    iget-object v1, v0, Lwg7;->A:Lyz7;

    invoke-virtual {v1}, Lyz7;->c()V

    iget-object v1, v0, Lwg7;->S:Lrn9;

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    move-result-object v2

    const-wide/16 v4, -0x1

    if-eqz v2, :cond_4ef

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    move-result-object v2

    const-string v6, "download"

    invoke-virtual {v2, v6, v4, v5}, Landroid/os/BaseBundle;->getLong(Ljava/lang/String;J)J

    move-result-wide v6

    goto :goto_4f0

    :cond_4ef
    move-wide v6, v4

    :goto_4f0
    cmp-long v2, v6, v4

    const/4 v4, -0x1

    if-eqz v2, :cond_50e

    iget-object v2, v0, Lwg7;->z:Lze7;

    :goto_4f7
    iget-object v5, v2, Lze7;->b:Lxvj;

    iget v8, v5, Lxvj;->h:I

    if-ge v3, v8, :cond_50e

    invoke-virtual {v5, v3}, Lxvj;->f(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lxe7;

    iget-wide v8, v5, Lxe7;->a:J

    cmp-long v5, v8, v6

    if-nez v5, :cond_50b

    move v4, v3

    goto :goto_50e

    :cond_50b
    add-int/lit8 v3, v3, 0x1

    goto :goto_4f7

    :cond_50e
    :goto_50e
    iget-object v0, v0, Lwg7;->I:Lpt1;

    iget-object v0, v0, Lpt1;->c:Landroid/view/View;

    check-cast v0, Lcom/opera/android/custom_views/FadingRecyclerView;

    invoke-virtual {v1, v0, v4}, Lrn9;->E(Landroidx/recyclerview/widget/RecyclerView;I)V

    :cond_517
    return-void

    :pswitch_518
    iget-object v0, v0, Lks6;->b:Ljava/lang/Object;

    check-cast v0, Lqs6;

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    iget-object v2, v0, Lqs6;->g:Ljava/util/Set;

    if-eqz v2, :cond_52d

    iget-object v3, v0, Lqs6;->d:Ligi;

    iget-object v0, v0, Lqs6;->a:Landroid/content/Context;

    invoke-virtual {v3, v0, v1, v2}, Ligi;->Z(Landroid/content/Context;ZLjava/util/Set;)V

    :cond_52d
    return-void

    :pswitch_data_52e
    .packed-switch 0x0
        :pswitch_518
        :pswitch_48a
        :pswitch_475
        :pswitch_467
        :pswitch_459
        :pswitch_44f
        :pswitch_443
        :pswitch_421
        :pswitch_409
        :pswitch_3cc
        :pswitch_3c2
        :pswitch_38d
        :pswitch_36f
        :pswitch_367
        :pswitch_2e6
        :pswitch_2de
        :pswitch_2c2
        :pswitch_2b8
        :pswitch_2ae
        :pswitch_296
        :pswitch_28c
        :pswitch_fd
        :pswitch_e0
        :pswitch_d8
        :pswitch_99
        :pswitch_8c
        :pswitch_72
        :pswitch_5b
        :pswitch_17
    .end packed-switch
.end method
