.class public final Lc5k;
.super Lo8k;
.source "SourceFile"

# interfaces
.implements Lo0c;
.implements Lp5j;


# instance fields
.field public final A:Lbx8;

.field public final B:Lcom/opera/android/feed/FeedViewPager;

.field public final C:Lqt3;

.field public final D:Lt4k;

.field public final E:Lw4k;

.field public final F:Lbp;

.field public final G:Laba;

.field public final H:Lz8b;

.field public final I:Luvl;

.field public final J:Lv4k;

.field public final K:Lh5k;

.field public final L:Lx4k;

.field public final M:Lmni;

.field public final N:Lpde;

.field public O:Lnrl;

.field public final P:Lb5k;

.field public final Q:I

.field public final R:Lq9b;

.field public final S:Landroid/graphics/drawable/ColorDrawable;

.field public final T:Lykn;

.field public final U:Lpde;

.field public final V:Lpde;

.field public final W:Lkze;

.field public final X:Lru9;

.field public final Y:Lx53;

.field public Z:Z

.field public final a0:Z

.field public final b0:Lks3;

.field public c0:Lq8l;

.field public final d0:I

.field public final e:Lt8k;

.field public final e0:Lkze;

.field public final f:Lfwf;

.field public final f0:Lpde;

.field public final g:Lpde;

.field public final h:Lxt3;

.field public final i:Lbvl;

.field public final j:Lcom/opera/android/settings/SettingsManager;

.field public final k:Lnue;

.field public final l:Lcom/opera/android/feed/FeedScrollView;

.field public final m:Lcom/opera/android/custom_views/swipe_to_refresh/RefreshView;

.field public final n:Lorg/chromium/third_party/android/swiperefresh/SwipeRefreshLayout;

.field public final o:Landroidx/recyclerview/widget/RecyclerView;

.field public final p:Lcom/opera/android/feed/FeedScrollViewContentWrapper;

.field public final q:Lcv8;

.field public final r:Lcom/opera/android/feed/FeedContainerView;

.field public final s:Llqe;

.field public final t:Lkue;

.field public final u:Lx5f;

.field public final v:Lfqe;

.field public final w:Lete;

.field public final x:Llv3;

.field public final y:Lzxf;

.field public final z:Lp0c;


