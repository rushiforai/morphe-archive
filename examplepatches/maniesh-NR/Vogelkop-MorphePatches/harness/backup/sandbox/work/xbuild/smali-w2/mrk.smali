.class public final Lmrk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lfm8;


# instance fields
.field public final A:Lwih;

.field public final B:Lisd;

.field public final C:Lhqk;

.field public final D:Lrqk;

.field public final E:Lflb;

.field public final F:Lp8f;

.field public final G:Lrv7;

.field public final H:Lxpm;

.field public final I:Lirk;

.field public final J:Lcom/opera/android/suggestion/SuggestionManagerBridge;

.field public final K:Lj55;

.field public final L:Lqt8;

.field public final M:Ln3h;

.field public final N:Lzyk;

.field public final O:Lrn9;

.field public P:Lc1f;

.field public Q:Lpvb;

.field public R:Z

.field public S:Ljava/lang/Integer;

.field public T:Z

.field public U:Z

.field public V:Z

.field public final W:Lqt6;

.field public final a:Lpde;

.field public final b:Landroid/view/ViewGroup;

.field public final c:Lfbf;

.field public final d:Lnwf;

.field public final e:Lode;

.field public final f:Lumi;

.field public final g:Lcom/opera/android/settings/SettingsManager;

.field public final h:Liv7;

.field public final i:Lk6l;

.field public final j:Li53;

.field public final k:Lnr8;

.field public final l:Lx5f;

.field public final m:Lqdh;

.field public final n:Lyz9;

.field public final o:Lm0a;

.field public final p:Lhw3;

.field public final q:Lx77;

.field public final r:Lhw3;

.field public final s:Lot8;

.field public final t:Lisj;

.field public final u:Lfe5;

.field public final v:Ligi;

.field public w:Z

.field public final x:Lpde;

.field public final y:Lw6j;

.field public final z:Leyi;


