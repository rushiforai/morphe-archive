.class public final synthetic Lwj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf7f;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 4

    iput-byte p3, p0, Lwj;->a:B

    iput-object p1, p0, Lwj;->b:Ljava/lang/Object;

    iput-object p2, p0, Lwj;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final d0(Ljava/lang/Object;)V
    .registers 20

    move-object/from16 v0, p0

    iget-byte v1, v0, Lwj;->a:B

    const/4 v2, 0x1

    iget-object v3, v0, Lwj;->c:Ljava/lang/Object;

    iget-object v0, v0, Lwj;->b:Ljava/lang/Object;

    const/4 v4, 0x0

    packed-switch v1, :pswitch_data_444

    check-cast v0, Llqh;

    check-cast v3, Lg4l;

    move-object/from16 v1, p1

    check-cast v1, Lqcc;

    sget-object v5, Lqcc;->e:Lqcc;

    invoke-virtual {v1, v5}, Lqcc;->d(Lqcc;)Z

    move-result v1

    iget-boolean v5, v0, Llqh;->a:Z

    if-eqz v1, :cond_27

    if-eqz v5, :cond_30

    invoke-static {v3}, Lg4l;->e(Lg4l;)V

    iput-boolean v4, v0, Llqh;->a:Z

    goto :goto_30

    :cond_27
    if-nez v5, :cond_30

    const/4 v1, 0x3

    const/4 v4, 0x0

    invoke-static {v3, v4, v1}, Lg4l;->a(Lg4l;Luz3;I)V

    iput-boolean v2, v0, Llqh;->a:Z

    :cond_30
    :goto_30
    return-void

    :pswitch_31
    check-cast v0, Lsyk;

    check-cast v3, Ltq8;

    move-object/from16 v1, p1

    check-cast v1, Lpkj;

    sget-object v2, Lpkj;->a:Lpkj;

    if-ne v1, v2, :cond_5b

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v0

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->o()Lnr8;

    move-result-object v0

    check-cast v0, Lcom/opera/android/favorites/e;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v3}, Lhq8;->e()J

    move-result-wide v0

    sget-object v2, Lcom/opera/android/favorites/FavoritesBridge;->a:Li7f;

    invoke-static {v0, v1}, LJ/N;->Mw8yLl_M(J)V

    :cond_5b
    return-void

    :pswitch_5c
    check-cast v0, Lb7k;

    check-cast v3, Lt8k;

    move-object/from16 v1, p1

    check-cast v1, Lkl5;

    iget-object v0, v0, Lb7k;->b:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v5

    iget-object v1, v1, Lkl5;->b:Landroid/graphics/Rect;

    iget-boolean v3, v3, Lt8k;->e:Z

    if-eqz v3, :cond_87

    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    move-result v1

    invoke-static {v1, v5}, Lddh;->s(ILandroid/content/Context;)Lgpj;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    if-eqz v1, :cond_87

    if-eq v1, v2, :cond_88

    const/4 v3, 0x2

    if-eq v1, v3, :cond_88

    invoke-static {}, Lh9o;->p()V

    goto :goto_a4

    :cond_87
    move v2, v4

    :cond_88
    if-eqz v2, :cond_96

    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f070975

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    goto :goto_a1

    :cond_96
    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f070974

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    :goto_a1
    invoke-static {v1, v0}, Lp37;->l0(ILandroid/view/View;)V

    :goto_a4
    return-void

    :pswitch_a5
    check-cast v0, Lru9;

    check-cast v3, Lh42;

    move-object/from16 v1, p1

    check-cast v1, Llpk;

    iget-object v2, v1, Llpk;->c:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    iget-object v5, v0, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v6, "startpage.last_suggestion_count"

    invoke-interface {v5, v6, v4}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v4

    if-eq v2, v4, :cond_cb

    invoke-virtual {v0}, Lru9;->b()Lnv6;

    move-result-object v0

    iget-object v4, v0, Lnv6;->a:Ljava/lang/Object;

    check-cast v4, Landroid/content/SharedPreferences$Editor;

    invoke-interface {v4, v6, v2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {v0}, Lnv6;->w()V

    :cond_cb
    new-instance v0, Lkpk;

    iget-object v2, v1, Ln1;->b:Ljava/lang/Object;

    check-cast v2, Lnpk;

    invoke-direct {v0, v1, v2}, Lk8;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v3, v0}, Lekc;->r(Ljava/lang/Object;)V

    return-void

    :pswitch_d8
    check-cast v0, Lcu5;

    check-cast v3, Lcom/jensdriller/libs/undobar/MaxWidthLinearLayout;

    move-object/from16 v1, p1

    check-cast v1, Lv8k;

    iget-object v0, v0, Lcu5;->f:Ltsd;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lv8k;

    invoke-virtual {v3}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lv8k;->d(Landroid/content/Context;)I

    move-result v0

    invoke-static {v0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    invoke-virtual {v3, v0}, Landroid/view/View;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    return-void

    :pswitch_f8
    check-cast v0, Lnlh;

    check-cast v3, Landroidx/recyclerview/widget/RecyclerView;

    move-object/from16 v1, p1

    check-cast v1, Ljava/util/List;

    iget-object v5, v0, Lnlh;->G:Lcom/opera/android/undo/UndoBar;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-interface {v1}, Ljava/util/Collection;->stream()Ljava/util/stream/Stream;

    move-result-object v1

    new-instance v6, Lzx1;

    const/16 v7, 0x12

    invoke-direct {v6, v5, v7}, Lzx1;-><init>(Ljava/lang/Object;B)V

    invoke-interface {v1, v6}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    move-result-object v1

    invoke-static {}, Ljava/util/stream/Collectors;->toList()Ljava/util/stream/Collector;

    move-result-object v5

    invoke-interface {v1, v5}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    iget-object v5, v0, Lnlh;->G:Lcom/opera/android/undo/UndoBar;

    invoke-virtual {v5, v2}, Lcom/opera/android/undo/UndoBar;->a(Z)V

    iget-object v5, v0, Lnlh;->z:Lzg7;

    invoke-virtual {v5}, Loy;->e()Z

    move-result v5

    iget-object v6, v0, Lnlh;->F:Lblh;

    if-eqz v5, :cond_174

    iget-object v4, v6, Lblh;->e:Lxvj;

    iget-object v5, v6, Lblh;->f:Ljava/util/HashMap;

    invoke-virtual {v5}, Ljava/util/HashMap;->clear()V

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_138
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_161

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lilh;

    new-instance v8, Lwkh;

    invoke-direct {v8, v7}, Lwkh;-><init>(Lilh;)V

    iget-object v9, v6, Lblh;->h:Ljava/util/ArrayList;

    iget-wide v10, v7, Lilh;->a:J

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v9

    iput v9, v8, Lwkh;->b:I

    iget-wide v9, v7, Lilh;->a:J

    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    invoke-virtual {v5, v7, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_138

    :cond_161
    invoke-virtual {v4}, Lxvj;->d()V

    invoke-virtual {v5}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-virtual {v4, v1}, Lxvj;->c(Ljava/util/Collection;)V

    iget-object v1, v6, Lblh;->i:Ll46;

    if-eqz v1, :cond_202

    invoke-virtual {v1}, Ll46;->onChanged()V

    goto/16 :goto_202

    :cond_174
    iget-object v5, v6, Lblh;->e:Lxvj;

    iget-object v7, v6, Lblh;->f:Ljava/util/HashMap;

    invoke-virtual {v7}, Ljava/util/HashMap;->clear()V

    new-instance v8, Ljava/util/ArrayList;

    iget-object v9, v6, Lblh;->h:Ljava/util/ArrayList;

    invoke-direct {v8, v9}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    new-instance v10, Ljava/util/ArrayList;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v11

    invoke-direct {v10, v11}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_18f
    :goto_18f
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_1c1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lilh;

    new-instance v12, Lwkh;

    invoke-direct {v12, v11}, Lwkh;-><init>(Lilh;)V

    invoke-virtual {v7}, Ljava/util/HashMap;->size()I

    move-result v13

    iput v13, v12, Lwkh;->b:I

    iget-wide v13, v11, Lilh;->a:J

    invoke-static {v13, v14}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    invoke-virtual {v7, v11, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {v13, v14}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    invoke-virtual {v8, v11}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_18f

    invoke-static {v13, v14}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_18f

    :cond_1c1
    invoke-virtual {v9, v8}, Ljava/util/ArrayList;->removeAll(Ljava/util/Collection;)Z

    move-result v1

    invoke-virtual {v9, v4, v10}, Ljava/util/ArrayList;->addAll(ILjava/util/Collection;)Z

    move-result v8

    or-int/2addr v1, v8

    invoke-virtual {v7}, Ljava/util/HashMap;->size()I

    move-result v8

    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v10

    if-ne v8, v10, :cond_1e9

    :goto_1d4
    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v8

    if-ge v4, v8, :cond_1ea

    invoke-virtual {v9, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lwkh;

    iput v4, v8, Lwkh;->b:I

    add-int/lit8 v4, v4, 0x1

    goto :goto_1d4

    :cond_1e9
    move v1, v2

    :cond_1ea
    if-eqz v1, :cond_1f1

    iget-object v1, v6, Lblh;->j:Lnlh;

    invoke-virtual {v1, v9}, Lnlh;->L0(Ljava/util/ArrayList;)V

    :cond_1f1
    invoke-virtual {v5}, Lxvj;->d()V

    invoke-virtual {v7}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-virtual {v5, v1}, Lxvj;->c(Ljava/util/Collection;)V

    iget-object v1, v6, Lblh;->i:Ll46;

    if-eqz v1, :cond_202

    invoke-virtual {v1}, Ll46;->onChanged()V

    :cond_202
    :goto_202
    iget-boolean v1, v0, Lnlh;->A:Z

    if-nez v1, :cond_214

    iput-boolean v2, v0, Lnlh;->A:Z

    iget-object v1, v0, Lnlh;->L:Lyz7;

    iget-object v1, v1, Lyz7;->c:Lx93;

    invoke-virtual {v3, v1}, Landroidx/recyclerview/widget/RecyclerView;->y0(Landroidx/recyclerview/widget/d;)V

    iget-object v0, v0, Lnlh;->L:Lyz7;

    invoke-virtual {v0}, Lyz7;->c()V

    :cond_214
    return-void

    :pswitch_215
    check-cast v0, Lxw;

    check-cast v3, Lr9i;

    move-object/from16 v1, p1

    check-cast v1, Ll0a;

    iget-object v1, v3, Lr9i;->c:Ljava/lang/Object;

    check-cast v1, Lm66;

    iget-object v0, v0, Lxw;->k:Ljava/lang/Object;

    check-cast v0, Lm0a;

    iget-object v0, v0, Lm0a;->e:Lpde;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ll0a;

    iget-object v2, v0, Ll0a;->c:Ll08;

    const v5, 0x7f0a068d

    invoke-virtual {v1, v5}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object v6

    iget-object v3, v3, Lr9i;->b:Ljava/lang/Object;

    check-cast v3, Ldkf;

    invoke-static {v3}, Lr9n;->A(Landroid/content/Context;)Z

    move-result v3

    invoke-interface {v6, v3}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    invoke-virtual {v1, v5}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object v3

    invoke-interface {v3, v4}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    const v3, 0x7f0a0696

    invoke-virtual {v1, v3}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object v3

    invoke-interface {v3, v4}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    const v3, 0x7f0a0693

    invoke-virtual {v1, v3}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object v3

    invoke-interface {v3, v4}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    const v3, 0x7f0a04e6

    invoke-virtual {v1, v3}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object v3

    sget-object v5, Lo0a;->a:Lo0a;

    invoke-virtual {v5, v2}, Lo0a;->d(Ll08;)Z

    move-result v5

    invoke-interface {v3, v5}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    iget-object v0, v0, Ll0a;->b:Lv08;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-interface {v3, v4}, Landroid/view/MenuItem;->setChecked(Z)Landroid/view/MenuItem;

    const v0, 0x7f0a04e7

    invoke-virtual {v1, v0}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    sget-object v1, Lo0a;->b:Lo0a;

    invoke-virtual {v1, v2}, Lo0a;->d(Ll08;)Z

    move-result v1

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    invoke-interface {v0, v4}, Landroid/view/MenuItem;->setChecked(Z)Landroid/view/MenuItem;

    return-void

    :pswitch_288
    check-cast v0, Lkf;

    check-cast v3, Llm6;

    move-object/from16 v1, p1

    check-cast v1, Landroid/content/res/Configuration;

    iget v1, v1, Landroid/content/res/Configuration;->screenHeightDp:I

    const/16 v5, 0x258

    if-ge v1, v5, :cond_297

    move v2, v4

    :cond_297
    iget-object v0, v0, Lkf;->c:Ljava/lang/Object;

    check-cast v0, Landroid/widget/FrameLayout;

    iget-object v1, v3, Llm6;->c:Lyl6;

    invoke-virtual {v1}, Lyl6;->c()Z

    move-result v1

    if-eqz v1, :cond_2a5

    if-nez v2, :cond_2a7

    :cond_2a5
    const/16 v4, 0x8

    :cond_2a7
    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    return-void

    :pswitch_2ab
    check-cast v0, Lrc5;

    check-cast v3, Landroidx/recyclerview/widget/RecyclerView;

    move-object/from16 v1, p1

    check-cast v1, Ljava/util/List;

    iget-object v0, v0, Lrc5;->c:Ljava/lang/Object;

    check-cast v0, Ldt1;

    check-cast v1, Ljava/lang/Iterable;

    new-instance v2, Ljava/util/ArrayList;

    const/16 v5, 0xa

    invoke-static {v1, v5}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v5

    invoke-direct {v2, v5}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_2c8
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2ef

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljfj;

    iget-object v8, v5, Ljfj;->d:Ljava/lang/String;

    new-instance v6, Lcom/opera/android/suggestion/Suggestion;

    const/4 v12, 0x0

    const/4 v15, 0x0

    const/16 v7, 0x19

    const-string v9, ""

    const/4 v11, 0x0

    const v13, 0x7fffffff

    const/16 v16, -0x1

    move-object v10, v8

    move-object v14, v9

    move-object/from16 v17, v5

    invoke-direct/range {v6 .. v17}, Lcom/opera/android/suggestion/Suggestion;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Lrn9;Ljava/lang/String;ILjava/lang/String;IILjava/lang/Object;)V

    invoke-virtual {v2, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2c8

    :cond_2ef
    invoke-virtual {v0, v2}, Ldt1;->K(Ljava/util/Collection;)V

    iget-object v0, v0, Ldt1;->d:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2ff

    invoke-virtual {v3, v4}, Landroidx/recyclerview/widget/RecyclerView;->x0(I)V

    :cond_2ff
    return-void

    :pswitch_300
    check-cast v0, Lwf;

    check-cast v3, Llk;

    move-object/from16 v1, p1

    check-cast v1, Lok;

    invoke-static {}, Lkotlin/collections/a;->b()Lehc;

    move-result-object v5

    new-instance v6, Lck;

    new-instance v7, Lrxh;

    const v8, 0x7f140090

    invoke-direct {v7, v8}, Lrxh;-><init>(I)V

    new-instance v8, Lrxh;

    const v9, 0x7f14008f

    invoke-direct {v8, v9}, Lrxh;-><init>(I)V

    iget-object v9, v1, Lok;->a:La7j;

    sget-object v10, La7j;->a:La7j;

    if-ne v9, v10, :cond_326

    move v10, v2

    goto :goto_327

    :cond_326
    move v10, v4

    :goto_327
    sget-object v11, Lkk;->a:Lkk;

    invoke-direct {v6, v7, v8, v10, v11}, Lck;-><init>(Lrxh;Lrxh;ZLkk;)V

    invoke-virtual {v5, v6}, Lehc;->add(Ljava/lang/Object;)Z

    new-instance v6, Lck;

    new-instance v7, Lrxh;

    const v8, 0x7f140094

    invoke-direct {v7, v8}, Lrxh;-><init>(I)V

    new-instance v8, Lrxh;

    const v10, 0x7f140093

    invoke-direct {v8, v10}, Lrxh;-><init>(I)V

    sget-object v10, La7j;->b:La7j;

    if-ne v9, v10, :cond_347

    move v10, v2

    goto :goto_348

    :cond_347
    move v10, v4

    :goto_348
    sget-object v11, Lkk;->b:Lkk;

    invoke-direct {v6, v7, v8, v10, v11}, Lck;-><init>(Lrxh;Lrxh;ZLkk;)V

    invoke-virtual {v5, v6}, Lehc;->add(Ljava/lang/Object;)Z

    new-instance v6, Lck;

    new-instance v7, Lrxh;

    const v8, 0x7f140092

    invoke-direct {v7, v8}, Lrxh;-><init>(I)V

    new-instance v8, Lrxh;

    const v10, 0x7f140091

    invoke-direct {v8, v10}, Lrxh;-><init>(I)V

    sget-object v10, La7j;->c:La7j;

    if-ne v9, v10, :cond_368

    move v11, v2

    goto :goto_369

    :cond_368
    move v11, v4

    :goto_369
    sget-object v12, Lkk;->c:Lkk;

    invoke-direct {v6, v7, v8, v11, v12}, Lck;-><init>(Lrxh;Lrxh;ZLkk;)V

    invoke-virtual {v5, v6}, Lehc;->add(Ljava/lang/Object;)Z

    if-ne v9, v10, :cond_424

    new-instance v6, Lbk;

    new-instance v7, Lrxh;

    const v8, 0x7f140096

    invoke-direct {v7, v8}, Lrxh;-><init>(I)V

    invoke-direct {v6, v7}, Lbk;-><init>(Lrxh;)V

    invoke-virtual {v5, v6}, Lehc;->add(Ljava/lang/Object;)Z

    iget-object v6, v1, Lok;->b:Ljava/util/List;

    invoke-virtual {v3}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    check-cast v6, Ljava/lang/Iterable;

    new-instance v8, Ljk;

    invoke-direct {v8, v7, v4}, Ljk;-><init>(Ljava/lang/Object;B)V

    invoke-static {v8, v6}, Lkotlin/collections/CollectionsKt;->c0(Ljava/util/Comparator;Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v6

    check-cast v6, Ljava/lang/Iterable;

    invoke-interface {v6}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_39a
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_3ae

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lmk;

    invoke-static {v7}, Lsgb;->d0(Lmk;)Lc09;

    move-result-object v7

    invoke-virtual {v5, v7}, Lehc;->add(Ljava/lang/Object;)Z

    goto :goto_39a

    :cond_3ae
    new-instance v6, Lbk;

    new-instance v7, Lrxh;

    const v8, 0x7f140095

    invoke-direct {v7, v8}, Lrxh;-><init>(I)V

    invoke-direct {v6, v7}, Lbk;-><init>(Lrxh;)V

    invoke-virtual {v5, v6}, Lehc;->add(Ljava/lang/Object;)Z

    iget-object v6, v1, Lok;->c:Ljava/util/List;

    invoke-virtual {v3}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    check-cast v6, Ljava/lang/Iterable;

    new-instance v8, Ljk;

    invoke-direct {v8, v7, v4}, Ljk;-><init>(Ljava/lang/Object;B)V

    invoke-static {v8, v6}, Lkotlin/collections/CollectionsKt;->c0(Ljava/util/Comparator;Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v6

    check-cast v6, Ljava/lang/Iterable;

    invoke-interface {v6}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_3d5
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_3e9

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lmk;

    invoke-static {v7}, Lsgb;->d0(Lmk;)Lc09;

    move-result-object v7

    invoke-virtual {v5, v7}, Lehc;->add(Ljava/lang/Object;)Z

    goto :goto_3d5

    :cond_3e9
    new-instance v6, Lbk;

    new-instance v7, Lrxh;

    const v8, 0x7f140097

    invoke-direct {v7, v8}, Lrxh;-><init>(I)V

    invoke-direct {v6, v7}, Lbk;-><init>(Lrxh;)V

    invoke-virtual {v5, v6}, Lehc;->add(Ljava/lang/Object;)Z

    iget-object v1, v1, Lok;->d:Ljava/util/List;

    invoke-virtual {v3}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    check-cast v1, Ljava/lang/Iterable;

    new-instance v6, Ljk;

    invoke-direct {v6, v3, v4}, Ljk;-><init>(Ljava/lang/Object;B)V

    invoke-static {v6, v1}, Lkotlin/collections/CollectionsKt;->c0(Ljava/util/Comparator;Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v1

    check-cast v1, Ljava/lang/Iterable;

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_410
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_424

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lmk;

    invoke-static {v3}, Lsgb;->d0(Lmk;)Lc09;

    move-result-object v3

    invoke-virtual {v5, v3}, Lehc;->add(Ljava/lang/Object;)Z

    goto :goto_410

    :cond_424
    invoke-static {v5}, Lkotlin/collections/a;->a(Lehc;)Lehc;

    move-result-object v1

    new-instance v3, Leme;

    invoke-direct {v3, v0}, Leme;-><init>(Ljava/lang/Object;)V

    iget-object v0, v0, Ldt1;->d:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    new-instance v5, Lik;

    invoke-direct {v5, v0, v1, v4}, Lik;-><init>(Ljava/util/ArrayList;Ljava/util/List;B)V

    invoke-static {v5, v2}, Luup;->k(Lk1g;Z)Lj87;

    move-result-object v2

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    invoke-virtual {v2, v3}, Lj87;->a(Lsic;)V

    return-void

    :pswitch_data_444
    .packed-switch 0x0
        :pswitch_300
        :pswitch_2ab
        :pswitch_288
        :pswitch_215
        :pswitch_f8
        :pswitch_d8
        :pswitch_a5
        :pswitch_5c
        :pswitch_31
    .end packed-switch
.end method
