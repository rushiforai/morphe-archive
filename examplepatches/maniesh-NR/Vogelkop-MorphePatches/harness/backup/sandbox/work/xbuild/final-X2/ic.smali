.class public final Lic;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    .line 13
    iput-byte p2, p0, Lic;->a:B

    iput-object p1, p0, Lic;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lwtm;)V
    .registers 3

    const/16 v0, 0x11

    iput-byte v0, p0, Lic;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lic;->b:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 14

    iget-byte v0, p0, Lic;->a:B

    const/4 v1, 0x2

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x1

    iget-object p0, p0, Lic;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_47a

    check-cast p0, Lwtm;

    iget-object p1, p0, Lwtm;->c:Ljava/lang/Object;

    check-cast p1, Landroid/view/View;

    if-eqz p1, :cond_21

    iget-object v0, p0, Lwtm;->a:Ljava/lang/Object;

    check-cast v0, Landroid/app/Activity;

    new-instance v1, Lvr9;

    const/16 v2, 0x1d

    invoke-direct {v1, p0, p1, v2}, Lvr9;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    :cond_21
    return-void

    :pswitch_22
    check-cast p0, Lami;

    iget-object p1, p0, Lami;->d:Ljava/lang/Object;

    check-cast p1, Lmgh;

    if-eqz p1, :cond_c9

    iget-object p1, p0, Lami;->c:Ljava/lang/Object;

    check-cast p1, Lgtj;

    if-eqz p1, :cond_c9

    const/16 v0, 0x9c4

    iget-object v5, p1, Lgtj;->a:Lasj;

    iput v0, v5, Lna3;->k:I

    invoke-virtual {p1}, Lgtj;->j()V

    iget-object p1, p0, Lami;->c:Ljava/lang/Object;

    check-cast p1, Lgtj;

    const/16 v0, 0x1388

    iget-object p1, p1, Lgtj;->a:Lasj;

    iput v0, p1, Lna3;->k:I

    iget-object p0, p0, Lami;->d:Ljava/lang/Object;

    check-cast p0, Lmgh;

    iget-object p1, p0, Lmgh;->c:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/undo/UndoBar;

    iget-object v0, p0, Lmgh;->b:Ljava/lang/Object;

    check-cast v0, Lmhk;

    invoke-virtual {v0}, Lmhk;->e()Lmkm;

    move-result-object v5

    if-eqz v5, :cond_a3

    iget-object v5, v5, Lmkm;->a:Le5d;

    iget-boolean v6, p1, Lcom/opera/android/undo/UndoBar;->f:Z

    if-eqz v6, :cond_93

    invoke-virtual {v0}, Lmhk;->e()Lmkm;

    move-result-object v6

    :goto_5f
    if-eqz v6, :cond_93

    iget-object v6, v6, Lmkm;->a:Le5d;

    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    iget-object v9, v5, Le5d;->c:Ljava/lang/Object;

    check-cast v9, Ljava/util/ArrayList;

    invoke-virtual {v7, v9}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    iget-object v9, v6, Le5d;->c:Ljava/lang/Object;

    check-cast v9, Ljava/util/ArrayList;

    invoke-virtual {v7, v9}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    iget-object v5, v5, Le5d;->b:Ljava/lang/Object;

    check-cast v5, Ljava/util/List;

    invoke-virtual {v8, v5}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    iget-object v5, v6, Le5d;->b:Ljava/lang/Object;

    check-cast v5, Ljava/util/List;

    invoke-virtual {v8, v5}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    new-instance v5, Le5d;

    invoke-direct {v5, v7, v8, v1}, Le5d;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0}, Lmhk;->e()Lmkm;

    move-result-object v6

    goto :goto_5f

    :cond_93
    iput-boolean v4, p1, Lcom/opera/android/undo/UndoBar;->g:Z

    iget-object p0, p0, Lmgh;->c:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/undo/UndoBar;

    iget-object p0, p0, Lcom/opera/android/undo/UndoBar;->e:Lkkm;

    invoke-interface {p0, v5}, Lkkm;->t(Le5d;)V

    iput-boolean v3, p1, Lcom/opera/android/undo/UndoBar;->g:Z

    invoke-virtual {p1}, Lcom/opera/android/undo/UndoBar;->f()V

    :cond_a3
    iget-object p0, v0, Lmhk;->c:Ljava/lang/Object;

    check-cast p0, Ljava/util/LinkedList;

    invoke-virtual {p0}, Ljava/util/LinkedList;->size()I

    move-result v0

    if-lez v0, :cond_b5

    sub-int/2addr v0, v4

    invoke-virtual {p0, v0}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lmkm;

    goto :goto_b6

    :cond_b5
    move-object p0, v2

    :goto_b6
    if-nez p0, :cond_c6

    iget-object p0, p1, Lcom/opera/android/undo/UndoBar;->b:Lami;

    iget-object p1, p0, Lami;->c:Ljava/lang/Object;

    check-cast p1, Lgtj;

    if-eqz p1, :cond_c9

    invoke-virtual {p1}, Lgtj;->a()V

    iput-object v2, p0, Lami;->c:Ljava/lang/Object;

    goto :goto_c9

    :cond_c6
    invoke-virtual {p1, p0}, Lcom/opera/android/undo/UndoBar;->b(Lmkm;)V

    :cond_c9
    :goto_c9
    return-void

    :pswitch_ca
    new-instance p1, Lvyl;

    invoke-direct {p1}, Lvyl;-><init>()V

    const/16 v0, 0x1003

    invoke-static {p1, v0}, Lzhj;->a(Lryl;I)Lzhj;

    move-result-object p1

    check-cast p0, Lwyl;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {p1, p0}, Lzhj;->c(Landroid/content/Context;)V

    return-void

    :pswitch_df
    check-cast p0, Landroidx/media3/ui/TrackSelectionView;

    sget v0, Landroidx/media3/ui/TrackSelectionView;->e:I

    iget-object v0, p0, Landroidx/media3/ui/TrackSelectionView;->b:Landroid/widget/CheckedTextView;

    iget-object v1, p0, Landroidx/media3/ui/TrackSelectionView;->c:Ljava/util/HashMap;

    iget-object v5, p0, Landroidx/media3/ui/TrackSelectionView;->a:Landroid/widget/CheckedTextView;

    if-ne p1, v5, :cond_f1

    iput-boolean v4, p0, Landroidx/media3/ui/TrackSelectionView;->d:Z

    invoke-virtual {v1}, Ljava/util/HashMap;->clear()V

    goto :goto_f8

    :cond_f1
    if-ne p1, v0, :cond_10c

    iput-boolean v3, p0, Landroidx/media3/ui/TrackSelectionView;->d:Z

    invoke-virtual {v1}, Ljava/util/HashMap;->clear()V

    :goto_f8
    iget-boolean p1, p0, Landroidx/media3/ui/TrackSelectionView;->d:Z

    invoke-virtual {v5, p1}, Landroid/widget/CheckedTextView;->setChecked(Z)V

    iget-boolean p0, p0, Landroidx/media3/ui/TrackSelectionView;->d:Z

    if-nez p0, :cond_108

    invoke-virtual {v1}, Ljava/util/HashMap;->isEmpty()Z

    move-result p0

    if-eqz p0, :cond_108

    move v3, v4

    :cond_108
    invoke-virtual {v0, v3}, Landroid/widget/CheckedTextView;->setChecked(Z)V

    throw v2

    :cond_10c
    iput-boolean v3, p0, Landroidx/media3/ui/TrackSelectionView;->d:Z

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p0, Ljava/lang/ClassCastException;

    invoke-direct {p0}, Ljava/lang/ClassCastException;-><init>()V

    throw p0

    :pswitch_11b
    check-cast p0, Lltl;

    invoke-virtual {p0, v3}, Lk24;->l0(Z)V

    return-void

    :pswitch_121
    check-cast p0, Landroidx/appcompat/widget/Toolbar;

    iget-object p0, p0, Landroidx/appcompat/widget/Toolbar;->L:Lqsl;

    if-eqz p0, :cond_129

    iget-object v2, p0, Lqsl;->b:Lptd;

    :cond_129
    if-eqz v2, :cond_12e

    invoke-virtual {v2}, Lptd;->collapseActionView()Z

    :cond_12e
    return-void

    :pswitch_12f
    sput-boolean v4, Lsjh;->q:Z

    check-cast p0, Llel;

    iget-object p0, p0, Llel;->d:Lcom/opera/android/browser/OperaPageRootView;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    const-string p1, "Load a page or block an ad to show Rate Us"

    invoke-static {p0, p1, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    return-void

    :pswitch_143
    check-cast p0, Luyk;

    iget-object p0, p0, Luyk;->e:Lvyk;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const v0, 0x7f0a0b24

    invoke-virtual {p1, v0}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/opera/android/sync/SyncedSessionTab;

    iget-object v0, p1, Lcom/opera/android/sync/SyncedSessionTab;->d:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_15d

    iget-object v0, p1, Lcom/opera/android/sync/SyncedSessionTab;->c:Ljava/lang/String;

    :cond_15d
    sget-object p1, Llqm;->h:Llqm;

    invoke-static {v0, p1, v3}, Lay3;->a(Ljava/lang/String;Llqm;Z)Lvx3;

    move-result-object p1

    const/4 v0, 0x3

    iput v0, p1, Lvx3;->b:I

    iput v4, p1, Lvx3;->c:I

    new-instance v0, Lay3;

    invoke-direct {v0, p1}, Lay3;-><init>(Lvx3;)V

    invoke-static {v0}, Lac8;->a(Ljava/lang/Object;)V

    invoke-virtual {p0}, Lryl;->g0()V

    return-void

    :pswitch_174
    check-cast p0, Landroidx/mediarouter/app/g;

    iget-object p1, p0, Landroidx/mediarouter/app/e;->b:Lcod;

    invoke-virtual {p0, p1}, Landroidx/mediarouter/app/g;->X(Lcod;)Z

    move-result p1

    xor-int/lit8 v0, p1, 0x1

    iget-object v2, p0, Landroidx/mediarouter/app/e;->b:Lcod;

    invoke-virtual {v2}, Lcod;->e()Z

    move-result v2

    iget-object v5, p0, Landroidx/mediarouter/app/g;->o:Lnnd;

    const-string v6, "route must not be null"

    const-string v7, "There is no currently selected dynamic group route."

    if-nez p1, :cond_1f4

    iget-object v8, v5, Lnnd;->j:Lond;

    iget-object v8, v8, Lond;->g:Ldod;

    iget-object v9, p0, Landroidx/mediarouter/app/e;->b:Lcod;

    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-eqz v9, :cond_1ef

    invoke-static {}, Ldod;->b()V

    invoke-static {}, Ldod;->c()Lez9;

    move-result-object v6

    iget-object v8, v6, Lez9;->d:Lcod;

    invoke-virtual {v8}, Lcod;->a()Lynd;

    move-result-object v8

    if-eqz v8, :cond_267

    invoke-virtual {v8, v9}, Lynd;->o(Lcod;)Z

    move-result v10

    if-nez v10, :cond_1b1

    invoke-virtual {v9}, Lcod;->toString()Ljava/lang/String;

    goto/16 :goto_267

    :cond_1b1
    iget-object v10, v8, Lcod;->v:Ljava/util/ArrayList;

    invoke-static {v10}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v10

    invoke-interface {v10, v9}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_1c2

    invoke-virtual {v9}, Lcod;->toString()Ljava/lang/String;

    goto/16 :goto_267

    :cond_1c2
    invoke-virtual {v8}, Lcod;->g()Z

    move-result v10

    if-eqz v10, :cond_1dc

    iget-object v6, v6, Lez9;->e:Lsnd;

    instance-of v8, v6, Lrnd;

    if-eqz v8, :cond_1d7

    check-cast v6, Lrnd;

    iget-object v7, v9, Lcod;->b:Ljava/lang/String;

    invoke-virtual {v6, v7}, Lrnd;->m(Ljava/lang/String;)V

    goto/16 :goto_267

    :cond_1d7
    invoke-static {v7}, Lqp2;->n(Ljava/lang/String;)V

    goto/16 :goto_325

    :cond_1dc
    invoke-virtual {v8}, Lynd;->n()Z

    move-result v7

    if-eqz v7, :cond_1ea

    invoke-virtual {v6}, Lez9;->f()V

    invoke-virtual {v8}, Lcod;->toString()Ljava/lang/String;

    goto/16 :goto_267

    :cond_1ea
    invoke-virtual {v8}, Lcod;->toString()Ljava/lang/String;

    goto/16 :goto_267

    :cond_1ef
    invoke-static {v6}, Lt3p;->q(Ljava/lang/String;)V

    goto/16 :goto_325

    :cond_1f4
    iget-object v8, v5, Lnnd;->j:Lond;

    iget-object v8, v8, Lond;->g:Ldod;

    iget-object v9, p0, Landroidx/mediarouter/app/e;->b:Lcod;

    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-eqz v9, :cond_322

    invoke-static {}, Ldod;->b()V

    invoke-static {}, Ldod;->c()Lez9;

    move-result-object v6

    iget-object v8, v6, Lez9;->d:Lcod;

    invoke-virtual {v8}, Lcod;->a()Lynd;

    move-result-object v8

    if-eqz v8, :cond_267

    iget-object v10, v8, Lynd;->x:Landroidx/collection/ArrayMap;

    iget-object v11, v9, Lcod;->c:Ljava/lang/String;

    invoke-virtual {v10, v11}, Lhkj;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lqnd;

    if-eqz v10, :cond_264

    iget-boolean v10, v10, Lqnd;->c:Z

    if-eqz v10, :cond_264

    iget-object v10, v8, Lcod;->v:Ljava/util/ArrayList;

    invoke-static {v10}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v10

    invoke-interface {v10, v9}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_22e

    invoke-virtual {v9}, Lcod;->toString()Ljava/lang/String;

    goto :goto_267

    :cond_22e
    iget-object v10, v8, Lcod;->v:Ljava/util/ArrayList;

    invoke-static {v10}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v10

    invoke-interface {v10}, Ljava/util/List;->size()I

    move-result v10

    if-le v10, v4, :cond_267

    invoke-virtual {v8}, Lcod;->g()Z

    move-result v10

    if-eqz v10, :cond_253

    iget-object v6, v6, Lez9;->e:Lsnd;

    instance-of v8, v6, Lrnd;

    if-eqz v8, :cond_24e

    check-cast v6, Lrnd;

    iget-object v7, v9, Lcod;->b:Ljava/lang/String;

    invoke-virtual {v6, v7}, Lrnd;->n(Ljava/lang/String;)V

    goto :goto_267

    :cond_24e
    invoke-static {v7}, Lqp2;->n(Ljava/lang/String;)V

    goto/16 :goto_325

    :cond_253
    invoke-virtual {v8}, Lynd;->n()Z

    move-result v7

    if-eqz v7, :cond_260

    invoke-virtual {v6}, Lez9;->f()V

    invoke-virtual {v8}, Lcod;->toString()Ljava/lang/String;

    goto :goto_267

    :cond_260
    invoke-virtual {v8}, Lcod;->toString()Ljava/lang/String;

    goto :goto_267

    :cond_264
    invoke-virtual {v9}, Lcod;->toString()Ljava/lang/String;

    :cond_267
    :goto_267
    xor-int/lit8 v6, v2, 0x1

    invoke-virtual {p0, v0, v6}, Landroidx/mediarouter/app/g;->Y(ZZ)V

    if-eqz v2, :cond_2ac

    iget-object v2, v5, Lnnd;->j:Lond;

    iget-object v2, v2, Lond;->j:Lcod;

    iget-object v2, v2, Lcod;->v:Ljava/util/ArrayList;

    invoke-static {v2}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v2

    iget-object v6, p0, Landroidx/mediarouter/app/e;->b:Lcod;

    iget-object v6, v6, Lcod;->v:Ljava/util/ArrayList;

    invoke-static {v6}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_284
    :goto_284
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_2ac

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcod;

    invoke-interface {v2, v7}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v8

    if-eq v8, v0, :cond_284

    iget-object v8, v5, Lnnd;->j:Lond;

    iget-object v8, v8, Lond;->w:Ljava/util/HashMap;

    iget-object v7, v7, Lcod;->c:Ljava/lang/String;

    invoke-virtual {v8, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroidx/mediarouter/app/e;

    instance-of v8, v7, Landroidx/mediarouter/app/g;

    if-eqz v8, :cond_284

    check-cast v7, Landroidx/mediarouter/app/g;

    invoke-virtual {v7, v0, v4}, Landroidx/mediarouter/app/g;->Y(ZZ)V

    goto :goto_284

    :cond_2ac
    iget-object v2, v5, Lnnd;->j:Lond;

    iget-object p0, p0, Landroidx/mediarouter/app/e;->b:Lcod;

    iget-object v6, v2, Lond;->j:Lcod;

    iget-object v6, v6, Lcod;->v:Ljava/util/ArrayList;

    invoke-static {v6}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v7

    invoke-static {v4, v7}, Ljava/lang/Math;->max(II)I

    move-result v7

    invoke-virtual {p0}, Lcod;->e()Z

    move-result v8

    const/4 v9, -0x1

    if-eqz v8, :cond_2ea

    iget-object p0, p0, Lcod;->v:Ljava/util/ArrayList;

    invoke-static {p0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_2d1
    :goto_2d1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_2ee

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcod;

    invoke-interface {v6, v8}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v8

    if-eq v8, v0, :cond_2d1

    if-nez p1, :cond_2e7

    move v8, v4

    goto :goto_2e8

    :cond_2e7
    move v8, v9

    :goto_2e8
    add-int/2addr v7, v8

    goto :goto_2d1

    :cond_2ea
    if-nez p1, :cond_2ed

    move v9, v4

    :cond_2ed
    add-int/2addr v7, v9

    :cond_2ee
    iget-boolean p0, v2, Lond;->T:Z

    if-eqz p0, :cond_302

    iget-object p0, v2, Lond;->j:Lcod;

    iget-object p0, p0, Lcod;->v:Ljava/util/ArrayList;

    invoke-static {p0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p0

    if-le p0, v4, :cond_302

    move p0, v4

    goto :goto_303

    :cond_302
    move p0, v3

    :goto_303
    iget-boolean p1, v2, Lond;->T:Z

    if-eqz p1, :cond_309

    if-ge v7, v1, :cond_30a

    :cond_309
    move v4, v3

    :cond_30a
    if-eq p0, v4, :cond_325

    iget-object p0, v2, Lond;->t:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p0, v3}, Landroidx/recyclerview/widget/RecyclerView;->M(I)Landroidx/recyclerview/widget/i;

    move-result-object p0

    instance-of p1, p0, Landroidx/mediarouter/app/f;

    if-eqz p1, :cond_325

    check-cast p0, Landroidx/mediarouter/app/f;

    iget-object p1, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    if-eqz v4, :cond_31e

    iget v3, p0, Landroidx/mediarouter/app/f;->g:I

    :cond_31e
    invoke-virtual {v5, v3, p1}, Lnnd;->G(ILandroid/view/View;)V

    goto :goto_325

    :cond_322
    invoke-static {v6}, Lt3p;->q(Ljava/lang/String;)V

    :cond_325
    :goto_325
    return-void

    :pswitch_326
    check-cast p0, Lldd;

    iget p1, p0, Lldd;->e:I

    if-ne p1, v1, :cond_330

    invoke-virtual {p0, v4}, Lldd;->i0(I)V

    goto :goto_335

    :cond_330
    if-ne p1, v4, :cond_335

    invoke-virtual {p0, v1}, Lldd;->i0(I)V

    :cond_335
    :goto_335
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getView()Landroid/view/View;

    move-result-object p1

    invoke-virtual {p0, p1}, Lldd;->j0(Landroid/view/View;)V

    return-void

    :pswitch_33d
    check-cast p0, Lcom/opera/ad/mraid/MRAIDView;

    invoke-virtual {p0}, Lcom/opera/ad/mraid/MRAIDView;->close()V

    return-void

    :pswitch_343
    invoke-virtual {p1}, Landroid/view/View;->getAlpha()F

    move-result v0

    const/high16 v1, 0x3f800000    # 1.0f

    cmpg-float v0, v0, v1

    if-nez v0, :cond_352

    check-cast p0, Landroid/view/View$OnClickListener;

    invoke-interface {p0, p1}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    :cond_352
    return-void

    :pswitch_353
    check-cast p0, Lcom/opera/android/bar/FindInPage;

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    const v0, 0x7f0a0492

    if-ne p1, v0, :cond_362

    invoke-virtual {p0}, Lcom/opera/android/bar/FindInPage;->f()V

    goto :goto_395

    :cond_362
    const v0, 0x7f0a049a

    if-ne p1, v0, :cond_37c

    iput-boolean v3, p0, Lcom/opera/android/bar/FindInPage;->g:Z

    iget-object p0, p0, Lcom/opera/android/bar/FindInPage;->d:Lzg;

    iget-object p1, p0, Lzg;->c:Ljava/lang/Object;

    check-cast p1, Ljava/lang/String;

    iput-object p1, p0, Lzg;->c:Ljava/lang/Object;

    iget-object v0, p0, Lzg;->b:Ljava/lang/Object;

    check-cast v0, Lorg/chromium/content_public/browser/WebContents;

    invoke-static {v0, p1, v3, v4}, LJ/N;->MaMXv1PI(Ljava/lang/Object;Ljava/lang/Object;ZZ)I

    move-result p1

    iput p1, p0, Lzg;->a:I

    goto :goto_395

    :cond_37c
    const v0, 0x7f0a0499

    if-ne p1, v0, :cond_395

    iput-boolean v3, p0, Lcom/opera/android/bar/FindInPage;->g:Z

    iget-object p0, p0, Lcom/opera/android/bar/FindInPage;->d:Lzg;

    iget-object p1, p0, Lzg;->c:Ljava/lang/Object;

    check-cast p1, Ljava/lang/String;

    iput-object p1, p0, Lzg;->c:Ljava/lang/Object;

    iget-object v0, p0, Lzg;->b:Ljava/lang/Object;

    check-cast v0, Lorg/chromium/content_public/browser/WebContents;

    invoke-static {v0, p1, v4, v4}, LJ/N;->MaMXv1PI(Ljava/lang/Object;Ljava/lang/Object;ZZ)I

    move-result p1

    iput p1, p0, Lzg;->a:I

    :cond_395
    :goto_395
    return-void

    :pswitch_396
    check-cast p0, Lar8;

    invoke-virtual {p0}, Lar8;->o0()V

    return-void

    :pswitch_39c
    check-cast p0, Ltq3;

    iget-boolean p1, p0, Ltq3;->k:Z

    if-eqz p1, :cond_3cd

    invoke-virtual {p0}, Landroid/app/Dialog;->isShowing()Z

    move-result p1

    if-eqz p1, :cond_3cd

    iget-boolean p1, p0, Ltq3;->m:Z

    if-nez p1, :cond_3c6

    invoke-virtual {p0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object p1

    const v0, 0x101035b

    filled-new-array {v0}, [I

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/content/Context;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    move-result-object p1

    invoke-virtual {p1, v3, v4}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v0

    iput-boolean v0, p0, Ltq3;->l:Z

    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    iput-boolean v4, p0, Ltq3;->m:Z

    :cond_3c6
    iget-boolean p1, p0, Ltq3;->l:Z

    if-eqz p1, :cond_3cd

    invoke-virtual {p0}, Ltq3;->cancel()V

    :cond_3cd
    return-void

    :pswitch_3ce
    check-cast p0, Lpj2;

    invoke-virtual {p0, v4}, Lpj2;->G0(Z)V

    new-instance p1, Lvzk;

    new-instance v0, Lole;

    invoke-direct {v0, p0}, Lole;-><init>(Ljava/lang/Object;)V

    invoke-direct {p1, v0}, Lvzk;-><init>(Ltif;)V

    iget-object v0, p0, Lpj2;->w:Ljava/lang/String;

    iget-object v1, p0, Lpj2;->s:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lpj2;->t:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    iget-object p0, p0, Lpj2;->x:Ljava/lang/String;

    new-instance v3, Ltvh;

    invoke-direct {v3}, Ltvh;-><init>()V

    invoke-static {}, Ldgh;->h()Landroid/net/Uri;

    move-result-object v4

    invoke-virtual {v4}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v4

    const/16 v5, 0x9

    invoke-static {v5}, Lvep;->h(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/net/Uri$Builder;->appendEncodedPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v4

    invoke-virtual {v4}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v4

    invoke-virtual {v4}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v4

    iput-object v4, v3, Ltvh;->a:Ljava/lang/String;

    new-instance v4, Llyf;

    const-string v5, "token"

    invoke-direct {v4, v5, v0}, Llyf;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    iget-object v0, v3, Ltvh;->c:Ljava/util/ArrayList;

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v4, Llyf;

    const-string v5, "fullname"

    invoke-direct {v4, v5, v1}, Llyf;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Llyf;

    const-string v4, "email"

    invoke-direct {v1, v4, v2}, Llyf;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p1, v3, p0}, Lvzk;->a0(Ltvh;Ljava/lang/String;)V

    return-void

    :pswitch_43a
    check-cast p0, Lzy0;

    iget-object v0, p0, Lzy0;->k:Landroid/widget/Button;

    if-ne p1, v0, :cond_449

    iget-object v0, p0, Lzy0;->m:Landroid/os/Message;

    if-eqz v0, :cond_449

    invoke-static {v0}, Landroid/os/Message;->obtain(Landroid/os/Message;)Landroid/os/Message;

    move-result-object v2

    goto :goto_462

    :cond_449
    iget-object v0, p0, Lzy0;->o:Landroid/widget/Button;

    if-ne p1, v0, :cond_456

    iget-object v0, p0, Lzy0;->q:Landroid/os/Message;

    if-eqz v0, :cond_456

    invoke-static {v0}, Landroid/os/Message;->obtain(Landroid/os/Message;)Landroid/os/Message;

    move-result-object v2

    goto :goto_462

    :cond_456
    iget-object v0, p0, Lzy0;->s:Landroid/widget/Button;

    if-ne p1, v0, :cond_462

    iget-object p1, p0, Lzy0;->u:Landroid/os/Message;

    if-eqz p1, :cond_462

    invoke-static {p1}, Landroid/os/Message;->obtain(Landroid/os/Message;)Landroid/os/Message;

    move-result-object v2

    :cond_462
    :goto_462
    if-eqz v2, :cond_467

    invoke-virtual {v2}, Landroid/os/Message;->sendToTarget()V

    :cond_467
    iget-object p1, p0, Lzy0;->J:Lxy0;

    iget-object p0, p0, Lzy0;->b:Lbz0;

    invoke-virtual {p1, v4, p0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object p0

    invoke-virtual {p0}, Landroid/os/Message;->sendToTarget()V

    return-void

    :pswitch_473
    check-cast p0, Lse;

    invoke-virtual {p0}, Lse;->a()V

    return-void

    nop

    :pswitch_data_47a
    .packed-switch 0x0
        :pswitch_473
        :pswitch_43a
        :pswitch_3ce
        :pswitch_39c
        :pswitch_396
        :pswitch_353
        :pswitch_343
        :pswitch_33d
        :pswitch_326
        :pswitch_174
        :pswitch_143
        :pswitch_12f
        :pswitch_121
        :pswitch_11b
        :pswitch_df
        :pswitch_ca
        :pswitch_22
    .end packed-switch
.end method
