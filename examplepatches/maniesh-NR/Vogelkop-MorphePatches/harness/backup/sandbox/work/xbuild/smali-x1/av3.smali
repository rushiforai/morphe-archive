.class public final Lav3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll24;


# instance fields
.field public final a:Ljava/util/LinkedHashSet;

.field public b:Lvvb;

.field public c:Landroid/view/View;

.field public final synthetic d:Lcom/opera/android/BrowserActivity;


# direct methods
.method public constructor <init>(Lcom/opera/android/BrowserActivity;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lav3;->d:Lcom/opera/android/BrowserActivity;

    new-instance p1, Ljava/util/LinkedHashSet;

    invoke-direct {p1}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object p1, p0, Lav3;->a:Ljava/util/LinkedHashSet;

    return-void
.end method


# virtual methods
.method public final L()V
    .registers 5

    iget-object v0, p0, Lav3;->d:Lcom/opera/android/BrowserActivity;

    iget-object v1, v0, Lcom/opera/android/BrowserActivity;->Q:Lcom/opera/android/RootView;

    const/4 v2, 0x0

    if-nez v1, :cond_8

    move-object v1, v2

    :cond_8
    invoke-virtual {v1}, Landroid/view/View;->findFocus()Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lav3;->c:Landroid/view/View;

    invoke-virtual {v0}, Lt5d;->e0()Lcom/opera/android/browser/chromium/ChromiumContainerView;

    move-result-object v1

    const/high16 v3, 0x60000

    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->setDescendantFocusability(I)V

    iget-object p0, p0, Lav3;->a:Ljava/util/LinkedHashSet;

    invoke-interface {p0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    iget-object v1, v0, Lcom/opera/android/BrowserActivity;->A:Lcom/opera/android/bar/BottomBar;

    if-nez v1, :cond_21

    move-object v1, v2

    :cond_21
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->setDescendantFocusability(I)V

    invoke-interface {p0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    iget-object v0, v0, Lcom/opera/android/BrowserActivity;->W:Lcom/opera/android/bar/TopToolbarContainer;

    if-eqz v0, :cond_2c

    move-object v2, v0

    :cond_2c
    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->setDescendantFocusability(I)V

    invoke-interface {p0, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public final S()V
    .registers 2

    iget-object p0, p0, Lav3;->d:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p0}, Lt5d;->e0()Lcom/opera/android/browser/chromium/ChromiumContainerView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-nez v0, :cond_17

    invoke-virtual {p0}, Lt5d;->e0()Lcom/opera/android/browser/chromium/ChromiumContainerView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->requestFocus()Z

    move-result v0

    if-eqz v0, :cond_17

    return-void

    :cond_17
    iget-object p0, p0, Lcom/opera/android/BrowserActivity;->Q:Lcom/opera/android/RootView;

    if-nez p0, :cond_1c

    const/4 p0, 0x0

    :cond_1c
    invoke-virtual {p0}, Landroid/view/View;->requestFocus()Z

    return-void
.end method

.method public final V()Z
    .registers 5

    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    iget-object p0, p0, Lav3;->d:Lcom/opera/android/BrowserActivity;

    iget-object v0, p0, Ldx3;->o:Lqim;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v0}, Lqim;->b()Z

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_65

    invoke-virtual {p0}, Lcom/opera/android/BrowserActivity;->M0()Lysl;

    move-result-object v0

    const/4 v2, 0x0

    invoke-interface {v0, v2}, Lysl;->b0(Ljava/lang/Runnable;)V

    iget-object v0, p0, Lcom/opera/android/BrowserActivity;->M:Lgbf;

    if-nez v0, :cond_1d

    move-object v0, v2

    :cond_1d
    iget-object v0, v0, Lgbf;->j:Lvbf;

    invoke-virtual {v0}, Lvbf;->p()Z

    move-result v0

    if-eqz v0, :cond_51

    iget-object p0, p0, Lcom/opera/android/BrowserActivity;->M:Lgbf;

    if-eqz p0, :cond_2a

    move-object v2, p0

    :cond_2a
    iget-object p0, v2, Lgbf;->s:Lay;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lzqi;

    iget-object v0, p0, Lzqi;->a:Lmri;

    invoke-virtual {v0}, Lo73;->k()Z

    move-result v2

    if-eqz v2, :cond_44

    invoke-virtual {v0}, Lo73;->k()Z

    move-result p0

    if-eqz p0, :cond_65

    invoke-virtual {v0}, Lo73;->b()Z

    return v1

    :cond_44
    iget-object p0, p0, Lzqi;->c:Lxd5;

    const v2, 0x7f0a05f8

    invoke-virtual {p0, v2}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object p0

    invoke-virtual {v0, p0}, Lo73;->o(Landroid/view/View;)V

    return v1

    :cond_51
    invoke-virtual {p0}, Lcom/opera/android/BrowserActivity;->B0()Landroidx/fragment/app/Fragment;

    move-result-object v0

    if-eqz v0, :cond_58

    return v1

    :cond_58
    invoke-virtual {p0}, Landroidx/fragment/app/r;->getSupportFragmentManager()Landroidx/fragment/app/w;

    move-result-object v0

    invoke-static {v0}, Lcqp;->d0(Landroidx/fragment/app/w;)I

    move-result v0

    if-eqz v0, :cond_6f

    const/4 v3, 0x2

    if-eq v0, v3, :cond_66

    :cond_65
    return v1

    :cond_66
    invoke-virtual {p0}, Landroidx/fragment/app/r;->getSupportFragmentManager()Landroidx/fragment/app/w;

    move-result-object p0

    const/4 v0, -0x1

    invoke-virtual {p0, v0, v1, v2}, Landroidx/fragment/app/w;->Y(IILjava/lang/String;)Z

    return v1

    :cond_6f
    invoke-virtual {p0}, Lcom/opera/android/BrowserActivity;->v1()V

    return v1
.end method

.method public final Z()Z
    .registers 3

    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    iget-object p0, p0, Lav3;->d:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p0}, Lcom/opera/android/BrowserActivity;->w0()Lb2l;

    move-result-object v0

    if-eqz v0, :cond_1d

    check-cast v0, Ld7l;

    invoke-virtual {v0}, Ld7l;->n()Z

    move-result v0

    if-eqz v0, :cond_1d

    new-instance v0, Lby3;

    const/4 v1, 0x2

    invoke-direct {v0, v1, v1}, Lby3;-><init>(II)V

    invoke-virtual {p0, v0}, Lcom/opera/android/BrowserActivity;->c1(Lby3;)V

    const/4 p0, 0x1

    return p0

    :cond_1d
    const/4 p0, 0x0

    return p0
.end method

.method public final a()V
    .registers 3

    iget-object p0, p0, Lav3;->d:Lcom/opera/android/BrowserActivity;

    iget-object v0, p0, Lcom/opera/android/BrowserActivity;->M:Lgbf;

    const/4 v1, 0x0

    if-nez v0, :cond_8

    move-object v0, v1

    :cond_8
    iget-object v0, v0, Lgbf;->j:Lvbf;

    invoke-virtual {v0}, Lvbf;->p()Z

    move-result v0

    if-eqz v0, :cond_11

    return-void

    :cond_11
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/opera/android/BrowserActivity;->o1(I)V

    iget-object p0, p0, Lcom/opera/android/BrowserActivity;->M:Lgbf;

    if-nez p0, :cond_1a

    move-object p0, v1

    :cond_1a
    sget-object v0, Lhbf;->c:Lhbf;

    invoke-virtual {p0, v1, v0}, Lgbf;->l(Lbsi;Lhbf;)V

    return-void
.end method

.method public final b()Lvvb;
    .registers 39

    move-object/from16 v0, p0

    iget-object v1, v0, Lav3;->b:Lvvb;

    if-nez v1, :cond_247

    new-instance v1, Lvvb;

    new-instance v2, Luvb;

    new-instance v3, Lpt3;

    const/16 v4, 0x12

    iget-object v5, v0, Lav3;->d:Lcom/opera/android/BrowserActivity;

    invoke-direct {v3, v5, v4}, Lpt3;-><init>(Lcom/opera/android/BrowserActivity;B)V

    const v4, 0x7f0a05cf

    const/4 v6, 0x2

    const/16 v7, 0x30

    invoke-direct {v2, v4, v6, v7, v3}, Luvb;-><init>(IIILtvb;)V

    new-instance v3, Luvb;

    new-instance v4, Lpt3;

    const/16 v8, 0x14

    invoke-direct {v4, v5, v8}, Lpt3;-><init>(Lcom/opera/android/BrowserActivity;B)V

    const v8, 0x7f0a05ca

    const/16 v9, 0x33

    invoke-direct {v3, v8, v6, v9, v4}, Luvb;-><init>(IIILtvb;)V

    new-instance v4, Luvb;

    new-instance v8, Lpt3;

    const/16 v10, 0x16

    invoke-direct {v8, v5, v10}, Lpt3;-><init>(Lcom/opera/android/BrowserActivity;B)V

    const v11, 0x7f0a05d7

    const/16 v12, 0x2e

    invoke-direct {v4, v11, v6, v12, v8}, Luvb;-><init>(IIILtvb;)V

    new-instance v8, Luvb;

    new-instance v11, Lpt3;

    const/16 v12, 0x17

    invoke-direct {v11, v5, v12}, Lpt3;-><init>(Lcom/opera/android/BrowserActivity;B)V

    const v12, 0x7f0a05cd

    const/4 v13, 0x1

    const/16 v14, 0x15

    invoke-direct {v8, v12, v13, v14, v11}, Luvb;-><init>(IIILtvb;)V

    new-instance v11, Luvb;

    new-instance v12, Lpt3;

    const/16 v15, 0x18

    invoke-direct {v12, v5, v15}, Lpt3;-><init>(Lcom/opera/android/BrowserActivity;B)V

    const v15, 0x7f0a05ce

    invoke-direct {v11, v15, v13, v10, v12}, Luvb;-><init>(IIILtvb;)V

    new-instance v10, Luvb;

    new-instance v12, Lpt3;

    const/16 v15, 0x19

    invoke-direct {v12, v5, v15}, Lpt3;-><init>(Lcom/opera/android/BrowserActivity;B)V

    const v15, 0x7f0a05d9

    const/4 v13, 0x6

    const/16 v7, 0x3d

    invoke-direct {v10, v15, v13, v7, v12}, Luvb;-><init>(IIILtvb;)V

    move-object v12, v8

    new-instance v8, Luvb;

    new-instance v14, Lpt3;

    const/16 v9, 0x1a

    invoke-direct {v14, v5, v9}, Lpt3;-><init>(Lcom/opera/android/BrowserActivity;B)V

    const v9, 0x7f0a05d8

    invoke-direct {v8, v9, v6, v7, v14}, Luvb;-><init>(IIILtvb;)V

    new-instance v7, Luvb;

    new-instance v14, Lpt3;

    const/16 v13, 0x1b

    invoke-direct {v14, v5, v13}, Lpt3;-><init>(Lcom/opera/android/BrowserActivity;B)V

    const/16 v13, 0x5c

    invoke-direct {v7, v15, v6, v13, v14}, Luvb;-><init>(IIILtvb;)V

    move-object v13, v7

    move-object v7, v10

    new-instance v10, Luvb;

    new-instance v14, Lpt3;

    const/16 v15, 0x1c

    invoke-direct {v14, v5, v15}, Lpt3;-><init>(Lcom/opera/android/BrowserActivity;B)V

    const/16 v15, 0x5d

    invoke-direct {v10, v9, v6, v15, v14}, Luvb;-><init>(IIILtvb;)V

    move-object v9, v11

    new-instance v11, Luvb;

    new-instance v14, Lpt3;

    const/16 v15, 0x1d

    invoke-direct {v14, v5, v15}, Lpt3;-><init>(Lcom/opera/android/BrowserActivity;B)V

    const/4 v15, 0x0

    move-object/from16 v19, v2

    const/16 v2, 0x33

    const/4 v6, 0x6

    invoke-direct {v11, v15, v6, v2, v14}, Luvb;-><init>(IIILtvb;)V

    move-object v2, v12

    new-instance v12, Luvb;

    new-instance v14, Lpt3;

    const/16 v6, 0x15

    invoke-direct {v14, v5, v6}, Lpt3;-><init>(Lcom/opera/android/BrowserActivity;B)V

    const/16 v6, 0x2a

    move-object/from16 v18, v2

    const/4 v2, 0x6

    invoke-direct {v12, v15, v2, v6, v14}, Luvb;-><init>(IIILtvb;)V

    move-object v6, v9

    move-object v9, v13

    new-instance v13, Luvb;

    new-instance v14, Lxu3;

    invoke-direct {v14, v5, v15}, Lxu3;-><init>(Lcom/opera/android/BrowserActivity;B)V

    move-object/from16 v22, v3

    const/16 v3, 0x30

    invoke-direct {v13, v15, v2, v3, v14}, Luvb;-><init>(IIILtvb;)V

    new-instance v14, Luvb;

    new-instance v2, Lxu3;

    const/4 v3, 0x1

    invoke-direct {v2, v5, v3}, Lxu3;-><init>(Lcom/opera/android/BrowserActivity;B)V

    const v3, 0x7f0a05cb

    const/16 v15, 0x22

    move-object/from16 v23, v4

    const/4 v4, 0x2

    invoke-direct {v14, v3, v4, v15, v2}, Luvb;-><init>(IIILtvb;)V

    new-instance v2, Luvb;

    new-instance v3, Lxu3;

    invoke-direct {v3, v5, v4}, Lxu3;-><init>(Lcom/opera/android/BrowserActivity;B)V

    const v15, 0x7f0a05d2

    move-object/from16 v25, v6

    const/16 v6, 0x24

    invoke-direct {v2, v15, v4, v6, v3}, Luvb;-><init>(IIILtvb;)V

    new-instance v3, Luvb;

    new-instance v6, Lxu3;

    const/4 v15, 0x3

    invoke-direct {v6, v5, v15}, Lxu3;-><init>(Lcom/opera/android/BrowserActivity;B)V

    const v15, 0x7f0a05d1

    move-object/from16 v27, v2

    const/16 v2, 0x26

    invoke-direct {v3, v15, v4, v2, v6}, Luvb;-><init>(IIILtvb;)V

    new-instance v2, Luvb;

    new-instance v6, Lxu3;

    const/4 v15, 0x4

    invoke-direct {v6, v5, v15}, Lxu3;-><init>(Lcom/opera/android/BrowserActivity;B)V

    const v15, 0x7f0a05c8

    move-object/from16 v29, v3

    const/16 v3, 0x20

    invoke-direct {v2, v15, v4, v3, v6}, Luvb;-><init>(IIILtvb;)V

    new-instance v3, Luvb;

    new-instance v6, Lwu3;

    const/16 v15, 0x9

    invoke-direct {v6, v0, v15}, Lwu3;-><init>(Lav3;B)V

    const/16 v15, 0x21

    move-object/from16 v31, v2

    const/4 v2, 0x0

    invoke-direct {v3, v2, v4, v15, v6}, Luvb;-><init>(IIILtvb;)V

    new-instance v6, Luvb;

    new-instance v15, Lwu3;

    const/16 v2, 0xa

    invoke-direct {v15, v0, v2}, Lwu3;-><init>(Lav3;B)V

    const/16 v2, 0x27

    move-object/from16 v34, v3

    const/4 v3, 0x0

    invoke-direct {v6, v3, v4, v2, v15}, Luvb;-><init>(IIILtvb;)V

    new-instance v2, Luvb;

    new-instance v15, Lwu3;

    const/16 v3, 0xb

    invoke-direct {v15, v0, v3}, Lwu3;-><init>(Lav3;B)V

    const/16 v3, 0x28

    move-object/from16 v36, v6

    const/4 v6, 0x0

    invoke-direct {v2, v6, v4, v3, v15}, Luvb;-><init>(IIILtvb;)V

    new-instance v3, Luvb;

    new-instance v6, Lpt3;

    const/16 v15, 0x13

    invoke-direct {v6, v5, v15}, Lpt3;-><init>(Lcom/opera/android/BrowserActivity;B)V

    const v15, 0x7f0a05c9

    move-object/from16 v37, v2

    const/16 v2, 0x2f

    invoke-direct {v3, v15, v4, v2, v6}, Luvb;-><init>(IIILtvb;)V

    new-instance v2, Luvb;

    new-instance v4, Lyu3;

    invoke-direct {v4, v5}, Lyu3;-><init>(Lcom/opera/android/BrowserActivity;)V

    const v6, 0x7f0a05cc

    move-object/from16 v16, v3

    const/16 v3, 0x21

    const/4 v15, 0x1

    invoke-direct {v2, v6, v15, v3, v4}, Luvb;-><init>(IIILtvb;)V

    new-instance v3, Luvb;

    new-instance v4, Lzu3;

    invoke-direct {v4, v5}, Lzu3;-><init>(Lcom/opera/android/BrowserActivity;)V

    const v5, 0x7f0a05d5

    const/16 v6, 0x22

    invoke-direct {v3, v5, v15, v6, v4}, Luvb;-><init>(IIILtvb;)V

    new-instance v4, Luvb;

    new-instance v5, Lwu3;

    const/4 v6, 0x0

    invoke-direct {v5, v0, v6}, Lwu3;-><init>(Lav3;B)V

    const/16 v15, 0x8

    move-object/from16 v24, v2

    const/4 v2, 0x2

    invoke-direct {v4, v6, v2, v15, v5}, Luvb;-><init>(IIILtvb;)V

    new-instance v5, Luvb;

    new-instance v15, Lwu3;

    move-object/from16 v32, v3

    const/4 v3, 0x1

    invoke-direct {v15, v0, v3}, Lwu3;-><init>(Lav3;B)V

    const/16 v3, 0x9

    invoke-direct {v5, v6, v2, v3, v15}, Luvb;-><init>(IIILtvb;)V

    new-instance v3, Luvb;

    new-instance v15, Lwu3;

    invoke-direct {v15, v0, v2}, Lwu3;-><init>(Lav3;B)V

    move-object/from16 v17, v4

    const/16 v4, 0xa

    invoke-direct {v3, v6, v2, v4, v15}, Luvb;-><init>(IIILtvb;)V

    new-instance v4, Luvb;

    new-instance v15, Lwu3;

    move-object/from16 v30, v3

    const/4 v3, 0x3

    invoke-direct {v15, v0, v3}, Lwu3;-><init>(Lav3;B)V

    const/16 v3, 0xb

    invoke-direct {v4, v6, v2, v3, v15}, Luvb;-><init>(IIILtvb;)V

    new-instance v3, Luvb;

    new-instance v15, Lwu3;

    const/4 v2, 0x4

    invoke-direct {v15, v0, v2}, Lwu3;-><init>(Lav3;B)V

    const/16 v2, 0xc

    move-object/from16 v28, v4

    const/4 v4, 0x2

    invoke-direct {v3, v6, v4, v2, v15}, Luvb;-><init>(IIILtvb;)V

    new-instance v2, Luvb;

    new-instance v15, Lwu3;

    const/4 v4, 0x5

    invoke-direct {v15, v0, v4}, Lwu3;-><init>(Lav3;B)V

    const/16 v4, 0xd

    move-object/from16 v33, v3

    const/4 v3, 0x2

    invoke-direct {v2, v6, v3, v4, v15}, Luvb;-><init>(IIILtvb;)V

    new-instance v4, Luvb;

    new-instance v15, Lwu3;

    const/4 v3, 0x6

    invoke-direct {v15, v0, v3}, Lwu3;-><init>(Lav3;B)V

    const/16 v3, 0xe

    move-object/from16 v20, v2

    const/4 v2, 0x2

    invoke-direct {v4, v6, v2, v3, v15}, Luvb;-><init>(IIILtvb;)V

    new-instance v3, Luvb;

    new-instance v15, Lwu3;

    const/4 v2, 0x7

    invoke-direct {v15, v0, v2}, Lwu3;-><init>(Lav3;B)V

    const/16 v2, 0xf

    move-object/from16 v35, v4

    const/4 v4, 0x2

    invoke-direct {v3, v6, v4, v2, v15}, Luvb;-><init>(IIILtvb;)V

    new-instance v2, Luvb;

    new-instance v15, Lwu3;

    const/16 v4, 0x8

    invoke-direct {v15, v0, v4}, Lwu3;-><init>(Lav3;B)V

    const/16 v4, 0x10

    move-object/from16 v21, v3

    const/4 v3, 0x2

    invoke-direct {v2, v6, v3, v4, v15}, Luvb;-><init>(IIILtvb;)V

    move-object/from16 v3, v22

    move-object/from16 v4, v23

    move-object/from16 v22, v24

    move-object/from16 v6, v25

    move-object/from16 v15, v27

    move-object/from16 v27, v28

    move-object/from16 v26, v30

    move-object/from16 v23, v32

    move-object/from16 v28, v33

    move-object/from16 v30, v35

    move-object/from16 v32, v2

    move-object/from16 v25, v5

    move-object/from16 v24, v17

    move-object/from16 v5, v18

    move-object/from16 v2, v19

    move-object/from16 v17, v31

    move-object/from16 v18, v34

    move-object/from16 v19, v36

    move-object/from16 v31, v21

    move-object/from16 v21, v16

    move-object/from16 v16, v29

    move-object/from16 v29, v20

    move-object/from16 v20, v37

    filled-new-array/range {v2 .. v32}, [Luvb;

    move-result-object v2

    invoke-direct {v1, v2}, Lvvb;-><init>([Luvb;)V

    iput-object v1, v0, Lav3;->b:Lvvb;

    :cond_247
    return-object v1
.end method

.method public final c(I)V
    .registers 7

    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    iget-object p0, p0, Lav3;->d:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p0}, Lcom/opera/android/BrowserActivity;->w0()Lb2l;

    move-result-object v0

    if-eqz v0, :cond_49

    iget-object v1, p0, Lcom/opera/android/BrowserActivity;->V:Lk6l;

    const/4 v2, 0x0

    if-nez v1, :cond_10

    move-object v1, v2

    :cond_10
    move-object v3, v0

    check-cast v3, Ld7l;

    iget-object v3, v3, Ld7l;->j:Le7l;

    invoke-interface {v3}, Lb9l;->m()Z

    move-result v3

    if-gez p1, :cond_20

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :cond_1e
    move-object p1, v2

    goto :goto_3c

    :cond_20
    invoke-virtual {v1, v3}, Lk6l;->t(Z)I

    move-result v4

    if-ge p1, v4, :cond_1e

    iget-object v4, v1, Lk6l;->b:Ljava/util/ArrayList;

    if-eqz v3, :cond_36

    invoke-virtual {v1}, Lk6l;->q()I

    move-result v1

    add-int/2addr v1, p1

    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lb2l;

    goto :goto_3c

    :cond_36
    invoke-virtual {v4, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lb2l;

    :goto_3c
    if-eq p1, v0, :cond_49

    if-eqz p1, :cond_49

    iget-object p0, p0, Lcom/opera/android/BrowserActivity;->V:Lk6l;

    if-eqz p0, :cond_45

    move-object v2, p0

    :cond_45
    const/4 p0, 0x3

    invoke-virtual {v2, p1, p0}, Lk6l;->C(Lb2l;I)V

    :cond_49
    return-void
.end method

.method public final j()Z
    .registers 5

    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    iget-object p0, p0, Lav3;->d:Lcom/opera/android/BrowserActivity;

    iget-object v0, p0, Ldx3;->o:Lqim;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v0}, Lqim;->b()Z

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_2d

    invoke-virtual {p0}, Lcom/opera/android/BrowserActivity;->w0()Lb2l;

    move-result-object v0

    const/4 v2, 0x0

    if-eqz v0, :cond_2e

    check-cast v0, Ld7l;

    iget-object v3, v0, Ld7l;->j:Le7l;

    invoke-interface {v3}, Lb9l;->isLoading()Z

    move-result v3

    if-eqz v3, :cond_25

    invoke-virtual {v0}, Ld7l;->V()V

    return v1

    :cond_25
    iget-object v0, v0, Ld7l;->j:Le7l;

    invoke-interface {v0, v2}, Lb9l;->M(Z)Z

    move-result v0

    if-eqz v0, :cond_2e

    :cond_2d
    return v1

    :cond_2e
    invoke-virtual {p0}, Ldx3;->S()Leq9;

    move-result-object p0

    iget-object v0, p0, Leq9;->a:Ld37;

    invoke-virtual {v0}, Ld37;->p()Z

    move-result v0

    if-eqz v0, :cond_3e

    invoke-virtual {p0}, Leq9;->b()V

    return v1

    :cond_3e
    iget-boolean v0, p0, Leq9;->b:Z

    if-eqz v0, :cond_46

    invoke-virtual {p0, v2}, Leq9;->d(Z)V

    return v1

    :cond_46
    return v2
.end method

.method public final l()V
    .registers 5

    iget-object v0, p0, Lav3;->a:Ljava/util/LinkedHashSet;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_6
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_18

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    const/high16 v3, 0x20000

    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->setDescendantFocusability(I)V

    goto :goto_6

    :cond_18
    invoke-interface {v0}, Ljava/util/Set;->clear()V

    iget-object v0, p0, Lav3;->c:Landroid/view/View;

    const/4 v1, 0x0

    iput-object v1, p0, Lav3;->c:Landroid/view/View;

    if-eqz v0, :cond_31

    invoke-virtual {v0}, Landroid/view/View;->isAttachedToWindow()Z

    move-result p0

    if-eqz p0, :cond_31

    invoke-virtual {v0}, Landroid/view/View;->findFocus()Landroid/view/View;

    move-result-object p0

    if-nez p0, :cond_31

    invoke-virtual {v0}, Landroid/view/View;->requestFocus()Z

    :cond_31
    return-void
.end method

.method public final u()Z
    .registers 8

    iget-object p0, p0, Lav3;->d:Lcom/opera/android/BrowserActivity;

    iget-object v0, p0, Lcom/opera/android/BrowserActivity;->g1:Lou3;

    iget-object v0, v0, Lou3;->a:Lnrl;

    iget-boolean v0, v0, Lnrl;->a:Z

    const/4 v1, 0x1

    if-nez v0, :cond_f

    invoke-virtual {p0, v1}, Landroid/app/Activity;->moveTaskToBack(Z)Z

    return v1

    :cond_f
    invoke-virtual {p0}, Lcom/opera/android/BrowserActivity;->B0()Landroidx/fragment/app/Fragment;

    move-result-object v0

    const/4 v2, 0x0

    if-eqz v0, :cond_18

    move v0, v1

    goto :goto_19

    :cond_18
    move v0, v2

    :goto_19
    invoke-virtual {p0}, Lcom/opera/android/BrowserActivity;->m0()Z

    move-result v3

    if-nez v3, :cond_95

    iget-object v3, p0, Ldx3;->o:Lqim;

    invoke-static {v3}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v3}, Lqim;->b()Z

    move-result v3

    if-nez v3, :cond_95

    iget-object v3, p0, Lcom/opera/android/BrowserActivity;->M:Lgbf;

    const/4 v4, 0x0

    if-nez v3, :cond_30

    move-object v3, v4

    :cond_30
    iget-object v3, v3, Lgbf;->j:Lvbf;

    invoke-virtual {v3}, Lvbf;->p()Z

    move-result v3

    if-eqz v3, :cond_53

    iget-object v0, p0, Lcom/opera/android/BrowserActivity;->M:Lgbf;

    if-nez v0, :cond_3d

    move-object v0, v4

    :cond_3d
    invoke-virtual {v0}, Lgbf;->i()Z

    move-result v0

    iget-object p0, p0, Lcom/opera/android/BrowserActivity;->M:Lgbf;

    if-eqz v0, :cond_4c

    if-eqz p0, :cond_48

    move-object v4, p0

    :cond_48
    invoke-virtual {v4}, Lgbf;->f()V

    return v1

    :cond_4c
    if-eqz p0, :cond_4f

    move-object v4, p0

    :cond_4f
    invoke-virtual {v4, v2}, Lgbf;->m(Z)V

    return v1

    :cond_53
    invoke-virtual {p0}, Lcom/opera/android/BrowserActivity;->w0()Lb2l;

    move-result-object v3

    sget-object v5, Llqm;->i:Llqm;

    if-eqz v0, :cond_88

    invoke-virtual {p0}, Landroidx/fragment/app/r;->getSupportFragmentManager()Landroidx/fragment/app/w;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/fragment/app/w;->X()Z

    if-eqz v3, :cond_95

    check-cast v3, Ld7l;

    iget-object v0, v3, Ld7l;->l:Llqm;

    if-ne v0, v5, :cond_95

    invoke-virtual {v3}, Ld7l;->i()Lcom/opera/android/browser/NavigationHistory;

    move-result-object v0

    check-cast v0, Liuh;

    iget-object v0, v0, Liuh;->b:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/browser/NavigationHistory;

    invoke-interface {v0}, Lcom/opera/android/browser/NavigationHistory;->d()I

    move-result v0

    if-nez v0, :cond_95

    iget-object p0, p0, Lcom/opera/android/BrowserActivity;->V:Lk6l;

    if-eqz p0, :cond_7f

    move-object v4, p0

    :cond_7f
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v3}, Ld7l;->N()V

    iput-object v3, v4, Lk6l;->p:Ld7l;

    return v2

    :cond_88
    if-eqz v3, :cond_96

    move-object v0, v3

    check-cast v0, Ld7l;

    iget-object v0, v0, Ld7l;->j:Le7l;

    invoke-interface {v0, v1}, Lb9l;->M(Z)Z

    move-result v0

    if-eqz v0, :cond_96

    :cond_95
    return v1

    :cond_96
    invoke-virtual {p0}, Ldx3;->S()Leq9;

    move-result-object v0

    iget-object v0, v0, Leq9;->a:Ld37;

    invoke-virtual {v0}, Ld37;->p()Z

    move-result v0

    if-eqz v0, :cond_aa

    invoke-virtual {p0}, Ldx3;->S()Leq9;

    move-result-object p0

    invoke-virtual {p0}, Leq9;->b()V

    return v1

    :cond_aa
    invoke-virtual {p0}, Ldx3;->S()Leq9;

    move-result-object v0

    iget-boolean v0, v0, Leq9;->b:Z

    if-eqz v0, :cond_ba

    invoke-virtual {p0}, Ldx3;->S()Leq9;

    move-result-object p0

    invoke-virtual {p0, v2}, Leq9;->d(Z)V

    return v1

    :cond_ba
    if-eqz v3, :cond_12e

    move-object v0, v3

    check-cast v0, Ld7l;

    invoke-virtual {v0}, Ld7l;->f()Z

    move-result v6

    if-eqz v6, :cond_cf

    new-instance v0, Lby3;

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lby3;-><init>(II)V

    invoke-virtual {p0, v0}, Lcom/opera/android/BrowserActivity;->c1(Lby3;)V

    return v1

    :cond_cf
    iget-object v6, v0, Ld7l;->l:Llqm;

    if-eq v6, v5, :cond_121

    iget-object v5, v0, Ld7l;->j:Le7l;

    invoke-interface {v5}, Lb9l;->m()Z

    move-result v5

    iget-object v6, p0, Lcom/opera/android/BrowserActivity;->V:Lk6l;

    if-eqz v5, :cond_e7

    if-nez v6, :cond_e0

    move-object v6, v4

    :cond_e0
    iget-object v5, v6, Lk6l;->b:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    goto :goto_ee

    :cond_e7
    if-nez v6, :cond_ea

    move-object v6, v4

    :cond_ea
    invoke-virtual {v6, v2}, Lk6l;->t(Z)I

    move-result v5

    :goto_ee
    invoke-virtual {v0}, Ld7l;->n0()Z

    move-result v6

    if-nez v6, :cond_ff

    if-le v5, v1, :cond_ff

    iget-object p0, p0, Lcom/opera/android/BrowserActivity;->V:Lk6l;

    if-eqz p0, :cond_fb

    move-object v4, p0

    :cond_fb
    invoke-virtual {v4, v3}, Lk6l;->k(Lb2l;)V

    return v1

    :cond_ff
    invoke-virtual {v0}, Ld7l;->n0()Z

    move-result v0

    if-eqz v0, :cond_12e

    invoke-interface {v3}, Lb9l;->T()Lp6l;

    move-result-object v0

    sget-object v5, Lp6l;->b:Lp6l;

    if-ne v0, v5, :cond_12e

    iget-object v0, p0, Lcom/opera/android/BrowserActivity;->V:Lk6l;

    if-nez v0, :cond_112

    move-object v0, v4

    :cond_112
    invoke-virtual {v0, v5}, Lk6l;->s(Lp6l;)I

    move-result v0

    if-ne v0, v1, :cond_12e

    iget-object p0, p0, Lcom/opera/android/BrowserActivity;->V:Lk6l;

    if-eqz p0, :cond_11d

    move-object v4, p0

    :cond_11d
    invoke-virtual {v4, v3}, Lk6l;->k(Lb2l;)V

    return v1

    :cond_121
    iget-object p0, p0, Lcom/opera/android/BrowserActivity;->V:Lk6l;

    if-eqz p0, :cond_126

    move-object v4, p0

    :cond_126
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0}, Ld7l;->N()V

    iput-object v0, v4, Lk6l;->p:Ld7l;

    :cond_12e
    return v2
.end method
