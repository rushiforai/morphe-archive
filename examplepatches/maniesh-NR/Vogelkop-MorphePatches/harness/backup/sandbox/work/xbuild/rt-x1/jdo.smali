.class public final Ljdo;
.super Llj;
.source "SourceFile"

# interfaces
.implements Ljvk;
.implements Lkkm;
.implements Llkm;


# instance fields
.field public final r:Lcom/opera/android/settings/SettingsManager;

.field public final s:Llw3;

.field public t:Landroid/view/MenuItem;

.field public u:Landroidx/appcompat/widget/SearchView;

.field public v:Ld83;

.field public w:Lcom/opera/android/undo/UndoBar;

.field public final x:Lmvk;


# direct methods
.method public constructor <init>(Lcom/opera/android/settings/SettingsManager;Llw3;)V
    .registers 5

    const v0, 0x7f1415b8

    const v1, 0x7f10003b

    invoke-direct {p0, v0, v1}, Llj;-><init>(II)V

    iput-object p1, p0, Ljdo;->r:Lcom/opera/android/settings/SettingsManager;

    iput-object p2, p0, Ljdo;->s:Llw3;

    const p1, 0x7f14056b

    invoke-static {p1}, Lnvk;->v(I)Lmvk;

    move-result-object p1

    iput-object p1, p0, Ljdo;->x:Lmvk;

    return-void
.end method


# virtual methods
.method public final G0(Lcom/opera/android/browser/chromium/OperaBrowserContextHandle;DLjava/lang/String;)V
    .registers 6

    const-string v0, "%reader_mode%"

    invoke-static {p4, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_19

    iget-object p0, p0, Ljdo;->r:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string p1, "reader_mode_zoom_level"

    const/4 p2, -0x1

    invoke-virtual {p0, p2, p1}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    const-string p1, "reader_mode_text_wrap"

    invoke-virtual {p0, p2, p1}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    return-void

    :cond_19
    invoke-static {p4}, Lcom/opera/android/browser/BrowserUtils;->getHostString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0, p2, p3}, LJ/N;->MvtzH5Ni(Ljava/lang/Object;Ljava/lang/Object;D)V

    invoke-static {p4}, LJ/N;->M3MkeCX1(Ljava/lang/Object;)V

    return-void
.end method

.method public final H0()V
    .registers 4

    iget-object v0, p0, Ljdo;->v:Ld83;

    if-nez v0, :cond_5

    const/4 v0, 0x0

    :cond_5
    iget-object v1, v0, Ld83;->c:Ljava/util/List;

    check-cast v1, Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    iget-object v0, v0, Ld83;->e:Ljava/lang/Object;

    check-cast v0, Ljava/util/TreeSet;

    invoke-virtual {v0}, Ljava/util/TreeSet;->size()I

    move-result v0

    const/4 v2, 0x1

    if-ne v1, v0, :cond_1a

    move v0, v2

    goto :goto_1b

    :cond_1a
    const/4 v0, 0x0

    :goto_1b
    xor-int/2addr v0, v2

    const v1, 0x7f0a0932

    invoke-virtual {p0, v1}, Lltl;->r0(I)Landroid/view/MenuItem;

    move-result-object v1

    if-eqz v1, :cond_28

    invoke-interface {v1, v0}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    :cond_28
    const v1, 0x7f0a02cb

    invoke-virtual {p0, v1}, Lltl;->r0(I)Landroid/view/MenuItem;

    move-result-object p0

    if-eqz p0, :cond_34

    invoke-interface {p0, v0}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    :cond_34
    return-void
.end method

.method public final N(Ljava/util/List;)Le5d;
    .registers 5

    check-cast p1, Ljava/lang/Iterable;

    new-instance p0, Ljava/util/ArrayList;

    const/16 v0, 0xa

    invoke-static {p1, v0}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v0

    invoke-direct {p0, v0}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_11
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_27

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    new-instance v1, Lguh;

    const/4 v2, -0x1

    invoke-direct {v1, v0, v2}, Lguh;-><init>(Ljava/lang/Object;I)V

    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_11

    :cond_27
    new-instance p1, Le5d;

    sget-object v0, Ll08;->a:Ll08;

    const/4 v1, 0x2

    invoke-direct {p1, p0, v0, v1}, Le5d;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    return-object p1