# direct methods
.method public constructor <init>(Ltcc;Lj4c;Lpde;Landroid/view/ViewGroup;Lfbf;Lnwf;Lode;Lumi;Ldbf;Lcom/opera/android/settings/SettingsManager;Liv7;Lk6l;Li53;Lnr8;Lipk;Lwcd;Landroid/content/ClipboardManager;Lpde;Libf;Lx5f;Losf;Lx5f;Lm6m;Ls28;Lmdh;Lqdh;Lbr6;Lqr8;Lnv2;Lgjm;Lyz9;Lm0a;Lhw3;Lky1;Lysj;Ljv3;Lx77;Ljv3;Lzv3;Lcom/opera/android/Lazy;Lplh;Lhw3;Lot8;)V
    .registers 84

    move-object/from16 v2, p0

    move-object/from16 v8, p3

    move-object/from16 v11, p4

    move-object/from16 v14, p5

    move-object/from16 v9, p9

    move-object/from16 v10, p11

    move-object/from16 v0, p20

    move-object/from16 v1, p30

    move-object/from16 v3, p32

    move-object/from16 v4, p43

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    iput-object v8, v2, Lmrk;->a:Lpde;

    iput-object v11, v2, Lmrk;->b:Landroid/view/ViewGroup;

    iput-object v14, v2, Lmrk;->c:Lfbf;

    move-object/from16 v5, p6

    iput-object v5, v2, Lmrk;->d:Lnwf;

    move-object/from16 v5, p7

    iput-object v5, v2, Lmrk;->e:Lode;

    move-object/from16 v6, p8

    iput-object v6, v2, Lmrk;->f:Lumi;

    move-object/from16 v7, p10

    iput-object v7, v2, Lmrk;->g:Lcom/opera/android/settings/SettingsManager;

    iput-object v10, v2, Lmrk;->h:Liv7;

    move-object/from16 v12, p12

    iput-object v12, v2, Lmrk;->i:Lk6l;

    move-object/from16 v12, p13

    iput-object v12, v2, Lmrk;->j:Li53;

    move-object/from16 v12, p14

    iput-object v12, v2, Lmrk;->k:Lnr8;

    iput-object v0, v2, Lmrk;->l:Lx5f;

    move-object/from16 v12, p26

    iput-object v12, v2, Lmrk;->m:Lqdh;

    move-object/from16 v13, p31

    iput-object v13, v2, Lmrk;->n:Lyz9;

    iput-object v3, v2, Lmrk;->o:Lm0a;

    move-object/from16 v13, p33

    iput-object v13, v2, Lmrk;->p:Lhw3;

    move-object/from16 v15, p37

    iput-object v15, v2, Lmrk;->q:Lx77;

    move-object/from16 v15, p42

    iput-object v15, v2, Lmrk;->r:Lhw3;

    iput-object v4, v2, Lmrk;->s:Lot8;

    new-instance v15, Lisj;

    new-instance v0, Lyqk;

    const/4 v6, 0x0

    invoke-direct {v0, v2, v6}, Lyqk;-><init>(Lmrk;B)V

    new-instance v6, Lkw3;

    const/16 v4, 0x1d

    invoke-direct {v6, v4}, Lkw3;-><init>(B)V

    invoke-direct {v15, v0, v6}, Lisj;-><init>(Lesk;Lesk;)V

    const/4 v0, 0x1

    iput-boolean v0, v15, Lisj;->f:Z

    iput-object v15, v2, Lmrk;->t:Lisj;

    new-instance v6, Lfe5;

    invoke-static/range {p1 .. p1}, Loup;->i0(Ltcc;)Lpde;

    move-result-object v15

    invoke-direct {v6, v15}, Lfe5;-><init>(Lpde;)V

    const/4 v15, 0x0

    invoke-virtual {v6, v15}, Lfe5;->a(Z)V

    iput-object v6, v2, Lmrk;->u:Lfe5;

    new-instance v27, Ligi;

    new-instance v4, Lrni;

    invoke-virtual {v11}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v15

    iget-object v0, v6, Lfe5;->b:Lqdc;

    invoke-direct {v4, v15, v0}, Lrni;-><init>(Landroid/content/Context;Lqdc;)V

    new-instance v0, Lyqk;

    const/4 v15, 0x1

    invoke-direct {v0, v2, v15}, Lyqk;-><init>(Lmrk;B)V

    new-instance v15, Lbrk;

    move-object/from16 v20, v0

    const/4 v0, 0x0

    invoke-direct {v15, v2, v0}, Lbrk;-><init>(Lmrk;B)V

    new-instance v0, Lzqk;

    move-object/from16 v17, v6

    const/4 v6, 0x2

    invoke-direct {v0, v2, v6}, Lzqk;-><init>(Lmrk;B)V

    iget-object v4, v4, Lrni;->b:Lkze;

    move-object/from16 v19, p40

    move-object/from16 v22, v0

    move-object/from16 v18, v4

    move-object/from16 v21, v15

    move-object/from16 v16, v27

    invoke-direct/range {v16 .. v22}, Ligi;-><init>(Lfe5;Lkze;Lcom/opera/android/Lazy;Lyqk;Lbrk;Lzqk;)V

    move-object/from16 v4, v16

    move-object/from16 v0, v17

    iput-object v4, v2, Lmrk;->v:Ligi;

    new-instance v15, Lpde;

    invoke-virtual {v2}, Lmrk;->e()Lfyj;

    move-result-object v6

    invoke-direct {v15, v6}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v15, v2, Lmrk;->x:Lpde;

    invoke-virtual {v5}, Lekc;->g()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljm7;

    if-eqz v6, :cond_c9

    iget-boolean v6, v6, Ljm7;->b:Z

    goto :goto_ca

    :cond_c9
    const/4 v6, 0x0

    :goto_ca
    invoke-virtual {v11}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v16

    move-object/from16 p14, v4

    invoke-static/range {v16 .. v16}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v4

    const/16 v31, 0x0

    const-string v5, "Missing required view with ID: "

    if-eqz v6, :cond_155

    const/4 v7, 0x1

    if-ne v6, v7, :cond_155

    const v6, 0x7f0d03dc

    const/4 v7, 0x0

    invoke-virtual {v4, v6, v11, v7}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v4

    const v6, 0x7f0a093a

    invoke-static {v6, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v7

    if-eqz v7, :cond_142

    invoke-static {v7}, Lvs;->c(Landroid/view/View;)Lvs;

    move-result-object v19

    const v6, 0x7f0a0aff

    invoke-static {v6, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v7

    move-object/from16 v22, v7

    check-cast v22, Lcom/opera/android/custom_views/FadingRecyclerView;

    if-eqz v22, :cond_13e

    const v6, 0x7f0a0b00

    invoke-static {v6, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v7

    move-object/from16 v21, v7

    check-cast v21, Lcom/opera/android/search/SuggestionsListWrapper;

    if-eqz v21, :cond_13a

    const v6, 0x7f0a0c67

    invoke-static {v6, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v7

    move-object/from16 v20, v7

    check-cast v20, Landroid/widget/FrameLayout;

    if-eqz v20, :cond_136

    check-cast v4, Landroidx/coordinatorlayout/widget/CoordinatorLayout;

    new-instance v5, Ldxh;

    const v6, 0x7f0402a8

    invoke-direct {v5, v6}, Ldxh;-><init>(I)V

    new-instance v7, Ldxh;

    invoke-direct {v7, v6}, Ldxh;-><init>(I)V

    invoke-static {v4, v5, v7}, Lcgh;->h(Landroid/view/View;Ldxh;Ldxh;)V

    new-instance v17, Lw6j;

    move-object/from16 v18, v4

    invoke-direct/range {v17 .. v22}, Lw6j;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    :goto_132
    move-object/from16 v4, v17

    goto/16 :goto_1ab

    :cond_136
    const v7, 0x7f0a0c67

    goto :goto_145

    :cond_13a
    const v7, 0x7f0a0b00

    goto :goto_145

    :cond_13e
    const v7, 0x7f0a0aff

    goto :goto_145

    :cond_142
    const v7, 0x7f0a093a

    :goto_145
    invoke-virtual {v4}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v7}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    throw v31

    :cond_155
    const v6, 0x7f0d03dd

    const/4 v7, 0x0

    invoke-virtual {v4, v6, v11, v7}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v4

    const v6, 0x7f0a093a

    invoke-static {v6, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v7

    if-eqz v7, :cond_adb

    invoke-static {v7}, Lvs;->c(Landroid/view/View;)Lvs;

    move-result-object v19

    const v6, 0x7f0a0aff

    invoke-static {v6, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v7

    move-object/from16 v22, v7

    check-cast v22, Lcom/opera/android/custom_views/FadingRecyclerView;

    if-eqz v22, :cond_adb

    const v7, 0x7f0a0b00

    invoke-static {v7, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v6

    move-object/from16 v21, v6

    check-cast v21, Lcom/opera/android/search/SuggestionsListWrapper;

    if-eqz v21, :cond_adc

    const v6, 0x7f0a0c67

    invoke-static {v6, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v7

    move-object/from16 v20, v7

    check-cast v20, Landroid/widget/FrameLayout;

    if-eqz v20, :cond_adb

    check-cast v4, Landroidx/coordinatorlayout/widget/CoordinatorLayout;

    new-instance v5, Ldxh;

    const v6, 0x7f0402a8

    invoke-direct {v5, v6}, Ldxh;-><init>(I)V

    new-instance v7, Ldxh;

    invoke-direct {v7, v6}, Ldxh;-><init>(I)V

    invoke-static {v4, v5, v7}, Lcgh;->h(Landroid/view/View;Ldxh;Ldxh;)V

    new-instance v17, Lw6j;

    move-object/from16 v18, v4

    invoke-direct/range {v17 .. v22}, Lw6j;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_132

    :goto_1ab
    iget-object v5, v4, Lw6j;->c:Ljava/lang/Object;

    move-object/from16 v32, v5

    check-cast v32, Landroid/widget/FrameLayout;

    iget-object v5, v4, Lw6j;->e:Ljava/lang/Object;

    check-cast v5, Lcom/opera/android/custom_views/FadingRecyclerView;

    iget-object v6, v4, Lw6j;->a:Ljava/lang/Object;

    check-cast v6, Landroidx/coordinatorlayout/widget/CoordinatorLayout;

    const/16 v7, 0x8

    invoke-virtual {v6, v7}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->setVisibility(I)V

    new-instance v7, Lcrk;

    const/4 v13, 0x0

    invoke-direct {v7, v4, v13}, Lcrk;-><init>(Ljava/lang/Object;B)V

    sget-object v16, Lr5n;->a:Ljava/util/WeakHashMap;

    invoke-static {v6, v7}, Lh5n;->c(Landroid/view/View;Lbcf;)V

    new-instance v7, Ltm9;

    const/4 v13, 0x1

    invoke-direct {v7, v6, v13}, Ltm9;-><init>(Landroid/view/View;B)V

    invoke-virtual {v6, v7}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    iput-object v4, v2, Lmrk;->y:Lw6j;

    new-instance v7, Leyi;

    move-object/from16 p13, v6

    const/4 v6, 0x5

    invoke-direct {v7, v2, v6}, Leyi;-><init>(Lmrk;B)V

    iput-object v7, v2, Lmrk;->z:Leyi;

    new-instance v7, Lwih;

    move-object/from16 v6, p2

    invoke-direct {v7, v6}, Lwih;-><init>(Lj4c;)V

    iput-object v7, v2, Lmrk;->A:Lwih;

    new-instance v6, Lisd;

    const/16 v13, 0x1d

    invoke-direct {v6, v2, v13}, Lisd;-><init>(Ljava/lang/Object;B)V

    iput-object v6, v2, Lmrk;->B:Lisd;

    new-instance v20, Lhqk;

    new-instance v13, Lcbf;

    const/4 v8, 0x3

    invoke-direct {v13, v9, v8}, Lcbf;-><init>(Ldbf;B)V

    invoke-virtual/range {p7 .. p7}, Lekc;->g()Ljava/lang/Object;

    move-result-object v17

    move-object/from16 v8, v17

    check-cast v8, Ljm7;

    if-eqz v8, :cond_207

    iget-boolean v8, v8, Ljm7;->b:Z

    move/from16 v24, v8

    goto :goto_209

    :cond_207
    const/16 v24, 0x0

    :goto_209
    new-instance v8, Lwjh;

    new-instance v12, Lj1k;

    const/16 v18, 0x0

    const/16 v19, 0x3

    move-object/from16 v23, v13

    const/4 v13, 0x0

    move-object/from16 v17, v15

    const-class v15, Lfbf;

    const-string v16, "hideIme"

    move-object/from16 v22, v17

    const-string v17, "hideIme()V"

    move-object/from16 v33, v22

    const/16 v34, 0x0

    invoke-direct/range {v12 .. v19}, Lj1k;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    invoke-direct {v8, v1, v0, v6, v12}, Lwjh;-><init>(Lgjm;Lfe5;Lisd;Lj1k;)V

    new-instance v6, Leek;

    const/4 v12, 0x3

    invoke-direct {v6, v2, v1, v12}, Leek;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object v1, v7, Lwih;->b:Lpde;

    move-object/from16 v16, p10

    move-object/from16 v17, p15

    move-object/from16 v18, p20

    move-object/from16 v19, p21

    move-object/from16 v15, p24

    move-object/from16 v21, p26

    move-object/from16 v22, p27

    move-object/from16 v26, p28

    move-object/from16 v27, p29

    move-object/from16 v29, p33

    move-object v13, v0

    move-object/from16 v28, v1

    move-object v14, v5

    move-object/from16 v30, v6

    move-object/from16 v25, v8

    move-object/from16 v12, v20

    move-object/from16 v0, p5

    move-object/from16 v20, p22

    invoke-direct/range {v12 .. v30}, Lhqk;-><init>(Lfe5;Lcom/opera/android/custom_views/FadingRecyclerView;Ls28;Lcom/opera/android/settings/SettingsManager;Lipk;Lx5f;Losf;Lx5f;Lqdh;Lbr6;Lcbf;ILwjh;Lqr8;Lnv2;Lpde;Lhw3;Leek;)V

    new-instance v1, La83;

    const/16 v5, 0x11

    invoke-direct {v1, v2, v5}, La83;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v12, v1}, Landroidx/recyclerview/widget/d;->registerAdapterDataObserver(Lgph;)V

    iput-object v12, v2, Lmrk;->C:Lhqk;

    new-instance v1, Lrqk;

    invoke-direct {v1, v14, v12}, Lrqk;-><init>(Lcom/opera/android/custom_views/FadingRecyclerView;Lhqk;)V

    invoke-virtual {v1}, Lrqk;->a()V

    iput-object v1, v2, Lmrk;->D:Lrqk;

    new-instance v1, Lflb;

    new-instance v5, Lnvk;

    invoke-virtual/range {p13 .. p13}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-direct {v5, v6, v12}, Lnvk;-><init>(Landroid/content/Context;Ljvk;)V

    invoke-direct {v1, v5}, Lflb;-><init>(Lblb;)V

    iput-object v1, v2, Lmrk;->E:Lflb;

    new-instance v8, Lp8f;

    invoke-direct {v8, v2, v9}, Lp8f;-><init>(Lmrk;Ldbf;)V

    iput-object v8, v2, Lmrk;->F:Lp8f;

    new-instance v12, Lwzg;

    const/4 v14, 0x7

    invoke-direct {v12, v2, v9, v14}, Lwzg;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    iget-object v5, v10, Liv7;->i:Ltsd;

    iget-object v15, v10, Liv7;->f:Lpde;

    iget-object v6, v3, Lm0a;->e:Lpde;

    new-instance v7, Lvoj;

    const/16 v14, 0x12

    invoke-direct {v7, v14}, Lvoj;-><init>(B)V

    invoke-static {v1, v5, v6, v7}, Lxf8;->Y(Ljava/lang/Object;Lekc;Lekc;Lkotlin/jvm/functions/Function2;)Lwnm;

    move-result-object v1

    invoke-static {v1}, Lxf8;->B(Likc;)Ltsd;

    move-result-object v14

    move-object/from16 v26, v12

    new-instance v12, Lrv7;

    iget-object v0, v0, Lfbf;->a:Lgbf;

    iget-object v0, v0, Lgbf;->k:Lhz4;

    new-instance v1, Lr4k;

    const/16 v5, 0x15

    invoke-direct {v1, v5}, Lr4k;-><init>(B)V

    invoke-static {v14, v1}, Lxf8;->V(Likc;Lkotlin/jvm/functions/Function1;)Ltsd;

    move-result-object v1

    invoke-static {v1}, Lxf8;->B(Likc;)Ltsd;

    move-result-object v25

    new-instance v1, Lki;

    const/16 v5, 0xb

    invoke-direct {v1, v2, v5}, Lki;-><init>(Ljava/lang/Object;B)V

    new-instance v29, Lj1k;

    const/4 v6, 0x0

    const/4 v7, 0x4

    move-object/from16 v28, v1

    const/4 v1, 0x0

    const-class v3, Lmrk;

    move-object/from16 v17, v4

    const-string v4, "isShowing"

    const-string v5, "isShowing()Z"

    move-object/from16 v30, p13

    move-object/from16 v27, p14

    move-object/from16 v16, v0

    move-object/from16 v22, v8

    move-object/from16 v36, v17

    move-object/from16 v0, v29

    move/from16 v8, v34

    const/16 v34, 0x8

    invoke-direct/range {v0 .. v7}, Lj1k;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    move-object/from16 v23, p18

    move-object/from16 v19, p20

    move-object/from16 v18, p34

    move-object/from16 v20, p35

    move-object/from16 v21, p36

    move-object/from16 v24, p38

    move-object/from16 v17, v10

    move-object v1, v14

    move-object v0, v15

    move-object/from16 v15, v32

    move-object/from16 v14, v33

    const/4 v3, 0x7

    invoke-direct/range {v12 .. v29}, Lrv7;-><init>(Lfe5;Lpde;Landroid/widget/FrameLayout;Lhz4;Liv7;Lky1;Lx5f;Lysj;Ljv3;Lp8f;Lpde;Ljv3;Ltsd;Lwzg;Ligi;Lki;Lj1k;)V

    move-object v7, v12

    move-object v6, v15

    move-object/from16 v4, v17

    move-object/from16 v5, v27

    iput-object v7, v2, Lmrk;->G:Lrv7;

    iget-object v10, v7, Lrv7;->t:Lxpm;

    iget-object v12, v10, Lxpm;->c:Lpde;

    new-instance v15, Ldrk;

    invoke-direct {v15, v2, v8}, Ldrk;-><init>(Lmrk;B)V

    invoke-virtual {v12, v13, v15}, Lekc;->j(Lndc;Lf7f;)V

    iput-object v10, v2, Lmrk;->H:Lxpm;

    new-instance v12, Lirk;

    invoke-direct {v12, v2}, Lirk;-><init>(Lmrk;)V

    invoke-virtual {v10, v12}, Lxpm;->F(Ljava/lang/Object;)V

    iput-object v12, v2, Lmrk;->I:Lirk;

    new-instance v12, Lcom/opera/android/suggestion/SuggestionManagerBridge;

    invoke-direct {v12}, Lcom/opera/android/suggestion/SuggestionManagerBridge;-><init>()V

    iput-object v12, v2, Lmrk;->J:Lcom/opera/android/suggestion/SuggestionManagerBridge;

    new-instance v9, Lj55;

    invoke-virtual/range {v30 .. v30}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v12

    iget-object v15, v4, Liv7;->k:Lpde;

    move/from16 p10, v3

    new-instance v3, Lr4k;

    const/16 v8, 0x17

    invoke-direct {v3, v8}, Lr4k;-><init>(B)V

    invoke-static {v14, v3}, Lxf8;->V(Likc;Lkotlin/jvm/functions/Function1;)Ltsd;

    move-result-object v3

    invoke-static {v3}, Lxf8;->B(Likc;)Ltsd;

    move-result-object v16

    new-instance v3, Lbrk;

    const/4 v14, 0x1

    invoke-direct {v3, v2, v14}, Lbrk;-><init>(Lmrk;B)V

    new-instance v14, Loji;

    invoke-direct {v14, v2}, Loji;-><init>(Ljava/lang/Object;)V

    move-object/from16 v17, v3

    move-object/from16 v18, v14

    move-object/from16 v3, p9

    move-object v14, v10

    move-object v10, v13

    move-object/from16 v13, p17

    invoke-direct/range {v9 .. v18}, Lj55;-><init>(Lfe5;Landroid/view/ViewGroup;Landroid/content/Context;Landroid/content/ClipboardManager;Lxpm;Lpde;Ltsd;Lbrk;Loji;)V

    move-object v13, v10

    iput-object v9, v2, Lmrk;->K:Lj55;

    new-instance v9, Lqt8;

    invoke-virtual/range {v30 .. v30}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v10

    move-object/from16 v11, p16

    invoke-direct {v9, v10, v11}, Lqt8;-><init>(Landroid/content/Context;Lwcd;)V

    iput-object v9, v2, Lmrk;->L:Lqt8;

    new-instance v9, Ln3h;

    new-instance v10, Lfrk;

    const/4 v15, 0x0

    invoke-direct {v10, v15}, Lfrk;-><init>(B)V

    invoke-virtual/range {v30 .. v30}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v11

    invoke-static {v11}, Le3j;->t(Landroid/content/Context;)Le3j;

    move-result-object v11

    invoke-virtual/range {v30 .. v30}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v12

    invoke-static {v12}, Ldj9;->t(Landroid/content/Context;)Ldj9;

    move-result-object v12

    move-object/from16 v17, v13

    new-instance v13, Lyqk;

    const/4 v14, 0x3

    invoke-direct {v13, v2, v14}, Lyqk;-><init>(Lmrk;B)V

    invoke-virtual/range {v17 .. v17}, Lfe5;->getLifecycle()Ltcc;

    move-result-object v14

    invoke-static {v14}, Lcqp;->V(Ltcc;)Lddc;

    move-result-object v15

    sget-object v14, Lvml;->e:Lwjh;

    iget-object v14, v14, Lwjh;->f:Ljava/lang/Object;

    move-object/from16 v16, v14

    check-cast v16, Ljg8;

    move-object/from16 v14, p41

    move-object/from16 v8, v17

    move-object/from16 v17, p20

    invoke-direct/range {v9 .. v17}, Ln3h;-><init>(Lfrk;Le3j;Ldj9;Lyqk;Lplh;Lddc;Ljg8;Lx5f;)V

    move-object v10, v9

    move-object/from16 v9, v17

    iput-object v10, v2, Lmrk;->M:Ln3h;

    new-instance v10, Leek;

    const/4 v11, 0x4

    invoke-direct {v10, v2, v3, v11}, Leek;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v10}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object v3

    iput-object v3, v2, Lmrk;->N:Lzyk;

    new-instance v3, Lrn9;

    invoke-direct {v3, v8, v0, v9}, Lrn9;-><init>(Lfe5;Lpde;Lx5f;)V

    iput-object v3, v2, Lmrk;->O:Lrn9;

    new-instance v3, Lqt6;

    new-instance v9, Lbrk;

    const/4 v10, 0x6

    invoke-direct {v9, v2, v10}, Lbrk;-><init>(Lmrk;B)V

    invoke-direct {v3}, Ljava/lang/Object;-><init>()V

    iput-object v2, v3, Lqt6;->f:Ljava/lang/Object;

    iput-object v9, v3, Lqt6;->c:Ljava/lang/Object;

    sget-object v9, Llbf;->a:Llbf;

    iput-object v9, v3, Lqt6;->d:Ljava/lang/Object;

    new-instance v9, Ljrk;

    const/4 v15, 0x0

    invoke-direct {v9, v3, v15}, Ljrk;-><init>(Lqt6;B)V

    iput-object v9, v3, Lqt6;->e:Ljava/lang/Object;

    iget-object v9, v2, Lmrk;->G:Lrv7;

    iget-object v9, v9, Lrv7;->u:Lpde;

    iget-object v12, v2, Lmrk;->u:Lfe5;

    new-instance v13, Lkrk;

    invoke-direct {v13, v3, v15}, Lkrk;-><init>(Lqt6;B)V

    new-instance v14, Lt7d;

    const/16 v15, 0x17

    invoke-direct {v14, v13, v15}, Lt7d;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v9, v12, v14}, Lekc;->j(Lndc;Lf7f;)V

    iget-object v9, v2, Lmrk;->o:Lm0a;

    iget-object v9, v9, Lm0a;->e:Lpde;

    new-instance v13, Lkrk;

    const/4 v14, 0x1

    invoke-direct {v13, v3, v14}, Lkrk;-><init>(Lqt6;B)V

    move/from16 p9, v10

    new-instance v10, Lt7d;

    invoke-direct {v10, v13, v15}, Lt7d;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v9, v12, v10}, Lekc;->j(Lndc;Lf7f;)V

    iput-object v3, v2, Lmrk;->W:Lqt6;

    move-object/from16 v3, p43

    iget-object v9, v3, Lot8;->b:Lkze;

    new-instance v10, Ld58;

    const/16 v12, 0x9

    invoke-direct {v10, v12}, Ld58;-><init>(B)V

    new-instance v13, Lug;

    const/16 v15, 0x16

    invoke-direct {v13, v10, v15}, Lug;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v9, v8, v13}, Lekc;->j(Lndc;Lf7f;)V

    iget-object v9, v3, Lot8;->c:Lhx5;

    new-instance v10, Ld58;

    const/16 v13, 0xa

    invoke-direct {v10, v13}, Ld58;-><init>(B)V

    move/from16 p13, v12

    new-instance v12, Lug;

    invoke-direct {v12, v10, v15}, Lug;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v9, v8, v12}, Lekc;->j(Lndc;Lf7f;)V

    iget-object v3, v3, Lot8;->d:Lhx5;

    new-instance v9, Ld58;

    const/16 v10, 0xb

    invoke-direct {v9, v10}, Ld58;-><init>(B)V

    new-instance v12, Lug;

    invoke-direct {v12, v9, v15}, Lug;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v3, v8, v12}, Lekc;->j(Lndc;Lf7f;)V

    new-instance v3, Lzqk;

    invoke-direct {v3, v2, v11}, Lzqk;-><init>(Lmrk;B)V

    new-instance v9, Lt7d;

    const/16 v15, 0x17

    invoke-direct {v9, v3, v15}, Lt7d;-><init>(Lkotlin/jvm/functions/Function1;B)V

    move-object/from16 v3, p3

    invoke-virtual {v3, v8, v9}, Lekc;->j(Lndc;Lf7f;)V

    iget-object v9, v4, Liv7;->i:Ltsd;

    new-instance v12, Ldrk;

    invoke-direct {v12, v2, v14}, Ldrk;-><init>(Lmrk;B)V

    invoke-static {v9, v8, v12}, Lxf8;->g0(Lekc;Lndc;Lf7f;)V

    new-instance v9, Ldrk;

    const/4 v12, 0x2

    invoke-direct {v9, v2, v12}, Ldrk;-><init>(Lmrk;B)V

    invoke-static {v0, v8, v9}, Lxf8;->g0(Lekc;Lndc;Lf7f;)V

    iget-object v0, v5, Ligi;->f:Ljava/lang/Object;

    check-cast v0, Lode;

    new-instance v5, Lzqk;

    const/4 v9, 0x5

    invoke-direct {v5, v2, v9}, Lzqk;-><init>(Lmrk;B)V

    new-instance v15, Lt7d;

    move/from16 p14, v13

    const/16 v13, 0x17

    invoke-direct {v15, v5, v13}, Lt7d;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v0, v8, v15}, Lekc;->j(Lndc;Lf7f;)V

    move-object/from16 v0, p32

    iget-object v0, v0, Lm0a;->e:Lpde;

    new-instance v5, Lzqk;

    const/4 v15, 0x0

    invoke-direct {v5, v2, v15}, Lzqk;-><init>(Lmrk;B)V

    new-instance v15, Lt7d;

    invoke-direct {v15, v5, v13}, Lt7d;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v0, v8, v15}, Lekc;->j(Lndc;Lf7f;)V

    new-instance v0, Lzqk;

    invoke-direct {v0, v2, v14}, Lzqk;-><init>(Lmrk;B)V

    new-instance v5, Lt7d;

    invoke-direct {v5, v0, v13}, Lt7d;-><init>(Lkotlin/jvm/functions/Function1;B)V

    iget-object v0, v7, Lrv7;->v:Lqde;

    invoke-virtual {v0, v8, v5}, Lekc;->j(Lndc;Lf7f;)V

    new-instance v5, Lev7;

    move-object/from16 v13, v36

    iget-object v13, v13, Lw6j;->b:Ljava/lang/Object;

    check-cast v13, Lvs;

    iget-object v7, v7, Lrv7;->u:Lpde;

    move-object/from16 p28, p8

    move-object/from16 p34, v1

    move-object/from16 p33, v3

    move-object/from16 p30, v4

    move-object/from16 p26, v5

    move-object/from16 p32, v7

    move-object/from16 p27, v8

    move-object/from16 p29, v13

    move-object/from16 p31, v26

    invoke-direct/range {p26 .. p34}, Lev7;-><init>(Lfe5;Lumi;Lvs;Liv7;Lwzg;Lpde;Lpde;Ltsd;)V

    move-object/from16 v13, p27

    iget-object v1, v2, Lmrk;->a:Lpde;

    new-instance v3, Ltu7;

    invoke-direct {v3, v6, v12}, Ltu7;-><init>(Ljava/lang/Object;B)V

    new-instance v4, Lcl4;

    const/16 v5, 0xe

    invoke-direct {v4, v3, v5}, Lcl4;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v1, v13, v4}, Lekc;->j(Lndc;Lf7f;)V

    move-object/from16 v1, p25

    iget-object v1, v1, Lmdh;->h:Lh42;

    new-instance v3, Lnqi;

    invoke-direct {v3, v2, v10}, Lnqi;-><init>(Ljava/lang/Object;B)V

    sget-object v4, Lhrk;->a:Lh58;

    invoke-virtual {v4}, Lz4;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_4cb
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_a70

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lkqk;

    invoke-virtual {v5}, Ljava/lang/Enum;->ordinal()I

    move-result v6

    packed-switch v6, :pswitch_data_aec

    invoke-static {}, Lh9o;->p()V

    throw v31

    :pswitch_4e2
    new-instance v6, Ldy0;

    iget-object v7, v2, Lmrk;->g:Lcom/opera/android/settings/SettingsManager;

    iget-object v8, v2, Lmrk;->h:Liv7;

    iget-object v13, v2, Lmrk;->u:Lfe5;

    const-string v15, "enable_suggested_speed_dials"

    const/16 v16, 0x6

    sget-object v17, Lkqk;->s:Lkqk;

    move-object/from16 p30, v0

    move-object/from16 p32, v3

    move-object/from16 p25, v6

    move-object/from16 p28, v7

    move-object/from16 p29, v8

    move-object/from16 p31, v13

    move-object/from16 p27, v15

    move/from16 p33, v16

    move-object/from16 p26, v17

    invoke-direct/range {p25 .. p33}, Ldy0;-><init>(Lkqk;Ljava/lang/String;Lcom/opera/android/settings/SettingsManager;Liv7;Likc;Lndc;Lkotlin/jvm/functions/Function2;B)V

    move-object/from16 v0, p19

    move-object/from16 v7, p30

    :goto_509
    move/from16 v16, v10

    goto/16 :goto_7de

    :pswitch_50d
    move-object/from16 v39, v3

    move-object v3, v0

    move-object/from16 v0, v39

    new-instance v6, Lvu4;

    iget-object v7, v2, Lmrk;->g:Lcom/opera/android/settings/SettingsManager;

    iget-object v8, v2, Lmrk;->h:Liv7;

    iget-object v13, v2, Lmrk;->u:Lfe5;

    move-object/from16 p7, p19

    move-object/from16 p6, v0

    move-object/from16 p4, v3

    move-object/from16 p1, v6

    move-object/from16 p2, v7

    move-object/from16 p3, v8

    move-object/from16 p5, v13

    invoke-direct/range {p1 .. p7}, Lvu4;-><init>(Lcom/opera/android/settings/SettingsManager;Liv7;Lqde;Lndc;Lnqi;Libf;)V

    move-object/from16 v0, p7

    move-object/from16 v7, p4

    move-object/from16 v3, p6

    goto :goto_509

    :pswitch_532
    move-object v7, v0

    move-object/from16 v0, p19

    new-instance v6, Ldy0;

    iget-object v8, v2, Lmrk;->g:Lcom/opera/android/settings/SettingsManager;

    iget-object v13, v2, Lmrk;->h:Liv7;

    iget-object v15, v2, Lmrk;->u:Lfe5;

    const/16 v16, 0x0

    const/16 v17, 0x0

    sget-object v18, Lkqk;->q:Lkqk;

    move-object/from16 p32, v3

    move-object/from16 p25, v6

    move-object/from16 p30, v7

    move-object/from16 p28, v8

    move-object/from16 p29, v13

    move-object/from16 p31, v15

    move-object/from16 p27, v16

    move/from16 p33, v17

    move-object/from16 p26, v18

    invoke-direct/range {p25 .. p33}, Ldy0;-><init>(Lkqk;Ljava/lang/String;Lcom/opera/android/settings/SettingsManager;Liv7;Likc;Lndc;Lkotlin/jvm/functions/Function2;B)V

    goto :goto_509

    :pswitch_559
    move-object v7, v0

    move-object/from16 v0, p19

    new-instance v6, Ldy0;

    iget-object v8, v2, Lmrk;->g:Lcom/opera/android/settings/SettingsManager;

    iget-object v13, v2, Lmrk;->h:Liv7;

    iget-object v15, v2, Lmrk;->u:Lfe5;

    const-string v16, "enable_suggestion_provider_ai_recent_activity"

    const/16 v17, 0xa

    sget-object v18, Lkqk;->p:Lkqk;

    move-object/from16 p32, v3

    move-object/from16 p25, v6

    move-object/from16 p30, v7

    move-object/from16 p28, v8

    move-object/from16 p29, v13

    move-object/from16 p31, v15

    move-object/from16 p27, v16

    move/from16 p33, v17

    move-object/from16 p26, v18

    invoke-direct/range {p25 .. p33}, Ldy0;-><init>(Lkqk;Ljava/lang/String;Lcom/opera/android/settings/SettingsManager;Liv7;Likc;Lndc;Lkotlin/jvm/functions/Function2;B)V

    goto :goto_509

    :pswitch_580
    move-object v7, v0

    move-object/from16 v0, p19

    new-instance v6, Lvu4;

    iget-object v8, v2, Lmrk;->g:Lcom/opera/android/settings/SettingsManager;

    iget-object v13, v2, Lmrk;->h:Liv7;

    iget-object v15, v2, Lmrk;->u:Lfe5;

    move/from16 v16, v10

    iget-object v10, v2, Lmrk;->A:Lwih;

    move-object/from16 p6, v3

    move-object/from16 p1, v6

    move-object/from16 p4, v7

    move-object/from16 p2, v8

    move-object/from16 p7, v10

    move-object/from16 p3, v13

    move-object/from16 p5, v15

    invoke-direct/range {p1 .. p7}, Lvu4;-><init>(Lcom/opera/android/settings/SettingsManager;Liv7;Lqde;Lndc;Lnqi;Lwih;)V

    goto/16 :goto_7de

    :pswitch_5a2
    move-object v7, v0

    move/from16 v16, v10

    move-object/from16 v0, p19

    new-instance v6, Ldy0;

    iget-object v8, v2, Lmrk;->g:Lcom/opera/android/settings/SettingsManager;

    iget-object v10, v2, Lmrk;->h:Liv7;

    iget-object v13, v2, Lmrk;->u:Lfe5;

    const-string v15, "enable_suggestion_provider_history"

    const/16 v17, 0xe

    sget-object v18, Lkqk;->n:Lkqk;

    move-object/from16 p32, v3

    move-object/from16 p25, v6

    move-object/from16 p30, v7

    move-object/from16 p28, v8

    move-object/from16 p29, v10

    move-object/from16 p31, v13

    move-object/from16 p27, v15

    move/from16 p33, v17

    move-object/from16 p26, v18

    invoke-direct/range {p25 .. p33}, Ldy0;-><init>(Lkqk;Ljava/lang/String;Lcom/opera/android/settings/SettingsManager;Liv7;Likc;Lndc;Lkotlin/jvm/functions/Function2;B)V

    goto/16 :goto_7de

    :pswitch_5cc
    move-object v7, v0

    move/from16 v16, v10

    move-object/from16 v0, p19

    new-instance v6, Ldy0;

    iget-object v8, v2, Lmrk;->g:Lcom/opera/android/settings/SettingsManager;

    iget-object v10, v2, Lmrk;->h:Liv7;

    iget-object v13, v2, Lmrk;->u:Lfe5;

    const-string v15, "enable_trending_searches"

    const/16 v17, 0xf

    sget-object v18, Lkqk;->m:Lkqk;

    move-object/from16 p32, v3

    move-object/from16 p25, v6

    move-object/from16 p30, v7

    move-object/from16 p28, v8

    move-object/from16 p29, v10

    move-object/from16 p31, v13

    move-object/from16 p27, v15

    move/from16 p33, v17

    move-object/from16 p26, v18

    invoke-direct/range {p25 .. p33}, Ldy0;-><init>(Lkqk;Ljava/lang/String;Lcom/opera/android/settings/SettingsManager;Liv7;Likc;Lndc;Lkotlin/jvm/functions/Function2;B)V

    goto/16 :goto_7de

    :pswitch_5f6
    move-object v7, v0

    move/from16 v16, v10

    move-object/from16 v0, p19

    new-instance v6, Ldy0;

    iget-object v8, v2, Lmrk;->g:Lcom/opera/android/settings/SettingsManager;

    iget-object v10, v2, Lmrk;->h:Liv7;

    iget-object v13, v2, Lmrk;->u:Lfe5;

    const-string v15, "enable_suggestion_provider_speeddials"

    const/16 v17, 0x9

    sget-object v18, Lkqk;->l:Lkqk;

    move-object/from16 p32, v3

    move-object/from16 p25, v6

    move-object/from16 p30, v7

    move-object/from16 p28, v8

    move-object/from16 p29, v10

    move-object/from16 p31, v13

    move-object/from16 p27, v15

    move/from16 p33, v17

    move-object/from16 p26, v18

    invoke-direct/range {p25 .. p33}, Ldy0;-><init>(Lkqk;Ljava/lang/String;Lcom/opera/android/settings/SettingsManager;Liv7;Likc;Lndc;Lkotlin/jvm/functions/Function2;B)V

    goto/16 :goto_7de

    :pswitch_620
    move-object v7, v0

    move/from16 v16, v10

    move-object/from16 v0, p19

    new-instance v6, Ldy0;

    iget-object v8, v2, Lmrk;->g:Lcom/opera/android/settings/SettingsManager;

    iget-object v10, v2, Lmrk;->h:Liv7;

    iget-object v13, v2, Lmrk;->u:Lfe5;

    const-string v15, "enable_suggestion_provider_speeddials"

    const/16 v17, 0xd

    sget-object v18, Lkqk;->k:Lkqk;

    move-object/from16 p32, v3

    move-object/from16 p25, v6

    move-object/from16 p30, v7

    move-object/from16 p28, v8

    move-object/from16 p29, v10

    move-object/from16 p31, v13

    move-object/from16 p27, v15

    move/from16 p33, v17

    move-object/from16 p26, v18

    invoke-direct/range {p25 .. p33}, Ldy0;-><init>(Lkqk;Ljava/lang/String;Lcom/opera/android/settings/SettingsManager;Liv7;Likc;Lndc;Lkotlin/jvm/functions/Function2;B)V

    goto/16 :goto_7de

    :pswitch_64a
    move-object v7, v0

    move/from16 v16, v10

    move-object/from16 v0, p19

    new-instance v6, Ldy0;

    iget-object v8, v2, Lmrk;->g:Lcom/opera/android/settings/SettingsManager;

    iget-object v10, v2, Lmrk;->h:Liv7;

    iget-object v13, v2, Lmrk;->u:Lfe5;

    const-string v15, "enable_suggestion_provider_recommendations"

    const/16 v17, 0xc

    sget-object v18, Lkqk;->j:Lkqk;

    move-object/from16 p32, v3

    move-object/from16 p25, v6

    move-object/from16 p30, v7

    move-object/from16 p28, v8

    move-object/from16 p29, v10

    move-object/from16 p31, v13

    move-object/from16 p27, v15

    move/from16 p33, v17

    move-object/from16 p26, v18

    invoke-direct/range {p25 .. p33}, Ldy0;-><init>(Lkqk;Ljava/lang/String;Lcom/opera/android/settings/SettingsManager;Liv7;Likc;Lndc;Lkotlin/jvm/functions/Function2;B)V

    goto/16 :goto_7de

    :pswitch_674
    move-object v7, v0

    move/from16 v16, v10

    move-object/from16 v0, p19

    new-instance v6, Ldy0;

    iget-object v8, v2, Lmrk;->g:Lcom/opera/android/settings/SettingsManager;

    iget-object v10, v2, Lmrk;->h:Liv7;

    iget-object v13, v2, Lmrk;->u:Lfe5;

    const-string v15, "enable_recent_searches"

    const/16 v17, 0xb

    sget-object v18, Lkqk;->i:Lkqk;

    move-object/from16 p32, v3

    move-object/from16 p25, v6

    move-object/from16 p30, v7

    move-object/from16 p28, v8

    move-object/from16 p29, v10

    move-object/from16 p31, v13

    move-object/from16 p27, v15

    move/from16 p33, v17

    move-object/from16 p26, v18

    invoke-direct/range {p25 .. p33}, Ldy0;-><init>(Lkqk;Ljava/lang/String;Lcom/opera/android/settings/SettingsManager;Liv7;Likc;Lndc;Lkotlin/jvm/functions/Function2;B)V

    goto/16 :goto_7de

    :pswitch_69e
    move-object v7, v0

    move/from16 v16, v10

    move-object/from16 v0, p19

    new-instance v6, Ld3h;

    iget-object v8, v2, Lmrk;->g:Lcom/opera/android/settings/SettingsManager;

    iget-object v10, v2, Lmrk;->h:Liv7;

    iget-object v13, v2, Lmrk;->u:Lfe5;

    move-object/from16 p8, p41

    move-object/from16 p7, v3

    move-object/from16 p2, v6

    move-object/from16 p5, v7

    move-object/from16 p3, v8

    move-object/from16 p4, v10

    move-object/from16 p6, v13

    invoke-direct/range {p2 .. p8}, Ld3h;-><init>(Lcom/opera/android/settings/SettingsManager;Liv7;Lqde;Lndc;Lnqi;Lplh;)V

    goto/16 :goto_7de

    :pswitch_6be
    move-object v7, v0

    move/from16 v16, v10

    move-object/from16 v0, p19

    new-instance v6, Ldy0;

    iget-object v8, v2, Lmrk;->g:Lcom/opera/android/settings/SettingsManager;

    iget-object v10, v2, Lmrk;->h:Liv7;

    iget-object v13, v2, Lmrk;->u:Lfe5;

    const/4 v15, 0x0

    const/16 v17, 0x8

    sget-object v18, Lkqk;->g:Lkqk;

    move-object/from16 p32, v3

    move-object/from16 p25, v6

    move-object/from16 p30, v7

    move-object/from16 p28, v8

    move-object/from16 p29, v10

    move-object/from16 p31, v13

    move-object/from16 p27, v15

    move/from16 p33, v17

    move-object/from16 p26, v18

    invoke-direct/range {p25 .. p33}, Ldy0;-><init>(Lkqk;Ljava/lang/String;Lcom/opera/android/settings/SettingsManager;Liv7;Likc;Lndc;Lkotlin/jvm/functions/Function2;B)V

    goto/16 :goto_7de

    :pswitch_6e7
    move-object v7, v0

    move/from16 v16, v10

    move-object/from16 v0, p19

    new-instance v6, Ldy0;

    iget-object v8, v2, Lmrk;->g:Lcom/opera/android/settings/SettingsManager;

    iget-object v10, v2, Lmrk;->h:Liv7;

    iget-object v13, v2, Lmrk;->u:Lfe5;

    const-string v15, "enable_suggestion_provider_history"

    const/16 v17, 0x7

    sget-object v18, Lkqk;->f:Lkqk;

    move-object/from16 p32, v3

    move-object/from16 p25, v6

    move-object/from16 p30, v7

    move-object/from16 p28, v8

    move-object/from16 p29, v10

    move-object/from16 p31, v13

    move-object/from16 p27, v15

    move/from16 p33, v17

    move-object/from16 p26, v18

    invoke-direct/range {p25 .. p33}, Ldy0;-><init>(Lkqk;Ljava/lang/String;Lcom/opera/android/settings/SettingsManager;Liv7;Likc;Lndc;Lkotlin/jvm/functions/Function2;B)V

    goto/16 :goto_7de

    :pswitch_711
    move-object v7, v0

    move/from16 v16, v10

    move-object/from16 v0, p19

    new-instance v6, Ldy0;

    iget-object v8, v2, Lmrk;->g:Lcom/opera/android/settings/SettingsManager;

    iget-object v10, v2, Lmrk;->h:Liv7;

    iget-object v13, v2, Lmrk;->u:Lfe5;

    const-string v15, "enable_suggestion_provider_bookmarks"

    const/16 v17, 0x5

    sget-object v18, Lkqk;->e:Lkqk;

    move-object/from16 p32, v3

    move-object/from16 p25, v6

    move-object/from16 p30, v7

    move-object/from16 p28, v8

    move-object/from16 p29, v10

    move-object/from16 p31, v13

    move-object/from16 p27, v15

    move/from16 p33, v17

    move-object/from16 p26, v18

    invoke-direct/range {p25 .. p33}, Ldy0;-><init>(Lkqk;Ljava/lang/String;Lcom/opera/android/settings/SettingsManager;Liv7;Likc;Lndc;Lkotlin/jvm/functions/Function2;B)V

    goto/16 :goto_7de

    :pswitch_73b
    move-object v7, v0

    move/from16 v16, v10

    move-object/from16 v0, p19

    new-instance v6, Ldy0;

    iget-object v8, v2, Lmrk;->g:Lcom/opera/android/settings/SettingsManager;

    iget-object v10, v2, Lmrk;->h:Liv7;

    iget-object v13, v2, Lmrk;->u:Lfe5;

    const-string v15, "enable_suggestion_provider_clipboard"

    const/16 v17, 0x4

    sget-object v18, Lkqk;->d:Lkqk;

    move-object/from16 p32, v3

    move-object/from16 p25, v6

    move-object/from16 p30, v7

    move-object/from16 p28, v8

    move-object/from16 p29, v10

    move-object/from16 p31, v13

    move-object/from16 p27, v15

    move/from16 p33, v17

    move-object/from16 p26, v18

    invoke-direct/range {p25 .. p33}, Ldy0;-><init>(Lkqk;Ljava/lang/String;Lcom/opera/android/settings/SettingsManager;Liv7;Likc;Lndc;Lkotlin/jvm/functions/Function2;B)V

    goto/16 :goto_7de

    :pswitch_765
    move-object v7, v0

    move/from16 v16, v10

    move-object/from16 v0, p19

    new-instance v6, Ldy0;

    iget-object v8, v2, Lmrk;->g:Lcom/opera/android/settings/SettingsManager;

    iget-object v10, v2, Lmrk;->h:Liv7;

    iget-object v13, v2, Lmrk;->u:Lfe5;

    const/4 v15, 0x0

    const/16 v17, 0x3

    sget-object v18, Lkqk;->c:Lkqk;

    move-object/from16 p32, v3

    move-object/from16 p25, v6

    move-object/from16 p30, v7

    move-object/from16 p28, v8

    move-object/from16 p29, v10

    move-object/from16 p31, v13

    move-object/from16 p27, v15

    move/from16 p33, v17

    move-object/from16 p26, v18

    invoke-direct/range {p25 .. p33}, Ldy0;-><init>(Lkqk;Ljava/lang/String;Lcom/opera/android/settings/SettingsManager;Liv7;Likc;Lndc;Lkotlin/jvm/functions/Function2;B)V

    goto :goto_7de

    :pswitch_78d
    move-object v7, v0

    move/from16 v16, v10

    move-object/from16 v0, p19

    new-instance v6, Ldy0;

    iget-object v8, v2, Lmrk;->g:Lcom/opera/android/settings/SettingsManager;

    iget-object v10, v2, Lmrk;->h:Liv7;

    iget-object v13, v2, Lmrk;->u:Lfe5;

    const-string v15, "enable_suggestion_provider_bookmarks"

    const/16 v17, 0x2

    sget-object v18, Lkqk;->b:Lkqk;

    move-object/from16 p32, v3

    move-object/from16 p25, v6

    move-object/from16 p30, v7

    move-object/from16 p28, v8

    move-object/from16 p29, v10

    move-object/from16 p31, v13

    move-object/from16 p27, v15

    move/from16 p33, v17

    move-object/from16 p26, v18

    invoke-direct/range {p25 .. p33}, Ldy0;-><init>(Lkqk;Ljava/lang/String;Lcom/opera/android/settings/SettingsManager;Liv7;Likc;Lndc;Lkotlin/jvm/functions/Function2;B)V

    goto :goto_7de

    :pswitch_7b6
    move-object v7, v0

    move/from16 v16, v10

    move-object/from16 v0, p19

    new-instance v6, Ldy0;

    iget-object v8, v2, Lmrk;->g:Lcom/opera/android/settings/SettingsManager;

    iget-object v10, v2, Lmrk;->h:Liv7;

    iget-object v13, v2, Lmrk;->u:Lfe5;

    const-string v15, "enable_suggested_speed_dials"

    const/16 v17, 0x1

    sget-object v18, Lkqk;->a:Lkqk;

    move-object/from16 p32, v3

    move-object/from16 p25, v6

    move-object/from16 p30, v7

    move-object/from16 p28, v8

    move-object/from16 p29, v10

    move-object/from16 p31, v13

    move-object/from16 p27, v15

    move/from16 p33, v17

    move-object/from16 p26, v18

    invoke-direct/range {p25 .. p33}, Ldy0;-><init>(Lkqk;Ljava/lang/String;Lcom/opera/android/settings/SettingsManager;Liv7;Likc;Lndc;Lkotlin/jvm/functions/Function2;B)V

    :goto_7de
    invoke-virtual {v6}, Lmqk;->a()Z

    move-result v8

    iput-boolean v8, v6, Lmqk;->i:Z

    iget-object v10, v2, Lmrk;->J:Lcom/opera/android/suggestion/SuggestionManagerBridge;

    iget-object v13, v2, Lmrk;->y:Lw6j;

    iget-object v15, v2, Lmrk;->u:Lfe5;

    invoke-virtual {v5}, Ljava/lang/Enum;->ordinal()I

    move-result v17

    move/from16 v21, v14

    const/16 v14, 0x14

    packed-switch v17, :pswitch_data_b16

    invoke-static {}, Lh9o;->p()V

    throw v31

    :pswitch_7f9
    new-instance v14, Lqt8;

    iget-object v13, v13, Lw6j;->a:Ljava/lang/Object;

    check-cast v13, Landroidx/coordinatorlayout/widget/CoordinatorLayout;

    invoke-virtual {v13}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v13

    new-instance v15, Llrk;

    iget-object v9, v2, Lmrk;->s:Lot8;

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/16 v20, 0x1

    const-class v22, Lot8;

    const-string v23, "isAvailable"

    const-string v24, "isAvailable(Lcom/opera/android/autocomplete/FeatureSuggestion;)Z"

    move-object/from16 p3, v9

    move-object/from16 p1, v15

    move/from16 p7, v17

    move/from16 p8, v18

    move/from16 p2, v20

    move-object/from16 p4, v22

    move-object/from16 p5, v23

    move-object/from16 p6, v24

    invoke-direct/range {p1 .. p8}, Llrk;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    move-object/from16 v9, p1

    new-instance v17, Llrk;

    iget-object v11, v2, Lmrk;->s:Lot8;

    const/16 v22, 0x1

    const-string v23, "getOverride"

    const-string v24, "getOverride(Lcom/opera/android/autocomplete/FeatureSuggestion;)Lcom/opera/android/autocomplete/FeatureSuggestionOverride;"

    move-object/from16 p3, v11

    move-object/from16 p1, v17

    move/from16 p7, v18

    move/from16 p8, v20

    move/from16 p2, v22

    move-object/from16 p5, v23

    move-object/from16 p6, v24

    invoke-direct/range {p1 .. p8}, Llrk;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    move-object/from16 v11, p1

    invoke-direct {v14, v13, v9, v11}, Lqt8;-><init>(Landroid/content/Context;Llrk;Llrk;)V

    :goto_848
    move-object/from16 v17, v1

    move-object/from16 p7, v3

    move/from16 v38, v12

    goto/16 :goto_a5e

    :pswitch_850
    new-instance v9, Lx3f;

    invoke-static {v15}, Lfsp;->y(Lndc;)Lddc;

    move-result-object v11

    iget-object v13, v2, Lmrk;->r:Lhw3;

    new-instance v14, Lyqk;

    invoke-direct {v14, v2, v12}, Lyqk;-><init>(Lmrk;B)V

    iget-object v15, v2, Lmrk;->m:Lqdh;

    iget-object v15, v15, Lqdh;->b:Lghf;

    move/from16 p6, v8

    move-object/from16 p1, v9

    move-object/from16 p2, v11

    move-object/from16 p3, v13

    move-object/from16 p4, v14

    move-object/from16 p5, v15

    invoke-direct/range {p1 .. p6}, Lx3f;-><init>(Lddc;Lhw3;Lyqk;Lghf;Z)V

    move-object/from16 v14, p1

    goto :goto_848

    :pswitch_873
    new-instance v14, Lcy0;

    iget-object v9, v13, Lw6j;->a:Ljava/lang/Object;

    check-cast v9, Landroidx/coordinatorlayout/widget/CoordinatorLayout;

    invoke-virtual {v9}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v9

    new-instance v11, Lbrk;

    const/4 v13, 0x4

    invoke-direct {v11, v2, v13}, Lbrk;-><init>(Lmrk;B)V

    new-instance v13, Lbrk;

    const/4 v15, 0x5

    invoke-direct {v13, v2, v15}, Lbrk;-><init>(Lmrk;B)V

    move-object/from16 v15, p39

    invoke-direct {v14, v9, v11, v13, v15}, Lcy0;-><init>(Landroid/content/Context;Lbrk;Lbrk;Lzv3;)V

    goto :goto_848

    :pswitch_88f
    new-instance v9, Lx3f;

    iget-object v11, v2, Lmrk;->h:Liv7;

    iget-object v11, v11, Liv7;->g:Lpde;

    iget-object v13, v2, Lmrk;->p:Lhw3;

    invoke-virtual {v13}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lkul;

    invoke-static {v15}, Lfsp;->y(Lndc;)Lddc;

    move-result-object v14

    new-instance v15, Lgrk;

    const/4 v12, 0x4

    invoke-direct {v15, v2, v12}, Lgrk;-><init>(Lmrk;B)V

    new-instance v12, Lbrk;

    move-object/from16 v17, v1

    const/4 v1, 0x3

    invoke-direct {v12, v2, v1}, Lbrk;-><init>(Lmrk;B)V

    move-object/from16 p1, v9

    move-object/from16 p2, v11

    move-object/from16 p6, v12

    move-object/from16 p3, v13

    move-object/from16 p4, v14

    move-object/from16 p5, v15

    invoke-direct/range {p1 .. p6}, Lx3f;-><init>(Lpde;Lkul;Lddc;Lgrk;Lbrk;)V

    move-object/from16 v14, p1

    :goto_8c0
    move-object/from16 p7, v3

    :goto_8c2
    const/16 v38, 0x2

    goto/16 :goto_a5e

    :pswitch_8c6
    move-object/from16 v17, v1

    new-instance v14, Luu4;

    const/4 v15, 0x0

    invoke-direct {v14, v15}, Lcom/opera/android/suggestion/SuggestionProviderBridge;-><init>(I)V

    goto :goto_8c0

    :pswitch_8cf
    move-object/from16 v17, v1

    new-instance v1, Lx8l;

    iget-object v9, v2, Lmrk;->f:Lumi;

    iget-object v11, v2, Lmrk;->i:Lk6l;

    iget-object v12, v0, Libf;->b:[Lfr;

    aget-object v13, v12, v34

    iget v14, v13, Lfr;->b:I

    iget v13, v13, Lfr;->c:I

    aget-object v15, v12, p13

    move-object/from16 p25, v1

    iget v1, v15, Lfr;->b:I

    iget v15, v15, Lfr;->c:I

    move/from16 p30, v1

    aget-object v1, v12, p14

    move-object/from16 p7, v3

    iget v3, v1, Lfr;->b:I

    iget v1, v1, Lfr;->c:I

    aget-object v12, v12, v16

    move/from16 p33, v1

    iget v1, v12, Lfr;->b:I

    iget v12, v12, Lfr;->c:I

    move/from16 p34, v1

    move/from16 p32, v3

    move-object/from16 p26, v9

    move-object/from16 p27, v11

    move/from16 p35, v12

    move/from16 p29, v13

    move/from16 p28, v14

    move/from16 p31, v15

    invoke-direct/range {p25 .. p35}, Lx8l;-><init>(Lumi;Lk6l;IIIIIIII)V

    :goto_90c
    move-object/from16 v14, p25

    goto :goto_8c2

    :pswitch_90f
    move-object/from16 v17, v1

    move-object/from16 p7, v3

    new-instance v14, Lo6m;

    move-object/from16 v1, p23

    invoke-direct {v14, v1}, Lo6m;-><init>(Lm6m;)V

    goto :goto_8c2

    :pswitch_91b
    move-object/from16 v17, v1

    move-object/from16 p7, v3

    new-instance v3, Lcom/opera/android/favorites/PushedSpeedDialSuggestionProvider;

    iget-object v9, v0, Libf;->b:[Lfr;

    const/16 v19, 0x0

    aget-object v11, v9, v19

    iget v12, v11, Lfr;->b:I

    iget v11, v11, Lfr;->c:I

    aget-object v9, v9, v21

    iget v13, v9, Lfr;->b:I

    iget v9, v9, Lfr;->c:I

    move-object/from16 p1, v3

    move/from16 p6, v9

    move/from16 p4, v11

    move/from16 p3, v12

    move/from16 p5, v13

    move-object/from16 p2, v17

    invoke-direct/range {p1 .. p6}, Lcom/opera/android/favorites/PushedSpeedDialSuggestionProvider;-><init>(Lh42;IIII)V

    move-object/from16 v14, p1

    goto :goto_8c2

    :pswitch_943
    move-object/from16 v17, v1

    move-object/from16 p7, v3

    new-instance v14, Lqmh;

    new-instance v3, Lgrk;

    const/4 v12, 0x3

    invoke-direct {v3, v2, v12}, Lgrk;-><init>(Lmrk;B)V

    iget-object v9, v2, Lmrk;->c:Lfbf;

    new-instance v11, Lcrk;

    move/from16 v13, v21

    invoke-direct {v11, v9, v13}, Lcrk;-><init>(Ljava/lang/Object;B)V

    invoke-direct {v14, v3, v11}, Lqmh;-><init>(Lgrk;Lcrk;)V

    goto/16 :goto_8c2

    :pswitch_95d
    move-object/from16 v17, v1

    move-object/from16 p7, v3

    new-instance v14, Lwsi;

    new-instance v3, Lgrk;

    const/4 v12, 0x2

    invoke-direct {v3, v2, v12}, Lgrk;-><init>(Lmrk;B)V

    new-instance v9, Leu3;

    invoke-direct {v9, v2, v12}, Leu3;-><init>(Ljava/lang/Object;B)V

    invoke-direct {v14, v3, v9}, Lwsi;-><init>(Lgrk;Leu3;)V

    goto/16 :goto_8c2

    :pswitch_973
    move-object/from16 v17, v1

    move-object/from16 p7, v3

    new-instance v14, Lqmh;

    new-instance v3, Lgrk;

    const/4 v15, 0x0

    invoke-direct {v3, v2, v15}, Lgrk;-><init>(Lmrk;B)V

    new-instance v9, Lgrk;

    const/4 v13, 0x1

    invoke-direct {v9, v2, v13}, Lgrk;-><init>(Lmrk;B)V

    move-object/from16 v11, p24

    invoke-direct {v14, v3, v9, v11}, Lqmh;-><init>(Lgrk;Lgrk;Ls28;)V

    goto/16 :goto_8c2

    :pswitch_98c
    move-object/from16 v17, v1

    move-object/from16 p7, v3

    iget-object v14, v2, Lmrk;->M:Ln3h;

    goto/16 :goto_8c2

    :pswitch_994
    move-object/from16 v17, v1

    move-object/from16 p7, v3

    iget-object v14, v2, Lmrk;->L:Lqt8;

    goto/16 :goto_8c2

    :pswitch_99c
    move-object/from16 v17, v1

    move-object/from16 p7, v3

    new-instance v3, Lvl3;

    iget-object v9, v0, Libf;->b:[Lfr;

    const/4 v12, 0x4

    aget-object v13, v9, v12

    iget v14, v13, Lfr;->b:I

    iget v13, v13, Lfr;->c:I

    const/16 v37, 0x5

    aget-object v15, v9, v37

    iget v12, v15, Lfr;->b:I

    iget v15, v15, Lfr;->c:I

    aget-object v1, v9, p9

    move-object/from16 p25, v3

    iget v3, v1, Lfr;->b:I

    iget v1, v1, Lfr;->c:I

    aget-object v9, v9, p10

    move/from16 p31, v1

    iget v1, v9, Lfr;->b:I

    iget v9, v9, Lfr;->c:I

    move/from16 p32, v1

    move/from16 p30, v3

    move/from16 p33, v9

    move/from16 p28, v12

    move/from16 p27, v13

    move/from16 p26, v14

    move/from16 p29, v15

    invoke-direct/range {p25 .. p33}, Lvl3;-><init>(IIIIIIII)V

    goto/16 :goto_90c

    :pswitch_9d6
    move-object/from16 v17, v1

    move-object/from16 p7, v3

    iget-object v1, v2, Lmrk;->k:Lnr8;

    check-cast v1, Lcom/opera/android/favorites/e;

    iget-object v3, v0, Libf;->b:[Lfr;

    const/16 v19, 0x0

    aget-object v9, v3, v19

    iget v12, v9, Lfr;->b:I

    iget v9, v9, Lfr;->c:I

    const/4 v13, 0x1

    aget-object v3, v3, v13

    iget v15, v3, Lfr;->b:I

    iget v3, v3, Lfr;->c:I

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Lvl3;

    invoke-direct {v1, v13}, Llt8;-><init>(B)V

    invoke-static {v14, v12, v9, v15, v3}, LJ/N;->MoPPs999(IIIII)J

    move-result-wide v14

    invoke-virtual {v1, v14, v15}, Llt8;->e(J)V

    move-object v14, v1

    goto/16 :goto_8c2

    :pswitch_a01
    move-object/from16 v17, v1

    move-object/from16 p7, v3

    iget-object v14, v2, Lmrk;->K:Lj55;

    goto/16 :goto_8c2

    :pswitch_a09
    move-object/from16 v17, v1

    move-object/from16 p7, v3

    move/from16 v13, v21

    new-instance v14, Lvl3;

    invoke-direct {v14, v13}, Llt8;-><init>(B)V

    invoke-static {}, LJ/N;->MfCsXMRr()J

    move-result-wide v12

    invoke-virtual {v14, v12, v13}, Llt8;->e(J)V

    goto/16 :goto_8c2

    :pswitch_a1d
    move-object/from16 v17, v1

    move-object/from16 p7, v3

    iget-object v1, v2, Lmrk;->j:Li53;

    check-cast v1, Lcom/opera/android/bookmarks/h;

    iget-object v3, v0, Libf;->b:[Lfr;

    const/16 v38, 0x2

    aget-object v9, v3, v38

    iget v12, v9, Lfr;->b:I

    iget v9, v9, Lfr;->c:I

    const/16 v18, 0x3

    aget-object v3, v3, v18

    iget v13, v3, Lfr;->b:I

    iget v3, v3, Lfr;->c:I

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Lvl3;

    const/4 v15, 0x1

    invoke-direct {v1, v15}, Llt8;-><init>(B)V

    invoke-static {v14, v12, v9, v13, v3}, LJ/N;->MWt5ZYqx(IIIII)J

    move-result-wide v12

    invoke-virtual {v1, v12, v13}, Llt8;->e(J)V

    move-object v14, v1

    goto :goto_a5e

    :pswitch_a49
    move-object/from16 v17, v1

    move-object/from16 p7, v3

    move/from16 v38, v12

    new-instance v14, Lxk3;

    iget-object v1, v13, Lw6j;->a:Ljava/lang/Object;

    check-cast v1, Landroidx/coordinatorlayout/widget/CoordinatorLayout;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v3, v15, Lfe5;->b:Lqdc;

    invoke-direct {v14, v1, v3}, Lxk3;-><init>(Landroid/content/Context;Ltcc;)V

    :goto_a5e
    invoke-virtual {v10, v14, v5, v8}, Lcom/opera/android/suggestion/SuggestionManagerBridge;->a(Llt8;Lkqk;Z)V

    invoke-virtual {v6}, Lmqk;->f()V

    move-object/from16 v3, p7

    move-object v0, v7

    move/from16 v10, v16

    move-object/from16 v1, v17

    move/from16 v12, v38

    const/4 v14, 0x1

    goto/16 :goto_4cb

    :cond_a70
    iget-object v0, v2, Lmrk;->y:Lw6j;

    iget-object v0, v0, Lw6j;->e:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/FadingRecyclerView;

    iget-object v1, v2, Lmrk;->e:Lode;

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljm7;

    if-eqz v1, :cond_a83

    iget-boolean v6, v1, Ljm7;->b:Z

    goto :goto_a84

    :cond_a83
    const/4 v6, 0x0

    :goto_a84
    iget-object v1, v2, Lmrk;->E:Lflb;

    invoke-virtual {v1, v0}, Lflb;->e(Landroidx/recyclerview/widget/RecyclerView;)V

    new-instance v1, Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    invoke-direct {v1}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>()V

    const/4 v13, 0x1

    if-ne v6, v13, :cond_a97

    invoke-virtual {v1, v13}, Landroidx/recyclerview/widget/LinearLayoutManager;->setStackFromEnd(Z)V

    :cond_a97
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->C0(Landroidx/recyclerview/widget/f;)V

    new-instance v1, Lvm3;

    invoke-direct {v1, v6, v2}, Lvm3;-><init>(ILmrk;)V

    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->o(Loph;)V

    new-instance v1, Lzz7;

    new-instance v3, Lark;

    invoke-direct {v3, v2, v13}, Lark;-><init>(Lmrk;B)V

    invoke-direct {v1, v0, v3}, Lzz7;-><init>(Landroidx/recyclerview/widget/RecyclerView;Lark;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    iget-object v0, v2, Lmrk;->y:Lw6j;

    iget-object v0, v0, Lw6j;->d:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/search/SuggestionsListWrapper;

    new-instance v1, Lark;

    const/4 v15, 0x0

    invoke-direct {v1, v2, v15}, Lark;-><init>(Lmrk;B)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, v2, Lmrk;->y:Lw6j;

    iget-object v0, v0, Lw6j;->d:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/search/SuggestionsListWrapper;

    iget-object v1, v2, Lmrk;->C:Lhqk;

    new-instance v3, Lwpk;

    const/4 v13, 0x1

    invoke-direct {v3, v1, v13}, Lwpk;-><init>(Lhqk;B)V

    iput-object v3, v0, Lcom/opera/android/search/SuggestionsListWrapper;->a:Lwpk;

    iget-object v0, v2, Lmrk;->u:Lfe5;

    iget-object v1, v0, Lfe5;->a:Lpde;

    iget-object v2, v0, Lfe5;->c:Lk9;

    invoke-virtual {v1, v2}, Lekc;->k(Lf7f;)V

    invoke-virtual {v0}, Lfe5;->b()V

    return-void

    :cond_adb
    move v7, v6

    :cond_adc
    invoke-virtual {v4}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v7}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    throw v31

    :pswitch_data_aec
    .packed-switch 0x0
        :pswitch_7b6
        :pswitch_78d
        :pswitch_765
        :pswitch_73b
        :pswitch_711
        :pswitch_6e7
        :pswitch_6be
        :pswitch_69e
        :pswitch_674
        :pswitch_64a
        :pswitch_620
        :pswitch_5f6
        :pswitch_5cc
        :pswitch_5a2
        :pswitch_580
        :pswitch_559
        :pswitch_532
        :pswitch_50d
        :pswitch_4e2
    .end packed-switch

    :pswitch_data_b16
    .packed-switch 0x0
        :pswitch_a49
        :pswitch_a1d
        :pswitch_a09
        :pswitch_a01
        :pswitch_9d6
        :pswitch_99c
        :pswitch_994
        :pswitch_98c
        :pswitch_973
        :pswitch_95d
        :pswitch_943
        :pswitch_91b
        :pswitch_90f
        :pswitch_8cf
        :pswitch_8c6
        :pswitch_88f
        :pswitch_873
        :pswitch_850
        :pswitch_7f9
    .end packed-switch
.end method


# virtual methods
.method public final a()Lisj;
    .registers 1

    iget-object p0, p0, Lmrk;->t:Lisj;

    return-object p0
.end method

.method public final b()V
    .registers 2

    invoke-virtual {p0}, Lmrk;->c()Z

    move-result v0

    if-eqz v0, :cond_d

    iget-object p0, p0, Lmrk;->P:Lc1f;

    if-eqz p0, :cond_d

    invoke-virtual {p0}, Lc1f;->b()V

    :cond_d
    return-void
.end method

.method public final c()Z
    .registers 1

    iget-object p0, p0, Lmrk;->P:Lc1f;

    if-eqz p0, :cond_9

    iget-boolean p0, p0, Lc1f;->c:Z

    xor-int/lit8 p0, p0, 0x1

    return p0

    :cond_9
    const/4 p0, 0x0

    return p0
.end method

.method public final d()Z
    .registers 1

    iget-object p0, p0, Lmrk;->y:Lw6j;

    iget-object p0, p0, Lw6j;->a:Ljava/lang/Object;

    check-cast p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;

    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    move-result p0

    if-nez p0, :cond_e

    const/4 p0, 0x1

    return p0

    :cond_e
    const/4 p0, 0x0

    return p0
.end method

.method public final e()Lfyj;
    .registers 11

    iget-object v0, p0, Lmrk;->b:Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lmrk;->h:Liv7;

    invoke-virtual {v1}, Liv7;->b()Z

    move-result v1

    iget-object v2, p0, Lmrk;->o:Lm0a;

    iget-object v2, v2, Lm0a;->e:Lpde;

    invoke-virtual {v2}, Lekc;->g()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ll0a;

    iget-object v3, p0, Lmrk;->e:Lode;

    invoke-virtual {v3}, Lekc;->g()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljm7;

    if-eqz v3, :cond_24

    iget-boolean v3, v3, Ljm7;->b:Z

    :goto_22
    move v9, v3

    goto :goto_26

    :cond_24
    const/4 v3, 0x0

    goto :goto_22

    :goto_26
    iget-object p0, p0, Lmrk;->v:Ligi;

    invoke-virtual {p0}, Ligi;->O()Z

    move-result p0

    const/high16 v3, 0x42d80000    # 108.0f

    const/high16 v4, 0x42400000    # 48.0f

    if-eqz p0, :cond_4a

    move p0, v4

    new-instance v4, Lfyj;

    sget-object v5, Ldyj;->a:Ldyj;

    new-instance v7, Ljxj;

    invoke-static {v0, p0}, Lz7h;->h(Landroid/content/Context;F)I

    move-result p0

    invoke-static {v0, v3}, Lz7h;->h(Landroid/content/Context;F)I

    move-result v0

    invoke-direct {v7, p0, v0}, Ljxj;-><init>(II)V

    const/4 v8, 0x0

    const/4 v6, 0x4

    invoke-direct/range {v4 .. v9}, Lfyj;-><init>(Ldyj;ILjxj;ZI)V

    return-object v4

    :cond_4a
    move p0, v4

    if-eqz v1, :cond_83

    invoke-static {v0}, Lr9n;->i(Landroid/content/Context;)Landroid/graphics/Rect;

    move-result-object v1

    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    move-result v1

    invoke-static {v1, v0}, Lddh;->s(ILandroid/content/Context;)Lgpj;

    move-result-object v1

    sget-object v2, Lgpj;->a:Lgpj;

    invoke-virtual {v1}, Lgpj;->d()Z

    move-result v1

    if-eqz v1, :cond_6c

    new-instance v4, Lfyj;

    sget-object v5, Ldyj;->a:Ldyj;

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v6, 0x2

    invoke-direct/range {v4 .. v9}, Lfyj;-><init>(Ldyj;ILjxj;ZI)V

    return-object v4

    :cond_6c
    new-instance v4, Lfyj;

    sget-object v5, Ldyj;->a:Ldyj;

    new-instance v7, Ljxj;

    invoke-static {v0, p0}, Lz7h;->h(Landroid/content/Context;F)I

    move-result p0

    invoke-static {v0, v3}, Lz7h;->h(Landroid/content/Context;F)I

    move-result v0

    invoke-direct {v7, p0, v0}, Ljxj;-><init>(II)V

    const/4 v8, 0x0

    const/4 v6, 0x4

    invoke-direct/range {v4 .. v9}, Lfyj;-><init>(Ldyj;ILjxj;ZI)V

    return-object v4

    :cond_83
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v4, Lfyj;

    sget-object v5, Ldyj;->b:Ldyj;

    const/4 v7, 0x0

    const/4 v8, 0x1

    const/4 v6, 0x1

    invoke-direct/range {v4 .. v9}, Lfyj;-><init>(Ldyj;ILjxj;ZI)V

    return-object v4
.end method

.method public final f()V
    .registers 16

    invoke-virtual {p0}, Lmrk;->c()Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    :cond_7
    iget-object v0, p0, Lmrk;->P:Lc1f;

    const/4 v1, 0x0

    if-eqz v0, :cond_1c

    invoke-virtual {v0, v1}, Lc1f;->f(Z)V

    iget-object v2, v0, Lc1f;->g:Ljava/lang/Object;

    check-cast v2, Lvqk;

    iput-boolean v1, v2, Lvqk;->w:Z

    iget-object v0, v0, Lc1f;->d:Ljava/lang/Object;

    check-cast v0, Leyi;

    invoke-virtual {v0}, Leyi;->j()V

    :cond_1c
    iget-object v0, p0, Lmrk;->y:Lw6j;

    iget-object v2, v0, Lw6j;->e:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/custom_views/FadingRecyclerView;

    iget-object v3, p0, Lmrk;->C:Lhqk;

    const/4 v4, 0x1

    invoke-virtual {v2, v3, v4}, Landroidx/recyclerview/widget/RecyclerView;->M0(Landroidx/recyclerview/widget/d;Z)V

    new-instance v8, Leyi;

    const/4 v2, 0x6

    invoke-direct {v8, p0, v2}, Leyi;-><init>(Lmrk;B)V

    iput-object v8, v3, Lhqk;->x:Liqk;

    iget-object v2, v3, Lhqk;->u:Lnv6;

    iget-object v2, v2, Lnv6;->a:Ljava/lang/Object;

    check-cast v2, Landroid/util/SparseArray;

    invoke-virtual {v2}, Landroid/util/SparseArray;->size()I

    move-result v5

    move v6, v1

    :goto_3b
    if-ge v6, v5, :cond_4c

    invoke-virtual {v2, v6}, Landroid/util/SparseArray;->keyAt(I)I

    invoke-virtual {v2, v6}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lodb;

    invoke-interface {v7}, Lodb;->reset()V

    add-int/lit8 v6, v6, 0x1

    goto :goto_3b

    :cond_4c
    new-instance v5, Lc1f;

    iget-object v2, v0, Lw6j;->d:Ljava/lang/Object;

    move-object v9, v2

    check-cast v9, Lcom/opera/android/search/SuggestionsListWrapper;

    iget-object v0, v0, Lw6j;->e:Ljava/lang/Object;

    move-object v10, v0

    check-cast v10, Lcom/opera/android/custom_views/FadingRecyclerView;

    iget-object v0, p0, Lmrk;->e:Lode;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljm7;

    if-eqz v0, :cond_66

    iget-boolean v0, v0, Ljm7;->a:Z

    move v13, v0

    goto :goto_67

    :cond_66
    move v13, v1

    :goto_67
    iget-object v0, p0, Lmrk;->v:Ligi;

    iget-object v0, v0, Ligi;->f:Ljava/lang/Object;

    check-cast v0, Lode;

    new-instance v2, Lr4k;

    const/16 v6, 0x16

    invoke-direct {v2, v6}, Lr4k;-><init>(B)V

    invoke-static {v0, v2}, Lb8h;->j(Lekc;Lkotlin/jvm/functions/Function1;)Lh42;

    move-result-object v14

    iget-object v6, p0, Lmrk;->u:Lfe5;

    iget-object v7, p0, Lmrk;->l:Lx5f;

    iget-object v11, p0, Lmrk;->J:Lcom/opera/android/suggestion/SuggestionManagerBridge;

    iget-object v12, p0, Lmrk;->f:Lumi;

    invoke-direct/range {v5 .. v14}, Lc1f;-><init>(Lndc;Lx5f;Leyi;Landroid/view/ViewGroup;Landroidx/recyclerview/widget/RecyclerView;Lcom/opera/android/suggestion/SuggestionManagerBridge;Lumi;ZLh42;)V

    iput-object v5, p0, Lmrk;->P:Lc1f;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget-object v2, v3, Lhqk;->s:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_90
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_ac

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/ref/WeakReference;

    invoke-virtual {v3}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lpa3;

    if-eqz v3, :cond_a8

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_90

    :cond_a8
    invoke-interface {v2}, Ljava/util/Iterator;->remove()V

    goto :goto_90

    :cond_ac
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    move v3, v1

    :cond_b1
    :goto_b1
    if-ge v3, v2, :cond_d9

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    add-int/lit8 v3, v3, 0x1

    check-cast v5, Landroidx/recyclerview/widget/i;

    iget-object v5, v5, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v5}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v6

    invoke-virtual {v6}, Landroid/view/ViewPropertyAnimator;->cancel()V

    invoke-virtual {v5}, Landroid/view/View;->clearAnimation()V

    invoke-virtual {v5}, Landroid/view/View;->hasTransientState()Z

    move-result v6

    if-eqz v6, :cond_b1

    new-instance v6, Lgpk;

    const/4 v7, 0x3

    invoke-direct {v6, v7}, Lgpk;-><init>(B)V

    const-class v7, Landroid/view/View;

    invoke-static {v5, v7, v6}, Lq9n;->J(Landroid/view/View;Ljava/lang/Class;Lp9n;)V

    goto :goto_b1

    :cond_d9
    iget-object v0, p0, Lmrk;->I:Lirk;

    iput-boolean v1, v0, Lirk;->a:Z

    iget-object v0, p0, Lmrk;->K:Lj55;

    iput-boolean v1, v0, Lj55;->l:Z

    iget v2, v0, Lj55;->m:I

    const/4 v3, 0x2

    if-lt v2, v3, :cond_eb

    const/4 v2, 0x0

    iput-object v2, v0, Lj55;->o:Landroid/content/ClipDescription;

    iput v1, v0, Lj55;->m:I

    :cond_eb
    iput-boolean v4, v0, Lj55;->n:Z

    iget-object v0, p0, Lmrk;->H:Lxpm;

    iget-object v0, v0, Lxpm;->a:Lcom/opera/android/widget/UrlFieldEditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lmrk;->i(Ljava/lang/String;)V

    return-void
.end method

.method public final g()V
    .registers 4

    iget-boolean v0, p0, Lmrk;->V:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x1

    iput-boolean v0, p0, Lmrk;->V:Z

    iget-object v0, p0, Lmrk;->y:Lw6j;

    iget-object v0, v0, Lw6j;->d:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/search/SuggestionsListWrapper;

    new-instance v1, Lerk;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lerk;-><init>(Lmrk;B)V

    invoke-virtual {v0, v1}, Landroid/view/View;->postOnAnimation(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final h(Lbsi;)V
    .registers 30

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual {v0}, Lmrk;->d()Z

    move-result v2

    if-nez v2, :cond_436

    iget-object v2, v0, Lmrk;->h:Liv7;

    const/4 v3, 0x0

    if-eqz v1, :cond_16

    iget-object v4, v1, Lbsi;->a:Leri;

    if-eqz v4, :cond_16

    invoke-virtual {v2, v4, v3}, Liv7;->e(Leri;Z)Z

    :cond_16
    iget v4, v2, Liv7;->l:I

    const/4 v5, 0x1

    add-int/2addr v4, v5

    iput v4, v2, Liv7;->l:I

    iget-object v2, v0, Lmrk;->A:Lwih;

    iget-object v4, v2, Lwih;->a:Lj4c;

    invoke-virtual {v4}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v4

    move-object v9, v4

    check-cast v9, Lyu4;

    new-instance v4, Lo8f;

    const/16 v6, 0x1c

    invoke-direct {v4, v2, v6}, Lo8f;-><init>(Ljava/lang/Object;B)V

    iget-object v2, v9, Lyu4;->e:Lmfj;

    const/4 v13, 0x0

    if-eqz v2, :cond_3c

    new-instance v6, Lt0i;

    invoke-direct {v6, v2}, Lt0i;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v4, v6}, Lo8f;->run(Ljava/lang/Object;)V

    goto :goto_67

    :cond_3c
    new-instance v10, Lwx;

    const/16 v2, 0x19

    invoke-direct {v10, v4, v9, v2}, Lwx;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object v2, v9, Lyu4;->d:Lb59;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/SharedPreferences;

    const-string v4, "last-language-header"

    invoke-interface {v2, v4, v13}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    iget-object v2, v9, Lyu4;->a:Lhw3;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    move-object v7, v2

    check-cast v7, Lufj;

    iget-object v2, v9, Lyu4;->c:La64;

    new-instance v6, Ls71;

    const/4 v11, 0x0

    const/4 v12, 0x5

    invoke-direct/range {v6 .. v12}, Ls71;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    const/4 v4, 0x3

    invoke-static {v2, v13, v13, v6, v4}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    :goto_67
    iget-object v2, v0, Lmrk;->y:Lw6j;

    iget-object v2, v2, Lw6j;->a:Ljava/lang/Object;

    check-cast v2, Landroidx/coordinatorlayout/widget/CoordinatorLayout;

    invoke-virtual {v2, v3}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->setVisibility(I)V

    iget-object v2, v0, Lmrk;->z:Leyi;

    iput-boolean v3, v2, Leyi;->b:Z

    iget-object v4, v2, Leyi;->d:Ljava/lang/Object;

    check-cast v4, Lmrk;

    iget-object v6, v4, Lmrk;->b:Landroid/view/ViewGroup;

    iget-object v2, v2, Leyi;->c:Ljava/lang/Object;

    check-cast v2, Lqlk;

    invoke-virtual {v6, v2}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    iget-object v2, v4, Lmrk;->y:Lw6j;

    iget-object v6, v2, Lw6j;->a:Ljava/lang/Object;

    check-cast v6, Landroidx/coordinatorlayout/widget/CoordinatorLayout;

    invoke-virtual {v6}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v6

    if-nez v6, :cond_96

    iget-object v4, v4, Lmrk;->b:Landroid/view/ViewGroup;

    iget-object v2, v2, Lw6j;->a:Ljava/lang/Object;

    check-cast v2, Landroidx/coordinatorlayout/widget/CoordinatorLayout;

    invoke-virtual {v4, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    :cond_96
    iget-object v2, v0, Lmrk;->u:Lfe5;

    invoke-virtual {v2, v5}, Lfe5;->a(Z)V

    iget-object v2, v0, Lmrk;->P:Lc1f;

    if-eqz v2, :cond_e0

    invoke-virtual {v2, v5}, Lc1f;->f(Z)V

    iget-object v4, v2, Lc1f;->a:Ljava/lang/Object;

    check-cast v4, Lnga;

    iget v6, v4, Lnga;->a:I

    iget-object v7, v4, Lnga;->c:Ljava/lang/Object;

    check-cast v7, Landroid/view/ViewGroup;

    if-nez v6, :cond_b0

    move-object v6, v13

    goto :goto_d0

    :cond_b0
    iput v3, v4, Lnga;->a:I

    invoke-virtual {v7}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v6

    invoke-virtual {v6}, Landroid/view/ViewPropertyAnimator;->cancel()V

    invoke-virtual {v7}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v6

    iget v8, v4, Lnga;->a:I

    int-to-float v8, v8

    invoke-virtual {v6, v8}, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v6

    sget-object v8, Llf1;->l:Landroid/view/animation/PathInterpolator;

    invoke-virtual {v6, v8}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    move-result-object v6

    const-wide/16 v8, 0x96

    invoke-virtual {v6, v8, v9}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v6

    :goto_d0
    if-eqz v6, :cond_da

    iget v4, v4, Lnga;->b:F

    invoke-virtual {v7, v4}, Landroid/view/View;->setTranslationY(F)V

    invoke-virtual {v6}, Landroid/view/ViewPropertyAnimator;->start()V

    :cond_da
    iget-object v2, v2, Lc1f;->f:Ljava/lang/Object;

    check-cast v2, Ljqk;

    iput-boolean v3, v2, Ljqk;->k:Z

    :cond_e0
    iget-object v2, v0, Lmrk;->O:Lrn9;

    iput-boolean v5, v2, Lrn9;->b:Z

    iget-object v4, v2, Lrn9;->d:Ljava/lang/Object;

    check-cast v4, Lx5f;

    iget-object v2, v2, Lrn9;->c:Ljava/lang/Object;

    check-cast v2, Lpde;

    invoke-virtual {v2}, Lekc;->g()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Leri;

    invoke-interface {v2}, Leri;->l()Ljava/lang/String;

    move-result-object v2

    iget-boolean v6, v4, Lx5f;->h:Z

    if-eqz v6, :cond_116

    iget-object v6, v4, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v7

    new-instance v8, Lck0;

    invoke-direct {v8, v6, v7}, Lck0;-><init>(Lzpa;Lx56;)V

    invoke-virtual {v8}, Lck0;->d()Ltd0;

    move-result-object v6

    new-instance v8, Lzbe;

    const/16 v9, 0x16

    invoke-direct {v8, v9}, Lzbe;-><init>(B)V

    invoke-virtual {v6, v2, v8}, Ltd0;->e(Ljava/lang/String;Lkotlin/jvm/functions/Function1;)V

    invoke-virtual {v4, v7}, Lx5f;->U0(Lx56;)V

    :cond_116
    iget-object v2, v0, Lmrk;->G:Lrv7;

    iget-object v4, v2, Lrv7;->c:Landroid/widget/FrameLayout;

    iget-object v6, v2, Lrv7;->n:Lyv7;

    iget-object v7, v2, Lrv7;->m:Lhd;

    if-eqz v1, :cond_123

    iget-object v8, v1, Lbsi;->d:Ljava/util/List;

    goto :goto_124

    :cond_123
    move-object v8, v13

    :goto_124
    check-cast v8, Ljava/util/Collection;

    if-eqz v8, :cond_130

    invoke-interface {v8}, Ljava/util/Collection;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_130

    move v8, v3

    goto :goto_131

    :cond_130
    move v8, v5

    :goto_131
    if-eqz v8, :cond_2b2

    iget-object v9, v7, Lhd;->f:Ljava/lang/Object;

    check-cast v9, Liy1;

    iget-object v10, v7, Lhd;->e:Ljava/lang/Object;

    check-cast v10, Ljv3;

    invoke-virtual {v10}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lex0;

    iget-object v10, v10, Lex0;->d:Lpde;

    invoke-virtual {v10}, Lekc;->g()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/util/List;

    check-cast v10, Ljava/lang/Iterable;

    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v10}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :cond_154
    :goto_154
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_166

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    instance-of v15, v14, Ld52;

    if-eqz v15, :cond_154

    invoke-virtual {v11, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_154

    :cond_166
    invoke-virtual {v11}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v11

    xor-int/2addr v11, v5

    iput-boolean v11, v7, Lhd;->b:Z

    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v10}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :cond_176
    :goto_176
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_18b

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    move-object v14, v12

    check-cast v14, Lc52;

    instance-of v14, v14, Ld52;

    if-nez v14, :cond_176

    invoke-virtual {v11, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_176

    :cond_18b
    new-instance v10, Ljava/util/LinkedHashSet;

    invoke-direct {v10}, Ljava/util/LinkedHashSet;-><init>()V

    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v12

    move v14, v3

    :goto_195
    if-ge v14, v12, :cond_1a7

    invoke-virtual {v11, v14}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v15

    add-int/lit8 v14, v14, 0x1

    check-cast v15, Lc52;

    invoke-virtual {v15}, Lc52;->a()Ljava/lang/String;

    move-result-object v15

    invoke-interface {v10, v15}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_195

    :cond_1a7
    iget-object v12, v9, Liy1;->m:Lqde;

    invoke-virtual {v12}, Lekc;->g()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/Iterable;

    new-instance v14, Ljava/util/LinkedHashSet;

    invoke-direct {v14}, Ljava/util/LinkedHashSet;-><init>()V

    invoke-interface {v12}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :goto_1b8
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_1cc

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ljx1;

    invoke-interface {v15}, Ljx1;->getId()Ljava/lang/String;

    move-result-object v15

    invoke-interface {v14, v15}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_1b8

    :cond_1cc
    invoke-virtual {v10, v14}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_29a

    invoke-virtual {v9}, Liy1;->b()V

    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v10

    move v12, v3

    :goto_1da
    if-ge v12, v10, :cond_29a

    invoke-virtual {v11, v12}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v14

    add-int/lit8 v12, v12, 0x1

    check-cast v14, Lc52;

    if-eqz v14, :cond_296

    instance-of v15, v14, Le52;

    if-eqz v15, :cond_278

    check-cast v14, Le52;

    iget-object v15, v14, Le52;->b:Ljava/lang/String;

    iget-object v3, v14, Le52;->c:Ljava/lang/String;

    iget-object v5, v14, Le52;->d:Ljava/lang/String;

    iget-object v13, v14, Le52;->e:Ljava/lang/String;

    move-object/from16 v26, v4

    iget-object v4, v14, Le52;->f:Ljava/lang/String;

    iget-object v14, v14, Le52;->g:Ljava/lang/String;

    move-object/from16 v24, v4

    if-eqz v14, :cond_204

    new-instance v4, Lz92;

    invoke-direct {v4, v14}, Lz92;-><init>(Ljava/lang/String;)V

    goto :goto_205

    :cond_204
    const/4 v4, 0x0

    :goto_205
    const-string v14, "application/vnd.opera.x-page-context"

    invoke-static {v13, v14}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_21e

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v14

    move-object/from16 v22, v5

    new-instance v5, Ltx1;

    move/from16 v27, v8

    const/4 v8, 0x0

    invoke-direct {v5, v4, v14, v8, v8}, Ltx1;-><init>(Lz92;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)V

    const/16 v17, 0x0

    goto :goto_246

    :cond_21e
    move-object/from16 v22, v5

    move/from16 v27, v8

    sget-object v5, Lsnf;->c:Ljava/lang/String;

    new-instance v8, Ljava/io/File;

    new-instance v14, Ljava/io/File;

    invoke-direct {v14, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {v8, v14, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static {}, Lc5o;->m()Lc5o;

    move-result-object v5

    invoke-static {v8}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v14

    invoke-virtual {v14}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v5, v14, v13}, Lc5o;->o(Ljava/lang/String;Ljava/lang/String;)Lo29;

    move-result-object v5

    new-instance v14, Lqx1;

    invoke-direct {v14, v5, v8, v13}, Lqx1;-><init>(Lo29;Ljava/io/File;Ljava/lang/String;)V

    move-object/from16 v17, v5

    move-object v5, v14

    :goto_246
    sget-object v8, Lux1;->a:Lux1;

    iget-object v14, v9, Liy1;->m:Lqde;

    move-object/from16 v21, v3

    iget-object v3, v14, Lqde;->l:Ljava/util/ArrayList;

    move-object/from16 v25, v4

    new-instance v4, Lrx1;

    invoke-direct {v4, v15, v5, v8}, Lvx1;-><init>(Ljava/lang/String;Lwxe;Lux1;)V

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-static {v3}, Lkotlin/collections/CollectionsKt;->k0(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v3

    invoke-virtual {v14, v3}, Lekc;->r(Ljava/lang/Object;)V

    iget-object v3, v9, Liy1;->i:Li52;

    move-object/from16 v16, v15

    new-instance v15, Lh52;

    const/16 v19, 0x1

    const/16 v20, 0x0

    move-object/from16 v18, v8

    move-object/from16 v23, v13

    invoke-direct/range {v15 .. v25}, Lh52;-><init>(Ljava/lang/String;Lo29;Lux1;ZZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lz92;)V

    move-object/from16 v4, v16

    iget-object v3, v3, Li52;->a:Ljava/util/LinkedHashMap;

    invoke-interface {v3, v4, v15}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_290

    :cond_278
    move-object/from16 v26, v4

    move/from16 v27, v8

    instance-of v3, v14, Lf52;

    if-eqz v3, :cond_28c

    check-cast v14, Lf52;

    iget-object v3, v14, Lf52;->b:Ljava/lang/String;

    iget-object v4, v14, Lf52;->c:Ljava/lang/String;

    iget-object v5, v14, Lf52;->d:Landroid/net/Uri;

    invoke-virtual {v9, v5, v3, v4}, Liy1;->a(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_290

    :cond_28c
    instance-of v3, v14, Ld52;

    if-eqz v3, :cond_296

    :goto_290
    move-object/from16 v4, v26

    move/from16 v8, v27

    goto/16 :goto_1da

    :cond_296
    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_29a
    move-object/from16 v26, v4

    move/from16 v27, v8

    iget-object v2, v2, Lrv7;->w:Lpv7;

    if-eqz v2, :cond_2bd

    iget-object v2, v2, Lpv7;->b:Lha6;

    if-eqz v2, :cond_2bd

    iget-object v2, v2, Lha6;->m:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/custom_views/StylingImageCheckableWithText;

    if-eqz v2, :cond_2bd

    iget-boolean v3, v7, Lhd;->b:Z

    invoke-virtual {v2, v3}, Lcom/opera/android/custom_views/StylingImageCheckableWithText;->u(Z)V

    goto :goto_2bd

    :cond_2b2
    move-object/from16 v26, v4

    move/from16 v27, v8

    iget-object v2, v7, Lhd;->f:Ljava/lang/Object;

    check-cast v2, Liy1;

    invoke-virtual {v2}, Liy1;->b()V

    :cond_2bd
    :goto_2bd
    if-eqz v1, :cond_2c6

    iget-object v2, v1, Lbsi;->b:Ljava/lang/String;

    if-eqz v2, :cond_2c6

    invoke-virtual {v6, v2}, Lyv7;->k(Ljava/lang/String;)V

    :cond_2c6
    if-nez v27, :cond_3e4

    invoke-virtual/range {v26 .. v26}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lz5i;->r0(Landroid/content/Context;)Z

    move-result v2

    if-eqz v2, :cond_2db

    invoke-virtual/range {v26 .. v26}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lz5i;->v0(Landroid/content/Context;)V

    goto/16 :goto_3ef

    :cond_2db
    iget-object v2, v1, Lbsi;->d:Ljava/util/List;

    check-cast v2, Ljava/lang/Iterable;

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    const/4 v3, 0x0

    :goto_2e4
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3e4

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    add-int/lit8 v5, v3, 0x1

    if-ltz v3, :cond_3df

    check-cast v4, Lw92;

    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-eqz v4, :cond_3db

    instance-of v8, v4, Lu92;

    const-string v9, "-"

    if-eqz v8, :cond_35a

    iget-object v8, v7, Lhd;->f:Ljava/lang/Object;

    move-object v10, v8

    check-cast v10, Liy1;

    check-cast v4, Lu92;

    iget-object v8, v4, Lu92;->a:Landroid/net/Uri;

    iget-object v15, v4, Lu92;->b:Lo29;

    iget-object v14, v4, Lu92;->d:Ljava/lang/String;

    iget-object v4, v4, Lu92;->c:Ljava/lang/String;

    sget-object v11, Lux1;->a:Lux1;

    invoke-virtual {v10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v13, Lux1;->b:Lux1;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v11

    move-object/from16 v16, v2

    if-lez v3, :cond_331

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v11, v12}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    :goto_32f
    move-object v11, v2

    goto :goto_336

    :cond_331
    invoke-static {v11, v12}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v2

    goto :goto_32f

    :goto_336
    sget-object v2, Lo29;->k:Lo29;

    if-ne v15, v2, :cond_347

    invoke-virtual {v10, v11}, Liy1;->c(Ljava/lang/String;)Ljava/io/File;

    move-result-object v2

    new-instance v3, Lv12;

    invoke-direct {v3, v8, v2}, Lv12;-><init>(Landroid/net/Uri;Ljava/io/File;)V

    invoke-virtual {v10, v11, v3, v13}, Liy1;->e(Ljava/lang/String;Lo0g;Lux1;)V

    goto :goto_355

    :cond_347
    sget-object v2, Lsnf;->c:Ljava/lang/String;

    invoke-static {v2, v11, v4}, Lulp;->D(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;

    move-result-object v2

    new-instance v12, Lpy1;

    invoke-direct {v12, v8, v2}, Lpy1;-><init>(Landroid/net/Uri;Ljava/io/File;)V

    invoke-virtual/range {v10 .. v15}, Liy1;->d(Ljava/lang/String;Lpy1;Lux1;Ljava/lang/String;Lo29;)V

    :goto_355
    move/from16 v17, v5

    move-object v8, v6

    goto/16 :goto_3d4

    :cond_35a
    move-object/from16 v16, v2

    instance-of v2, v4, Ly92;

    if-eqz v2, :cond_3b6

    iget-object v2, v7, Lhd;->f:Ljava/lang/Object;

    move-object v10, v2

    check-cast v10, Liy1;

    check-cast v4, Ly92;

    iget-object v12, v4, Ly92;->a:Landroid/net/Uri;

    iget-object v13, v4, Ly92;->b:Ljava/lang/String;

    iget-object v14, v4, Ly92;->c:Ljava/lang/String;

    iget-object v2, v4, Ly92;->d:Lz92;

    sget-object v4, Lux1;->a:Lux1;

    invoke-virtual {v10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v4, Lux1;->b:Lux1;

    move/from16 v17, v5

    move-object v8, v6

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    if-lez v3, :cond_393

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v11, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    :goto_391
    move-object v11, v3

    goto :goto_398

    :cond_393
    invoke-static {v5, v6}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v3

    goto :goto_391

    :goto_398
    iget-object v3, v10, Liy1;->m:Lqde;

    iget-object v5, v3, Lqde;->l:Ljava/util/ArrayList;

    new-instance v6, Lsx1;

    new-instance v9, Ltx1;

    invoke-direct {v9, v2, v12, v13, v14}, Ltx1;-><init>(Lz92;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {v6, v11, v9, v4}, Lvx1;-><init>(Ljava/lang/String;Lwxe;Lux1;)V

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-static {v5}, Lkotlin/collections/CollectionsKt;->k0(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v4

    invoke-virtual {v3, v4}, Lekc;->r(Ljava/lang/Object;)V

    iget-object v15, v2, Lz92;->a:Ljava/lang/String;

    invoke-virtual/range {v10 .. v15}, Liy1;->j(Ljava/lang/String;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_3d4

    :cond_3b6
    move/from16 v17, v5

    move-object v8, v6

    instance-of v2, v4, Lv92;

    if-eqz v2, :cond_3db

    iget-object v2, v7, Lhd;->f:Ljava/lang/Object;

    check-cast v2, Liy1;

    check-cast v4, Lv92;

    iget-object v3, v4, Lv92;->a:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v2, v5, v4, v3}, Liy1;->a(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)V

    :goto_3d4
    move-object v6, v8

    move-object/from16 v2, v16

    move/from16 v3, v17

    goto/16 :goto_2e4

    :cond_3db
    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_3df
    const/4 v5, 0x0

    invoke-static {}, Lj95;->n()V

    throw v5

    :cond_3e4
    move-object v8, v6

    if-eqz v1, :cond_3ef

    iget-boolean v1, v1, Lbsi;->h:Z

    const/4 v2, 0x1

    if-ne v1, v2, :cond_3ef

    invoke-virtual {v8}, Lyv7;->b()V

    :cond_3ef
    :goto_3ef
    iget-object v1, v0, Lmrk;->q:Lx77;

    iget-object v2, v1, Lx77;->b:Ljava/lang/Object;

    check-cast v2, Lqim;

    invoke-virtual {v2, v0}, Lqim;->f(Lfm8;)Leq6;

    move-result-object v2

    iput-object v2, v1, Lx77;->d:Ljava/lang/Object;

    iget-object v1, v1, Lx77;->c:Ljava/lang/Object;

    check-cast v1, Lgm8;

    invoke-interface {v1}, Lgm8;->d()V

    iget-object v0, v0, Lmrk;->W:Lqt6;

    const/4 v2, 0x1

    iput-boolean v2, v0, Lqt6;->a:Z

    iget-object v1, v0, Lqt6;->f:Ljava/lang/Object;

    check-cast v1, Lmrk;

    iget-object v2, v1, Lmrk;->o:Lm0a;

    iget-object v3, v1, Lmrk;->G:Lrv7;

    iget-object v2, v2, Lm0a;->e:Lpde;

    invoke-virtual {v2}, Lekc;->g()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ll0a;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v2, v3, Lrv7;->u:Lpde;

    invoke-virtual {v2}, Lekc;->g()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Luv7;

    iget-boolean v2, v2, Luv7;->a:Z

    iput-boolean v2, v0, Lqt6;->b:Z

    iget-object v2, v3, Lrv7;->u:Lpde;

    invoke-virtual {v2}, Lekc;->g()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Luv7;

    iget-object v2, v2, Luv7;->b:Llbf;

    iput-object v2, v0, Lqt6;->d:Ljava/lang/Object;

    iget-boolean v2, v1, Lmrk;->w:Z

    if-nez v2, :cond_437

    :cond_436
    return-void

    :cond_437
    const/4 v2, 0x0

    iput-boolean v2, v1, Lmrk;->w:Z

    iget-object v0, v0, Lqt6;->c:Ljava/lang/Object;

    check-cast v0, Lbrk;

    invoke-virtual {v0}, Lbrk;->invoke()Ljava/lang/Object;

    return-void
.end method

.method public final i(Ljava/lang/String;)V
    .registers 14

    iget-object v0, p0, Lmrk;->y:Lw6j;

    iget-object v0, v0, Lw6j;->b:Ljava/lang/Object;

    check-cast v0, Lvs;

    iget-object v0, v0, Lvs;->b:Landroid/view/ViewGroup;

    check-cast v0, Lcom/opera/android/search/behavior/ScrollableToolbarLinearLayout;

    invoke-static {v0}, Lp37;->h0(Landroid/view/View;)V

    iget-object v0, p0, Lmrk;->i:Lk6l;

    iget-object v0, v0, Lk6l;->o:Lb2l;

    if-eqz v0, :cond_e9

    iget-object v1, p0, Lmrk;->P:Lc1f;

    if-eqz v1, :cond_e9

    iget-object p0, p0, Lmrk;->G:Lrv7;

    iget-object p0, p0, Lrv7;->u:Lpde;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Luv7;

    iget-object p0, p0, Luv7;->b:Llbf;

    sget-object v2, Llbf;->c:Llbf;

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-ne p0, v2, :cond_2b

    move v8, v4

    goto :goto_2c

    :cond_2b
    move v8, v3

    :goto_2c
    check-cast v0, Ld7l;

    iget-object p0, v0, Ld7l;->j:Le7l;

    invoke-interface {p0}, Lb9l;->m()Z

    move-result v9

    iget-object p0, v1, Lc1f;->g:Ljava/lang/Object;

    check-cast p0, Lvqk;

    iput-boolean v3, p0, Lvqk;->v:Z

    iget-object p0, v1, Lc1f;->f:Ljava/lang/Object;

    check-cast p0, Ljqk;

    iget-object v0, p0, Ljqk;->g:Ljava/lang/String;

    if-nez v0, :cond_44

    move v0, v4

    goto :goto_45

    :cond_44
    move v0, v3

    :goto_45
    iput-object p1, p0, Ljqk;->g:Ljava/lang/String;

    iput-boolean v4, p0, Ljqk;->i:Z

    iput-boolean v3, p0, Ljqk;->j:Z

    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    iget-object v5, p0, Ljqk;->b:Lcom/opera/android/suggestion/SuggestionManagerBridge;

    new-instance v10, Lkm5;

    invoke-direct {v10}, Ljava/lang/Object;-><init>()V

    iput-object p1, v10, Lkm5;->c:Ljava/lang/Object;

    iput-boolean v0, v10, Lkm5;->a:Z

    iput-boolean v9, v10, Lkm5;->b:Z

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p0, v10, Lkm5;->d:Ljava/lang/Object;

    iget-wide v5, v5, Lcom/opera/android/suggestion/SuggestionManagerBridge;->a:J

    move-object v7, p1

    invoke-static/range {v5 .. v11}, LJ/N;->MopJ6PdP(JLjava/lang/Object;ZZLjava/lang/Object;Ljava/lang/Object;)V

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v5

    iput-boolean v3, p0, Ljqk;->i:Z

    iget-boolean p1, p0, Ljqk;->j:Z

    if-eqz p1, :cond_7f

    iget-object p1, p0, Ljqk;->d:Leyi;

    iget-object v0, p0, Ljqk;->g:Ljava/lang/String;

    iget-object v7, p0, Ljqk;->e:Ljava/util/List;

    invoke-virtual {p1, v0, v7, v9}, Leyi;->k(Ljava/lang/String;Ljava/util/List;Z)Z

    :cond_7f
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v7

    sub-long v0, v5, v1

    sub-long/2addr v7, v5

    iget-boolean p1, p0, Ljqk;->k:Z

    if-nez p1, :cond_e9

    add-long v5, v0, v7

    const-wide/16 v9, 0xc8

    cmp-long p1, v5, v9

    if-gtz p1, :cond_98

    invoke-virtual {v11}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_e9

    :cond_98
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v2

    :goto_a1
    if-ge v3, v2, :cond_be

    invoke-virtual {v11, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    add-int/lit8 v3, v3, 0x1

    check-cast v5, Lkqk;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result v6

    if-lez v6, :cond_b6

    const/16 v6, 0x2c

    invoke-virtual {p1, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_b6
    invoke-virtual {v5}, Ljava/lang/Enum;->ordinal()I

    move-result v5

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    goto :goto_a1

    :cond_be
    iput-boolean v4, p0, Ljqk;->k:Z

    iget-object p0, p0, Ljqk;->c:Lx5f;

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-wide/16 v2, 0x3e8

    div-long/2addr v0, v2

    div-long/2addr v7, v2

    const-string v2, "query: <"

    const-string v3, "s, update: <"

    invoke-static {v0, v1, v2, v3}, Lp3p;->q(JLjava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, "s ("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, ")"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const/16 v0, 0x18

    invoke-virtual {p0, v0, p1}, Lx5f;->R(ILjava/lang/String;)V

    :cond_e9
    return-void
.end method
