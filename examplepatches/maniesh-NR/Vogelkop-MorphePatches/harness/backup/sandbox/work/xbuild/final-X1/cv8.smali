.class public final Lcv8;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final F:Landroid/view/animation/AccelerateInterpolator;

.field public static final G:Landroid/view/animation/DecelerateInterpolator;


# instance fields
.field public final A:I

.field public final B:Lkm5;

.field public final C:Lzu8;

.field public D:Ldv8;

.field public E:Z

.field public final a:Lcom/opera/android/settings/SettingsManager;

.field public final b:Lnue;

.field public final c:Lcom/opera/android/feed/FeedScrollView;

.field public final d:Lcom/opera/android/feed/FeedScrollViewContentWrapper;

.field public final e:Landroidx/recyclerview/widget/RecyclerView;

.field public final f:Lipk;

.field public final g:Lqie;

.field public final h:Lpde;

.field public final i:Lbvl;

.field public final j:Lu8k;

.field public final k:Lpde;

.field public final l:Luvl;

.field public final m:Lnjm;

.field public final n:Ltsd;

.field public final o:Lzu8;

.field public final p:Lt5k;

.field public final q:Lu37;

.field public final r:Lfv8;

.field public final s:Lm9f;

.field public final t:Lkze;

.field public u:I

.field public final v:Lpr;

.field public final w:Lijc;

.field public final x:I

.field public final y:I

.field public final z:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    sget-object v0, Llf1;->b:Landroid/view/animation/AccelerateInterpolator;

    sput-object v0, Lcv8;->F:Landroid/view/animation/AccelerateInterpolator;

    sget-object v0, Llf1;->c:Landroid/view/animation/DecelerateInterpolator;

    sput-object v0, Lcv8;->G:Landroid/view/animation/DecelerateInterpolator;

    return-void
.end method