.end method

.method public final O(Ll46;)V
    .registers 2

    return-void
.end method

.method public final R(Ljava/util/ArrayList;)V
    .registers 9

    invoke-static {}, LJ/N;->M4QvXpDD()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/opera/android/browser/chromium/OperaBrowserContextHandle;

    invoke-static {v0}, LJ/N;->MNitnPWj(Ljava/lang/Object;)D

    move-result-wide v1

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v3

    const/4 v4, 0x0

    move v5, v4

    :goto_10
    if-ge v5, v3, :cond_1e

    invoke-virtual {p1, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    add-int/lit8 v5, v5, 0x1

    check-cast v6, Ljava/lang/String;

    invoke-virtual {p0, v0, v1, v2, v6}, Ljdo;->G0(Lcom/opera/android/browser/chromium/OperaBrowserContextHandle;DLjava/lang/String;)V

    goto :goto_10

    :cond_1e
    iget-object v0, p0, Ljdo;->v:Ld83;

    if-nez v0, :cond_23

    const/4 v0, 0x0

    :cond_23
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v1

    :goto_2a
    if-ge v4, v1, :cond_58

    invoke-virtual {p1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v4, v4, 0x1

    check-cast v2, Ljava/lang/String;

    iget-object v3, v0, Ld83;->c:Ljava/util/List;

    check-cast v3, Ljava/util/ArrayList;

    new-instance v5, Lu5f;

    const/16 v6, 0xf

    invoke-direct {v5, v2, v6}, Lu5f;-><init>(Ljava/lang/String;B)V

    invoke-static {v3, v5}, Lo95;->v(Ljava/util/List;Lkotlin/jvm/functions/Function1;)V

    iget-object v3, v0, Ld83;->d:Ljava/lang/Object;

    check-cast v3, Ljava/util/ArrayList;

    new-instance v5, Lu5f;

    const/16 v6, 0x10

    invoke-direct {v5, v2, v6}, Lu5f;-><init>(Ljava/lang/String;B)V

    invoke-static {v3, v5}, Lo95;->v(Ljava/util/List;Lkotlin/jvm/functions/Function1;)V

    iget-object v3, v0, Ld83;->e:Ljava/lang/Object;

    check-cast v3, Ljava/util/TreeSet;

    invoke-virtual {v3, v2}, Ljava/util/TreeSet;->remove(Ljava/lang/Object;)Z

    goto :goto_2a

    :cond_58
    iget-object p0, p0, Ljdo;->r:Lcom/opera/android/settings/SettingsManager;

    const-string p1, "text_wrap"

    invoke-virtual {p0, p1}, Lcom/opera/android/settings/SettingsManager;->Q(Ljava/lang/String;)V

    return-void
.end method

.method public final h(Landroidx/recyclerview/widget/i;[Lhvk;)V
    .registers 3

    const/4 p1, 0x0

    iget-object p0, p0, Ljdo;->x:Lmvk;

    aput-object p0, p2, p1

    const/4 p1, 0x1

    aput-object p0, p2, p1

    return-void
.end method

.method public final k(Landroidx/recyclerview/widget/i;Lhvk;)V
    .registers 4

    check-cast p1, Lmdo;

    iget-object p1, p1, Lmdo;->c:Ljava/lang/String;

    if-eqz p1, :cond_2a

    iget-object p0, p0, Ljdo;->v:Ld83;

    if-nez p0, :cond_b

    const/4 p0, 0x0

    :cond_b
    iget-object p2, p0, Ld83;->b:Ljava/lang/Object;

    check-cast p2, Lcom/opera/android/undo/UndoBar;

    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {p2, v0}, Lcom/opera/android/undo/UndoBar;->c(Ljava/util/List;)V

    iget-object p2, p0, Ld83;->e:Ljava/lang/Object;

    check-cast p2, Ljava/util/TreeSet;

    invoke-virtual {p2, p1}, Ljava/util/TreeSet;->add(Ljava/lang/Object;)Z

    new-instance p1, Lc83;

    const/4 p2, 0x4

    invoke-direct {p1, p0, p2}, Lc83;-><init>(Landroidx/recyclerview/widget/d;B)V

    iget-object p0, p0, Ld83;->f:Ljava/lang/Object;

    check-cast p0, Ljava/lang/CharSequence;

    invoke-virtual {p1, p0}, Landroid/widget/Filter;->filter(Ljava/lang/CharSequence;)V

    :cond_2a
    return-void
.end method

.method public final l0(Z)V
    .registers 4

    iget-object v0, p0, Ljdo;->t:Landroid/view/MenuItem;

    const/4 v1, 0x1

    if-eqz v0, :cond_13

    invoke-interface {v0}, Landroid/view/MenuItem;->isActionViewExpanded()Z

    move-result v0

    if-ne v0, v1, :cond_13

    iget-object p0, p0, Ljdo;->t:Landroid/view/MenuItem;

    if-eqz p0, :cond_12

    invoke-interface {p0}, Landroid/view/MenuItem;->collapseActionView()Z

    :cond_12
    return-void

    :cond_13
    iget-object v0, p0, Ljdo;->w:Lcom/opera/android/undo/UndoBar;

    if-nez v0, :cond_18

    const/4 v0, 0x0

    :cond_18
    invoke-virtual {v0, v1}, Lcom/opera/android/undo/UndoBar;->a(Z)V

    invoke-super {p0, p1}, Lk24;->l0(Z)V

    return-void
.end method

.method public final n(Landroidx/recyclerview/widget/i;)Z
    .registers 2

    const/4 p0, 0x1

    return p0
.end method

.method public final onMenuItemClick(Landroid/view/MenuItem;)Z
    .registers 6

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p1

    const v0, 0x7f0a02cb

    const/4 v1, 0x1

    if-ne p1, v0, :cond_1f

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object p1

    new-instance v0, Lsk;

    const/16 v2, 0xe

    invoke-direct {v0, p0, v2}, Lsk;-><init>(Ljava/lang/Object;B)V

    const/4 p0, 0x0

    const v2, 0x7f140e9e

    const v3, 0x7f140e9f

    invoke-static {p1, p0, v2, v3, v0}, Lg25;->b(Landroid/content/Context;IIILandroid/content/DialogInterface$OnClickListener;)Lg25;

    :cond_1f
    return v1
.end method

.method public final t(Le5d;)V
    .registers 4

    iget-object p0, p0, Ljdo;->v:Ld83;

    if-nez p0, :cond_5

    const/4 p0, 0x0

    :cond_5
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Le5d;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_c
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_22

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lguh;

    iget-object v1, p0, Ld83;->e:Ljava/lang/Object;

    check-cast v1, Ljava/util/TreeSet;

    iget-object v0, v0, Lguh;->a:Ljava/lang/Object;

    invoke-virtual {v1, v0}, Ljava/util/TreeSet;->remove(Ljava/lang/Object;)Z

    goto :goto_c

    :cond_22
    new-instance p1, Lc83;

    const/4 v0, 0x4

    invoke-direct {p1, p0, v0}, Lc83;-><init>(Landroidx/recyclerview/widget/d;B)V

    iget-object p0, p0, Ld83;->f:Ljava/lang/Object;

    check-cast p0, Ljava/lang/CharSequence;

    invoke-virtual {p1, p0}, Landroid/widget/Filter;->filter(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public final v0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)V
    .registers 26

    move-object/from16 v3, p0

    move-object/from16 v6, p2

    new-instance v0, Lcom/opera/android/undo/UndoBar;

    invoke-virtual {v3}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object v1

    iget-object v2, v3, Lltl;->n:Lqm9;

    const/4 v5, 0x1

    move-object/from16 v4, p0

    invoke-direct/range {v0 .. v5}, Lcom/opera/android/undo/UndoBar;-><init>(Landroid/app/Activity;Lvwh;Llkm;Lkkm;Z)V

    iput-object v0, v3, Ljdo;->w:Lcom/opera/android/undo/UndoBar;

    const v1, 0x7f120061

    invoke-virtual {v0, v1}, Lcom/opera/android/undo/UndoBar;->e(I)V

    new-instance v0, Ld83;

    invoke-static {}, LJ/N;->M4QvXpDD()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/opera/android/browser/chromium/OperaBrowserContextHandle;

    invoke-static {v1}, LJ/N;->MNitnPWj(Ljava/lang/Object;)D

    move-result-wide v1

    const-string v4, "text_wrap"

    iget-object v5, v3, Ljdo;->r:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v5, v4}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v4

    invoke-virtual {v5}, Lcom/opera/android/settings/SettingsManager;->getReaderModeZoomLevel()Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v5}, Lcom/opera/android/settings/SettingsManager;->getReaderModeTextWrap()Ljava/lang/Boolean;

    move-result-object v5

    invoke-static {}, LJ/N;->M9qRRZZC()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, [Ljava/lang/String;

    invoke-static {v8}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v8

    check-cast v8, Ljava/lang/Iterable;

    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v8}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :cond_4b
    :goto_4b
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    const/4 v11, 0x1

    const/4 v12, 0x0

    const/4 v13, 0x0

    if-eqz v10, :cond_ba

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    move-object v15, v10

    check-cast v15, Ljava/lang/String;

    invoke-static {v15}, LJ/N;->MO9jFwQ0(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Double;

    invoke-static {v15}, LJ/N;->MzJrTmZH(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/Boolean;

    if-nez v10, :cond_6e

    if-eqz v14, :cond_b4

    move-wide/from16 v21, v1

    goto :goto_74

    :cond_6e
    invoke-virtual {v10}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v16

    move-wide/from16 v21, v16

    :goto_74
    if-eqz v14, :cond_7d

    invoke-virtual {v14}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v10

    move/from16 v19, v10

    goto :goto_7f

    :cond_7d
    move/from16 v19, v4

    :goto_7f
    invoke-virtual {v3}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v20

    new-instance v14, Lldo;

    invoke-static {v15}, Lwqm;->G(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    const-string v13, "/"

    invoke-virtual {v10, v13}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_95

    invoke-static {v11, v12, v10}, Lp3p;->h(IILjava/lang/String;)Ljava/lang/String;

    move-result-object v10

    :cond_95
    move-object/from16 v16, v10

    const-wide v10, 0x3ff3333340000000L    # 1.2000000476837158

    move-wide/from16 v12, v21

    invoke-static {v10, v11, v12, v13}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v10

    const-wide/high16 v12, 0x4059000000000000L    # 100.0

    mul-double/2addr v10, v12

    const-wide/high16 v12, 0x4014000000000000L    # 5.0

    div-double/2addr v10, v12

    invoke-static {v10, v11}, Lzed;->a(D)I

    move-result v10

    mul-int/lit8 v18, v10, 0x5

    move-object/from16 v17, v15

    invoke-direct/range {v14 .. v20}, Lldo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IZLandroid/content/Context;)V

    move-object v13, v14

    :cond_b4
    if-eqz v13, :cond_4b

    invoke-virtual {v9, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_4b

    :cond_ba
    if-nez v7, :cond_cd

    if-eqz v5, :cond_f6

    iget-object v1, v3, Ljdo;->s:Llw3;

    invoke-virtual {v1}, Llw3;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lbxk;

    invoke-virtual {v1}, Lbxk;->g()I

    move-result v1

    :goto_ca
    move/from16 v18, v1

    goto :goto_d2

    :cond_cd
    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v1

    goto :goto_ca

    :goto_d2
    if-eqz v5, :cond_d8

    invoke-virtual {v5}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    :cond_d8
    move/from16 v19, v4

    invoke-virtual {v3}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v1

    new-instance v14, Lldo;

    const v2, 0x7f140da0

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v16

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v17

    const-string v15, "%reader_mode%"

    move-object/from16 v20, v1

    invoke-direct/range {v14 .. v20}, Lldo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IZLandroid/content/Context;)V

    invoke-static {v14, v9}, Lkotlin/collections/CollectionsKt;->W(Ljava/lang/Object;Ljava/util/Collection;)Ljava/util/ArrayList;

    move-result-object v9

    :cond_f6
    iget-object v1, v3, Ljdo;->w:Lcom/opera/android/undo/UndoBar;

    if-nez v1, :cond_fb

    move-object v1, v13

    :cond_fb
    invoke-direct {v0, v9, v1}, Ld83;-><init>(Ljava/util/ArrayList;Lcom/opera/android/undo/UndoBar;)V

    iput-object v0, v3, Ljdo;->v:Ld83;

    const v0, 0x7f0d049e

    move-object/from16 v1, p1

    invoke-virtual {v1, v0, v6, v12}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v6, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    const v1, 0x7f0a0837

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/opera/android/custom_views/EmptyListView;

    if-eqz v2, :cond_175

    const v1, 0x7f0a0d01

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/opera/android/custom_views/FadingRecyclerView;

    if-eqz v2, :cond_175

    const v1, 0x7f0a0d02

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/opera/android/widget/RecyclerViewEmptyViewSwitcher;

    if-eqz v4, :cond_175

    check-cast v0, Lcom/opera/android/custom_views/LayoutDirectionFrameLayout;

    new-instance v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-virtual {v3}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    invoke-direct {v0}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>()V

    invoke-virtual {v2, v0}, Landroidx/recyclerview/widget/RecyclerView;->C0(Landroidx/recyclerview/widget/f;)V

    iget-object v0, v3, Ljdo;->v:Ld83;

    if-nez v0, :cond_13f

    move-object v0, v13

    :cond_13f
    invoke-virtual {v2, v0}, Landroidx/recyclerview/widget/RecyclerView;->y0(Landroidx/recyclerview/widget/d;)V

    iget-object v0, v3, Ljdo;->v:Ld83;

    if-eqz v0, :cond_147

    move-object v13, v0

    :cond_147
    new-instance v0, Lf01;

    invoke-direct {v0, v4, v3}, Lf01;-><init>(Lcom/opera/android/widget/RecyclerViewEmptyViewSwitcher;Ljdo;)V

    invoke-virtual {v13, v0}, Landroidx/recyclerview/widget/d;->registerAdapterDataObserver(Lgph;)V

    new-instance v0, Lr2n;

    const/16 v1, 0x1b

    invoke-direct {v0, v3, v1}, Lr2n;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v4, v0}, Lcom/opera/android/widget/RecyclerViewEmptyViewSwitcher;->a(Lzph;)V

    new-instance v0, Lnvk;

    invoke-virtual {v3}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, v3}, Lnvk;-><init>(Landroid/content/Context;Ljvk;)V

    new-instance v1, Lflb;

    invoke-direct {v1, v0}, Lflb;-><init>(Lblb;)V

    invoke-virtual {v1, v2}, Lflb;->e(Landroidx/recyclerview/widget/RecyclerView;)V

    new-instance v0, Le01;

    invoke-direct {v0, v1, v11}, Le01;-><init>(Lflb;B)V

    iput-object v0, v4, Lcom/opera/android/widget/RecyclerViewEmptyViewSwitcher;->b:Ljava/lang/Runnable;

    invoke-virtual {v3}, Ljdo;->H0()V

    return-void

    :cond_175
    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    const-string v1, "Missing required view with ID: "

    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    return-void
.end method

.method public final x0(Litd;)V
    .registers 4

    const v0, 0x7f0a0932

    invoke-virtual {p1, v0}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object p1

    iput-object p1, p0, Ljdo;->t:Landroid/view/MenuItem;

    const/4 v0, 0x0

    if-eqz p1, :cond_11

    invoke-interface {p1}, Landroid/view/MenuItem;->getActionView()Landroid/view/View;

    move-result-object p1

    goto :goto_12

    :cond_11
    move-object p1, v0

    :goto_12
    instance-of v1, p1, Landroidx/appcompat/widget/SearchView;

    if-eqz v1, :cond_19

    move-object v0, p1

    check-cast v0, Landroidx/appcompat/widget/SearchView;

    :cond_19
    iput-object v0, p0, Ljdo;->u:Landroidx/appcompat/widget/SearchView;

    if-eqz v0, :cond_27

    const p1, 0x7f140082

    invoke-virtual {p0, p1}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroidx/appcompat/widget/SearchView;->setQueryHint(Ljava/lang/CharSequence;)V

    :cond_27
    iget-object p1, p0, Ljdo;->u:Landroidx/appcompat/widget/SearchView;

    if-eqz p1, :cond_33

    new-instance v0, Ldcl;

    invoke-direct {v0, p0}, Ldcl;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/SearchView;->setOnQueryTextListener(Lhti;)V

    :cond_33
    return-void
.end method