# direct methods
.method public constructor <init>(Lp6l;Lcom/opera/android/BrowserActivity;Lu8k;Lhw3;Lqim;Lxt3;Lbvl;Lr22;Lx5f;Lx5f;Losf;Lumi;Lekn;Ls6h;Lku5;Lxnh;Lcq5;Lipk;Lcom/opera/android/settings/SettingsManager;Lnue;Lfqe;Llv3;Lwt3;Lpde;Lpde;Lf1p;Lkze;Lykn;Lpde;Lfs6;Lkze;Lj4c;Lqnc;Lw6o;Lnr8;Landroid/view/View$OnLongClickListener;Lqr8;Lqq6;Lnv2;Ltlg;Lcom/opera/android/Lazy;Ljv3;Lhv3;Lrw3;Lgx8;Lj4c;Le7k;Lj4c;)V
    .registers 139

    move-object/from16 v0, p0

    move-object/from16 v2, p2

    move-object/from16 v13, p19

    move-object/from16 v14, p36

    move-object/from16 v15, p29

    invoke-direct {v0, v2, v15}, Lo8k;-><init>(Lcom/opera/android/BrowserActivity;Lpde;)V

    new-instance v3, Lpde;

    sget-object v1, Log;->a:Log;

    invoke-direct {v3, v1}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v3, v0, Lc5k;->g:Lpde;

    new-instance v1, Lt4k;

    invoke-direct {v1, v0}, Lt4k;-><init>(Lc5k;)V

    iput-object v1, v0, Lc5k;->D:Lt4k;

    new-instance v4, Lw4k;

    invoke-direct {v4, v0}, Lw4k;-><init>(Lc5k;)V

    iput-object v4, v0, Lc5k;->E:Lw4k;

    new-instance v5, Lbp;

    invoke-direct {v5}, Ljava/lang/Object;-><init>()V

    iput-object v5, v0, Lc5k;->F:Lbp;

    new-instance v5, Lmni;

    const/16 v6, 0x15

    invoke-direct {v5, v0, v6}, Lmni;-><init>(Ljava/lang/Object;B)V

    iput-object v5, v0, Lc5k;->M:Lmni;

    new-instance v6, Lpde;

    sget-object v7, Llaj;->e:Llaj;

    invoke-direct {v6, v7}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v6, v0, Lc5k;->N:Lpde;

    new-instance v7, Lb5k;

    invoke-direct {v7, v0}, Lb5k;-><init>(Lc5k;)V

    iput-object v7, v0, Lc5k;->P:Lb5k;

    new-instance v7, Lqie;

    const/16 v8, 0x18

    invoke-direct {v7, v0, v8}, Lqie;-><init>(Ljava/lang/Object;B)V

    new-instance v8, Lq9b;

    new-instance v9, Landroid/graphics/drawable/ColorDrawable;

    const/4 v10, 0x0

    invoke-direct {v9, v10}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-direct {v8, v9}, Lq9b;-><init>(Landroid/graphics/drawable/ColorDrawable;)V

    iput-object v8, v0, Lc5k;->R:Lq9b;

    new-instance v9, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v9, v10}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    iput-object v9, v0, Lc5k;->S:Landroid/graphics/drawable/ColorDrawable;

    new-instance v11, Lk26;

    invoke-direct {v11, v8, v9}, Lk26;-><init>(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    new-instance v8, Lkze;

    sget-object v9, Lvr8;->l:Lvr8;

    invoke-direct {v8, v9}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v8, v0, Lc5k;->W:Lkze;

    new-instance v9, Lx53;

    invoke-direct {v9, v0}, Lx53;-><init>(Lc5k;)V

    iput-object v9, v0, Lc5k;->Y:Lx53;

    sget-object v12, Lq8l;->c:Lq8l;

    iput-object v12, v0, Lc5k;->c0:Lq8l;

    new-instance v10, Lkze;

    move-object/from16 v17, v1

    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-direct {v10, v1}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v10, v0, Lc5k;->e0:Lkze;

    new-instance v15, Lpde;

    invoke-direct {v15, v1}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v15, v0, Lc5k;->f0:Lpde;

    new-instance v1, Lnjm;

    move-object/from16 v18, v4

    iget-object v4, v0, Lo8k;->c:Lcom/opera/android/browser/OperaPageRootView;

    invoke-direct {v1, v4}, Lnjm;-><init>(Landroid/view/View;)V

    sget-object v4, Lp6l;->b:Lp6l;

    move-object/from16 v19, v15

    move-object/from16 v15, p1

    if-ne v15, v4, :cond_b9

    iget-object v4, v0, Lo8k;->c:Lcom/opera/android/browser/OperaPageRootView;

    move-object/from16 v21, v1

    new-instance v1, Ltji;

    const/16 v15, 0x1d

    invoke-direct {v1, v0, v15}, Ltji;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v4}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v20

    if-eqz v20, :cond_b0

    invoke-virtual {v1, v4}, Ltji;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_bb

    :cond_b0
    new-instance v15, Li7n;

    invoke-direct {v15, v4, v1}, Li7n;-><init>(Landroid/view/View;Lkotlin/jvm/functions/Function1;)V

    invoke-virtual {v4, v15}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    goto :goto_bb

    :cond_b9
    move-object/from16 v21, v1

    :goto_bb
    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v2}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v1

    move-object v15, v1

    check-cast v15, Lcom/opera/android/OperaApplication;

    move-object v1, v5

    invoke-virtual/range {p3 .. p3}, Lu8k;->b()Lt8k;

    move-result-object v5

    iget-object v4, v5, Lt8k;->c:Ls8k;

    iput-object v5, v0, Lc5k;->e:Lt8k;

    move-object/from16 v22, v15

    new-instance v15, Lfwf;

    move-object/from16 v23, v1

    invoke-virtual {v2}, Lxd5;->getLifecycle()Ltcc;

    move-result-object v1

    invoke-direct {v15, v1}, Lfwf;-><init>(Ltcc;)V

    iput-object v15, v0, Lc5k;->f:Lfwf;

    move-object/from16 v1, p6

    iput-object v1, v0, Lc5k;->h:Lxt3;

    move-object/from16 v1, p7

    iput-object v1, v0, Lc5k;->i:Lbvl;

    iput-object v13, v0, Lc5k;->j:Lcom/opera/android/settings/SettingsManager;

    move-object/from16 v45, v15

    move-object/from16 v15, p20

    iput-object v15, v0, Lc5k;->k:Lnue;

    invoke-static/range {v22 .. v22}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v15

    iput-object v15, v0, Lc5k;->X:Lru9;

    iget-object v1, v0, Lo8k;->c:Lcom/opera/android/browser/OperaPageRootView;

    move-object/from16 v24, v4

    const v4, 0x7f0a047d

    invoke-virtual {v1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/opera/android/feed/FeedScrollView;

    iput-object v1, v0, Lc5k;->l:Lcom/opera/android/feed/FeedScrollView;

    iget-object v4, v0, Lo8k;->c:Lcom/opera/android/browser/OperaPageRootView;

    move-object/from16 p6, v1

    const v1, 0x7f0a047b

    invoke-virtual {v4, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/opera/android/custom_views/swipe_to_refresh/RefreshView;

    iput-object v1, v0, Lc5k;->m:Lcom/opera/android/custom_views/swipe_to_refresh/RefreshView;

    iget-object v1, v0, Lo8k;->c:Lcom/opera/android/browser/OperaPageRootView;

    const v4, 0x7f0a047a

    invoke-virtual {v1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lorg/chromium/third_party/android/swiperefresh/SwipeRefreshLayout;

    iput-object v1, v0, Lc5k;->n:Lorg/chromium/third_party/android/swiperefresh/SwipeRefreshLayout;

    new-instance v4, Lp4k;

    move-object/from16 v25, v15

    const/4 v15, 0x1

    invoke-direct {v4, v0, v15}, Lp4k;-><init>(Lc5k;B)V

    invoke-static {v1, v4}, Lq9n;->f(Landroid/view/View;Lr8n;)V

    iget-object v1, v0, Lo8k;->c:Lcom/opera/android/browser/OperaPageRootView;

    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v4, 0x7f070966

    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    iput v1, v0, Lc5k;->d0:I

    iget-object v1, v0, Lo8k;->c:Lcom/opera/android/browser/OperaPageRootView;

    const v4, 0x7f0a0475

    invoke-virtual {v1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroidx/recyclerview/widget/RecyclerView;

    iput-object v1, v0, Lc5k;->o:Landroidx/recyclerview/widget/RecyclerView;

    new-instance v4, Leqh;

    invoke-direct {v4, v1, v14}, Leqh;-><init>(Landroidx/recyclerview/widget/RecyclerView;Landroid/view/View$OnLongClickListener;)V

    iget-object v4, v0, Lo8k;->c:Lcom/opera/android/browser/OperaPageRootView;

    const v15, 0x7f0a0470

    invoke-virtual {v4, v15}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    move-object v15, v4

    check-cast v15, Lcom/opera/android/feed/FeedScrollViewContentWrapper;

    iput-object v15, v0, Lc5k;->p:Lcom/opera/android/feed/FeedScrollViewContentWrapper;

    invoke-virtual {v15, v14}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    iget-object v4, v0, Lo8k;->c:Lcom/opera/android/browser/OperaPageRootView;

    invoke-static {v4}, Lfsp;->m(Landroid/view/View;)Lpde;

    move-result-object v4

    move-object/from16 v27, v1

    iget-object v1, v0, Lo8k;->c:Lcom/opera/android/browser/OperaPageRootView;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    move-object/from16 v28, v6

    new-instance v6, Liv0;

    const/4 v14, 0x4

    invoke-direct {v6, v1, v14}, Liv0;-><init>(Landroid/content/Context;B)V

    invoke-static {v4, v6}, Lxf8;->V(Likc;Lkotlin/jvm/functions/Function1;)Ltsd;

    move-result-object v1

    invoke-static {v1}, Lxf8;->B(Likc;)Ltsd;

    move-result-object v6

    new-instance v1, Lks3;

    iget-object v4, v0, Lo8k;->c:Lcom/opera/android/browser/OperaPageRootView;

    invoke-virtual {v4}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual/range {p27 .. p27}, Lekc;->g()Ljava/lang/Object;

    move-result-object v29

    move-object/from16 v14, v29

    check-cast v14, Lqjn;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-object v4, v1, Lks3;->b:Ljava/lang/Object;

    move-object/from16 v4, p13

    iput-object v4, v1, Lks3;->a:Ljava/lang/Object;

    iput-object v6, v1, Lks3;->c:Ljava/lang/Object;

    iput-object v14, v1, Lks3;->d:Ljava/lang/Object;

    new-instance v4, Landroid/graphics/Rect;

    invoke-direct {v4}, Landroid/graphics/Rect;-><init>()V

    iput-object v4, v1, Lks3;->f:Ljava/lang/Object;

    new-instance v4, Landroid/graphics/Rect;

    invoke-direct {v4}, Landroid/graphics/Rect;-><init>()V

    iput-object v4, v1, Lks3;->g:Ljava/lang/Object;

    new-instance v4, Lkze;

    invoke-virtual {v1}, Lks3;->m()Lrmn;

    move-result-object v14

    invoke-direct {v4, v14}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v4, v1, Lks3;->h:Ljava/lang/Object;

    iput-object v1, v0, Lc5k;->b0:Lks3;

    iget-object v4, v1, Lks3;->h:Ljava/lang/Object;

    check-cast v4, Lkze;

    new-instance v14, Lo4k;

    move-object/from16 v29, v15

    const/4 v15, 0x2

    invoke-direct {v14, v0, v15}, Lo4k;-><init>(Lc5k;B)V

    invoke-static {v4, v3, v14}, La26;->T(Lekc;Likc;Lf7f;)V

    new-instance v14, Lz8b;

    new-instance v4, Ldnj;

    const/4 v15, 0x5

    invoke-direct {v4, v1, v15}, Ldnj;-><init>(Ljava/lang/Object;B)V

    new-instance v1, Lq4k;

    const/4 v15, 0x0

    invoke-direct {v1, v0, v15}, Lq4k;-><init>(Lc5k;B)V

    move-object/from16 v16, v1

    new-instance v1, Lr4k;

    invoke-direct {v1, v15}, Lr4k;-><init>(B)V

    const-string v15, "enable_search_shortcuts"

    invoke-static {v13, v15, v1}, Luyg;->e(Lcom/opera/android/settings/SettingsManager;Ljava/lang/String;Lkotlin/jvm/functions/Function1;)Ltsd;

    move-result-object v1

    invoke-static/range {p41 .. p41}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v15, Ls4k;

    move-object/from16 v13, p41

    move-object/from16 v32, v1

    const/4 v1, 0x0

    invoke-direct {v15, v13, v1}, Ls4k;-><init>(Lcom/opera/android/Lazy;B)V

    invoke-direct {v14}, Ljava/lang/Object;-><init>()V

    move/from16 v33, v1

    new-instance v1, Lpde;

    move-object/from16 v34, v3

    invoke-static/range {v33 .. v33}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-direct {v1, v3}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v1, v14, Lz8b;->a:Ljava/lang/Object;

    iget-object v1, v5, Lt8k;->c:Ls8k;

    sget-object v3, Ls8k;->c:Ls8k;

    const-string v13, "Missing required view with ID: "

    move-object/from16 v35, v15

    if-ne v1, v3, :cond_36b

    new-instance v1, Lu85;

    invoke-virtual/range {v35 .. v35}, Ls4k;->invoke()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Llg;

    invoke-virtual/range {p42 .. p42}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v35

    check-cast v35, Lfd;

    const/16 v41, 0x0

    sget-object v15, Lz8b;->c:Lixh;

    invoke-virtual {v15, v2}, Ly7h;->k(Landroid/content/Context;)I

    move-result v15

    move-object/from16 v42, v1

    sget-object v1, Lz8b;->d:Lixh;

    invoke-virtual {v1, v2}, Ly7h;->k(Landroid/content/Context;)I

    move-result v1

    move-object/from16 v33, v8

    move-object/from16 v49, v10

    move-object/from16 v62, v11

    move-object/from16 v60, v12

    move v11, v15

    move-object/from16 v61, v18

    move-object/from16 v18, v27

    move-object/from16 v8, p43

    move v12, v1

    move-object v15, v4

    move-object v10, v6

    move-object/from16 v1, v42

    move-object/from16 v4, p1

    move-object v6, v3

    move-object/from16 v3, v34

    move-object/from16 v34, p6

    move-object/from16 p6, v9

    move-object/from16 v9, v32

    move-object/from16 v32, v7

    move-object/from16 v7, v35

    invoke-direct/range {v1 .. v12}, Lu85;-><init>(Landroid/content/Context;Lpde;Lp6l;Lt8k;Llg;Lfd;Lhv3;Ltsd;Ltsd;II)V

    move-object v2, v3

    move-object/from16 v26, v5

    move-object v6, v10

    const/16 v27, 0x1

    iput-object v1, v14, Lz8b;->b:Ljava/lang/Object;

    invoke-virtual/range {v16 .. v16}, Lq4k;->invoke()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/ViewStub;

    invoke-virtual {v3}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    move-result-object v3

    const v4, 0x7f0a01b2

    invoke-static {v4, v3}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroidx/constraintlayout/widget/Barrier;

    if-eqz v5, :cond_35a

    const v4, 0x7f0a040d

    invoke-static {v4, v3}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    move-object/from16 v65, v5

    check-cast v65, Landroid/widget/FrameLayout;

    if-eqz v65, :cond_35a

    const v4, 0x7f0a040e

    invoke-static {v4, v3}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    move-object/from16 v66, v5

    check-cast v66, Landroid/widget/FrameLayout;

    if-eqz v66, :cond_35a

    const v4, 0x7f0a040f

    invoke-static {v4, v3}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    move-object/from16 v67, v5

    check-cast v67, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v67, :cond_35a

    const v4, 0x7f0a0410

    invoke-static {v4, v3}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    move-object/from16 v68, v5

    check-cast v68, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v68, :cond_35a

    const v4, 0x7f0a0411

    invoke-static {v4, v3}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    move-object/from16 v69, v5

    check-cast v69, Landroid/widget/LinearLayout;

    if-eqz v69, :cond_35a

    const v5, 0x7f0a04a5

    invoke-static {v5, v3}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object/from16 v70, v4

    check-cast v70, Landroid/widget/ImageView;

    if-eqz v70, :cond_356

    const v4, 0x7f0a052f

    invoke-static {v4, v3}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroidx/constraintlayout/widget/Barrier;

    if-eqz v5, :cond_352

    const v4, 0x7f0a0530

    invoke-static {v4, v3}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    move-object/from16 v71, v5

    check-cast v71, Landroid/widget/TextView;

    if-eqz v71, :cond_34e

    const v4, 0x7f0a0792

    invoke-static {v4, v3}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    move-object/from16 v72, v5

    check-cast v72, Landroidx/constraintlayout/widget/ConstraintLayout;

    if-eqz v72, :cond_35a

    const v5, 0x7f0a093b

    invoke-static {v5, v3}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object/from16 v73, v4

    check-cast v73, Landroid/widget/ImageView;

    if-eqz v73, :cond_34a

    const v4, 0x7f0a093c

    invoke-static {v4, v3}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroidx/constraintlayout/widget/Barrier;

    if-eqz v5, :cond_35a

    const v5, 0x7f0a094d

    invoke-static {v5, v3}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object/from16 v74, v4

    check-cast v74, Landroid/widget/ImageView;

    if-eqz v74, :cond_346

    const v4, 0x7f0a0a2b

    invoke-static {v4, v3}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    move-object/from16 v75, v5

    check-cast v75, Lcom/opera/android/custom_views/DropShadowFrameLayout;

    if-eqz v75, :cond_35a

    new-instance v63, Lp85;

    move-object/from16 v64, v3

    check-cast v64, Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-direct/range {v63 .. v75}, Lp85;-><init>(Landroidx/constraintlayout/widget/ConstraintLayout;Landroid/widget/FrameLayout;Landroid/widget/FrameLayout;Lcom/opera/android/custom_views/StylingTextView;Lcom/opera/android/custom_views/StylingTextView;Landroid/widget/LinearLayout;Landroid/widget/ImageView;Landroid/widget/TextView;Landroidx/constraintlayout/widget/ConstraintLayout;Landroid/widget/ImageView;Landroid/widget/ImageView;Lcom/opera/android/custom_views/DropShadowFrameLayout;)V

    move-object v7, v1

    move-object/from16 v8, v64

    new-instance v1, Lo85;

    iget-object v3, v15, Ldnj;->b:Ljava/lang/Object;

    check-cast v3, Lks3;

    iget-object v3, v3, Lks3;->h:Ljava/lang/Object;

    move-object v4, v3

    check-cast v4, Lkze;

    move-object/from16 v5, p29

    move-object/from16 v3, v63

    invoke-direct/range {v1 .. v7}, Lo85;-><init>(Lpde;Lp85;Lize;Lpde;Ltsd;Lu85;)V

    move-object v15, v6

    new-instance v3, Lz61;

    invoke-direct {v3}, Lz61;-><init>()V

    invoke-virtual {v8}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v4

    if-eqz v4, :cond_336

    invoke-virtual {v3, v8}, Lz61;->onViewAttachedToWindow(Landroid/view/View;)V

    :cond_336
    invoke-virtual {v8, v3}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    new-instance v3, Lk9;

    const/16 v4, 0x1a

    invoke-direct {v3, v14, v4}, Lk9;-><init>(Ljava/lang/Object;B)V

    iget-object v1, v1, Lo85;->d:Lpde;

    invoke-static {v1, v2, v3}, La26;->T(Lekc;Likc;Lf7f;)V

    goto :goto_386

    :cond_346
    const v15, 0x7f0a094d

    goto :goto_35b

    :cond_34a
    const v15, 0x7f0a093b

    goto :goto_35b

    :cond_34e
    const v15, 0x7f0a0530

    goto :goto_35b

    :cond_352
    const v15, 0x7f0a052f

    goto :goto_35b

    :cond_356
    const v15, 0x7f0a04a5

    goto :goto_35b

    :cond_35a
    move v15, v4

    :goto_35b
    invoke-virtual {v3}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v15}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v13, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    throw v41

    :cond_36b
    move-object/from16 v26, v5

    move-object v15, v6

    move-object/from16 v32, v7

    move-object/from16 v33, v8

    move-object/from16 v49, v10

    move-object/from16 v62, v11

    move-object/from16 v60, v12

    move-object/from16 v61, v18

    move-object/from16 v18, v27

    move-object/from16 v2, v34

    const/16 v27, 0x1

    const/16 v41, 0x0

    move-object/from16 v34, p6

    move-object/from16 p6, v9

    :goto_386
    iget-object v1, v14, Lz8b;->a:Ljava/lang/Object;

    move-object v9, v1

    check-cast v9, Lpde;

    iput-object v14, v0, Lc5k;->H:Lz8b;

    iget-object v1, v0, Lo8k;->c:Lcom/opera/android/browser/OperaPageRootView;

    const v3, 0x7f0a0524

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    move-object v4, v1

    check-cast v4, Lcom/opera/android/startpage/layout/feed_specific/HiddenStartPageContentHintView;

    new-instance v1, Laba;

    iget-object v10, v0, Lo8k;->a:Lpde;

    move-object/from16 v14, p2

    move-object/from16 v3, p12

    move-object/from16 v12, p19

    move-object/from16 v7, p20

    move-object/from16 v6, p24

    move-object/from16 v11, p25

    move-object/from16 v8, v19

    move-object/from16 v5, v25

    invoke-direct/range {v1 .. v12}, Laba;-><init>(Lpde;Lumi;Lcom/opera/android/startpage/layout/feed_specific/HiddenStartPageContentHintView;Lru9;Lpde;Lnue;Lpde;Lpde;Lpde;Lpde;Lcom/opera/android/settings/SettingsManager;)V

    move-object v4, v1

    move-object v1, v5

    move-object v3, v9

    move-object v9, v12

    iput-object v4, v0, Lc5k;->G:Laba;

    new-instance v5, Lr4k;

    move/from16 v7, v27

    invoke-direct {v5, v7}, Lr4k;-><init>(B)V

    invoke-static {v6, v5}, Lxf8;->V(Likc;Lkotlin/jvm/functions/Function1;)Ltsd;

    move-result-object v5

    invoke-static {v5}, Lxf8;->B(Likc;)Ltsd;

    move-result-object v25

    new-instance v5, Lshf;

    iget-object v8, v0, Lo8k;->c:Lcom/opera/android/browser/OperaPageRootView;

    invoke-virtual {v8}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v8

    invoke-direct {v5, v8, v2, v15}, Lshf;-><init>(Landroid/content/Context;Lpde;Ltsd;)V

    sget-object v8, Ls8k;->b:Ls8k;

    move-object/from16 v10, v24

    if-ne v10, v8, :cond_4b0

    iget-object v8, v0, Lo8k;->c:Lcom/opera/android/browser/OperaPageRootView;

    const v11, 0x7f0a0bd1

    invoke-virtual {v8, v11}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/view/ViewStub;

    invoke-virtual {v8}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    move-result-object v8

    const v11, 0x7f0a04a5

    invoke-static {v11, v8}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v12

    move-object/from16 v52, v12

    check-cast v52, Landroid/widget/ImageView;

    if-eqz v52, :cond_49d

    const v11, 0x7f0a0500

    invoke-static {v11, v8}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v12

    check-cast v12, Landroidx/constraintlayout/widget/Guideline;

    if-eqz v12, :cond_49d

    const v11, 0x7f0a0501

    invoke-static {v11, v8}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v12

    check-cast v12, Landroidx/constraintlayout/widget/Guideline;

    if-eqz v12, :cond_49d

    const v12, 0x7f0a052f

    invoke-static {v12, v8}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v11

    move-object/from16 v53, v11

    check-cast v53, Landroidx/constraintlayout/widget/Barrier;

    if-eqz v53, :cond_499

    const v11, 0x7f0a0530

    invoke-static {v11, v8}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v12

    check-cast v12, Landroid/widget/TextView;

    if-eqz v12, :cond_49d

    const v11, 0x7f0a0791

    invoke-static {v11, v8}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v12

    move-object/from16 v54, v12

    check-cast v54, Landroidx/constraintlayout/widget/ConstraintLayout;

    if-eqz v54, :cond_49d

    const v12, 0x7f0a093b

    invoke-static {v12, v8}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v11

    move-object/from16 v55, v11

    check-cast v55, Landroid/widget/ImageView;

    if-eqz v55, :cond_499

    const v11, 0x7f0a094d

    invoke-static {v11, v8}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v12

    move-object/from16 v56, v12

    check-cast v56, Landroid/widget/ImageView;

    if-eqz v56, :cond_49d

    new-instance v50, Lpt1;

    move-object/from16 v51, v8

    check-cast v51, Landroid/widget/FrameLayout;

    const/16 v57, 0x15

    invoke-direct/range {v50 .. v57}, Lpt1;-><init>(Landroid/widget/FrameLayout;Ljava/lang/Object;Ljava/lang/Object;Landroid/view/ViewGroup;Landroid/view/View;Landroid/view/View;B)V

    move-object/from16 v54, v15

    new-instance v15, Luvl;

    iget-object v8, v5, Lshf;->c:Ljava/lang/Object;

    check-cast v8, Lpde;

    invoke-virtual/range {p41 .. p41}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Llg;

    invoke-virtual/range {p42 .. p42}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lfd;

    move-object/from16 v7, v22

    move-object/from16 v22, v11

    move-object v11, v7

    move-object/from16 v19, p29

    move-object/from16 v24, p43

    move-object/from16 v16, v2

    move-object/from16 v20, v8

    move-object v13, v10

    move-object/from16 v7, v17

    move-object/from16 v10, v23

    move-object/from16 v27, v25

    move-object/from16 v25, v49

    move-object/from16 v17, v50

    move-object/from16 v8, p6

    move-object/from16 v23, v12

    move-object/from16 v12, v28

    move-object/from16 v28, v54

    invoke-direct/range {v15 .. v28}, Luvl;-><init>(Lpde;Lpt1;Landroidx/recyclerview/widget/RecyclerView;Lpde;Lpde;Lnjm;Llg;Lfd;Lhv3;Lkze;Lt8k;Ltsd;Ltsd;)V

    move-object/from16 v76, v16

    move-object/from16 v77, v21

    move-object/from16 v25, v27

    iput-object v15, v0, Lc5k;->I:Luvl;

    move-object/from16 v22, v11

    move-object/from16 v78, v13

    move-object/from16 v50, v15

    move-object v15, v8

    goto :goto_4c6

    :cond_499
    move-object/from16 v2, v41

    move v15, v12

    goto :goto_4a0

    :cond_49d
    move-object/from16 v2, v41

    move v15, v11

    :goto_4a0
    invoke-virtual {v8}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v15}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v13, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    throw v2

    :cond_4b0
    move-object/from16 v76, v2

    move-object/from16 v78, v10

    move-object/from16 v54, v15

    move-object/from16 v7, v17

    move-object/from16 v77, v21

    move-object/from16 v10, v23

    move-object/from16 v12, v28

    move-object/from16 v2, v41

    move-object/from16 v15, p6

    iput-object v2, v0, Lc5k;->I:Luvl;

    move-object/from16 v50, v2

    :goto_4c6
    new-instance v8, Lbv8;

    const/4 v11, 0x1

    invoke-direct {v8, v0, v11}, Lbv8;-><init>(Ljava/lang/Object;B)V

    new-instance v13, Lq4k;

    invoke-direct {v13, v0, v11}, Lq4k;-><init>(Lc5k;B)V

    move-object/from16 v2, v76

    move-object/from16 v11, v77

    invoke-static {v11, v2, v8, v13}, La26;->U(Lw6f;Likc;Ljava/lang/Object;Lkotlin/jvm/functions/Function0;)V

    new-instance v8, Lmgh;

    const/4 v13, 0x4

    invoke-direct {v8, v9, v1, v13}, Lmgh;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    move-object/from16 v16, v1

    new-instance v1, Lcv8;

    move-object/from16 v21, v11

    invoke-virtual/range {v22 .. v22}, Lcom/opera/android/OperaApplication;->N()Lzwk;

    move-result-object v11

    move-object/from16 p6, v1

    move-object/from16 v13, v22

    iget-object v1, v13, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object v2, v1, Lxv1;->Z0:Lj4c;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lswk;

    move-object/from16 p13, v2

    new-instance v2, Let3;

    move-object/from16 v17, v3

    const/16 v3, 0xa

    invoke-direct {v2, v13, v3}, Let3;-><init>(Lcom/opera/android/OperaApplication;B)V

    iget-object v3, v0, Lo8k;->c:Lcom/opera/android/browser/OperaPageRootView;

    move-object/from16 v19, v2

    const v2, 0x7f0a0474

    invoke-virtual {v3, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/opera/android/feed/FeedHeaderContainer;

    invoke-virtual {v13}, Lcom/opera/android/OperaApplication;->G()Lmdh;

    move-result-object v3

    iget-object v13, v1, Lxv1;->A0:Lj4c;

    invoke-virtual {v13}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lqdh;

    move-object/from16 v20, v1

    new-instance v1, Lne5;

    move-object/from16 v22, v2

    move-object/from16 v23, v3

    move-object/from16 v2, p3

    iget-object v3, v2, Lu8k;->d:Lode;

    invoke-virtual/range {p44 .. p44}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v24

    move-object/from16 v2, v24

    check-cast v2, Lpz6;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-object v9, v1, Lne5;->a:Ljava/lang/Object;

    iput-object v3, v1, Lne5;->b:Ljava/lang/Object;

    iput-object v6, v1, Lne5;->c:Ljava/lang/Object;

    iput-object v12, v1, Lne5;->d:Ljava/lang/Object;

    iput-object v2, v1, Lne5;->e:Ljava/lang/Object;

    move-object/from16 v55, v5

    move-object/from16 v5, p26

    iput-object v5, v1, Lne5;->f:Ljava/lang/Object;

    invoke-interface {v14}, Lndc;->getLifecycle()Ltcc;

    move-result-object v5

    invoke-static {v5}, Lcqp;->V(Ltcc;)Lddc;

    move-result-object v5

    move-object/from16 v24, v7

    new-instance v7, Lpde;

    move-object/from16 v44, v8

    invoke-virtual {v1}, Lne5;->s()Lv6k;

    move-result-object v8

    invoke-direct {v7, v8}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v7, v1, Lne5;->g:Ljava/lang/Object;

    new-instance v7, Lezg;

    const/4 v8, 0x5

    invoke-direct {v7, v1, v8}, Lezg;-><init>(Ljava/lang/Object;B)V

    new-instance v8, Ldnj;

    move-object/from16 v27, v10

    const/16 v10, 0xa

    invoke-direct {v8, v1, v10}, Ldnj;-><init>(Ljava/lang/Object;B)V

    invoke-interface {v14}, Lndc;->getLifecycle()Ltcc;

    move-result-object v10

    invoke-static {v9, v10, v7, v8}, Laib;->A(Lw6f;Ltcc;Ljava/lang/Object;Lkotlin/jvm/functions/Function0;)V

    new-instance v7, Lr4k;

    const/4 v8, 0x3

    invoke-direct {v7, v8}, Lr4k;-><init>(B)V

    invoke-static {v3, v7}, Lb8h;->j(Lekc;Lkotlin/jvm/functions/Function1;)Lh42;

    move-result-object v3

    invoke-static {v3}, Lb8h;->d(Lekc;)Lh42;

    move-result-object v3

    new-instance v7, Lqzg;

    const/16 v10, 0x10

    invoke-direct {v7, v1, v10}, Lqzg;-><init>(Ljava/lang/Object;B)V

    invoke-static {v3, v14, v7}, Lxf8;->g0(Lekc;Lndc;Lf7f;)V

    new-instance v3, Lt6k;

    const/4 v7, 0x0

    invoke-direct {v3, v1, v7}, Lt6k;-><init>(Lne5;B)V

    new-instance v8, Lt7d;

    invoke-direct {v8, v3, v10}, Lt7d;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v6, v14, v8}, Lekc;->j(Lndc;Lf7f;)V

    new-instance v3, Lt6k;

    const/4 v8, 0x1

    invoke-direct {v3, v1, v8}, Lt6k;-><init>(Lne5;B)V

    new-instance v8, Lt7d;

    invoke-direct {v8, v3, v10}, Lt7d;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v12, v14, v8}, Lekc;->j(Lndc;Lf7f;)V

    iget-object v2, v2, Lpz6;->h:Lrlh;

    invoke-interface {v14}, Lndc;->getLifecycle()Ltcc;

    move-result-object v3

    invoke-static {v2, v3}, Lscd;->D(Lf99;Ltcc;)Lj94;

    move-result-object v2

    new-instance v3, Lu6k;

    const/4 v8, 0x0

    invoke-direct {v3, v7, v8, v1}, Lu6k;-><init>(BLmt5;Ljava/lang/Object;)V

    invoke-static {v2, v5, v3}, Lw7d;->i(Lf99;Lnx5;Lkotlin/jvm/functions/Function2;)Ld3k;

    new-instance v2, Lq4k;

    const/4 v3, 0x2

    invoke-direct {v2, v0, v3}, Lq4k;-><init>(Lc5k;B)V

    invoke-virtual/range {p41 .. p41}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v5

    move-object/from16 v47, v5

    check-cast v47, Llg;

    iget-object v5, v0, Lo8k;->c:Lcom/opera/android/browser/OperaPageRootView;

    iget-object v5, v5, Lcom/opera/android/browser/OperaPageRootView;->h:Lpde;

    iget-object v4, v4, Laba;->i:Lpde;

    move-object/from16 v3, p1

    move-object/from16 v41, p3

    move-object/from16 v26, p4

    move-object/from16 v39, p7

    move-object/from16 v40, p8

    move-object/from16 v7, p10

    move-object/from16 v8, p11

    move-object/from16 v12, p13

    move-object/from16 v28, p31

    move-object/from16 v30, p33

    move-object/from16 v31, p34

    move-object/from16 v35, p36

    move-object/from16 v36, p37

    move-object/from16 v37, p39

    move-object/from16 v38, p40

    move-object/from16 v51, p42

    move-object/from16 v48, p43

    move-object/from16 v56, p45

    move-object/from16 v57, p46

    move-object/from16 v58, p47

    move-object/from16 v59, p48

    move-object/from16 v42, v1

    move-object/from16 v43, v2

    move-object/from16 v46, v4

    move-object/from16 v53, v5

    move-object v10, v9

    move-object v4, v14

    move-object/from16 v80, v15

    move-object/from16 v81, v16

    move-object/from16 v82, v17

    move-object/from16 v17, v18

    move-object/from16 v83, v20

    move-object/from16 v52, v21

    move-object/from16 v18, v22

    move-object/from16 v79, v27

    move-object/from16 v16, v29

    move-object/from16 v22, v32

    move-object/from16 v15, v34

    move-object/from16 v2, v76

    move-object/from16 v5, p5

    move-object/from16 v1, p6

    move-object/from16 v20, p14

    move-object/from16 v21, p15

    move-object/from16 v9, p16

    move-object/from16 v14, p20

    move-object/from16 v27, p30

    move-object/from16 v29, p32

    move-object/from16 v32, p35

    move-object/from16 v34, v13

    move-object/from16 v13, v19

    move-object/from16 p6, v24

    move-object/from16 v24, v33

    move-object/from16 v19, p18

    move-object/from16 v33, v23

    move-object/from16 v23, v6

    move-object/from16 v6, p9

    invoke-direct/range {v1 .. v59}, Lcv8;-><init>(Lpde;Lp6l;Lcom/opera/android/BrowserActivity;Lqim;Lx5f;Lx5f;Losf;Lxnh;Lcom/opera/android/settings/SettingsManager;Lzwk;Lswk;Let3;Lnue;Lcom/opera/android/feed/FeedScrollView;Lcom/opera/android/feed/FeedScrollViewContentWrapper;Landroidx/recyclerview/widget/RecyclerView;Lcom/opera/android/feed/FeedHeaderContainer;Lipk;Ls6h;Lku5;Lqie;Lpde;Lkze;Ltsd;Lhw3;Lfs6;Lkze;Lj4c;Lqnc;Lw6o;Lnr8;Lmdh;Lqdh;Landroid/view/View$OnLongClickListener;Lqr8;Lnv2;Ltlg;Lbvl;Lr22;Lu8k;Lne5;Lq4k;Lmgh;Lfwf;Lpde;Llg;Lhv3;Lkze;Luvl;Ljv3;Lnjm;Lpde;Ltsd;Lshf;Lgx8;Lj4c;Le7k;Lj4c;)V

    move-object v3, v1

    move-object/from16 v32, v22

    move-object/from16 v13, v23

    move-object/from16 v1, v56

    iget-object v12, v1, Lgx8;->d:Lpde;

    iput-object v3, v0, Lc5k;->q:Lcv8;

    iget-object v3, v0, Lo8k;->c:Lcom/opera/android/browser/OperaPageRootView;

    const v4, 0x7f0a046f

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Lcom/opera/android/feed/FeedContainerView;

    iput-object v3, v0, Lc5k;->r:Lcom/opera/android/feed/FeedContainerView;

    iget-object v4, v0, Lo8k;->b:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v4}, Lcom/opera/android/BrowserActivity;->E0()Ldyf;

    move-result-object v14

    iget-object v4, v0, Lo8k;->c:Lcom/opera/android/browser/OperaPageRootView;

    const v5, 0x7f0a0763

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    iget-object v5, v0, Lo8k;->c:Lcom/opera/android/browser/OperaPageRootView;

    const v6, 0x7f0a0762

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;

    new-instance v6, Lkue;

    invoke-direct {v6, v4, v5}, Lkue;-><init>(Landroid/view/View;Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;)V

    iput-object v6, v0, Lc5k;->t:Lkue;

    new-instance v7, Llqe;

    invoke-interface/range {p7 .. p7}, Lbvl;->getState()Lpde;

    move-result-object v8

    new-instance v9, Lr4k;

    const/4 v10, 0x2

    invoke-direct {v9, v10}, Lr4k;-><init>(B)V

    invoke-static {v8, v9}, Lxf8;->V(Likc;Lkotlin/jvm/functions/Function1;)Ltsd;

    move-result-object v10

    iget-object v11, v1, Lgx8;->c:Lpde;

    move-object v1, v7

    move-object/from16 p1, v14

    move-object/from16 v8, v49

    move-object/from16 v7, v54

    move-object/from16 v9, v62

    move-object v14, v6

    move-object/from16 v6, v25

    invoke-direct/range {v1 .. v12}, Llqe;-><init>(Lpde;Lcom/opera/android/feed/FeedContainerView;Landroid/view/View;Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;Ltsd;Ltsd;Lkze;Lk26;Ltsd;Lpde;Lpde;)V

    move-object/from16 v49, v2

    move-object v2, v1

    move-object/from16 v1, v49

    move-object/from16 v49, v8

    iput-object v2, v0, Lc5k;->s:Llqe;

    move-object/from16 v5, p9

    iput-object v5, v0, Lc5k;->u:Lx5f;

    move-object/from16 v10, p21

    iput-object v10, v0, Lc5k;->v:Lfqe;

    move-object/from16 v2, v83

    iget-object v2, v2, Lxv1;->f0:Lj4c;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lete;

    iput-object v2, v0, Lc5k;->w:Lete;

    move-object/from16 v2, p22

    iput-object v2, v0, Lc5k;->x:Llv3;

    new-instance v2, Lz4k;

    const/4 v4, 0x0

    invoke-direct {v2, v0, v4}, Lz4k;-><init>(Ljava/lang/Object;B)V

    iput-object v2, v14, Lkue;->g:Lz4k;

    invoke-virtual/range {p1 .. p1}, Ldyf;->b()Lzxf;

    move-result-object v2

    iput-object v2, v0, Lc5k;->y:Lzxf;

    invoke-virtual/range {p2 .. p2}, Lcom/opera/android/BrowserActivity;->E0()Ldyf;

    move-result-object v6

    iget-object v6, v6, Ldyf;->b:Lay;

    invoke-virtual {v6}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lp0c;

    iput-object v6, v0, Lc5k;->z:Lp0c;

    iget-object v7, v0, Lo8k;->c:Lcom/opera/android/browser/OperaPageRootView;

    invoke-virtual {v7}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const/high16 v8, 0x41c00000    # 24.0f

    invoke-static {v8, v7}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v7

    iput v7, v0, Lc5k;->Q:I

    iput-object v13, v0, Lc5k;->U:Lpde;

    move-object/from16 v7, p25

    iput-object v7, v0, Lc5k;->V:Lpde;

    move-object/from16 v8, p28

    iput-object v8, v0, Lc5k;->T:Lykn;

    new-instance v8, Lo4k;

    const/4 v11, 0x3

    invoke-direct {v8, v0, v11}, Lo4k;-><init>(Lc5k;B)V

    move-object/from16 v11, v82

    invoke-static {v11, v1, v8}, La26;->T(Lekc;Likc;Lf7f;)V

    move-object/from16 v76, v1

    new-instance v1, Lbx8;

    move-object v8, v2

    iget-object v2, v0, Lo8k;->b:Lcom/opera/android/BrowserActivity;

    move-object/from16 v7, p12

    move-object/from16 v87, v3

    move-object/from16 v89, v6

    move-object/from16 v88, v8

    move-object/from16 v85, v9

    move-object v4, v14

    move-object/from16 v86, v15

    move-object/from16 v11, v32

    move-object/from16 v13, v49

    move-object/from16 v84, v76

    move-object/from16 v6, p10

    move-object/from16 v8, p17

    move-object/from16 v9, p19

    move-object/from16 v3, p20

    move-object/from16 v14, p38

    move-object v15, v12

    move-object/from16 v12, p36

    invoke-direct/range {v1 .. v15}, Lbx8;-><init>(Lcom/opera/android/BrowserActivity;Lnue;Lkue;Lx5f;Lx5f;Lumi;Lcq5;Lcom/opera/android/settings/SettingsManager;Lfqe;Lqie;Landroid/view/View$OnLongClickListener;Lkze;Lqq6;Lpde;)V

    iput-object v1, v0, Lc5k;->A:Lbx8;

    iget-object v2, v0, Lo8k;->c:Lcom/opera/android/browser/OperaPageRootView;

    const v3, 0x7f0a047e

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/opera/android/feed/FeedViewPager;

    iput-object v2, v0, Lc5k;->B:Lcom/opera/android/feed/FeedViewPager;

    new-instance v3, Ly4k;

    const/4 v15, 0x0

    invoke-direct {v3, v0, v15}, Ly4k;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v4, Lr2c;

    invoke-direct {v4, v2, v3}, Lr2c;-><init>(Lcom/opera/android/custom_views/LayoutDirectionViewPager;Le8n;)V

    invoke-virtual {v2, v4}, Landroidx/viewpager/widget/ViewPager;->addOnPageChangeListener(Le8n;)V

    new-instance v3, Lx4k;

    move-object/from16 v4, p23

    invoke-direct {v3, v0, v4}, Lx4k;-><init>(Lc5k;Lwt3;)V

    iput-object v3, v0, Lc5k;->L:Lx4k;

    invoke-virtual {v2, v1}, Lcom/opera/android/custom_views/LayoutDirectionViewPager;->setAdapter(Landroidx/viewpager/widget/PagerAdapter;)V

    new-instance v1, Lqt3;

    const/16 v2, 0x14

    move-object/from16 v4, p2

    invoke-direct {v1, v4, v2}, Lqt3;-><init>(Lcom/opera/android/BrowserActivity;B)V

    iput-object v1, v0, Lc5k;->C:Lqt3;

    new-instance v1, Lv4k;

    invoke-direct {v1, v0}, Lv4k;-><init>(Lc5k;)V

    iput-object v1, v0, Lc5k;->J:Lv4k;

    new-instance v2, Li4d;

    const/16 v3, 0x1d

    invoke-direct {v2, v0, v3}, Li4d;-><init>(Ljava/lang/Object;B)V

    move-object/from16 v3, v86

    iput-object v2, v3, Lcom/opera/android/feed/FeedScrollView;->H:Li4d;

    iget-object v2, v0, Lo8k;->c:Lcom/opera/android/browser/OperaPageRootView;

    move-object/from16 v4, v85

    invoke-virtual {v2, v4}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    iget-object v2, v0, Lo8k;->c:Lcom/opera/android/browser/OperaPageRootView;

    iget-object v2, v2, Lcom/opera/android/browser/OperaPageRootView;->d:Li7f;

    move-object/from16 v10, v79

    invoke-virtual {v2, v10}, Li7f;->b(Ljava/lang/Object;)Z

    new-instance v2, Lh5k;

    sget-object v4, Ls8k;->a:Ls8k;

    move-object/from16 v10, v78

    if-eq v10, v4, :cond_782

    sget-object v4, Lyul;->e:Lyul;

    goto :goto_784

    :cond_782
    sget-object v4, Lyul;->d:Lyul;

    :goto_784
    invoke-virtual/range {p25 .. p25}, Lekc;->g()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Llo3;

    iget-boolean v5, v5, Llo3;->a:Z

    if-eqz v5, :cond_791

    sget-object v5, Lp8l;->b:Lp8l;

    goto :goto_793

    :cond_791
    sget-object v5, Lp8l;->a:Lp8l;

    :goto_793
    sget-object v6, Lp8l;->b:Lp8l;

    if-ne v5, v6, :cond_7a0

    new-instance v12, Lq8l;

    sget-object v5, Ln8l;->a:Ln8l;

    invoke-direct {v12, v6, v5}, Lq8l;-><init>(Lp8l;Luyg;)V

    :goto_79e
    const/4 v7, 0x1

    goto :goto_7a3

    :cond_7a0
    move-object/from16 v12, v60

    goto :goto_79e

    :goto_7a3
    invoke-direct {v2, v4, v12, v7}, Lh5k;-><init>(Lyul;Lq8l;Z)V

    iput-object v2, v0, Lc5k;->K:Lh5k;

    iget-object v2, v0, Lo8k;->a:Lpde;

    new-instance v4, Lo4k;

    const/4 v13, 0x4

    invoke-direct {v4, v0, v13}, Lo4k;-><init>(Lc5k;B)V

    move-object/from16 v5, v84

    invoke-static {v2, v5, v4}, La26;->T(Lekc;Likc;Lf7f;)V

    invoke-virtual {v9, v0}, Lcom/opera/android/settings/SettingsManager;->a(Lp5j;)V

    new-instance v2, Lo4k;

    const/4 v8, 0x5

    invoke-direct {v2, v0, v8}, Lo4k;-><init>(Lc5k;B)V

    move-object/from16 v4, p27

    invoke-static {v4, v5, v2}, La26;->T(Lekc;Likc;Lf7f;)V

    new-instance v2, Lo4k;

    const/4 v4, 0x6

    invoke-direct {v2, v0, v4}, Lo4k;-><init>(Lc5k;B)V

    move-object/from16 v6, p24

    invoke-static {v6, v5, v2}, La26;->T(Lekc;Likc;Lf7f;)V

    new-instance v2, Lo4k;

    invoke-direct {v2, v0, v15}, Lo4k;-><init>(Lc5k;B)V

    move-object/from16 v11, p25

    invoke-static {v11, v5, v2}, La26;->T(Lekc;Likc;Lf7f;)V

    iget-object v2, v0, Lo8k;->c:Lcom/opera/android/browser/OperaPageRootView;

    new-instance v4, Lp4k;

    invoke-direct {v4, v0, v15}, Lp4k;-><init>(Lc5k;B)V

    invoke-static {v2, v4}, Lq9n;->e(Landroid/view/View;Lr8n;)V

    invoke-virtual {v3, v1}, Lcom/opera/android/feed/FeedScrollView;->F(Lile;)V

    invoke-interface/range {p7 .. p7}, Lbvl;->F()Lkze;

    move-result-object v2

    new-instance v3, Lu4k;

    invoke-direct {v3, v1, v15}, Lu4k;-><init>(Lv4k;B)V

    invoke-static {v2, v5, v3}, La26;->T(Lekc;Likc;Lf7f;)V

    invoke-interface/range {p7 .. p7}, Lbvl;->getState()Lpde;

    move-result-object v2

    new-instance v3, Lu4k;

    invoke-direct {v3, v1, v7}, Lu4k;-><init>(Lv4k;B)V

    invoke-static {v2, v5, v3}, La26;->T(Lekc;Likc;Lf7f;)V

    new-instance v2, Lz22;

    const/16 v3, 0x10

    invoke-direct {v2, v1, v3}, Lz22;-><init>(Ljava/lang/Object;B)V

    move-object/from16 v3, v87

    invoke-virtual {v3, v2}, Landroid/view/View;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    invoke-virtual {v1}, Lv4k;->b()V

    invoke-virtual/range {p6 .. p6}, Lt4k;->f()V

    move-object/from16 v1, p6

    move-object/from16 v8, v88

    invoke-virtual {v8, v1}, Lzxf;->F(Ljava/lang/Object;)V

    invoke-static/range {v61 .. v61}, Lac8;->c(Ljava/lang/Object;)V

    move-object/from16 v6, v89

    iget-object v1, v6, Lp0c;->c:Li7f;

    invoke-virtual {v1, v0}, Li7f;->b(Ljava/lang/Object;)Z

    iget-object v1, v6, Lp0c;->d:Ll0c;

    invoke-virtual {v0, v1}, Lc5k;->p(Ll0c;)V

    move-object/from16 v15, v80

    move-object/from16 v1, v81

    invoke-virtual {v1, v15}, Lru9;->a(Ln1;)V

    invoke-interface/range {p20 .. p20}, Lnue;->getVisibility()Lize;

    move-result-object v1

    new-instance v2, Lo4k;

    invoke-direct {v2, v0, v7}, Lo4k;-><init>(Lc5k;B)V

    invoke-static {v1, v5, v2}, La26;->T(Lekc;Likc;Lf7f;)V

    iput-boolean v7, v0, Lc5k;->a0:Z

    return-void