.method public constructor <init>(Lpde;Lp6l;Lcom/opera/android/BrowserActivity;Lqim;Lx5f;Lx5f;Losf;Lxnh;Lcom/opera/android/settings/SettingsManager;Lzwk;Lswk;Let3;Lnue;Lcom/opera/android/feed/FeedScrollView;Lcom/opera/android/feed/FeedScrollViewContentWrapper;Landroidx/recyclerview/widget/RecyclerView;Lcom/opera/android/feed/FeedHeaderContainer;Lipk;Ls6h;Lku5;Lqie;Lpde;Lkze;Ltsd;Lhw3;Lfs6;Lkze;Lj4c;Lqnc;Lw6o;Lnr8;Lmdh;Lqdh;Landroid/view/View$OnLongClickListener;Lqr8;Lnv2;Ltlg;Lbvl;Lr22;Lu8k;Lne5;Lq4k;Lmgh;Lfwf;Lpde;Llg;Lhv3;Lkze;Luvl;Ljv3;Lnjm;Lpde;Ltsd;Lshf;Lgx8;Lj4c;Le7k;Lj4c;)V
    .registers 97

    move-object/from16 v0, p0

    move-object/from16 v8, p3

    move-object/from16 v15, p9

    move-object/from16 v9, p14

    move-object/from16 v10, p15

    move-object/from16 v14, p16

    move-object/from16 v11, p22

    move-object/from16 v13, p40

    move-object/from16 v1, p45

    move-object/from16 v2, p49

    move-object/from16 v3, p51

    move-object/from16 v4, p54

    iget-object v4, v4, Lshf;->c:Ljava/lang/Object;

    move-object/from16 v18, v4

    check-cast v18, Lpde;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v15, v0, Lcv8;->a:Lcom/opera/android/settings/SettingsManager;

    move-object/from16 v4, p13

    iput-object v4, v0, Lcv8;->b:Lnue;

    iput-object v9, v0, Lcv8;->c:Lcom/opera/android/feed/FeedScrollView;

    iput-object v10, v0, Lcv8;->d:Lcom/opera/android/feed/FeedScrollViewContentWrapper;

    iput-object v14, v0, Lcv8;->e:Landroidx/recyclerview/widget/RecyclerView;

    move-object/from16 v4, p18

    iput-object v4, v0, Lcv8;->f:Lipk;

    move-object/from16 v5, p21

    iput-object v5, v0, Lcv8;->g:Lqie;

    iput-object v11, v0, Lcv8;->h:Lpde;

    move-object/from16 v5, p38

    iput-object v5, v0, Lcv8;->i:Lbvl;

    iput-object v13, v0, Lcv8;->j:Lu8k;

    iput-object v1, v0, Lcv8;->k:Lpde;

    iput-object v2, v0, Lcv8;->l:Luvl;

    iput-object v3, v0, Lcv8;->m:Lnjm;

    new-instance v6, Lxu8;

    const/4 v7, 0x0

    invoke-direct {v6, v0, v7}, Lxu8;-><init>(Lcv8;B)V

    const-string v7, "speed_dial.enabled"

    invoke-static {v15, v7, v6}, Luyg;->e(Lcom/opera/android/settings/SettingsManager;Ljava/lang/String;Lkotlin/jvm/functions/Function1;)Ltsd;

    move-result-object v6

    iput-object v6, v0, Lcv8;->n:Ltsd;

    new-instance v7, Lxu8;

    const/4 v10, 0x1

    invoke-direct {v7, v0, v10}, Lxu8;-><init>(Lcv8;B)V

    const-string v10, "speed_dial.plus_button"

    invoke-static {v15, v10, v7}, Luyg;->e(Lcom/opera/android/settings/SettingsManager;Ljava/lang/String;Lkotlin/jvm/functions/Function1;)Ltsd;

    move-result-object v10

    new-instance v7, Lzu8;

    const/4 v1, 0x0

    invoke-direct {v7, v0, v1}, Lzu8;-><init>(Lcv8;B)V

    iput-object v7, v0, Lcv8;->o:Lzu8;

    move-object/from16 p13, v10

    new-instance v10, Lt5k;

    iget-object v1, v8, Ldx3;->l:Ltni;

    invoke-direct {v10, v1}, Lha2;-><init>(Ltni;)V

    iput-object v10, v0, Lcv8;->p:Lt5k;

    new-instance v1, Lu37;

    new-instance v2, Lav8;

    invoke-direct {v2, v0}, Lav8;-><init>(Lcv8;)V

    invoke-direct {v1, v2}, Lu37;-><init>(Lt37;)V

    iput-object v1, v0, Lcv8;->q:Lu37;

    move-object v2, v1

    new-instance v1, Lfv8;

    move-object/from16 v17, v2

    invoke-virtual {v14}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    move-object/from16 p54, v1

    new-instance v1, Ld58;

    move-object/from16 v19, v2

    const/16 v2, 0xc

    invoke-direct {v1, v2}, Ld58;-><init>(B)V

    invoke-static {v11, v1}, Lxf8;->V(Likc;Lkotlin/jvm/functions/Function1;)Ltsd;

    move-result-object v1

    new-instance v2, Lyu8;

    move-object/from16 v20, v1

    const/4 v1, 0x1

    invoke-direct {v2, v0, v1}, Lyu8;-><init>(Lcv8;B)V

    new-instance v1, Lyu8;

    const/4 v12, 0x2

    invoke-direct {v1, v0, v12}, Lyu8;-><init>(Lcv8;B)V

    sget v12, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x1f

    if-lt v12, v3, :cond_af

    new-instance v3, Lpm7;

    invoke-direct {v3, v2, v1}, Lpm7;-><init>(Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;)V

    :goto_ad
    move-object v1, v6

    goto :goto_b5

    :cond_af
    new-instance v3, Lqm7;

    invoke-direct {v3}, Ljava/lang/Object;-><init>()V

    goto :goto_ad

    :goto_b5
    new-instance v6, Lxu8;

    const/4 v2, 0x2

    invoke-direct {v6, v0, v2}, Lxu8;-><init>(Lcv8;B)V

    move-object v2, v7

    new-instance v7, Lyu8;

    const/4 v12, 0x3

    invoke-direct {v7, v0, v12}, Lyu8;-><init>(Lcv8;B)V

    move-object/from16 v12, p49

    move-object/from16 v13, p51

    move-object/from16 v15, p55

    move-object v8, v1

    move-object/from16 v32, v2

    move-object v5, v3

    move-object/from16 v11, v17

    move-object/from16 v2, v19

    move-object/from16 v4, v20

    const/16 v33, 0x0

    move-object/from16 v3, p1

    move-object/from16 v1, p54

    invoke-direct/range {v1 .. v7}, Lfv8;-><init>(Landroid/content/Context;Lpde;Ltsd;Lzi4;Lxu8;Lyu8;)V

    iput-object v1, v0, Lcv8;->r:Lfv8;

    new-instance v2, Lkze;

    invoke-static/range {v33 .. v33}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-direct {v2, v4}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v2, v0, Lcv8;->t:Lkze;

    new-instance v7, Lijc;

    invoke-direct {v7, v3, v14, v10, v13}, Lijc;-><init>(Lpde;Landroidx/recyclerview/widget/RecyclerView;Lt5k;Lnjm;)V

    iput-object v7, v0, Lcv8;->w:Lijc;

    invoke-virtual {v14}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v4, 0x7f07097a

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iput v2, v0, Lcv8;->x:I

    invoke-virtual {v14}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v4, 0x7f070964

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iput v2, v0, Lcv8;->y:I

    invoke-virtual {v14}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v4, 0x7f070963

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iput v2, v0, Lcv8;->z:I

    invoke-virtual {v14}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v4, 0x7f070966

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iput v2, v0, Lcv8;->A:I

    new-instance v2, Lkm5;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    iput-object v8, v2, Lkm5;->c:Ljava/lang/Object;

    move-object/from16 v4, p5

    iput-object v4, v2, Lkm5;->d:Ljava/lang/Object;

    iput-object v2, v0, Lcv8;->B:Lkm5;

    new-instance v2, Lzu8;

    const/4 v5, 0x1

    invoke-direct {v2, v0, v5}, Lzu8;-><init>(Lcv8;B)V

    iput-object v2, v0, Lcv8;->C:Lzu8;

    new-instance v5, Ldv8;

    move/from16 v6, v33

    invoke-direct {v5, v6, v6}, Ldv8;-><init>(II)V

    iput-object v5, v0, Lcv8;->D:Ldv8;

    new-instance v5, Lbv8;

    invoke-direct {v5, v0, v6}, Lbv8;-><init>(Ljava/lang/Object;B)V

    new-instance v6, Lyu8;

    move-object/from16 v27, v8

    const/4 v8, 0x4

    invoke-direct {v6, v0, v8}, Lyu8;-><init>(Lcv8;B)V

    invoke-static {v13, v3, v5, v6}, La26;->U(Lw6f;Likc;Ljava/lang/Object;Lkotlin/jvm/functions/Function0;)V

    if-eqz v12, :cond_160

    iget-object v5, v12, Luvl;->h:Lpde;

    if-eqz v5, :cond_160

    new-instance v6, Lzu8;

    const/4 v13, 0x7

    invoke-direct {v6, v0, v13}, Lzu8;-><init>(Lcv8;B)V

    invoke-static {v5, v3, v6}, La26;->T(Lekc;Likc;Lf7f;)V

    :cond_160
    iget-object v3, v15, Lgx8;->c:Lpde;

    iget-object v13, v15, Lgx8;->c:Lpde;

    new-instance v5, Lj04;

    const/16 v6, 0xa

    invoke-direct {v5, v0, v6}, Lj04;-><init>(Ljava/lang/Object;B)V

    move-object/from16 v6, p52

    move-object/from16 v15, p53

    invoke-static {v15, v6, v3, v5}, Lxf8;->y(Likc;Likc;Lpde;Lcr9;)Ltsd;

    move-result-object v33

    invoke-virtual {v14, v11}, Landroidx/recyclerview/widget/RecyclerView;->D0(Lro9;)V

    new-instance v11, Lpr;

    invoke-virtual/range {p3 .. p3}, Lcom/opera/android/BrowserActivity;->K0()Lizj;

    move-result-object v3

    iget-object v3, v3, Lizj;->d:Lpde;

    invoke-direct {v11}, Ljava/lang/Object;-><init>()V

    iput-object v3, v11, Lpr;->b:Ljava/lang/Object;

    iput-object v13, v11, Lpr;->c:Ljava/lang/Object;

    new-instance v5, Lode;

    invoke-direct {v5}, Lekc;-><init>()V

    iput-object v5, v11, Lpr;->d:Ljava/lang/Object;

    new-instance v5, Lhr8;

    const/4 v6, 0x0

    invoke-direct {v5, v11, v6}, Lhr8;-><init>(Lpr;B)V

    iput-object v5, v11, Lpr;->e:Ljava/lang/Object;

    new-instance v6, Lhr8;

    const/4 v8, 0x1

    invoke-direct {v6, v11, v8}, Lhr8;-><init>(Lpr;B)V

    iput-object v6, v11, Lpr;->f:Ljava/lang/Object;

    invoke-virtual {v3, v5}, Lekc;->k(Lf7f;)V

    invoke-virtual {v13, v6}, Lekc;->k(Lf7f;)V

    iput-object v11, v0, Lcv8;->v:Lpr;

    new-instance v3, Lbn7;

    const/16 v5, 0x16

    invoke-direct {v3, v0, v5}, Lbn7;-><init>(Ljava/lang/Object;B)V

    move-object/from16 v5, p17

    iput-object v3, v5, Lcom/opera/android/feed/FeedHeaderContainer;->b:Lbn7;

    new-instance v3, Li16;

    const/16 v5, 0x11

    move-object/from16 v6, p42

    invoke-direct {v3, v6, v0, v5}, Li16;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object v3, v9, Lcom/opera/android/feed/FeedScrollView;->I:Lfx8;

    move-object v3, v1

    new-instance v1, Lncd;

    move-object v5, v3

    invoke-virtual/range {p3 .. p3}, Lcom/opera/android/BrowserActivity;->x0()Lwy;

    move-result-object v3

    new-instance v6, Ld58;

    const/16 v8, 0xd

    invoke-direct {v6, v8}, Ld58;-><init>(B)V

    move-object/from16 v8, p22

    invoke-static {v8, v6}, Lxf8;->V(Likc;Lkotlin/jvm/functions/Function1;)Ltsd;

    move-result-object v6

    move-object/from16 p1, v2

    move-object v2, v14

    move-object v14, v5

    move-object/from16 v5, v18

    invoke-direct/range {v1 .. v7}, Lncd;-><init>(Landroidx/recyclerview/widget/RecyclerView;Lwy;Lx5f;Lpde;Ltsd;Lijc;)V

    move-object v3, v7

    invoke-virtual {v3, v1}, Lijc;->b(Lu5k;)V

    if-eqz p49, :cond_225

    new-instance v1, Ls4b;

    invoke-virtual/range {p40 .. p40}, Lu8k;->b()Lt8k;

    move-result-object v4

    move-object/from16 v2, p16

    move-object/from16 v6, p47

    move-object v5, v15

    invoke-direct/range {v1 .. v6}, Ls4b;-><init>(Landroidx/recyclerview/widget/RecyclerView;Lijc;Lt8k;Ltsd;Lhv3;)V

    invoke-virtual {v3, v1}, Lijc;->b(Lu5k;)V

    sget-object v1, Lp6l;->a:Lp6l;

    move-object/from16 v2, p2

    if-ne v2, v1, :cond_21f

    move-object/from16 v28, v13

    new-instance v13, Lk8k;

    invoke-virtual/range {p40 .. p40}, Lu8k;->b()Lt8k;

    move-result-object v17

    invoke-virtual/range {p50 .. p50}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lfd;

    move-object/from16 v21, p9

    move-object/from16 v15, p16

    move-object/from16 v22, p24

    move-object/from16 v19, p53

    move-object/from16 v16, v3

    move-object v5, v14

    move-object/from16 v20, v18

    move-object/from16 v14, p44

    move-object/from16 v18, v1

    move-object/from16 v1, p40

    invoke-direct/range {v13 .. v22}, Lk8k;-><init>(Lfwf;Landroidx/recyclerview/widget/RecyclerView;Lijc;Lt8k;Lfd;Ltsd;Lpde;Lcom/opera/android/settings/SettingsManager;Ltsd;)V

    move-object/from16 v18, v20

    invoke-virtual {v3, v13}, Lijc;->b(Lu5k;)V

    goto :goto_228

    :cond_21f
    :goto_21f
    move-object/from16 v1, p40

    move-object/from16 v28, v13

    move-object v5, v14

    goto :goto_228

    :cond_225
    move-object/from16 v2, p2

    goto :goto_21f

    :goto_228
    new-instance v13, Li7k;

    invoke-virtual/range {p50 .. p50}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v4

    move-object/from16 v21, v4

    check-cast v21, Lfd;

    invoke-virtual/range {p25 .. p25}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v4

    move-object/from16 v24, v4

    check-cast v24, Lmbf;

    move-object/from16 v19, p9

    move-object/from16 v15, p16

    move-object/from16 v23, p24

    move-object/from16 v25, p38

    move-object/from16 v26, p39

    move-object/from16 v14, p44

    move-object/from16 v20, p46

    move-object/from16 v22, p47

    move-object/from16 v17, p53

    move-object/from16 v16, v3

    invoke-direct/range {v13 .. v26}, Li7k;-><init>(Lfwf;Landroidx/recyclerview/widget/RecyclerView;Lijc;Ltsd;Lpde;Lcom/opera/android/settings/SettingsManager;Llg;Lfd;Lhv3;Ltsd;Lmbf;Lbvl;Lr22;)V

    invoke-virtual {v3, v13}, Lijc;->b(Lu5k;)V

    new-instance v13, Lvdh;

    invoke-virtual/range {p3 .. p3}, Lcom/opera/android/BrowserActivity;->K0()Lizj;

    move-result-object v4

    iget-object v4, v4, Lizj;->d:Lpde;

    new-instance v6, Lcy;

    invoke-virtual/range {p3 .. p3}, Lxd5;->getLifecycle()Ltcc;

    move-result-object v7

    move-object/from16 v14, p6

    move-object/from16 v15, p33

    invoke-direct {v6, v7, v9, v15, v14}, Lcy;-><init>(Ltcc;Lcom/opera/android/feed/FeedScrollView;Lqdh;Lx5f;)V

    move-object/from16 v20, p5

    move-object/from16 v18, p23

    move-object/from16 v21, p32

    move-object/from16 v23, p34

    move-object/from16 v26, p35

    move-object/from16 v30, v2

    move-object/from16 v25, v3

    move-object/from16 v17, v4

    move-object/from16 v24, v6

    move-object/from16 v19, v14

    move-object/from16 v22, v15

    move-object/from16 v16, v27

    move-object/from16 v29, v28

    move-object/from16 v15, p9

    move-object/from16 v14, p16

    move-object/from16 v27, p36

    move-object/from16 v28, p37

    invoke-direct/range {v13 .. v30}, Lvdh;-><init>(Landroidx/recyclerview/widget/RecyclerView;Lcom/opera/android/settings/SettingsManager;Ltsd;Lpde;Lkze;Lx5f;Lx5f;Lmdh;Lqdh;Landroid/view/View$OnLongClickListener;Lcy;Lijc;Lqr8;Lnv2;Ltlg;Lpde;Lp6l;)V

    move-object/from16 v27, v16

    move-object/from16 v28, v29

    invoke-virtual {v3, v13}, Lijc;->b(Lu5k;)V

    new-instance v13, Lts8;

    new-instance v2, Ldg7;

    const/16 v4, 0xe

    invoke-direct {v2, v0, v4}, Ldg7;-><init>(Ljava/lang/Object;B)V

    move-object/from16 v29, p2

    move-object/from16 v16, p6

    move-object/from16 v17, p9

    move-object/from16 v19, p13

    move-object/from16 v22, p23

    move-object/from16 v21, p31

    move-object/from16 v26, p36

    move-object/from16 v20, p38

    move-object/from16 v25, v2

    move-object/from16 v24, v3

    move-object v15, v9

    move-object/from16 v18, v27

    move-object/from16 v27, p37

    invoke-direct/range {v13 .. v29}, Lts8;-><init>(Landroidx/recyclerview/widget/RecyclerView;Lcom/opera/android/feed/FeedScrollView;Lx5f;Lcom/opera/android/settings/SettingsManager;Ltsd;Ltsd;Lbvl;Lnr8;Lkze;Landroid/view/View$OnLongClickListener;Lijc;Ldg7;Lnv2;Ltlg;Lpde;Lp6l;)V

    move-object v2, v14

    move-object/from16 v3, v18

    move-object/from16 v7, v24

    move-object/from16 v4, v28

    invoke-virtual {v7, v13}, Lijc;->b(Lu5k;)V

    new-instance v6, Lp5k;

    invoke-direct {v6, v2, v7}, Lp5k;-><init>(Landroidx/recyclerview/widget/RecyclerView;Lijc;)V

    invoke-virtual {v7, v6}, Lijc;->b(Lu5k;)V

    new-instance v6, Ls5k;

    invoke-direct {v6, v2, v7, v1}, Ls5k;-><init>(Landroidx/recyclerview/widget/RecyclerView;Lijc;Lu8k;)V

    invoke-virtual {v7, v6}, Lijc;->b(Lu5k;)V

    new-instance v13, La7k;

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v14

    move-object/from16 v21, p2

    move-object/from16 v16, p9

    move-object/from16 v20, p43

    move-object/from16 v19, p53

    move-object/from16 v17, v1

    move-object v15, v7

    move-object/from16 v18, v8

    invoke-direct/range {v13 .. v21}, La7k;-><init>(Landroid/content/Context;Lijc;Lcom/opera/android/settings/SettingsManager;Lu8k;Lpde;Ltsd;Lmgh;Lp6l;)V

    invoke-virtual {v7, v13}, Lijc;->b(Lu5k;)V

    new-instance v1, Ly5k;

    invoke-direct {v1, v2, v7}, Ly5k;-><init>(Landroidx/recyclerview/widget/RecyclerView;Lijc;)V

    invoke-virtual {v7, v1}, Lijc;->b(Lu5k;)V

    invoke-virtual/range {p2 .. p2}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    const/4 v6, 0x5

    const/4 v8, 0x0

    const/4 v9, 0x1

    if-eqz v1, :cond_32d

    if-ne v1, v9, :cond_329

    invoke-virtual/range {p3 .. p3}, Lcom/opera/android/BrowserActivity;->P0()Lgjm;

    move-result-object v1

    new-instance v9, Lp4b;

    invoke-direct {v9, v2, v1, v7, v4}, Lp4b;-><init>(Landroidx/recyclerview/widget/RecyclerView;Lgjm;Lijc;Lpde;)V

    invoke-virtual {v7, v9}, Lijc;->b(Lu5k;)V

    invoke-virtual/range {p3 .. p3}, Lcom/opera/android/BrowserActivity;->P0()Lgjm;

    move-result-object v1

    new-instance v9, Ls4b;

    invoke-direct {v9, v2, v1, v7, v4}, Ls4b;-><init>(Landroidx/recyclerview/widget/RecyclerView;Lgjm;Lijc;Lpde;)V

    invoke-virtual {v7, v9}, Lijc;->b(Lu5k;)V

    move-object/from16 v9, p14

    move-object/from16 v14, p15

    move-object/from16 v15, p22

    move-object/from16 v34, v3

    move-object/from16 v36, v5

    move-object v3, v7

    move-object/from16 v35, v10

    move-object/from16 v37, v11

    goto/16 :goto_4a1

    :cond_329
    invoke-static {}, Lh9o;->p()V

    throw v8

    :cond_32d
    new-instance v13, Lcok;

    move-object/from16 v1, p3

    iget-object v14, v1, Lcom/opera/android/BrowserActivity;->m0:Lzyk;

    invoke-virtual {v14}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v14

    move-object v15, v14

    check-cast v15, Lf35;

    move-object/from16 v31, p2

    move-object/from16 v21, p5

    move-object/from16 v22, p6

    move-object/from16 v23, p7

    move-object/from16 v19, p8

    move-object/from16 v16, p9

    move-object/from16 v20, p14

    move-object/from16 v18, p18

    move-object/from16 v24, p23

    move-object/from16 v17, p31

    move-object/from16 v25, p34

    move-object/from16 v27, p35

    move-object/from16 v28, p36

    move-object/from16 v29, p38

    move-object v14, v2

    move-object/from16 v30, v4

    move-object/from16 v26, v7

    invoke-direct/range {v13 .. v31}, Lcok;-><init>(Landroidx/recyclerview/widget/RecyclerView;Lf35;Lcom/opera/android/settings/SettingsManager;Lnr8;Lipk;Lxnh;Lcom/opera/android/feed/FeedScrollView;Lx5f;Lx5f;Losf;Lkze;Landroid/view/View$OnLongClickListener;Lijc;Lqr8;Lnv2;Lbvl;Lpde;Lp6l;)V

    invoke-virtual {v7, v13}, Lijc;->b(Lu5k;)V

    new-instance v2, Ls6k;

    move-object/from16 p32, p16

    move-object/from16 p35, p41

    move-object/from16 p33, p44

    move-object/from16 p36, p57

    move-object/from16 p31, v2

    move-object/from16 p34, v7

    invoke-direct/range {p31 .. p36}, Ls6k;-><init>(Landroidx/recyclerview/widget/RecyclerView;Lfwf;Lijc;Lne5;Le7k;)V

    invoke-virtual {v7, v2}, Lijc;->b(Lu5k;)V

    new-instance v1, Lqwk;

    move-object v2, v10

    new-instance v10, Lyu8;

    invoke-direct {v10, v0, v6}, Lyu8;-><init>(Lcv8;B)V

    move-object v4, v11

    new-instance v11, Lft3;

    move-object/from16 v13, p4

    const/4 v14, 0x2

    invoke-direct {v11, v13, v14}, Lft3;-><init>(Lqim;B)V

    move-object/from16 v8, p11

    move-object/from16 v14, p15

    move-object/from16 v15, p22

    move-object/from16 v6, p24

    move-object/from16 v35, v2

    move-object/from16 v34, v3

    move-object/from16 v37, v4

    move-object/from16 v36, v5

    move-object v3, v7

    move v12, v9

    move-object/from16 v5, v33

    move-object/from16 v2, p3

    move-object/from16 v7, p10

    move-object/from16 v9, p12

    move-object/from16 v4, p16

    invoke-direct/range {v1 .. v11}, Lqwk;-><init>(Landroid/content/Context;Lijc;Landroidx/recyclerview/widget/RecyclerView;Ltsd;Ltsd;Lzwk;Lswk;Let3;Lyu8;Lft3;)V

    invoke-virtual {v3, v1}, Lijc;->b(Lu5k;)V

    new-instance v1, Ltt5;

    move-object v9, v5

    new-instance v5, Lft3;

    invoke-direct {v5, v13, v12}, Lft3;-><init>(Lqim;B)V

    new-instance v6, Lyu8;

    const/4 v12, 0x0

    invoke-direct {v6, v0, v12}, Lyu8;-><init>(Lcv8;B)V

    move-object/from16 v12, p3

    move-object/from16 v2, p5

    move-object/from16 v7, p19

    move-object/from16 v8, p20

    move-object/from16 v10, p23

    move-object/from16 v11, p24

    invoke-direct/range {v1 .. v11}, Ltt5;-><init>(Lx5f;Lijc;Landroidx/recyclerview/widget/RecyclerView;Lft3;Lyu8;Ls6h;Lku5;Ltsd;Lkze;Ltsd;)V

    move-object v5, v9

    invoke-virtual {v3, v1}, Lijc;->b(Lu5k;)V

    new-instance v1, Lh6o;

    invoke-virtual/range {p44 .. p44}, Lfwf;->getLifecycle()Ltcc;

    move-result-object v2

    invoke-static {v2}, Lcqp;->V(Ltcc;)Lddc;

    move-result-object v2

    const/4 v4, 0x1

    move-object/from16 p7, p16

    move-object/from16 p8, p24

    move-object/from16 p5, p30

    move-object/from16 p4, v1

    move-object/from16 p10, v2

    move-object/from16 p6, v3

    move/from16 p11, v4

    move-object/from16 p9, v5

    invoke-direct/range {p4 .. p11}, Lh6o;-><init>(Lw6o;Lijc;Landroidx/recyclerview/widget/RecyclerView;Ltsd;Ltsd;Lddc;B)V

    invoke-virtual {v3, v1}, Lijc;->b(Lu5k;)V

    new-instance v1, Lh6o;

    invoke-virtual/range {p44 .. p44}, Lfwf;->getLifecycle()Ltcc;

    move-result-object v2

    invoke-static {v2}, Lcqp;->V(Ltcc;)Lddc;

    move-result-object v2

    const/4 v4, 0x0

    move-object/from16 p4, v1

    move-object/from16 p10, v2

    move/from16 p11, v4

    invoke-direct/range {p4 .. p11}, Lh6o;-><init>(Lw6o;Lijc;Landroidx/recyclerview/widget/RecyclerView;Ltsd;Ltsd;Lddc;B)V

    invoke-virtual {v3, v1}, Lijc;->b(Lu5k;)V

    new-instance v1, Lh6o;

    invoke-virtual/range {p44 .. p44}, Lfwf;->getLifecycle()Ltcc;

    move-result-object v2

    invoke-static {v2}, Lcqp;->V(Ltcc;)Lddc;

    move-result-object v2

    const/4 v4, 0x2

    move-object/from16 p4, v1

    move-object/from16 p10, v2

    move/from16 p11, v4

    invoke-direct/range {p4 .. p11}, Lh6o;-><init>(Lw6o;Lijc;Landroidx/recyclerview/widget/RecyclerView;Ltsd;Ltsd;Lddc;B)V

    invoke-virtual {v3, v1}, Lijc;->b(Lu5k;)V

    new-instance v1, Ltkc;

    new-instance v2, Llu3;

    const/4 v4, 0x2

    invoke-direct {v2, v12, v4}, Llu3;-><init>(Lcom/opera/android/BrowserActivity;B)V

    new-instance v4, Llu3;

    const/4 v6, 0x3

    invoke-direct {v4, v12, v6}, Llu3;-><init>(Lcom/opera/android/BrowserActivity;B)V

    new-instance v6, Ldqc;

    move-object/from16 v7, p29

    iget-object v8, v7, Lqnc;->a:Lsnc;

    iget-object v7, v7, Lqnc;->b:Lumi;

    new-instance v9, Ljs6;

    invoke-virtual {v8}, Lsnc;->a()Lfs6;

    move-result-object v10

    iget-object v11, v8, Lsnc;->h:Lj4c;

    iget-object v13, v8, Lsnc;->m:Lj4c;

    move-object/from16 p25, v1

    iget-object v1, v8, Lsnc;->k:Lzyk;

    invoke-virtual {v1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lxoc;

    move-object/from16 p9, v1

    iget-object v1, v8, Lsnc;->z:Lzyk;

    invoke-virtual {v1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lrs6;

    move-object/from16 p10, v1

    new-instance v1, Ltn;

    move-object/from16 p2, v2

    iget-object v2, v8, Lsnc;->g:Lxnc;

    iget-object v2, v2, Lxnc;->b:Lkze;

    iget-object v8, v8, Lsnc;->n:Lt1;

    invoke-direct {v1, v2, v8, v7, v12}, Ltn;-><init>(Lkze;Lt1;Lumi;Lndc;)V

    move-object/from16 p11, v1

    move-object/from16 p4, v9

    move-object/from16 p6, v10

    move-object/from16 p7, v11

    move-object/from16 p5, v12

    move-object/from16 p8, v13

    invoke-direct/range {p4 .. p11}, Ljs6;-><init>(Landroid/content/Context;Lfs6;Lj4c;Lj4c;Lxoc;Lrs6;Ltn;)V

    move-object/from16 p8, p4

    move-object/from16 p9, p5

    move-object/from16 p5, p26

    move-object/from16 p10, p27

    move-object/from16 p7, p28

    move-object/from16 p11, p30

    move-object/from16 p6, p56

    move-object/from16 p12, p58

    move-object/from16 p4, v6

    invoke-direct/range {p4 .. p12}, Ldqc;-><init>(Lfs6;Lj4c;Lj4c;Ljs6;Lndc;Lkze;Lw6o;Lj4c;)V

    move-object/from16 p27, p2

    move-object/from16 p32, p4

    move-object/from16 p26, p9

    move-object/from16 p31, p14

    move-object/from16 p29, p16

    move-object/from16 p34, p23

    move-object/from16 p35, p24

    move-object/from16 p36, p44

    move-object/from16 p30, v3

    move-object/from16 p28, v4

    move-object/from16 p33, v5

    invoke-direct/range {p25 .. p36}, Ltkc;-><init>(Lndc;Llu3;Llu3;Landroidx/recyclerview/widget/RecyclerView;Lijc;Lcom/opera/android/feed/FeedScrollView;Ldqc;Ltsd;Lkze;Ltsd;Lfwf;)V

    move-object/from16 v1, p25

    move-object/from16 v2, p29

    move-object/from16 v9, p31

    invoke-virtual {v3, v1}, Lijc;->b(Lu5k;)V

    :goto_4a1
    invoke-virtual {v3}, Lijc;->h()V

    new-instance v1, Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    invoke-direct {v1}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>()V

    invoke-virtual {v2, v1}, Landroidx/recyclerview/widget/RecyclerView;->C0(Landroidx/recyclerview/widget/f;)V

    const/4 v1, 0x0

    invoke-virtual {v2, v1}, Landroidx/recyclerview/widget/RecyclerView;->B0(Landroidx/recyclerview/widget/e;)V

    move-object/from16 v1, v35

    invoke-virtual {v2, v1}, Landroidx/recyclerview/widget/RecyclerView;->y0(Landroidx/recyclerview/widget/d;)V

    move-object/from16 v5, v36

    invoke-virtual {v2, v5}, Landroidx/recyclerview/widget/RecyclerView;->m(Liph;)V

    new-instance v1, Lm9f;

    invoke-direct {v1, v2}, Lm9f;-><init>(Landroid/view/ViewGroup;)V

    iput-object v1, v0, Lcv8;->s:Lm9f;

    invoke-virtual {v0}, Lcv8;->a()V

    move-object/from16 v1, v32

    move-object/from16 v8, v34

    invoke-virtual {v8, v1}, Lekc;->k(Lf7f;)V

    new-instance v1, Lut3;

    const/4 v4, 0x2

    invoke-direct {v1, v0, v4}, Lut3;-><init>(Ljava/lang/Object;B)V

    iput-object v1, v9, Lcom/opera/android/feed/FeedScrollView;->J:Lut3;

    move-object/from16 v4, v37

    iget-object v1, v4, Lpr;->d:Ljava/lang/Object;

    check-cast v1, Lode;

    move-object/from16 v3, p1

    invoke-virtual {v1, v3}, Lekc;->k(Lf7f;)V

    new-instance v1, Lav8;

    invoke-direct {v1, v0}, Lav8;-><init>(Lcv8;)V

    iput-object v1, v14, Lcom/opera/android/feed/FeedScrollViewContentWrapper;->f:Lav8;

    invoke-virtual {v14}, Landroid/view/View;->requestLayout()V

    new-instance v1, Lz61;

    invoke-direct {v1, v2}, Lz61;-><init>(Landroid/view/View;)V

    iget-object v1, v1, Lz61;->b:Ljava/lang/Object;

    check-cast v1, Lkze;

    new-instance v2, Lzu8;

    const/4 v4, 0x2

    invoke-direct {v2, v0, v4}, Lzu8;-><init>(Lcv8;B)V

    invoke-static {v15, v1, v2}, La26;->T(Lekc;Likc;Lf7f;)V

    move-object/from16 v13, p40

    iget-object v2, v13, Lu8k;->d:Lode;

    new-instance v3, Lzu8;

    const/4 v6, 0x3

    invoke-direct {v3, v0, v6}, Lzu8;-><init>(Lcv8;B)V

    invoke-static {v2, v1, v3}, La26;->T(Lekc;Likc;Lf7f;)V

    new-instance v2, Lzu8;

    const/4 v3, 0x4

    invoke-direct {v2, v0, v3}, Lzu8;-><init>(Lcv8;B)V

    move-object/from16 v3, p45

    invoke-static {v3, v1, v2}, La26;->T(Lekc;Likc;Lf7f;)V

    new-instance v2, Lzu8;

    const/4 v3, 0x5

    invoke-direct {v2, v0, v3}, Lzu8;-><init>(Lcv8;B)V

    move-object/from16 v3, p48

    invoke-static {v3, v1, v2}, La26;->T(Lekc;Likc;Lf7f;)V

    invoke-interface/range {p38 .. p38}, Lbvl;->getState()Lpde;

    move-result-object v2

    new-instance v3, Lzu8;

    const/4 v4, 0x6

    invoke-direct {v3, v0, v4}, Lzu8;-><init>(Lcv8;B)V

    invoke-static {v2, v1, v3}, La26;->T(Lekc;Likc;Lf7f;)V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 4

    iget-object v0, p0, Lcv8;->s:Lm9f;

    iget-object v1, v0, Lm9f;->c:Ljava/lang/Object;

    check-cast v1, Landroid/view/ViewGroup;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lm9f;->d(Landroid/content/Context;)I

    move-result v1

    iget v2, v0, Lm9f;->a:I

    if-eq v2, v1, :cond_14

    iput v1, v0, Lm9f;->a:I

    :cond_14
    invoke-virtual {v0}, Lm9f;->e()I

    move-result v0

    if-gtz v0, :cond_28

    iget-object v0, p0, Lcv8;->e:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f0408e3

    const/4 v2, 0x0

    invoke-static {v1, v0, v2}, Lf03;->w(ILandroid/content/Context;I)I

    move-result v0

    :cond_28
    iget-object v1, p0, Lcv8;->r:Lfv8;

    iget v2, v1, Lfv8;->h:I

    if-eq v2, v0, :cond_35

    iput v0, v1, Lfv8;->h:I

    iget-object v0, v1, Lfv8;->c:Lyu8;

    invoke-virtual {v0}, Lyu8;->invoke()Ljava/lang/Object;

    :cond_35
    invoke-virtual {p0}, Lcv8;->c()V

    return-void
.end method

.method public final b()Z
    .registers 20

    move-object/from16 v0, p0

    new-instance v1, Lgo8;

    iget-boolean v2, v0, Lcv8;->E:Z

    iget-object v3, v0, Lcv8;->c:Lcom/opera/android/feed/FeedScrollView;

    invoke-virtual {v3}, Landroid/view/View;->getScrollY()I

    move-result v4

    const/4 v6, 0x2

    const/4 v7, 0x1

    const/4 v8, 0x0

    const/high16 v9, 0x3f800000    # 1.0f

    const/4 v10, 0x0

    if-lez v4, :cond_9b

    iget-object v11, v0, Lcv8;->i:Lbvl;

    invoke-interface {v11}, Lbvl;->getState()Lpde;

    move-result-object v11

    invoke-virtual {v11}, Lekc;->g()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lavl;

    iget-byte v11, v11, Lavl;->e:B

    if-eq v11, v6, :cond_9b

    int-to-float v11, v4

    iget v12, v0, Lcv8;->x:I

    int-to-float v13, v12

    div-float/2addr v11, v13

    invoke-static {v11, v10, v9}, Ldjh;->b(FFF)F

    move-result v11

    iget-object v14, v0, Lcv8;->D:Ldv8;

    iget v14, v14, Ldv8;->a:I

    iget-object v15, v0, Lcv8;->l:Luvl;

    if-eqz v15, :cond_40

    iget-object v15, v15, Luvl;->h:Lpde;

    if-eqz v15, :cond_40

    invoke-virtual {v15}, Lekc;->g()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ltvl;

    goto :goto_41

    :cond_40
    const/4 v15, 0x0

    :goto_41
    if-eqz v15, :cond_54

    iget v6, v15, Ltvl;->a:F

    cmpg-float v17, v6, v9

    if-gez v17, :cond_4b

    move v15, v8

    goto :goto_56

    :cond_4b
    iget v6, v15, Ltvl;->c:I

    add-int/2addr v6, v14

    iget v11, v15, Ltvl;->b:F

    move v15, v14

    move v14, v6

    :goto_52
    move v6, v10

    goto :goto_56

    :cond_54
    move v15, v8

    goto :goto_52

    :goto_56
    iget-object v5, v0, Lcv8;->b:Lnue;

    invoke-interface {v5}, Lnue;->getVisibility()Lize;

    move-result-object v5

    invoke-virtual {v5}, Lekc;->g()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Llue;

    invoke-virtual {v5}, Llue;->d()Z

    move-result v5

    if-eqz v5, :cond_86

    invoke-virtual {v3}, Landroidx/core/widget/NestedScrollView;->computeVerticalScrollRange()I

    move-result v5

    invoke-virtual {v3}, Landroidx/core/widget/NestedScrollView;->computeVerticalScrollExtent()I

    move-result v18

    sub-int v5, v5, v18

    sub-int v12, v5, v12

    if-ne v12, v5, :cond_78

    move v4, v10

    goto :goto_81

    :cond_78
    sub-int/2addr v4, v12

    int-to-float v4, v4

    sub-int/2addr v5, v12

    int-to-float v5, v5

    div-float/2addr v4, v5

    invoke-static {v4, v10, v9}, Ldjh;->b(FFF)F

    move-result v4

    :goto_81
    cmpl-float v5, v4, v10

    if-lez v5, :cond_86

    move v6, v4

    :cond_86
    new-instance v4, Lgvl;

    sub-float v5, v9, v6

    mul-float/2addr v5, v13

    invoke-static {v5}, Lzed;->b(F)I

    move-result v5

    if-ge v5, v7, :cond_92

    move v5, v7

    :cond_92
    cmpg-float v12, v11, v6

    if-gez v12, :cond_97

    move v11, v6

    :cond_97
    invoke-direct {v4, v15, v11, v5, v14}, Lgvl;-><init>(IFII)V

    goto :goto_9d

    :cond_9b
    sget-object v4, Lgvl;->e:Lgvl;

    :goto_9d
    invoke-virtual {v3}, Landroid/view/View;->getScrollY()I

    move-result v5

    int-to-float v6, v5

    iget v11, v0, Lcv8;->A:I

    int-to-float v11, v11

    div-float/2addr v6, v11

    invoke-static {v6, v10, v9}, Ldjh;->b(FFF)F

    move-result v6

    sget-object v11, Lcv8;->F:Landroid/view/animation/AccelerateInterpolator;

    invoke-virtual {v11, v6}, Landroid/view/animation/AccelerateInterpolator;->getInterpolation(F)F

    move-result v6

    iget-object v11, v0, Lcv8;->k:Lpde;

    invoke-virtual {v11}, Lekc;->g()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lzaa;

    iget-object v12, v0, Lcv8;->h:Lpde;

    invoke-virtual {v12}, Lekc;->g()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lf8k;

    iget-object v12, v12, Lf8k;->j:Lq8l;

    iget-object v12, v12, Lq8l;->b:Luyg;

    sget-object v13, Ln8l;->a:Ln8l;

    invoke-virtual {v12, v13}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_d0

    sget-object v0, Lrp3;->d:Lrp3;

    goto/16 :goto_13f

    :cond_d0
    instance-of v12, v12, Lo8l;

    if-eqz v12, :cond_1ee

    iget-object v12, v0, Lcv8;->w:Lijc;

    iget-boolean v12, v12, Lijc;->a:Z

    if-nez v12, :cond_12e

    invoke-virtual {v3, v7}, Lcom/opera/android/feed/FeedScrollView;->canScrollVertically(I)Z

    move-result v12

    if-nez v12, :cond_e8

    iget-object v12, v0, Lcv8;->e:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v12, v7}, Landroid/view/View;->canScrollVertically(I)Z

    move-result v12

    if-eqz v12, :cond_f2

    :cond_e8
    iget-object v12, v0, Lcv8;->j:Lu8k;

    invoke-virtual {v12}, Lu8k;->b()Lt8k;

    move-result-object v12

    iget-boolean v12, v12, Lt8k;->a:Z

    if-eqz v12, :cond_12e

    :cond_f2
    iget v12, v11, Lzaa;->a:I

    if-lez v12, :cond_120

    iget v11, v11, Lzaa;->b:F

    cmpl-float v13, v11, v10

    if-lez v13, :cond_120

    sget-object v13, Lcv8;->G:Landroid/view/animation/DecelerateInterpolator;

    invoke-virtual {v13, v11}, Landroid/view/animation/DecelerateInterpolator;->getInterpolation(F)F

    move-result v11

    new-instance v13, Lrp3;

    int-to-float v12, v12

    mul-float v14, v12, v11

    invoke-static {v14}, Lzed;->b(F)I

    move-result v14

    iget-object v0, v0, Lcv8;->D:Ldv8;

    iget v0, v0, Ldv8;->b:I

    add-int/2addr v0, v5

    const/high16 v5, 0x40000000    # 2.0f

    div-float/2addr v12, v5

    mul-float/2addr v12, v11

    invoke-static {v12}, Lzed;->b(F)I

    move-result v5

    add-int/2addr v5, v0

    sub-float v0, v9, v6

    invoke-direct {v13, v14, v5, v0}, Lrp3;-><init>(IIF)V

    move-object v0, v13

    goto :goto_13f

    :cond_120
    new-instance v11, Lrp3;

    iget-object v0, v0, Lcv8;->D:Ldv8;

    iget v0, v0, Ldv8;->b:I

    add-int/2addr v0, v5

    sub-float v5, v9, v6

    invoke-direct {v11, v8, v0, v5}, Lrp3;-><init>(IIF)V

    move-object v0, v11

    goto :goto_13f

    :cond_12e
    new-instance v5, Lrp3;

    iget-object v11, v0, Lcv8;->D:Ldv8;

    iget v11, v11, Ldv8;->b:I

    iget v12, v0, Lcv8;->z:I

    add-int/2addr v11, v12

    sub-float v6, v9, v6

    iget v0, v0, Lcv8;->y:I

    invoke-direct {v5, v0, v11, v6}, Lrp3;-><init>(IIF)V

    move-object v0, v5

    :goto_13f
    invoke-direct {v1, v2, v4, v0}, Lgo8;-><init>(ZLgvl;Lrp3;)V

    iget-object v5, v3, Lcom/opera/android/feed/FeedScrollView;->M:Lgo8;

    invoke-virtual {v5, v1}, Lgo8;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_14b

    return v8

    :cond_14b
    iput-object v1, v3, Lcom/opera/android/feed/FeedScrollView;->M:Lgo8;

    invoke-virtual {v4}, Lgvl;->a()Z

    move-result v1

    if-nez v1, :cond_15f

    invoke-virtual {v0}, Lrp3;->a()Z

    move-result v0

    if-nez v0, :cond_15f

    const/4 v0, 0x0

    invoke-virtual {v3, v8, v0}, Landroid/view/View;->setLayerType(ILandroid/graphics/Paint;)V

    goto/16 :goto_1ea

    :cond_15f
    const/4 v0, 0x0

    if-eqz v2, :cond_164

    move v6, v7

    goto :goto_165

    :cond_164
    const/4 v6, 0x2

    :goto_165
    invoke-virtual {v3, v6, v0}, Landroid/view/View;->setLayerType(ILandroid/graphics/Paint;)V

    iget-object v0, v3, Lcom/opera/android/feed/FeedScrollView;->M:Lgo8;

    iget-object v0, v0, Lgo8;->b:Lgvl;

    invoke-virtual {v0}, Lgvl;->a()Z

    move-result v0

    if-eqz v0, :cond_193

    iget-object v0, v3, Lcom/opera/android/feed/FeedScrollView;->O:Landroid/graphics/Paint;

    new-instance v11, Landroid/graphics/LinearGradient;

    iget-object v1, v3, Lcom/opera/android/feed/FeedScrollView;->M:Lgo8;

    iget-object v1, v1, Lgo8;->b:Lgvl;

    iget v2, v1, Lgvl;->c:I

    int-to-float v13, v2

    iget v4, v1, Lgvl;->b:I

    add-int/2addr v2, v4

    int-to-float v15, v2

    iget v1, v1, Lgvl;->d:F

    invoke-static {v1, v8}, Lp37;->j0(FI)I

    move-result v16

    const/16 v17, 0x0

    sget-object v18, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    const/4 v12, 0x0

    const/4 v14, 0x0

    invoke-direct/range {v11 .. v18}, Landroid/graphics/LinearGradient;-><init>(FFFFIILandroid/graphics/Shader$TileMode;)V

    invoke-virtual {v0, v11}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    :cond_193
    iget-object v0, v3, Lcom/opera/android/feed/FeedScrollView;->M:Lgo8;

    iget-object v0, v0, Lgo8;->c:Lrp3;

    invoke-virtual {v0}, Lrp3;->a()Z

    move-result v0

    if-eqz v0, :cond_1ea

    new-instance v0, Landroid/view/animation/DecelerateInterpolator;

    invoke-direct {v0}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    iget-object v1, v3, Lcom/opera/android/feed/FeedScrollView;->M:Lgo8;

    iget-object v1, v1, Lgo8;->c:Lrp3;

    iget v1, v1, Lrp3;->c:F

    const/16 v2, 0x8

    new-array v4, v2, [I

    new-array v5, v2, [F

    :goto_1ae
    if-ge v8, v2, :cond_1d0

    int-to-float v6, v8

    mul-float/2addr v6, v9

    const/high16 v11, 0x40e00000    # 7.0f

    div-float/2addr v6, v11

    invoke-virtual {v0, v6}, Landroid/view/animation/DecelerateInterpolator;->getInterpolation(F)F

    move-result v11

    mul-float/2addr v11, v1

    float-to-double v11, v11

    const-wide v13, 0x40019999a0000000L    # 2.200000047683716

    invoke-static {v11, v12, v13, v14}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v11

    double-to-float v11, v11

    aput v6, v5, v8

    invoke-static {v11, v10, v10, v10}, Landroid/graphics/Color;->argb(FFFF)I

    move-result v6

    aput v6, v4, v8

    add-int/lit8 v8, v8, 0x1

    goto :goto_1ae

    :cond_1d0
    iget-object v0, v3, Lcom/opera/android/feed/FeedScrollView;->P:Landroid/graphics/Paint;

    new-instance v11, Landroid/graphics/LinearGradient;

    iget-object v1, v3, Lcom/opera/android/feed/FeedScrollView;->M:Lgo8;

    iget-object v1, v1, Lgo8;->c:Lrp3;

    iget v1, v1, Lrp3;->a:I

    int-to-float v15, v1

    sget-object v18, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    move-object/from16 v16, v4

    move-object/from16 v17, v5

    invoke-direct/range {v11 .. v18}, Landroid/graphics/LinearGradient;-><init>(FFFF[I[FLandroid/graphics/Shader$TileMode;)V

    invoke-virtual {v0, v11}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    :cond_1ea
    :goto_1ea
    invoke-virtual {v3}, Landroid/view/View;->invalidate()V

    return v7

    :cond_1ee
    invoke-static {}, Lh9o;->p()V

    return v8
.end method

.method public final c()V
    .registers 4

    iget-object v0, p0, Lcv8;->s:Lm9f;

    iget-object v1, v0, Lm9f;->c:Ljava/lang/Object;

    check-cast v1, Landroid/view/ViewGroup;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lm9f;->d(Landroid/content/Context;)I

    move-result v1

    iget v2, v0, Lm9f;->a:I

    if-eq v2, v1, :cond_14

    iput v1, v0, Lm9f;->a:I

    :cond_14
    invoke-virtual {v0}, Lm9f;->e()I

    move-result v0

    iget-object v1, p0, Lcv8;->n:Ltsd;

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_2c

    iget v1, p0, Lcv8;->u:I

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    :cond_2c
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iget-object p0, p0, Lcv8;->t:Lkze;

    invoke-virtual {p0, v0}, Lekc;->r(Ljava/lang/Object;)V

    return-void
.end method
