.class public final Lxw8;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public A:Landroid/util/SparseArray;

.field public B:Ligi;

.field public C:Z

.field public D:Z

.field public final E:Z

.field public final a:Landroid/widget/FrameLayout;

.field public final b:Lbwf;

.field public final c:Z

.field public final d:Z

.field public final e:Ltcc;

.field public final f:Ly73;

.field public final g:Landroidx/recyclerview/widget/RecyclerView;

.field public final h:Low8;

.field public final i:Lrw8;

.field public final j:Lf92;

.field public final k:Lv82;

.field public final l:Ljava/lang/Object;

.field public final m:Lvu8;

.field public final n:Luv8;

.field public final o:Lkue;

.field public final p:Lx5f;

.field public final q:Lete;

.field public final r:Lcom/opera/android/settings/SettingsManager;

.field public final s:Lqie;

.field public final t:Lcq5;

.field public final u:Lisd;

.field public final v:Lpde;

.field public final w:Lhv2;

.field public final x:Lww8;

.field public final y:Ls9i;

.field public final z:Lvw8;


# direct methods
.method public constructor <init>(Lcom/opera/android/BrowserActivity;Lnue;Lkue;Landroid/view/ViewGroup;Lbwf;ZLandroid/util/SparseArray;Lu37;Lisd;Lx5f;Lx5f;Lumi;Lcq5;Lcom/opera/android/settings/SettingsManager;Lfqe;Lqie;Landroid/view/View$OnLongClickListener;Lkze;Lqq6;Lpde;)V
    .registers 38

    move-object/from16 v4, p0

    move-object/from16 v2, p1

    move-object/from16 v10, p3

    move-object/from16 v11, p5

    move-object/from16 v12, p18

    invoke-direct {v4}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ly73;

    const/4 v13, 0x2

    invoke-direct {v0, v4, v13}, Ly73;-><init>(Ljava/lang/Object;B)V

    iput-object v0, v4, Lxw8;->f:Ly73;

    new-instance v1, Lv82;

    new-instance v3, Lv82;

    invoke-direct {v3, v4}, Lv82;-><init>(Lxw8;)V

    const/4 v14, 0x1

    invoke-direct {v1, v14}, Lv82;-><init>(B)V

    iput-object v3, v1, Lv82;->b:Ljava/lang/Object;

    iput-object v1, v4, Lxw8;->k:Lv82;

    new-instance v1, Ljava/lang/Object;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-object v1, v4, Lxw8;->l:Ljava/lang/Object;

    sget-object v3, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v2}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v3

    check-cast v3, Lcom/opera/android/OperaApplication;

    invoke-virtual {v2}, Lxd5;->getLifecycle()Ltcc;

    move-result-object v5

    iput-object v5, v4, Lxw8;->e:Ltcc;

    iget-object v6, v3, Lcom/opera/android/OperaApplication;->w:Lj4c;

    invoke-virtual {v6}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lau8;

    iput-object v11, v4, Lxw8;->b:Lbwf;

    move-object/from16 v7, p20

    iput-object v7, v4, Lxw8;->v:Lpde;

    move/from16 v15, p6

    iput-boolean v15, v4, Lxw8;->c:Z

    invoke-virtual {v11}, Lbwf;->a()Ljava/lang/String;

    move-result-object v7

    const-string v8, "cur_city_id"

    invoke-virtual {v8, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    iput-boolean v7, v4, Lxw8;->d:Z

    move-object/from16 v7, p7

    iput-object v7, v4, Lxw8;->A:Landroid/util/SparseArray;

    iput-object v10, v4, Lxw8;->o:Lkue;

    move-object/from16 v7, p10

    iput-object v7, v4, Lxw8;->p:Lx5f;

    iget-object v3, v3, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object v3, v3, Lxv1;->f0:Lj4c;

    invoke-virtual {v3}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lete;

    iput-object v3, v4, Lxw8;->q:Lete;

    move-object/from16 v3, p14

    iput-object v3, v4, Lxw8;->r:Lcom/opera/android/settings/SettingsManager;

    move-object/from16 v3, p16

    iput-object v3, v4, Lxw8;->s:Lqie;

    move-object/from16 v8, p13

    iput-object v8, v4, Lxw8;->t:Lcq5;

    move-object/from16 v8, p9

    iput-object v8, v4, Lxw8;->u:Lisd;

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v8, Lge5;

    const/16 v9, 0x14

    invoke-direct {v8, v6, v11, v9}, Lge5;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v6, v11, v8}, Lau8;->a(Lbwf;Lzt8;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lf92;

    iput-object v8, v4, Lxw8;->j:Lf92;

    new-instance v9, Low8;

    iget-object v13, v2, Ldx3;->l:Ltni;

    invoke-direct {v9, v4, v13}, Low8;-><init>(Lxw8;Ltni;)V

    iput-object v9, v4, Lxw8;->h:Low8;

    new-instance v13, Lvu8;

    invoke-virtual {v8}, Lf92;->d()Ld53;

    move-result-object v14

    new-instance v2, Lnw8;

    const/4 v15, 0x0

    invoke-direct {v2, v4, v15}, Lnw8;-><init>(Lxw8;B)V

    invoke-direct {v13, v9, v14, v1, v2}, Lvu8;-><init>(Low8;Ld53;Ljava/lang/Object;Lnw8;)V

    iput-object v13, v4, Lxw8;->m:Lvu8;

    iget-object v1, v8, Lf92;->e:Lj4c;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lhv2;

    iput-object v1, v4, Lxw8;->w:Lhv2;

    iget-boolean v2, v1, Lhv2;->h:Z

    if-nez v2, :cond_ba

    invoke-virtual {v1}, Lhv2;->e()V

    :cond_ba
    new-instance v2, Lww8;

    new-instance v8, Ldg7;

    const/16 v13, 0x10

    invoke-direct {v8, v4, v13}, Ldg7;-><init>(Ljava/lang/Object;B)V

    invoke-direct {v2, v1, v8}, Lww8;-><init>(Lhv2;Ldg7;)V

    iput-object v2, v4, Lxw8;->x:Lww8;

    new-instance v1, Lvw8;

    invoke-direct {v1, v4}, Lvw8;-><init>(Lxw8;)V

    iput-object v1, v4, Lxw8;->z:Lvw8;

    invoke-virtual {v5, v0}, Ltcc;->a(Lmdc;)V

    invoke-virtual/range {p4 .. p4}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f0d01b0

    move-object/from16 v2, p4

    invoke-virtual {v0, v1, v2, v15}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    iput-object v0, v4, Lxw8;->a:Landroid/widget/FrameLayout;

    const v1, 0x7f0a0479

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    move-object v13, v1

    check-cast v13, Landroidx/recyclerview/widget/RecyclerView;

    iput-object v13, v4, Lxw8;->g:Landroidx/recyclerview/widget/RecyclerView;

    new-instance v1, Leqh;

    move-object/from16 v2, p17

    invoke-direct {v1, v13, v2}, Leqh;-><init>(Landroidx/recyclerview/widget/RecyclerView;Landroid/view/View$OnLongClickListener;)V

    const/4 v1, 0x1

    iput-boolean v1, v13, Landroidx/recyclerview/widget/RecyclerView;->t:Z

    move-object/from16 v2, p8

    invoke-virtual {v13, v2}, Landroidx/recyclerview/widget/RecyclerView;->D0(Lro9;)V

    new-instance v2, Llv2;

    invoke-direct {v2, v1}, Llv2;-><init>(B)V

    iput-boolean v15, v2, Lxkj;->g:Z

    invoke-virtual {v13, v2}, Landroidx/recyclerview/widget/RecyclerView;->B0(Landroidx/recyclerview/widget/e;)V

    invoke-virtual {v13}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result v2

    new-instance v5, Lnw8;

    invoke-direct {v5, v4, v1}, Lnw8;-><init>(Lxw8;B)V

    new-instance v1, Lpw8;

    invoke-direct {v1, v4, v2, v5}, Lpw8;-><init>(Lxw8;ILnw8;)V

    invoke-virtual {v13, v1}, Landroidx/recyclerview/widget/RecyclerView;->n(Lnph;)V

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    sget-object v2, Lrv8;->b:Ls16;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v1}, Lr9n;->i(Landroid/content/Context;)Landroid/graphics/Rect;

    move-result-object v2

    invoke-virtual {v2}, Landroid/graphics/Rect;->width()I

    move-result v2

    const/high16 v14, 0x44740000    # 976.0f

    invoke-static {v1, v14}, Lz7h;->h(Landroid/content/Context;F)I

    move-result v1

    if-le v2, v1, :cond_141

    sget-object v1, Lrv8;->d:Lrv8;

    goto :goto_143

    :cond_141
    sget-object v1, Lrv8;->c:Lrv8;

    :goto_143
    invoke-virtual {v4, v1}, Lxw8;->h(Lrv8;)V

    new-instance v1, Ls9i;

    invoke-direct {v1, v0}, Ls9i;-><init>(Landroid/widget/FrameLayout;)V

    iput-object v1, v4, Lxw8;->y:Ls9i;

    invoke-virtual/range {p1 .. p1}, Lcom/opera/android/BrowserActivity;->K0()Lizj;

    move-result-object v0

    iget-object v5, v10, Lkue;->j:Ljue;

    move-object v1, v0

    new-instance v0, Lvw1;

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move-object/from16 v8, p12

    move-object/from16 v16, v1

    move-object v1, v6

    move-object v6, v7

    move-object v14, v9

    move-object/from16 v7, p11

    move-object/from16 v9, p19

    invoke-direct/range {v0 .. v9}, Lvw1;-><init>(Lau8;Lcom/opera/android/BrowserActivity;Lnue;Lxw8;Ljue;Lx5f;Lx5f;Lumi;Lqq6;)V

    invoke-virtual {v1, v11, v0}, Lau8;->a(Lbwf;Lzt8;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Liu8;

    if-eqz v0, :cond_274

    invoke-virtual {v14, v0}, Lha2;->G(Lfa2;)V

    invoke-virtual {v2}, Lcom/opera/android/BrowserActivity;->x0()Lwy;

    move-result-object v1

    new-instance v3, Lk5k;

    iget-object v5, v1, Lwy;->a:Landroid/content/Context;

    iget-object v6, v1, Lwy;->j:Lbi;

    iget-object v7, v1, Lwy;->b:Lx5f;

    iget-object v8, v1, Lwy;->i:Ls9i;

    move/from16 p13, p6

    move-object/from16 p9, v1

    move-object/from16 p7, v3

    move-object/from16 p8, v5

    move-object/from16 p10, v6

    move-object/from16 p11, v7

    move-object/from16 p12, v8

    invoke-direct/range {p7 .. p13}, Lk5k;-><init>(Landroid/content/Context;Lwy;Lbi;Lx5f;Ls9i;Z)V

    invoke-virtual {v2}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v5

    check-cast v5, Lcom/opera/android/OperaApplication;

    invoke-virtual {v5}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v5

    iget-object v5, v5, Ld6j;->c:Lx5f;

    new-instance v6, Lhx;

    const/4 v7, 0x7

    invoke-direct {v6, v7}, Lhx;-><init>(B)V

    sget v7, Lix;->o:I

    new-instance v7, Lhx;

    invoke-direct {v7, v12, v15}, Lhx;-><init>(Lkze;B)V

    invoke-virtual {v6, v7}, Lhx;->a(Lea2;)V

    sget v7, Lmx;->H:I

    new-instance v7, Lhx;

    const/4 v8, 0x1

    invoke-direct {v7, v8}, Lhx;-><init>(B)V

    iput-object v12, v7, Lhx;->b:Ljava/lang/Object;

    invoke-virtual {v6, v7}, Lhx;->a(Lea2;)V

    sget v7, Llx;->n:I

    new-instance v7, Lkx;

    move-object/from16 v9, v16

    invoke-direct {v7, v12, v9}, Lkx;-><init>(Lkze;Lizj;)V

    invoke-virtual {v6, v7}, Lhx;->a(Lea2;)V

    sget-object v7, Lep7;->a:Lii;

    invoke-virtual {v7}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lqyf;

    invoke-virtual {v7}, Lk8;->a0()Z

    move-result v9

    if-eqz v9, :cond_1f1

    iget-object v7, v7, Lk8;->a:Ljava/lang/Object;

    check-cast v7, Ljava/lang/String;

    const-class v9, Lize;

    filled-new-array {v9}, [Ljava/lang/Class;

    move-result-object v9

    filled-new-array {v12}, [Ljava/lang/Object;

    move-result-object v11

    const-string v8, "createViewHolderFactory"

    invoke-static {v7, v8, v9, v11}, Lmzg;->k(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lea2;

    invoke-static {v7}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v6, v7}, Lhx;->a(Lea2;)V

    :cond_1f1
    sget v7, Leu9;->E:I

    new-instance v7, Lhx;

    const/4 v8, 0x4

    invoke-direct {v7, v12, v8}, Lhx;-><init>(Lkze;B)V

    invoke-virtual {v6, v7}, Lhx;->a(Lea2;)V

    sget v7, Ll00;->D:I

    new-instance v7, Lkx;

    invoke-direct {v7, v5, v12}, Lkx;-><init>(Lx5f;Lkze;)V

    invoke-virtual {v6, v7}, Lhx;->a(Lea2;)V

    sget v5, Lix;->o:I

    new-instance v5, Lhx;

    const/4 v7, 0x5

    invoke-direct {v5, v12, v7}, Lhx;-><init>(Lkze;B)V

    invoke-virtual {v6, v5}, Lhx;->a(Lea2;)V

    sget v5, Lmx;->H:I

    new-instance v5, Lhx;

    const/4 v7, 0x6

    invoke-direct {v5, v12, v7}, Lhx;-><init>(Lkze;B)V

    invoke-virtual {v6, v5}, Lhx;->a(Lea2;)V

    new-instance v5, Lox;

    invoke-direct {v5, v15}, Lox;-><init>(B)V

    new-instance v7, Lda2;

    const-class v8, Lno;

    const v9, 0x7f0d017b

    invoke-direct {v7, v8, v9, v9, v5}, Lda2;-><init>(Ljava/lang/Class;IILjr9;)V

    invoke-virtual {v6, v7}, Lhx;->a(Lea2;)V

    sget v5, Lso8;->D:I

    new-instance v5, Lhx;

    const/4 v7, 0x3

    invoke-direct {v5, v12, v7}, Lhx;-><init>(Lkze;B)V

    invoke-virtual {v6, v5}, Lhx;->a(Lea2;)V

    sget v5, Lix;->o:I

    new-instance v5, Lhx;

    const/4 v7, 0x2

    invoke-direct {v5, v12, v7}, Lhx;-><init>(Lkze;B)V

    invoke-virtual {v6, v5}, Lhx;->a(Lea2;)V

    new-instance v5, Leu8;

    move-object/from16 p9, v1

    move-object/from16 p8, v3

    move-object/from16 p4, v5

    move-object/from16 p7, v6

    move-object/from16 p5, v13

    move-object/from16 p6, v14

    invoke-direct/range {p4 .. p9}, Leu8;-><init>(Landroidx/recyclerview/widget/RecyclerView;Low8;Lhx;Lk5k;Lwy;)V

    move-object/from16 v1, p4

    invoke-virtual {v14, v1}, Lha2;->G(Lfa2;)V

    sget-object v1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_260
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_270

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lfa2;

    invoke-virtual {v14, v3}, Lha2;->G(Lfa2;)V

    goto :goto_260

    :cond_270
    invoke-virtual/range {p16 .. p16}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    goto :goto_277

    :cond_274
    invoke-virtual/range {p16 .. p16}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :goto_277
    new-instance v1, Lr16;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iget-boolean v3, v4, Lxw8;->c:Z

    if-eqz v3, :cond_283

    if-eqz v0, :cond_283

    const/4 v15, 0x1

    :cond_283
    iput-boolean v15, v4, Lxw8;->E:Z

    if-eqz v15, :cond_2ea

    new-instance v3, Liw8;

    iget-object v5, v2, Lhjf;->h:Lsz4;

    invoke-static {v5}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v6, v4, Lxw8;->p:Lx5f;

    iget-object v7, v4, Lxw8;->h:Low8;

    move-object/from16 v8, p1

    move-object/from16 p9, v1

    move-object/from16 p5, v2

    move-object/from16 p4, v3

    move-object/from16 p6, v5

    move-object/from16 p8, v6

    move-object/from16 p10, v7

    move-object/from16 p7, v8

    invoke-direct/range {p4 .. p10}, Liw8;-><init>(Lcom/opera/android/BrowserActivity;Lsz4;Loi;Lx5f;Lr16;Low8;)V

    move-object/from16 v2, p4

    invoke-virtual {v14, v2}, Lha2;->G(Lfa2;)V

    new-instance v2, Lew8;

    iget-object v3, v4, Lxw8;->h:Low8;

    iget-object v5, v10, Lkue;->i:Ljue;

    iget-object v6, v4, Lxw8;->p:Lx5f;

    move-object/from16 p3, p1

    move-object/from16 p8, p15

    move-object/from16 p4, v1

    move-object/from16 p2, v2

    move-object/from16 p5, v3

    move-object/from16 p6, v5

    move-object/from16 p7, v6

    invoke-direct/range {p2 .. p8}, Lew8;-><init>(Lcom/opera/android/BrowserActivity;Lr16;Low8;Ljue;Lx5f;Lfqe;)V

    invoke-virtual {v14, v2}, Lha2;->G(Lfa2;)V

    iget-object v2, v4, Lxw8;->h:Low8;

    new-instance v3, Lmw8;

    iget-object v5, v4, Lxw8;->r:Lcom/opera/android/settings/SettingsManager;

    iget-object v6, v4, Lxw8;->t:Lcq5;

    iget-object v7, v4, Lxw8;->p:Lx5f;

    invoke-virtual/range {p1 .. p1}, Lcom/opera/android/BrowserActivity;->P0()Lgjm;

    move-result-object v8

    move-object/from16 p5, v2

    move-object/from16 p2, v3

    move-object/from16 p6, v5

    move-object/from16 p7, v6

    move-object/from16 p8, v7

    move-object/from16 p9, v8

    invoke-direct/range {p2 .. p9}, Lmw8;-><init>(Lcom/opera/android/BrowserActivity;Lr16;Low8;Lcom/opera/android/settings/SettingsManager;Lcq5;Lx5f;Lgjm;)V

    move-object/from16 v2, p3

    move-object/from16 v1, p5

    invoke-virtual {v1, v3}, Lha2;->G(Lfa2;)V

    :cond_2ea
    iget-boolean v1, v4, Lxw8;->d:Z

    if-eqz v1, :cond_2f8

    new-instance v1, Lavc;

    const-class v3, Lxuc;

    invoke-direct {v1, v3}, Lavc;-><init>(Ljava/lang/Class;)V

    invoke-virtual {v14, v1}, Lha2;->G(Lfa2;)V

    :cond_2f8
    iget-object v1, v4, Lxw8;->m:Lvu8;

    invoke-virtual {v14, v1}, Lha2;->G(Lfa2;)V

    new-instance v1, Luv8;

    iget-object v3, v4, Lxw8;->j:Lf92;

    invoke-virtual {v3}, Lf92;->d()Ld53;

    move-result-object v3

    iget-object v5, v4, Lxw8;->l:Ljava/lang/Object;

    invoke-direct {v1, v3, v5, v14}, Luv8;-><init>(Ld53;Ljava/lang/Object;Low8;)V

    iput-object v1, v4, Lxw8;->n:Luv8;

    invoke-virtual {v14, v1}, Lha2;->G(Lfa2;)V

    iget-object v1, v4, Lxw8;->g:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v3, v4, Lxw8;->h:Low8;

    invoke-virtual {v1, v3}, Landroidx/recyclerview/widget/RecyclerView;->y0(Landroidx/recyclerview/widget/d;)V

    if-eqz v0, :cond_322

    check-cast v0, Lvue;

    new-instance v1, Lkqd;

    const/16 v3, 0xa

    invoke-direct {v1, v0, v3}, Lkqd;-><init>(Ljava/lang/Object;B)V

    goto :goto_324

    :cond_322
    sget-object v1, Li82;->Do:Lt40;

    :goto_324
    iget-object v0, v4, Lxw8;->j:Lf92;

    invoke-virtual {v0}, Lf92;->c()Lu82;

    move-result-object v0

    new-instance v3, Lrw8;

    iget-object v5, v4, Lxw8;->h:Low8;

    new-instance v6, Leq6;

    invoke-direct {v6, v4}, Leq6;-><init>(Ljava/lang/Object;)V

    invoke-direct {v3, v0, v5, v1, v6}, Lrw8;-><init>(Lu82;Low8;Li82;Leq6;)V

    iput-object v3, v4, Lxw8;->i:Lrw8;

    invoke-interface {v0, v3}, Lu82;->a(Lrw8;)V

    iget-object v0, v4, Lxw8;->v:Lpde;

    new-instance v1, Lks6;

    const/16 v3, 0xc

    invoke-direct {v1, v4, v3}, Lks6;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v2, v1}, Lekc;->j(Lndc;Lf7f;)V

    iget-object v0, v4, Lxw8;->a:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    sget-object v1, Lrv8;->b:Ls16;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v0}, Lr9n;->i(Landroid/content/Context;)Landroid/graphics/Rect;

    move-result-object v1

    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    move-result v1

    const/high16 v2, 0x44740000    # 976.0f

    invoke-static {v0, v2}, Lz7h;->h(Landroid/content/Context;F)I

    move-result v0

    if-le v1, v0, :cond_365

    sget-object v0, Lrv8;->d:Lrv8;

    goto :goto_367

    :cond_365
    sget-object v0, Lrv8;->c:Lrv8;

    :goto_367
    invoke-virtual {v4, v0}, Lxw8;->h(Lrv8;)V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 5

    iget-object v0, p0, Lxw8;->A:Landroid/util/SparseArray;

    if-nez v0, :cond_5

    return-void

    :cond_5
    iget-object v1, p0, Lxw8;->a:Landroid/widget/FrameLayout;

    invoke-virtual {v1, v0}, Landroid/view/View;->restoreHierarchyState(Landroid/util/SparseArray;)V

    iget-object v0, p0, Lxw8;->A:Landroid/util/SparseArray;

    const v1, 0x7f0a0081

    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/Parcelable;

    instance-of v1, v0, Lu0g;

    const/4 v2, 0x0

    iget-object v3, p0, Lxw8;->h:Low8;

    if-eqz v1, :cond_22

    check-cast v0, Lu0g;

    invoke-virtual {v3, v0}, Lha2;->I(Lu0g;)V

    goto :goto_25

    :cond_22
    invoke-virtual {v3, v2}, Lha2;->I(Lu0g;)V

    :goto_25
    iput-object v2, p0, Lxw8;->A:Landroid/util/SparseArray;

    return-void
.end method

.method public final b()V
    .registers 4

    iget-object v0, p0, Lxw8;->a:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    sget-object v1, Lrv8;->b:Ls16;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v0}, Lr9n;->i(Landroid/content/Context;)Landroid/graphics/Rect;

    move-result-object v1

    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    move-result v1

    const/high16 v2, 0x44740000    # 976.0f

    invoke-static {v0, v2}, Lz7h;->h(Landroid/content/Context;F)I

    move-result v0

    if-le v1, v0, :cond_1e

    sget-object v0, Lrv8;->d:Lrv8;

    goto :goto_20

    :cond_1e
    sget-object v0, Lrv8;->c:Lrv8;

    :goto_20
    invoke-virtual {p0, v0}, Lxw8;->h(Lrv8;)V

    return-void