.end method


# virtual methods
.method public final M(Ljava/lang/String;)V
    .registers 3

    const-string v0, "speed_dial.enabled"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_11

    iget-object p1, p0, Lc5k;->J:Lv4k;

    invoke-virtual {p1}, Lv4k;->b()V

    invoke-virtual {p0}, Lc5k;->k()V

    return-void

    :cond_11
    const-string v0, "speed_dial.shape"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_22

    iget-object p1, p0, Lc5k;->W:Lkze;

    invoke-virtual {p0}, Lc5k;->d()Lvr8;

    move-result-object p0

    invoke-virtual {p1, p0}, Lekc;->r(Ljava/lang/Object;)V

    :cond_22
    return-void
.end method

.method public final a(Lmnf;)V
    .registers 8

    iget-object v0, p0, Lc5k;->V:Lpde;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Llo3;

    iget-boolean v0, v0, Llo3;->a:Z

    if-eqz v0, :cond_f

    sget-object v0, Lp8l;->b:Lp8l;

    goto :goto_11

    :cond_f
    sget-object v0, Lp8l;->a:Lp8l;

    :goto_11
    iget v1, p1, Lmnf;->c:I

    iget-object v2, p0, Lc5k;->T:Lykn;

    iget-object v3, v2, Lykn;->a:Ldu3;

    invoke-virtual {v3}, Ldu3;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lbvl;

    invoke-interface {v3}, Lbvl;->getState()Lpde;

    move-result-object v3

    invoke-virtual {v3}, Lekc;->g()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lavl;

    iget-byte v4, v3, Lavl;->e:B

    const/4 v5, 0x2

    if-eq v4, v5, :cond_2e

    const/4 v1, 0x0

    goto :goto_31

    :cond_2e
    iget v3, v3, Lavl;->c:I

    add-int/2addr v1, v3

    :goto_31
    iget-object v3, p0, Lc5k;->R:Lq9b;

    iget v4, v3, Lq9b;->b:I

    if-eq v1, v4, :cond_3c

    iput v1, v3, Lq9b;->b:I

    invoke-virtual {v3}, Lq9b;->b()V

    :cond_3c
    iget p1, p1, Lmnf;->d:I

    invoke-virtual {v2, p1, v0}, Lykn;->a(ILp8l;)I

    move-result p1

    iget v0, v3, Lq9b;->c:I

    if-eq p1, v0, :cond_4b

    iput p1, v3, Lq9b;->c:I

    invoke-virtual {v3}, Lq9b;->b()V

    :cond_4b
    invoke-virtual {p0}, Lc5k;->m()V

    invoke-virtual {p0}, Lc5k;->l()V

    return-void