.end method

.method public final c(Z)V
    .registers 7

    iget-object v0, p0, Lxw8;->g:Landroidx/recyclerview/widget/RecyclerView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->y0(Landroidx/recyclerview/widget/d;)V

    iget-object v0, p0, Lxw8;->w:Lhv2;

    iget-boolean v2, v0, Lhv2;->h:Z

    const/4 v3, 0x0

    if-eqz v2, :cond_1d

    iput-boolean v3, v0, Lhv2;->h:Z

    iget-object v2, v0, Lhv2;->g:Lc53;

    if-eqz v2, :cond_1d

    iget-object v4, v0, Lhv2;->e:Lip1;

    invoke-virtual {v4, v2}, Lip1;->accept(Ljava/lang/Object;)V

    iput-object v1, v0, Lhv2;->g:Lc53;

    const/4 v2, 0x1

    iput-boolean v2, v0, Lhv2;->f:Z

    :cond_1d
    if-nez p1, :cond_23

    invoke-virtual {v0}, Lhv2;->e()V

    goto :goto_33

    :cond_23
    iget-boolean p1, v0, Lhv2;->i:Z

    if-eqz p1, :cond_2e

    iget-object p1, v0, Lhv2;->j:Lfv2;

    invoke-static {p1}, Lvml;->a(Ljava/lang/Runnable;)V

    iput-boolean v3, v0, Lhv2;->i:Z

    :cond_2e
    iget-object p1, v0, Lhv2;->d:Ld53;

    invoke-virtual {p1, v0}, Ld53;->m(Ljava/lang/Object;)V

    :goto_33
    iget-object p1, p0, Lxw8;->x:Lww8;

    iget-boolean v0, p1, Lww8;->d:Z

    if-eqz v0, :cond_3e

    iput-boolean v3, p1, Lww8;->d:Z

    invoke-static {p1}, Lvml;->a(Ljava/lang/Runnable;)V

    :cond_3e
    iget-object p1, p0, Lxw8;->h:Low8;

    invoke-virtual {p1}, Lha2;->onDestroy()V

    iget-object p1, p0, Lxw8;->i:Lrw8;

    iget-object v0, p1, Lrw8;->a:Lu82;

    invoke-interface {v0, p1}, Lu82;->b(Lrw8;)V

    iget-object p1, p0, Lxw8;->l:Ljava/lang/Object;

    iget-object v0, p0, Lxw8;->j:Lf92;

    invoke-virtual {v0}, Lf92;->d()Ld53;

    move-result-object v0

    invoke-virtual {v0, p1}, Ld53;->m(Ljava/lang/Object;)V

    iget-object p1, p0, Lxw8;->k:Lv82;

    iput-object v1, p1, Lv82;->b:Ljava/lang/Object;

    iget-object p1, p0, Lxw8;->e:Ltcc;

    iget-object v0, p0, Lxw8;->f:Ly73;

    invoke-virtual {p1, v0}, Ltcc;->b(Lmdc;)V

    iget-object p1, p0, Lxw8;->y:Ls9i;

    invoke-virtual {p1}, Ls9i;->T()V

    iget-boolean p1, p0, Lxw8;->D:Z

    if-eqz p1, :cond_6e

    iget-object p0, p0, Lxw8;->s:Lqie;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :cond_6e
    return-void
.end method

.method public final d()V
    .registers 6

    iget-object v0, p0, Lxw8;->f:Ly73;

    iget-boolean v0, v0, Ly73;->b:Z

    iget-boolean v1, p0, Lxw8;->D:Z

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eqz v1, :cond_12

    iget-boolean v1, p0, Lxw8;->C:Z

    if-eqz v1, :cond_12

    if-eqz v0, :cond_12

    move v0, v3

    goto :goto_13

    :cond_12
    move v0, v2

    :goto_13
    iget-object p0, p0, Lxw8;->x:Lww8;

    iget-boolean v1, p0, Lww8;->e:Z

    if-ne v1, v0, :cond_1a

    return-void

    :cond_1a
    iput-boolean v0, p0, Lww8;->e:Z

    iget-object v1, p0, Lww8;->a:Lwr9;

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iget-object v4, v1, Lwr9;->c:Ljava/lang/Object;

    iput-object v0, v1, Lwr9;->c:Ljava/lang/Object;

    if-nez v4, :cond_29

    move v2, v3

    :cond_29
    invoke-virtual {p0, v2}, Lww8;->a(Z)V

    return-void
.end method

.method public final e(IZ)V
    .registers 8

    iget-object v0, p0, Lxw8;->s:Lqie;

    iget-object v1, v0, Lqie;->b:Ljava/lang/Object;

    check-cast v1, Lc5k;

    iget-object v1, v1, Lc5k;->n:Lorg/chromium/third_party/android/swiperefresh/SwipeRefreshLayout;

    iget-boolean v1, v1, Lorg/chromium/third_party/android/swiperefresh/SwipeRefreshLayout;->b:Z

    if-eqz v1, :cond_d

    return-void

    :cond_d
    const/4 v1, 0x0

    const/4 v2, 0x2

    const/4 v3, 0x1

    if-eq p1, v3, :cond_18

    if-ne p1, v2, :cond_1d

    invoke-virtual {p0}, Lxw8;->g()V

    goto :goto_1d

    :cond_18
    iget-object p1, p0, Lxw8;->g:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p1, v1}, Landroidx/recyclerview/widget/RecyclerView;->x0(I)V

    :cond_1d
    :goto_1d
    if-eqz p2, :cond_95

    iget-object p1, v0, Lqie;->b:Ljava/lang/Object;

    check-cast p1, Lc5k;

    iget-object p2, p1, Lc5k;->l:Lcom/opera/android/feed/FeedScrollView;

    invoke-virtual {p2}, Landroid/view/View;->getScrollY()I

    move-result v0

    iget v4, p1, Lc5k;->Q:I

    if-lt v0, v4, :cond_45

    invoke-virtual {p2}, Landroidx/core/widget/NestedScrollView;->computeVerticalScrollRange()I

    move-result v0

    invoke-virtual {p2}, Landroidx/core/widget/NestedScrollView;->computeVerticalScrollExtent()I

    move-result v4

    sub-int/2addr v0, v4

    invoke-virtual {p2}, Landroid/view/View;->getScrollY()I

    move-result v4

    sub-int/2addr v0, v4

    invoke-virtual {p2}, Landroid/view/View;->getHeight()I

    move-result p2

    div-int/2addr p2, v2

    if-ge v0, p2, :cond_45

    invoke-virtual {p1}, Lc5k;->f()V

    :cond_45
    iget-object p1, p1, Lc5k;->n:Lorg/chromium/third_party/android/swiperefresh/SwipeRefreshLayout;

    iget-boolean p2, p1, Lorg/chromium/third_party/android/swiperefresh/SwipeRefreshLayout;->b:Z

    if-eq p2, v3, :cond_92

    iput-boolean v3, p1, Lorg/chromium/third_party/android/swiperefresh/SwipeRefreshLayout;->b:Z

    iget-boolean p2, p1, Lorg/chromium/third_party/android/swiperefresh/SwipeRefreshLayout;->x:Z

    iget v0, p1, Lorg/chromium/third_party/android/swiperefresh/SwipeRefreshLayout;->t:F

    if-nez p2, :cond_57

    iget p2, p1, Lorg/chromium/third_party/android/swiperefresh/SwipeRefreshLayout;->n:I

    int-to-float p2, p2

    add-float/2addr v0, p2

    :cond_57
    float-to-int p2, v0

    iget v0, p1, Lorg/chromium/third_party/android/swiperefresh/SwipeRefreshLayout;->e:I

    sub-int/2addr p2, v0

    invoke-virtual {p1, p2}, Lorg/chromium/third_party/android/swiperefresh/SwipeRefreshLayout;->d(I)V

    iput-boolean v1, p1, Lorg/chromium/third_party/android/swiperefresh/SwipeRefreshLayout;->u:Z

    iget-object p2, p1, Lorg/chromium/third_party/android/swiperefresh/SwipeRefreshLayout;->A:Luvk;

    iget-object v0, p1, Lorg/chromium/third_party/android/swiperefresh/SwipeRefreshLayout;->j:Lg05;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p1, Lorg/chromium/third_party/android/swiperefresh/SwipeRefreshLayout;->o:Lvdd;

    const/16 v2, 0xff

    invoke-virtual {v0, v2}, Lvdd;->setAlpha(I)V

    iget-object v0, p1, Lorg/chromium/third_party/android/swiperefresh/SwipeRefreshLayout;->p:Lwvk;

    if-nez v0, :cond_7f

    new-instance v0, Lwvk;

    invoke-direct {v0, p1, v1}, Lwvk;-><init>(Lorg/chromium/third_party/android/swiperefresh/SwipeRefreshLayout;B)V

    iput-object v0, p1, Lorg/chromium/third_party/android/swiperefresh/SwipeRefreshLayout;->p:Lwvk;

    iget v1, p1, Lorg/chromium/third_party/android/swiperefresh/SwipeRefreshLayout;->d:I

    int-to-long v1, v1

    invoke-virtual {v0, v1, v2}, Landroid/view/animation/Animation;->setDuration(J)V

    :cond_7f
    if-eqz p2, :cond_85

    iget-object v0, p1, Lorg/chromium/third_party/android/swiperefresh/SwipeRefreshLayout;->j:Lg05;

    iput-object p2, v0, Lg05;->a:Landroid/view/animation/Animation$AnimationListener;

    :cond_85
    iget-object p2, p1, Lorg/chromium/third_party/android/swiperefresh/SwipeRefreshLayout;->j:Lg05;

    invoke-virtual {p2}, Landroid/view/View;->clearAnimation()V

    iget-object p2, p1, Lorg/chromium/third_party/android/swiperefresh/SwipeRefreshLayout;->j:Lg05;

    iget-object p1, p1, Lorg/chromium/third_party/android/swiperefresh/SwipeRefreshLayout;->p:Lwvk;

    invoke-virtual {p2, p1}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    goto :goto_95

    :cond_92
    invoke-virtual {p1, v3, v1}, Lorg/chromium/third_party/android/swiperefresh/SwipeRefreshLayout;->c(ZZ)V

    :cond_95
    :goto_95
    iget-object p1, p0, Lxw8;->h:Low8;

    iget-object p1, p1, Lha2;->b:Ljava/util/LinkedHashMap;

    invoke-virtual {p1}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object p1

    const-class p2, Lzsh;

    invoke-static {p1, p2}, Lsfe;->R(Ljava/lang/Iterable;Ljava/lang/Class;)Lzlb;

    move-result-object p1

    invoke-virtual {p1}, Lzlb;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_a7
    move-object p2, p1

    check-cast p2, Lbmb;

    invoke-virtual {p2}, Lbmb;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_ba

    invoke-virtual {p2}, Lbmb;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lzsh;

    invoke-interface {p2}, Lzsh;->c()V

    goto :goto_a7

    :cond_ba
    iget-object p1, p0, Lxw8;->k:Lv82;

    const/4 p2, 0x0

    iget-object v0, p0, Lxw8;->j:Lf92;

    iget-object p0, p0, Lxw8;->l:Ljava/lang/Object;

    invoke-virtual {v0, p0, p2, p1}, Lf92;->e(Ljava/lang/Object;Loqe;Lw82;)V

    return-void