.end method

.method public final b()Lxw8;
    .registers 3

    iget-object v0, p0, Lc5k;->B:Lcom/opera/android/feed/FeedViewPager;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    if-eqz v1, :cond_e

    invoke-virtual {v0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    move-result v1

    if-gez v1, :cond_10

    :cond_e
    const/4 p0, 0x0

    return-object p0

    :cond_10
    invoke-virtual {v0, v1}, Lcom/opera/android/custom_views/LayoutDirectionViewPager;->r(I)I

    move-result v0

    iget-object p0, p0, Lc5k;->A:Lbx8;

    iget-object p0, p0, Lbx8;->a:Ljava/util/ArrayList;

    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lzw8;

    iget-object p0, p0, Lzw8;->b:Lxw8;

    return-object p0
.end method

.method public final c(Z)V
    .registers 4

    if-eqz p1, :cond_21

    iget-object p0, p0, Lc5k;->P:Lb5k;

    iget-object p1, p0, Lb5k;->f:Lc5k;

    iget-boolean v0, p0, Lb5k;->c:Z

    if-nez v0, :cond_21

    const/4 v0, 0x1

    iput-boolean v0, p0, Lb5k;->c:Z

    iget-object v0, p1, Lc5k;->p:Lcom/opera/android/feed/FeedScrollViewContentWrapper;

    invoke-virtual {v0, p0}, Landroid/view/View;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    iget-object p1, p1, Lc5k;->l:Lcom/opera/android/feed/FeedScrollView;

    invoke-virtual {p1, p0}, Lcom/opera/android/feed/FeedScrollView;->F(Lile;)V

    iget-object p1, p0, Lb5k;->a:La5k;

    const-wide/16 v0, 0x1388

    invoke-static {p1, v0, v1}, Lvml;->d(Ljava/lang/Runnable;J)V

    invoke-virtual {p0}, Lb5k;->c()V

    :cond_21
    return-void
.end method

.method public final d()Lvr8;
    .registers 16

    iget-object v0, p0, Lc5k;->U:Lpde;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lf8k;

    iget-object v1, p0, Lc5k;->l:Lcom/opera/android/feed/FeedScrollView;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lc5k;->b0:Lks3;

    iget-object v2, v2, Lks3;->h:Ljava/lang/Object;

    check-cast v2, Lkze;

    invoke-virtual {v2}, Lekc;->g()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lrmn;

    iget v2, v2, Lrmn;->f:I

    const v3, 0x7f04047d

    const v4, 0x7f06063b

    invoke-static {v3, v1, v4}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v3

    const v5, 0x7f04047e

    invoke-static {v5, v1, v4}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v4

    invoke-static {v2, v3, v4}, Lp37;->F(III)I

    move-result v2

    new-instance v8, Lgxh;

    invoke-direct {v8, v2}, Lgxh;-><init>(I)V

    iget-object v2, v0, Lf8k;->c:Lw6k;

    iget-boolean v3, v0, Lf8k;->a:Z

    sget-object v4, Lw6k;->b:Lw6k;

    iget-object p0, p0, Lc5k;->j:Lcom/opera/android/settings/SettingsManager;

    const v5, 0x106000d

    if-ne v2, v4, :cond_98

    move v2, v3

    new-instance v3, Lvr8;

    new-instance v4, Lfxh;

    const v0, 0x7f061084

    invoke-direct {v4, v0}, Lfxh;-><init>(I)V

    sget-object v6, Lmaj;->b:Lmaj;

    invoke-static {v1, v6}, Lu0h;->g(Landroid/content/Context;Lmaj;)Llaj;

    move-result-object v1

    new-instance v6, Lfxh;

    invoke-direct {v6, v5}, Lfxh;-><init>(I)V

    if-eqz v2, :cond_65

    new-instance v2, Ldxh;

    const v5, 0x7f04021c

    invoke-direct {v2, v5}, Ldxh;-><init>(I)V

    :goto_63
    move-object v7, v2

    goto :goto_6b

    :cond_65
    new-instance v2, Lfxh;

    invoke-direct {v2, v5}, Lfxh;-><init>(I)V

    goto :goto_63

    :goto_6b
    new-instance v9, Lfxh;

    invoke-direct {v9, v0}, Lfxh;-><init>(I)V

    new-instance v10, Lfxh;

    const v2, 0x7f061088

    invoke-direct {v10, v2}, Lfxh;-><init>(I)V

    new-instance v11, Lfxh;

    const v2, 0x7f06108c

    invoke-direct {v11, v2}, Lfxh;-><init>(I)V

    new-instance v12, Lfxh;

    invoke-direct {v12, v0}, Lfxh;-><init>(I)V

    new-instance v13, Lfxh;

    const v0, 0x7f061085

    invoke-direct {v13, v0}, Lfxh;-><init>(I)V

    invoke-virtual {p0}, Lcom/opera/android/settings/SettingsManager;->x()Lp7j;

    move-result-object p0

    iget-byte v14, p0, Lp7j;->b:B

    move-object v5, v1

    invoke-direct/range {v3 .. v14}, Lvr8;-><init>(Lcxh;Llaj;Lfxh;Lcxh;Lcxh;Lcxh;Lcxh;Lcxh;Lcxh;Lfxh;I)V

    return-object v3

    :cond_98
    move v2, v3

    new-instance v3, Lvr8;

    new-instance v4, Lfxh;

    const v1, 0x7f0600a7

    invoke-direct {v4, v1}, Lfxh;-><init>(I)V

    iget-boolean v0, v0, Lf8k;->b:Z

    const v6, 0x7f0600aa

    if-eqz v0, :cond_ad

    move v0, v6

    move v7, v0

    goto :goto_af

    :cond_ad
    move v0, v5

    move v7, v6

    :goto_af
    new-instance v6, Lfxh;

    invoke-direct {v6, v0}, Lfxh;-><init>(I)V

    if-eqz v2, :cond_bf

    new-instance v0, Ldxh;

    const v2, 0x7f04021d

    invoke-direct {v0, v2}, Ldxh;-><init>(I)V

    goto :goto_c4

    :cond_bf
    new-instance v0, Lfxh;

    invoke-direct {v0, v5}, Lfxh;-><init>(I)V

    :goto_c4
    new-instance v9, Lfxh;

    invoke-direct {v9, v1}, Lfxh;-><init>(I)V

    new-instance v10, Lfxh;

    invoke-direct {v10, v7}, Lfxh;-><init>(I)V

    new-instance v11, Lfxh;

    const v1, 0x7f0600ae

    invoke-direct {v11, v1}, Lfxh;-><init>(I)V

    new-instance v12, Ldxh;

    const v1, 0x7f0409c6

    invoke-direct {v12, v1}, Ldxh;-><init>(I)V

    new-instance v13, Lfxh;

    const v1, 0x7f06011d

    invoke-direct {v13, v1}, Lfxh;-><init>(I)V

    invoke-virtual {p0}, Lcom/opera/android/settings/SettingsManager;->x()Lp7j;

    move-result-object p0

    iget-byte v14, p0, Lp7j;->b:B

    sget-object v5, Llaj;->e:Llaj;

    move-object v7, v0

    invoke-direct/range {v3 .. v14}, Lvr8;-><init>(Lcxh;Llaj;Lfxh;Lcxh;Lcxh;Lcxh;Lcxh;Lcxh;Lcxh;Lfxh;I)V

    return-object v3
.end method

.method public final e(Landroid/os/Parcelable;)Landroid/os/Parcelable;
    .registers 4

    iget-object v0, p0, Lc5k;->s:Llqe;

    iget v1, v0, Llqe;->w:I

    add-int/lit8 v1, v1, 0x1

    iput v1, v0, Llqe;->w:I

    instance-of v1, p1, Lex8;

    iget-object p0, p0, Lc5k;->l:Lcom/opera/android/feed/FeedScrollView;

    if-eqz v1, :cond_1e

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast p1, Lex8;

    invoke-virtual {p1}, Landroid/view/AbsSavedState;->getSuperState()Landroid/os/Parcelable;

    move-result-object v1

    iget p1, p1, Lex8;->a:I

    invoke-virtual {p0, p1}, Landroid/view/View;->setScrollY(I)V

    move-object p1, v1

    goto :goto_22

    :cond_1e
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Landroid/view/View;->setScrollY(I)V

    :goto_22
    iget p0, v0, Llqe;->w:I

    add-int/lit8 p0, p0, -0x1

    iput p0, v0, Llqe;->w:I

    return-object p1
.end method

.method public final f()V
    .registers 5

    iget-object v0, p0, Lc5k;->r:Lcom/opera/android/feed/FeedContainerView;

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-nez v0, :cond_4c

    iget-object v0, p0, Lc5k;->l:Lcom/opera/android/feed/FeedScrollView;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/opera/android/feed/FeedScrollView;->canScrollVertically(I)Z

    move-result v1

    if-eqz v1, :cond_4c

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v1

    invoke-virtual {v0}, Landroid/view/View;->getPaddingTop()I

    move-result v2

    sub-int/2addr v1, v2

    invoke-virtual {v0}, Landroid/view/View;->getPaddingBottom()I

    move-result v2

    sub-int/2addr v1, v2

    iget-object p0, p0, Lc5k;->p:Lcom/opera/android/feed/FeedScrollViewContentWrapper;

    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    move-result p0

    sub-int/2addr p0, v1

    invoke-virtual {v0}, Landroid/view/View;->getScrollY()I

    move-result v1

    sub-int/2addr p0, v1

    int-to-float v1, p0

    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    sget-object v3, Lfan;->a:Landroid/graphics/Rect;

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    iget v2, v2, Landroid/util/DisplayMetrics;->density:F

    div-float/2addr v1, v2

    float-to-int v1, v1

    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    move-result v1

    mul-int/lit8 v1, v1, 0x5

    const/16 v2, 0xfa

    const/16 v3, 0x3e8

    invoke-static {v1, v2, v3}, Lcs5;->t(III)I

    move-result v1

    const/4 v2, 0x0

    invoke-virtual {v0, v2, p0, v1, v2}, Landroidx/core/widget/NestedScrollView;->B(IIIZ)V

    :cond_4c
    return-void
.end method

.method public final g(Lf1p;ZZ)V
    .registers 8

    iget-object v0, p1, Lf1p;->a:Ljava/lang/Object;

    check-cast v0, Lcue;

    iget-object v1, p1, Lf1p;->b:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    sget-object v2, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v2, p0, Lo8k;->b:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v2}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v2

    check-cast v2, Lcom/opera/android/OperaApplication;

    invoke-virtual {v2}, Lcom/opera/android/OperaApplication;->z()Lfue;

    move-result-object v2

    invoke-virtual {v2}, Lfue;->d()V

    iget-object v2, v2, Lfue;->a:Lcue;

    iget-object v3, p0, Lc5k;->B:Lcom/opera/android/feed/FeedViewPager;

    if-eq v0, v2, :cond_38

    iget-object p1, p0, Lc5k;->l:Lcom/opera/android/feed/FeedScrollView;

    const/4 p2, 0x0

    invoke-virtual {p1, p2, p2}, Landroidx/core/widget/NestedScrollView;->scrollTo(II)V

    invoke-virtual {v3, p2}, Lcom/opera/android/custom_views/LayoutDirectionViewPager;->r(I)I

    move-result p1

    invoke-virtual {v3, p1}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    invoke-virtual {p0}, Lc5k;->b()Lxw8;

    move-result-object p0

    if-eqz p0, :cond_5e

    iget-object p0, p0, Lxw8;->g:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p0, p2}, Landroidx/recyclerview/widget/RecyclerView;->x0(I)V

    return-void

    :cond_38
    if-nez v1, :cond_3e

    invoke-virtual {p0, p2}, Lc5k;->c(Z)V

    return-void

    :cond_3e
    iget-object v0, p0, Lc5k;->A:Lbx8;

    invoke-virtual {v0, v1}, Lbx8;->a(Ljava/lang/String;)I

    move-result v0

    const/4 v2, -0x1

    if-ne v0, v2, :cond_69

    new-instance v0, Lnrl;

    invoke-direct {v0, p1, p2}, Lnrl;-><init>(Ljava/lang/Object;Z)V

    iput-object v0, p0, Lc5k;->O:Lnrl;

    if-eqz p3, :cond_53

    invoke-virtual {p0, p2}, Lc5k;->c(Z)V

    :cond_53
    iget-object p1, p1, Lf1p;->a:Ljava/lang/Object;

    check-cast p1, Lcue;

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    const/4 p2, 0x1

    if-eq p1, p2, :cond_5f

    :cond_5e
    return-void

    :cond_5f
    iget-object p0, p0, Lc5k;->v:Lfqe;

    invoke-virtual {p0}, Lfqe;->c()Luqe;

    move-result-object p0

    invoke-virtual {p0, v1}, Luqe;->l(Ljava/lang/String;)V

    return-void

    :cond_69
    invoke-virtual {v3, v0}, Lcom/opera/android/custom_views/LayoutDirectionViewPager;->r(I)I

    move-result p1

    invoke-virtual {v3, p1}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    invoke-virtual {p0, p2}, Lc5k;->c(Z)V

    return-void