.end method

.method public final f()Landroid/util/SparseArray;
    .registers 9

    iget-object v0, p0, Lxw8;->A:Landroid/util/SparseArray;

    if-eqz v0, :cond_5

    return-object v0

    :cond_5
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iget-object v1, p0, Lxw8;->a:Landroid/widget/FrameLayout;

    invoke-virtual {v1, v0}, Landroid/view/View;->saveHierarchyState(Landroid/util/SparseArray;)V

    iget-object p0, p0, Lxw8;->h:Low8;

    iget-object v1, p0, Lha2;->d:Lf1p;

    iget-object v1, v1, Lf1p;->a:Ljava/lang/Object;

    check-cast v1, Li7f;

    const-class v2, Lya2;

    invoke-static {v1, v2}, Lsfe;->R(Ljava/lang/Iterable;Ljava/lang/Class;)Lzlb;

    move-result-object v1

    invoke-virtual {v1}, Lzlb;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_21
    move-object v2, v1

    check-cast v2, Lbmb;

    invoke-virtual {v2}, Lbmb;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_34

    invoke-virtual {v2}, Lbmb;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lya2;

    invoke-interface {v2}, Lya2;->t()V

    goto :goto_21

    :cond_34
    new-instance v1, Lu0g;

    invoke-direct {v1}, Landroid/util/SparseArray;-><init>()V

    const-class v2, Lja2;

    invoke-virtual {v2, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    iget-object v4, p0, Lha2;->a:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    :goto_47
    if-ltz v5, :cond_69

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lja2;

    if-nez v3, :cond_57

    invoke-virtual {v2, v6}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_66

    :cond_57
    invoke-virtual {v6}, Lja2;->d()Z

    move-result v7

    if-eqz v7, :cond_66

    invoke-virtual {v6}, Ljava/lang/Object;->hashCode()I

    move-result v7

    iget-object v6, v6, Lja2;->a:Lu0g;

    invoke-virtual {v1, v7, v6}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    :cond_66
    add-int/lit8 v5, v5, -0x1

    goto :goto_47

    :cond_69
    iget-object p0, p0, Lha2;->b:Ljava/util/LinkedHashMap;

    invoke-virtual {p0}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object p0

    invoke-static {p0}, Ljava/util/Collections;->unmodifiableCollection(Ljava/util/Collection;)Ljava/util/Collection;

    move-result-object p0

    check-cast p0, Ljava/util/Collection;

    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_79
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_89

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lfa2;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    goto :goto_79

    :cond_89
    const p0, 0x7f0a0081

    invoke-virtual {v0, p0, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    return-object v0
.end method

.method public final g()V
    .registers 7

    iget-object v0, p0, Lxw8;->h:Low8;

    iget-object v0, v0, Lha2;->a:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    move v3, v2

    :goto_a
    if-ge v3, v1, :cond_1f

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    add-int/lit8 v3, v3, 0x1

    check-cast v4, Lja2;

    instance-of v5, v4, Lj82;

    if-nez v5, :cond_20

    instance-of v4, v4, Lmq;

    if-nez v4, :cond_20

    add-int/lit8 v2, v2, 0x1

    goto :goto_a

    :cond_1f
    const/4 v2, -0x1

    :cond_20
    if-gez v2, :cond_23

    return-void

    :cond_23
    iget-object p0, p0, Lxw8;->g:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p0, v2}, Landroidx/recyclerview/widget/RecyclerView;->H0(I)V

    return-void
.end method

.method public final h(Lrv8;)V
    .registers 7

    iget-object v0, p0, Lxw8;->B:Ligi;

    const/4 v1, 0x0

    if-eqz v0, :cond_36

    iget-object v2, v0, Ligi;->b:Ljava/lang/Object;

    check-cast v2, Lrv8;

    if-eq v2, p1, :cond_72

    iget-object v2, v0, Ligi;->g:Ljava/lang/Object;

    check-cast v2, Lxw8;

    iget-object v3, v2, Lxw8;->g:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v4, v0, Ligi;->d:Ljava/lang/Object;

    check-cast v4, Lqv8;

    invoke-virtual {v3, v4}, Landroidx/recyclerview/widget/RecyclerView;->q0(Liph;)V

    iget-object v4, v0, Ligi;->e:Ljava/lang/Object;

    check-cast v4, Lz6b;

    invoke-virtual {v3, v4}, Landroidx/recyclerview/widget/RecyclerView;->t0(Loph;)V

    iget-object v3, v0, Ligi;->f:Ljava/lang/Object;

    check-cast v3, Ltw8;

    if-eqz v3, :cond_2a

    iget-object v2, v2, Lxw8;->h:Low8;

    invoke-virtual {v2, v3}, Landroidx/recyclerview/widget/d;->unregisterAdapterDataObserver(Lgph;)V

    :cond_2a
    new-instance v2, Lfr;

    iget-object v0, v0, Ligi;->c:Ljava/lang/Object;

    check-cast v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-direct {v2, v0}, Lfr;-><init>(Landroidx/recyclerview/widget/LinearLayoutManager;)V

    iput-object v1, p0, Lxw8;->B:Ligi;

    move-object v1, v2

    :cond_36
    new-instance v0, Ligi;

    invoke-direct {v0, p0, p1}, Ligi;-><init>(Lxw8;Lrv8;)V

    iput-object v0, p0, Lxw8;->B:Ligi;

    iget-object p1, v0, Ligi;->d:Ljava/lang/Object;

    check-cast p1, Lqv8;

    iget-object v0, p0, Lxw8;->v:Lpde;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iget v2, p1, Lqv8;->f:I

    if-eq v2, v0, :cond_53

    iput v0, p1, Lqv8;->f:I

    :cond_53
    iget-object p1, p0, Lxw8;->B:Ligi;

    iget-object p1, p1, Ligi;->c:Ljava/lang/Object;

    check-cast p1, Landroidx/recyclerview/widget/LinearLayoutManager;

    iget-object v0, p0, Lxw8;->g:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/RecyclerView;->C0(Landroidx/recyclerview/widget/f;)V

    if-eqz v1, :cond_72

    iget-object p0, p0, Lxw8;->B:Ligi;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget p1, v1, Lfr;->b:I

    if-ltz p1, :cond_72

    iget-object p0, p0, Ligi;->c:Ljava/lang/Object;

    check-cast p0, Landroidx/recyclerview/widget/LinearLayoutManager;

    iget v0, v1, Lfr;->c:I

    invoke-virtual {p0, p1, v0}, Landroidx/recyclerview/widget/LinearLayoutManager;->scrollToPositionWithOffset(II)V

    :cond_72
    return-void
.end method

.method public final i(Z)V
    .registers 4

    iget-object p0, p0, Lxw8;->h:Low8;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object p0, p0, Lha2;->b:Ljava/util/LinkedHashMap;

    invoke-virtual {p0}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object p0

    const-class v0, Le5k;

    invoke-static {p0, v0}, Lsfe;->R(Ljava/lang/Iterable;Ljava/lang/Class;)Lzlb;

    move-result-object p0

    invoke-virtual {p0}, Lzlb;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_15
    move-object v0, p0

    check-cast v0, Lbmb;

    invoke-virtual {v0}, Lbmb;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_28

    invoke-virtual {v0}, Lbmb;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le5k;

    invoke-interface {v0, p1}, Le5k;->p(Z)V

    goto :goto_15

    :cond_28
    return-void
.end method

.method public final j(Z)V
    .registers 4

    iput-boolean p1, p0, Lxw8;->C:Z

    invoke-virtual {p0}, Lxw8;->d()V

    new-instance p1, Lix8;

    iget-boolean v0, p0, Lxw8;->D:Z

    iget-boolean v1, p0, Lxw8;->C:Z

    invoke-direct {p1, v0, v1}, Lix8;-><init>(ZZ)V

    iget-object p0, p0, Lxw8;->h:Low8;

    invoke-virtual {p0, p1}, Lha2;->b(Lsjm;)V

    return-void
.end method

.method public final k(Z)V
    .registers 5

    iput-boolean p1, p0, Lxw8;->D:Z

    invoke-virtual {p0}, Lxw8;->d()V

    new-instance p1, Lix8;

    iget-boolean v0, p0, Lxw8;->D:Z

    iget-boolean v1, p0, Lxw8;->C:Z

    invoke-direct {p1, v0, v1}, Lix8;-><init>(ZZ)V

    iget-object v0, p0, Lxw8;->h:Low8;

    invoke-virtual {v0, p1}, Lha2;->b(Lsjm;)V

    iget-boolean p1, p0, Lxw8;->D:Z

    if-nez p1, :cond_22

    iget-object p1, p0, Lxw8;->l:Ljava/lang/Object;

    iget-object v0, p0, Lxw8;->j:Lf92;

    invoke-virtual {v0}, Lf92;->d()Ld53;

    move-result-object v0

    invoke-virtual {v0, p1}, Ld53;->m(Ljava/lang/Object;)V

    :cond_22
    iget-boolean p1, p0, Lxw8;->D:Z

    iget-object v0, p0, Lxw8;->s:Lqie;

    if-eqz p1, :cond_2c

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    goto :goto_2f

    :cond_2c
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :goto_2f
    iget-boolean p1, p0, Lxw8;->D:Z

    if-eqz p1, :cond_52

    iget-boolean p1, p0, Lxw8;->C:Z

    if-eqz p1, :cond_52

    iget-object p1, p0, Lxw8;->p:Lx5f;

    iget-boolean v0, p1, Lx5f;->h:Z

    if-eqz v0, :cond_52

    iget-object v0, p1, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v1

    invoke-virtual {v1, v0}, Lx56;->E(Lzpa;)Lfi0;

    move-result-object v2

    invoke-virtual {v2, v0}, Lfi0;->z(Lzpa;)Llj0;

    move-result-object v0

    const/4 v2, 0x2

    invoke-virtual {v0, v2}, Ljf0;->e(I)V

    invoke-virtual {p1, v1}, Lx5f;->U0(Lx56;)V

    :cond_52
    iget-object p0, p0, Lxw8;->z:Lvw8;

    invoke-virtual {p0}, Lvw8;->a()V

    return-void
.end method

.method public final l()V
    .registers 1

    iget-object p0, p0, Lxw8;->h:Low8;

    iget-object p0, p0, Lha2;->c:Laan;

    invoke-virtual {p0}, Lcan;->d()V

    return-void
.end method