.end method

.method public final h()V
    .registers 6

    iget-object v0, p0, Lc5k;->P:Lb5k;

    invoke-virtual {v0}, Lb5k;->b()V

    iget-object v0, p0, Lc5k;->l:Lcom/opera/android/feed/FeedScrollView;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v1, 0x0

    new-array v2, v1, [Ljava/lang/Object;

    const-string v3, "abortAnimatedScroll"

    const/4 v4, 0x0

    invoke-static {v0, v3, v4, v2}, Lmzg;->j(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    new-array v0, v1, [Ljava/lang/Object;

    iget-object v2, p0, Lc5k;->o:Landroidx/recyclerview/widget/RecyclerView;

    const-string v3, "cancelScroll"

    invoke-static {v2, v3, v4, v0}, Lmzg;->j(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p0}, Lc5k;->b()Lxw8;

    move-result-object p0

    if-eqz p0, :cond_29

    iget-object p0, p0, Lxw8;->g:Landroidx/recyclerview/widget/RecyclerView;

    new-array v0, v1, [Ljava/lang/Object;

    invoke-static {p0, v3, v4, v0}, Lmzg;->j(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    :cond_29
    return-void
.end method

.method public final i()V
    .registers 7

    iget-object v0, p0, Lo8k;->a:Lpde;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lmnf;

    iget v1, v0, Lmnf;->b:I

    iget-object v2, p0, Lc5k;->H:Lz8b;

    iget-object v2, v2, Lz8b;->a:Ljava/lang/Object;

    check-cast v2, Lpde;

    invoke-virtual {v2}, Lekc;->g()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v1

    iget v2, v0, Lmnf;->b:I

    iget-object v3, p0, Lc5k;->p:Lcom/opera/android/feed/FeedScrollViewContentWrapper;

    iget v4, v3, Lcom/opera/android/feed/FeedScrollViewContentWrapper;->b:I

    iget v5, p0, Lc5k;->d0:I

    if-ne v1, v4, :cond_30

    iget v4, v3, Lcom/opera/android/feed/FeedScrollViewContentWrapper;->c:I

    if-ne v2, v4, :cond_30

    iget v4, v3, Lcom/opera/android/feed/FeedScrollViewContentWrapper;->d:I

    if-eq v5, v4, :cond_39

    :cond_30
    iput v1, v3, Lcom/opera/android/feed/FeedScrollViewContentWrapper;->b:I

    iput v2, v3, Lcom/opera/android/feed/FeedScrollViewContentWrapper;->c:I

    iput v5, v3, Lcom/opera/android/feed/FeedScrollViewContentWrapper;->d:I

    invoke-virtual {v3}, Landroid/view/View;->requestLayout()V

    :cond_39
    new-instance v2, Ldv8;

    iget v0, v0, Lmnf;->c:I

    invoke-direct {v2, v0, v1}, Ldv8;-><init>(II)V

    iget-object p0, p0, Lc5k;->q:Lcv8;

    iget-object v0, p0, Lcv8;->e:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v1, p0, Lcv8;->D:Ldv8;

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4d

    return-void

    :cond_4d
    iput-object v2, p0, Lcv8;->D:Ldv8;

    invoke-virtual {v0}, Landroid/view/View;->getPaddingLeft()I

    move-result v1

    invoke-virtual {v0}, Landroid/view/View;->getPaddingRight()I

    move-result v2

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v3, v2, v3}, Landroid/view/View;->setPadding(IIII)V

    iget-object v0, p0, Lcv8;->d:Lcom/opera/android/feed/FeedScrollViewContentWrapper;

    invoke-virtual {v0}, Landroid/view/View;->requestLayout()V

    iget-object p0, p0, Lcv8;->m:Lnjm;

    invoke-virtual {p0}, Lnjm;->b()V

    return-void
.end method

.method public final j(Lrmn;)V
    .registers 24

    move-object/from16 v0, p0

    move-object/from16 v8, p1

    iget-boolean v1, v8, Lrmn;->i:Z

    iget v2, v8, Lrmn;->f:I

    sget-object v3, Lw6k;->a:Lw6k;

    sget-object v4, Lw6k;->b:Lw6k;

    if-eqz v1, :cond_10

    move-object v1, v4

    goto :goto_12

    :cond_10
    move-object v1, v4

    move-object v4, v3

    :goto_12
    iget-boolean v5, v8, Lrmn;->j:Z

    if-eqz v5, :cond_18

    move-object v5, v1

    goto :goto_19

    :cond_18
    move-object v5, v3

    :goto_19
    iget-boolean v6, v8, Lrmn;->k:Z

    if-eqz v6, :cond_1f

    move-object v6, v1

    goto :goto_20

    :cond_1f
    move-object v6, v3

    :goto_20
    invoke-static {v2}, Lp37;->t(I)F

    move-result v1

    const v3, 0x3f666666    # 0.9f

    cmpl-float v3, v1, v3

    const/4 v7, 0x1

    const/4 v9, 0x0

    if-lez v3, :cond_2f

    move v3, v7

    goto :goto_30

    :cond_2f
    move v3, v9

    :goto_30
    const v10, 0x3dcccccd    # 0.1f

    cmpg-float v1, v1, v10

    if-ltz v1, :cond_3a

    if-nez v3, :cond_3a

    move v7, v9

    :cond_3a
    iget-object v1, v0, Lc5k;->V:Lpde;

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Llo3;

    iget-boolean v1, v1, Llo3;->a:Z

    if-eqz v1, :cond_49

    sget-object v1, Lp8l;->b:Lp8l;

    goto :goto_4b

    :cond_49
    sget-object v1, Lp8l;->a:Lp8l;

    :goto_4b
    sget-object v10, Lp8l;->b:Lp8l;

    iget-object v12, v0, Lo8k;->c:Lcom/opera/android/browser/OperaPageRootView;

    sget-object v13, Ln8l;->a:Ln8l;

    if-ne v1, v10, :cond_121

    iget-object v10, v0, Lc5k;->l:Lcom/opera/android/feed/FeedScrollView;

    invoke-virtual {v10}, Landroid/view/View;->getScrollY()I

    move-result v10

    sget-object v14, Lcv8;->F:Landroid/view/animation/AccelerateInterpolator;

    int-to-float v10, v10

    iget v15, v0, Lc5k;->d0:I

    int-to-float v15, v15

    div-float/2addr v10, v15

    const/4 v15, 0x0

    const/high16 v11, 0x3f800000    # 1.0f

    invoke-static {v10, v15, v11}, Lcs5;->s(FFF)F

    move-result v10

    invoke-virtual {v14, v10}, Landroid/view/animation/AccelerateInterpolator;->getInterpolation(F)F

    move-result v10

    iget-object v14, v8, Lrmn;->h:Likn;

    if-nez v14, :cond_83

    new-instance v14, Lfyh;

    cmpg-float v11, v10, v11

    if-eqz v11, :cond_7c

    new-instance v13, Lo8l;

    iget v11, v8, Lrmn;->g:I

    invoke-direct {v13, v11, v10}, Lo8l;-><init>(IF)V

    :cond_7c
    invoke-direct {v14, v13, v9, v9}, Lfyh;-><init>(Luyg;II)V

    move-object/from16 v17, v12

    goto/16 :goto_100

    :cond_83
    iget v15, v14, Likn;->a:I

    invoke-static {v15}, Lp37;->u0(I)Z

    move-result v17

    iget v9, v14, Likn;->c:F

    iget v14, v14, Likn;->b:F

    sub-float v14, v9, v14

    move/from16 v18, v11

    const v19, 0x3ecccccd    # 0.4f

    const-wide/high16 v20, 0x3fe0000000000000L    # 0.5

    if-nez v17, :cond_c3

    move-object/from16 v17, v12

    float-to-double v11, v9

    cmpl-double v9, v11, v20

    const/high16 v11, -0x1000000

    if-lez v9, :cond_a8

    const/high16 v9, 0x3f000000    # 0.5f

    invoke-static {v9, v11}, Lp37;->j0(FI)I

    move-result v9

    goto :goto_ee

    :cond_a8
    cmpl-float v9, v14, v19

    if-lez v9, :cond_b4

    const v9, 0x3e99999a    # 0.3f

    invoke-static {v9, v11}, Lp37;->j0(FI)I

    move-result v9

    goto :goto_ee

    :cond_b4
    const v9, 0x3e99999a    # 0.3f

    cmpl-float v9, v14, v9

    if-lez v9, :cond_ed

    const v9, 0x3df5c28f    # 0.12f

    invoke-static {v9, v11}, Lp37;->j0(FI)I

    move-result v9

    goto :goto_ee

    :cond_c3
    move-object/from16 v17, v12

    float-to-double v11, v9

    cmpg-double v9, v11, v20

    const/4 v11, -0x1

    if-gez v9, :cond_d2

    const/high16 v9, 0x3f000000    # 0.5f

    invoke-static {v9, v11}, Lp37;->j0(FI)I

    move-result v9

    goto :goto_ee

    :cond_d2
    cmpl-float v9, v14, v19

    if-lez v9, :cond_de

    const v9, 0x3e99999a    # 0.3f

    invoke-static {v9, v11}, Lp37;->j0(FI)I

    move-result v9

    goto :goto_ee

    :cond_de
    const v9, 0x3e99999a    # 0.3f

    cmpl-float v9, v14, v9

    if-lez v9, :cond_ed

    const v9, 0x3df5c28f    # 0.12f

    invoke-static {v9, v11}, Lp37;->j0(FI)I

    move-result v9

    goto :goto_ee

    :cond_ed
    const/4 v9, 0x0

    :goto_ee
    invoke-static {v15, v9}, Lp37;->r(II)I

    move-result v11

    cmpg-float v12, v10, v18

    if-eqz v12, :cond_fb

    new-instance v13, Lo8l;

    invoke-direct {v13, v11, v10}, Lo8l;-><init>(IF)V

    :cond_fb
    new-instance v14, Lfyh;

    invoke-direct {v14, v13, v9, v11}, Lfyh;-><init>(Luyg;II)V

    :goto_100
    invoke-virtual/range {v17 .. v17}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v9

    iget v10, v14, Lfyh;->b:I

    if-nez v10, :cond_10a

    const/4 v11, 0x0

    goto :goto_11a

    :cond_10a
    new-instance v11, Leyh;

    invoke-virtual {v9}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    const v12, 0x7f070965

    invoke-virtual {v9, v12}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v9

    invoke-direct {v11, v10, v9}, Leyh;-><init>(II)V

    :goto_11a
    iget-object v13, v14, Lfyh;->a:Luyg;

    iget v9, v14, Lfyh;->c:I

    move v10, v9

    move-object v9, v11

    goto :goto_125

    :cond_121
    move-object/from16 v17, v12

    const/4 v9, 0x0

    const/4 v10, 0x0

    :goto_125
    new-instance v11, Lf8k;

    sget-object v12, Lv8k;->a:Lv8k;

    invoke-virtual/range {v17 .. v17}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v14

    invoke-virtual {v12, v14}, Lv8k;->d(Landroid/content/Context;)I

    move-result v14

    sget-object v15, Lv8k;->b:Lv8k;

    move/from16 v16, v3

    invoke-virtual/range {v17 .. v17}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v15, v3}, Lv8k;->d(Landroid/content/Context;)I

    move-result v3

    invoke-static {v2, v14, v3}, Lp37;->F(III)I

    move-result v2

    if-ne v2, v14, :cond_145

    :goto_143
    move-object v2, v11

    goto :goto_147

    :cond_145
    move-object v12, v15

    goto :goto_143

    :goto_147
    new-instance v11, Lq8l;

    invoke-direct {v11, v1, v13}, Lq8l;-><init>(Lp8l;Luyg;)V

    move-object v1, v2

    move v2, v7

    move-object v7, v12

    move/from16 v3, v16

    invoke-direct/range {v1 .. v11}, Lf8k;-><init>(ZZLw6k;Lw6k;Lw6k;Lv8k;Lrmn;Leyh;ILq8l;)V

    iget-object v0, v0, Lc5k;->U:Lpde;

    invoke-static {v0, v1}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    return-void
.end method

.method public final k()V
    .registers 6

    iget-object v0, p0, Lo8k;->c:Lcom/opera/android/browser/OperaPageRootView;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lc5k;->U:Lpde;

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lf8k;

    iget-object v1, v1, Lf8k;->d:Lw6k;

    sget-object v2, Lw6k;->a:Lw6k;

    if-ne v1, v2, :cond_17

    sget-object v2, Llaj;->e:Llaj;

    goto :goto_1d

    :cond_17
    sget-object v2, Lmaj;->b:Lmaj;

    invoke-static {v0, v2}, Lu0h;->g(Landroid/content/Context;Lmaj;)Llaj;

    move-result-object v2

    :goto_1d
    iget-object v3, p0, Lc5k;->N:Lpde;

    invoke-static {v3, v2}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    if-eqz v1, :cond_2a

    const/4 v1, -0x1

    goto :goto_31

    :cond_2a
    const v1, 0x7f0600b6

    invoke-virtual {v0, v1}, Landroid/content/Context;->getColor(I)I

    move-result v1

    :goto_31
    iget-object v3, p0, Lc5k;->m:Lcom/opera/android/custom_views/swipe_to_refresh/RefreshView;

    iget v4, v3, Lcom/opera/android/custom_views/swipe_to_refresh/RefreshView;->c:I

    if-eq v1, v4, :cond_3c

    iput v1, v3, Lcom/opera/android/custom_views/swipe_to_refresh/RefreshView;->c:I

    invoke-virtual {v3}, Landroid/view/View;->invalidate()V

    :cond_3c
    const v1, 0x7f0600ac

    invoke-virtual {v0, v1}, Landroid/content/Context;->getColor(I)I

    invoke-virtual {v3}, Landroid/view/View;->invalidate()V

    iget-object v1, v3, Lcom/opera/android/custom_views/swipe_to_refresh/RefreshView;->d:Llaj;

    invoke-virtual {v2, v1}, Llaj;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_52

    iput-object v2, v3, Lcom/opera/android/custom_views/swipe_to_refresh/RefreshView;->d:Llaj;

    invoke-virtual {v3}, Landroid/view/View;->invalidate()V

    :cond_52
    const v1, 0x3f5eb852    # 0.87f

    invoke-virtual {v3, v1}, Landroid/view/View;->setAlpha(F)V

    iget-object v1, p0, Lc5k;->l:Lcom/opera/android/feed/FeedScrollView;

    invoke-virtual {v1}, Landroid/view/View;->invalidate()V

    const v1, 0x7f0402a8

    const v2, 0x7f06063b

    invoke-static {v1, v0, v2}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v0

    iget-object p0, p0, Lc5k;->S:Landroid/graphics/drawable/ColorDrawable;

    invoke-virtual {p0, v0}, Landroid/graphics/drawable/ColorDrawable;->setColor(I)V

    return-void
.end method

.method public final l()V
    .registers 7

    iget-object v0, p0, Lo8k;->a:Lpde;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lmnf;

    iget v0, v0, Lmnf;->c:I

    iget-object v1, p0, Lc5k;->i:Lbvl;

    invoke-interface {v1}, Lbvl;->getState()Lpde;

    move-result-object v1

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lavl;

    iget-byte v2, v1, Lavl;->e:B

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-ne v2, v4, :cond_1e

    move v2, v3

    goto :goto_20

    :cond_1e
    iget v2, v1, Lavl;->c:I

    :goto_20
    add-int/2addr v2, v0

    iget-object v5, p0, Lc5k;->l:Lcom/opera/android/feed/FeedScrollView;

    invoke-virtual {v5, v3, v2, v3, v3}, Landroid/view/View;->setPadding(IIII)V

    iget-byte v1, v1, Lavl;->e:B

    if-eq v1, v4, :cond_2d

    const/4 v2, 0x2

    if-eq v1, v2, :cond_2e

    :cond_2d
    move v0, v3

    :cond_2e
    iget v1, v5, Lcom/opera/android/feed/FeedScrollView;->G:I

    if-eq v0, v1, :cond_37

    iput v0, v5, Lcom/opera/android/feed/FeedScrollView;->G:I

    invoke-virtual {v5}, Landroid/view/View;->invalidate()V

    :cond_37
    invoke-virtual {p0}, Lc5k;->i()V

    return-void
.end method

.method public final m()V
    .registers 7

    new-instance v0, Landroid/graphics/Rect;

    iget-object v1, p0, Lc5k;->R:Lq9b;

    iget v2, v1, Lq9b;->b:I

    iget-object v3, p0, Lo8k;->c:Lcom/opera/android/browser/OperaPageRootView;

    invoke-virtual {v3}, Landroid/view/View;->getWidth()I

    move-result v4

    invoke-virtual {v3}, Landroid/view/View;->getHeight()I

    move-result v3

    iget v1, v1, Lq9b;->c:I

    sub-int/2addr v3, v1

    const/4 v1, 0x0

    invoke-direct {v0, v1, v2, v4, v3}, Landroid/graphics/Rect;-><init>(IIII)V

    iget-object v2, p0, Lc5k;->m:Lcom/opera/android/custom_views/swipe_to_refresh/RefreshView;

    invoke-virtual {v2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f070883

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    new-instance v3, Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v4

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v5

    invoke-static {v2, v5}, Ljava/lang/Math;->min(II)I

    move-result v2

    invoke-direct {v3, v1, v1, v4, v2}, Landroid/graphics/Rect;-><init>(IIII)V

    iget-object p0, p0, Lc5k;->b0:Lks3;

    iget-object v1, p0, Lks3;->f:Ljava/lang/Object;

    check-cast v1, Landroid/graphics/Rect;

    invoke-static {v1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4c

    iget-object v1, p0, Lks3;->g:Ljava/lang/Object;

    check-cast v1, Landroid/graphics/Rect;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4c

    return-void

    :cond_4c
    iput-object v0, p0, Lks3;->f:Ljava/lang/Object;

    iput-object v3, p0, Lks3;->g:Ljava/lang/Object;

    invoke-virtual {p0}, Lks3;->r()V

    return-void
.end method

.method public final p(Ll0c;)V
    .registers 4

    if-nez p1, :cond_7

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object p1

    goto :goto_b

    :cond_7
    invoke-virtual {p1}, Ll0c;->b()Ljava/util/Locale;

    move-result-object p1

    :goto_b
    invoke-static {p1}, Landroid/text/TextUtils;->getLayoutDirectionFromLocale(Ljava/util/Locale;)I

    move-result p1

    const/4 v0, 0x1

    if-eq p1, v0, :cond_13

    const/4 v0, 0x0

    :cond_13
    iget-object p1, p0, Lc5k;->B:Lcom/opera/android/feed/FeedViewPager;

    iget-boolean v1, p1, Lcom/opera/android/feed/FeedViewPager;->c:Z

    if-eq v1, v0, :cond_20

    iput-boolean v0, p1, Lcom/opera/android/feed/FeedViewPager;->c:Z

    iget-object p1, p1, Lcom/opera/android/custom_views/LayoutDirectionViewPager;->b:Ll2c;

    invoke-virtual {p1, v0}, Ll2c;->d(I)V

    :cond_20
    iget-object p0, p0, Lc5k;->t:Lkue;

    iget-boolean p1, p0, Lkue;->l:Z

    if-ne p1, v0, :cond_27

    return-void

    :cond_27
    iput-boolean v0, p0, Lkue;->l:Z

    iget-object p0, p0, Lkue;->d:Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;

    iget-object p0, p0, Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;->a:Ll2c;

    invoke-virtual {p0, v0}, Ll2c;->d(I)V

    return-void
.end method
