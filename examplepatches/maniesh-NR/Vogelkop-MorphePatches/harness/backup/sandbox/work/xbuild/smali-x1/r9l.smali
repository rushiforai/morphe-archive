.class public final Lr9l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lfm8;


# static fields
.field public static final F:Ljava/util/LinkedHashMap;


# instance fields
.field public final A:Lp9l;

.field public final B:Lz5l;

.field public final C:Lz5l;

.field public final D:Lg4l;

.field public final E:Ll45;

.field public final a:Lgjm;

.field public final b:Lp77;

.field public final c:Lk6l;

.field public final d:Lu4l;

.field public final e:Landroid/view/ViewGroup;

.field public final f:Lmt3;

.field public final g:Ljo3;

.field public final h:Lyqa;

.field public final i:Lgb3;

.field public final j:Lj1k;

.field public final k:Lzyk;

.field public final l:Lzyk;

.field public final m:Lzyk;

.field public final n:Ll9l;

.field public o:Lj9l;

.field public final p:Li03;

.field public final q:Lebl;

.field public final r:Lpde;

.field public final s:Lfe5;

.field public final t:Lgal;

.field public u:Z

.field public final v:Lpde;

.field public final w:Ls9i;

.field public final x:Lpde;

.field public final y:Lz9j;

.field public final z:Lzkk;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    sput-object v0, Lr9l;->F:Ljava/util/LinkedHashMap;

    return-void
.end method

.method public constructor <init>(Lpde;Lc4l;Lgjm;Lx5f;Lz77;Lp77;Lk6l;Lu4l;Li53;Lnr8;Lcom/opera/android/settings/SettingsManager;Lysj;Lmt3;Landroid/view/ViewGroup;Lmt3;Leme;Ljo3;Lyqa;Lp6l;Lgb3;Lj1k;)V
    .registers 95

    move-object/from16 v2, p0

    move-object/from16 v8, p7

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    move-object/from16 v0, p3

    iput-object v0, v2, Lr9l;->a:Lgjm;

    move-object/from16 v0, p6

    iput-object v0, v2, Lr9l;->b:Lp77;

    iput-object v8, v2, Lr9l;->c:Lk6l;

    move-object/from16 v9, p8

    iput-object v9, v2, Lr9l;->d:Lu4l;

    move-object/from16 v13, p14

    iput-object v13, v2, Lr9l;->e:Landroid/view/ViewGroup;

    move-object/from16 v0, p15

    iput-object v0, v2, Lr9l;->f:Lmt3;

    move-object/from16 v0, p17

    iput-object v0, v2, Lr9l;->g:Ljo3;

    move-object/from16 v15, p18

    iput-object v15, v2, Lr9l;->h:Lyqa;

    move-object/from16 v0, p20

    iput-object v0, v2, Lr9l;->i:Lgb3;

    move-object/from16 v0, p21

    iput-object v0, v2, Lr9l;->j:Lj1k;

    new-instance v0, Lc9l;

    const/4 v14, 0x0

    invoke-direct {v0, v2, v14}, Lc9l;-><init>(Lr9l;B)V

    invoke-static {v0}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object v0

    iput-object v0, v2, Lr9l;->k:Lzyk;

    new-instance v0, Lc9l;

    const/4 v10, 0x1

    invoke-direct {v0, v2, v10}, Lc9l;-><init>(Lr9l;B)V

    invoke-static {v0}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object v0

    iput-object v0, v2, Lr9l;->l:Lzyk;

    new-instance v0, Leek;

    const/16 v11, 0x9

    move-object/from16 v12, p16

    invoke-direct {v0, v12, v2, v11}, Leek;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v0}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object v0

    iput-object v0, v2, Lr9l;->m:Lzyk;

    new-instance v0, Ll9l;

    invoke-direct {v0, v2}, Ll9l;-><init>(Lr9l;)V

    iput-object v0, v2, Lr9l;->n:Ll9l;

    sget-object v0, Lj9l;->a:Lj9l;

    iput-object v0, v2, Lr9l;->o:Lj9l;

    new-instance v0, Li03;

    invoke-virtual {v13}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Li03;-><init>(Landroid/content/Context;)V

    iput-object v0, v2, Lr9l;->p:Li03;

    invoke-virtual {v13}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    const v3, 0x7f0d03f1

    invoke-virtual {v1, v3, v0, v14}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    const v3, 0x7f0a0193

    invoke-static {v3, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object/from16 v18, v4

    check-cast v18, Lcom/opera/android/custom_views/EqualWidthLinearLayout;

    if-eqz v18, :cond_755

    const v3, 0x7f0a05f0

    invoke-static {v3, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    move-object/from16 v19, v5

    check-cast v19, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v19, :cond_755

    const v3, 0x7f0a0685

    invoke-static {v3, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    move-object/from16 v20, v5

    check-cast v20, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v20, :cond_755

    const v3, 0x7f0a08a5

    invoke-static {v3, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    move-object/from16 v21, v5

    check-cast v21, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v21, :cond_755

    const v3, 0x7f0a08af

    invoke-static {v3, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    check-cast v5, Lcom/opera/android/tabui2/ConfigurationProvidingFrameLayout;

    if-eqz v5, :cond_755

    iget-object v3, v5, Lcom/opera/android/tabui2/ConfigurationProvidingFrameLayout;->c:Lpde;

    const v6, 0x7f0a08b0

    invoke-static {v6, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v7

    move-object/from16 v23, v7

    check-cast v23, Lcom/opera/android/tabui2/FadeoutRecyclerView;

    if-eqz v23, :cond_751

    const v6, 0x7f0a08b1

    invoke-static {v6, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v7

    move-object/from16 v24, v7

    check-cast v24, Landroidx/recyclerview/widget/RecyclerView;

    if-eqz v24, :cond_751

    const v6, 0x7f0a08b2

    invoke-static {v6, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v7

    move-object/from16 v25, v7

    check-cast v25, Landroidx/recyclerview/widget/RecyclerView;

    if-eqz v25, :cond_751

    const v6, 0x7f0a08b3

    invoke-static {v6, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v7

    move-object/from16 v26, v7

    check-cast v26, Lcom/opera/android/tabui2/FadeoutRecyclerView;

    if-eqz v26, :cond_751

    const v6, 0x7f0a08c2

    invoke-static {v6, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v7

    move-object/from16 v27, v7

    check-cast v27, Landroid/widget/FrameLayout;

    if-eqz v27, :cond_751

    const v6, 0x7f0a08c3

    invoke-static {v6, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v7

    move-object/from16 v28, v7

    check-cast v28, Landroid/widget/FrameLayout;

    if-eqz v28, :cond_751

    const v6, 0x7f0a0935

    invoke-static {v6, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v7

    move-object/from16 v29, v7

    check-cast v29, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v29, :cond_751

    const v6, 0x7f0a0936

    invoke-static {v6, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v7

    move-object/from16 v30, v7

    check-cast v30, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v30, :cond_751

    const v6, 0x7f0a0938

    invoke-static {v6, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v7

    move-object/from16 v31, v7

    check-cast v31, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v31, :cond_751

    const v6, 0x7f0a093d

    invoke-static {v6, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v7

    move-object/from16 v32, v7

    check-cast v32, Lcom/opera/android/custom_views/ObservableEditText;

    if-eqz v32, :cond_751

    const v6, 0x7f0a0941

    invoke-static {v6, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v7

    move-object/from16 v33, v7

    check-cast v33, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v33, :cond_751

    const v6, 0x7f0a0948

    invoke-static {v6, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v7

    move-object/from16 v34, v7

    check-cast v34, Landroid/widget/RelativeLayout;

    if-eqz v34, :cond_751

    const v6, 0x7f0a096e

    invoke-static {v6, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v7

    move-object/from16 v35, v7

    check-cast v35, Landroid/widget/RelativeLayout;

    if-eqz v35, :cond_751

    const v6, 0x7f0a0974

    invoke-static {v6, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v7

    move-object/from16 v36, v7

    check-cast v36, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v36, :cond_751

    const v6, 0x7f0a0975

    invoke-static {v6, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v7

    move-object/from16 v37, v7

    check-cast v37, Lcom/opera/android/ui/catalog/widget/OperaTextView;

    if-eqz v37, :cond_751

    const v6, 0x7f0a0976

    invoke-static {v6, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v7

    move-object/from16 v38, v7

    check-cast v38, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v38, :cond_751

    const v6, 0x7f0a0b25

    invoke-static {v6, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v7

    move-object/from16 v39, v7

    check-cast v39, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v39, :cond_751

    move-object/from16 v17, v1

    check-cast v17, Lcom/opera/android/tabui2/TabUiRootFrameLayout;

    const v6, 0x7f0a0b34

    invoke-static {v6, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v7

    move-object/from16 v41, v7

    check-cast v41, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v41, :cond_751

    const v6, 0x7f0a0b35

    invoke-static {v6, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v7

    move-object/from16 v42, v7

    check-cast v42, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v42, :cond_751

    const v6, 0x7f0a0b36

    invoke-static {v6, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v7

    move-object/from16 v43, v7

    check-cast v43, Lcom/opera/android/tabui2/TabGalleryButtonContainer;

    if-eqz v43, :cond_751

    const v6, 0x7f0a0b39

    invoke-static {v6, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v7

    move-object/from16 v44, v7

    check-cast v44, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    if-eqz v44, :cond_751

    const v6, 0x7f0a0b42

    invoke-static {v6, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v7

    move-object/from16 v45, v7

    check-cast v45, Lcom/opera/android/custom_views/TabCountButton;

    if-eqz v45, :cond_751

    const v6, 0x7f0a0bd2

    invoke-static {v6, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v7

    move-object/from16 v46, v7

    check-cast v46, Landroid/widget/RelativeLayout;

    if-eqz v46, :cond_751

    new-instance v16, Lebl;

    move-object/from16 v40, v17

    move-object/from16 v22, v5

    invoke-direct/range {v16 .. v46}, Lebl;-><init>(Lcom/opera/android/tabui2/TabUiRootFrameLayout;Lcom/opera/android/custom_views/EqualWidthLinearLayout;Lcom/opera/android/custom_views/StylingImageButton;Lcom/opera/android/custom_views/StylingImageButton;Lcom/opera/android/custom_views/StylingImageButton;Lcom/opera/android/tabui2/ConfigurationProvidingFrameLayout;Lcom/opera/android/tabui2/FadeoutRecyclerView;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView;Lcom/opera/android/tabui2/FadeoutRecyclerView;Landroid/widget/FrameLayout;Landroid/widget/FrameLayout;Lcom/opera/android/custom_views/StylingImageButton;Lcom/opera/android/custom_views/StylingImageButton;Lcom/opera/android/custom_views/StylingImageButton;Lcom/opera/android/custom_views/ObservableEditText;Lcom/opera/android/custom_views/StylingImageButton;Landroid/widget/RelativeLayout;Landroid/widget/RelativeLayout;Lcom/opera/android/custom_views/StylingImageButton;Lcom/opera/android/ui/catalog/widget/OperaTextView;Lcom/opera/android/custom_views/StylingImageButton;Lcom/opera/android/custom_views/StylingImageButton;Lcom/opera/android/tabui2/TabUiRootFrameLayout;Lcom/opera/android/custom_views/StylingTextView;Lcom/opera/android/custom_views/StylingTextView;Lcom/opera/android/tabui2/TabGalleryButtonContainer;Lcom/google/android/material/floatingactionbutton/FloatingActionButton;Lcom/opera/android/custom_views/TabCountButton;Landroid/widget/RelativeLayout;)V

    move-object/from16 v5, v16

    move-object/from16 v1, v17

    iput-object v5, v2, Lr9l;->q:Lebl;

    new-instance v6, Lt9l;

    invoke-direct {v6, v1}, Lt9l;-><init>(Landroid/view/ViewGroup;)V

    iget-object v6, v6, Lt9l;->b:Ljava/lang/Object;

    check-cast v6, Lpde;

    iput-object v6, v2, Lr9l;->r:Lpde;

    new-instance v7, Lfe5;

    move-object/from16 v14, p1

    invoke-direct {v7, v14}, Lfe5;-><init>(Lpde;)V

    new-instance v4, Lbo3;

    const/16 v1, 0x1c

    invoke-direct {v4, v7, v1}, Lbo3;-><init>(Ljava/lang/Object;B)V

    new-instance v1, Lcl4;

    const/4 v13, 0x3

    invoke-direct {v1, v4, v13}, Lcl4;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v6, v1}, Lekc;->k(Lf7f;)V

    iput-object v7, v2, Lr9l;->s:Lfe5;

    new-instance v16, Lgal;

    move-object v1, v0

    new-instance v0, Lj1k;

    move-object v4, v6

    const/4 v6, 0x0

    const/16 v7, 0x16

    move-object/from16 v18, v1

    const/4 v1, 0x0

    move-object/from16 v20, v3

    const-class v3, Lr9l;

    move-object/from16 v21, v4

    const-string v4, "onModeChanged"

    move-object/from16 v22, v5

    const-string v5, "onModeChanged()V"

    move-object/from16 v47, v19

    move-object/from16 v48, v29

    move-object/from16 v49, v30

    move-object/from16 v50, v31

    move-object/from16 v51, v32

    move-object/from16 v52, v33

    move-object/from16 v53, v39

    move-object/from16 v54, v41

    move-object/from16 v55, v42

    move-object/from16 v56, v44

    move-object/from16 v57, v45

    const/4 v13, 0x0

    invoke-direct/range {v0 .. v7}, Lj1k;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    move-object v5, v0

    move-object v0, v2

    move-object v7, v3

    if-nez p19, :cond_268

    invoke-virtual {v8}, Lk6l;->A()Lb2l;

    move-result-object v1

    invoke-interface {v1}, Lb9l;->T()Lp6l;

    move-result-object v1

    move-object v6, v1

    :goto_25f
    move-object/from16 v1, v16

    move-object/from16 v3, v18

    move-object/from16 v2, v21

    move-object/from16 v4, v22

    goto :goto_26b

    :cond_268
    move-object/from16 v6, p19

    goto :goto_25f

    :goto_26b
    invoke-direct/range {v1 .. v6}, Lgal;-><init>(Lpde;Li03;Lebl;Lj1k;Lp6l;)V

    move-object/from16 v18, v2

    move-object v2, v1

    move-object/from16 v1, v18

    move-object/from16 v18, v3

    move-object/from16 v22, v4

    iput-object v2, v0, Lr9l;->t:Lgal;

    new-instance v3, Lpde;

    invoke-direct {v3, v13}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v3, v0, Lr9l;->v:Lpde;

    move/from16 v16, v10

    new-instance v10, Ls9i;

    invoke-direct {v10, v1, v8}, Ls9i;-><init>(Lpde;Lk6l;)V

    iget-object v4, v10, Ls9i;->d:Ljava/lang/Object;

    check-cast v4, Lpde;

    iget-object v5, v10, Ls9i;->c:Ljava/lang/Object;

    check-cast v5, Lpde;

    new-instance v6, Lg9l;

    const/4 v11, 0x0

    invoke-direct {v6, v10, v11}, Lg9l;-><init>(Ljava/lang/Object;B)V

    invoke-static {v5, v1, v6}, La26;->T(Lekc;Likc;Lf7f;)V

    new-instance v5, Lu6j;

    invoke-direct {v5, v0}, Lu6j;-><init>(Lr9l;)V

    invoke-static {v4, v1, v5}, La26;->T(Lekc;Likc;Lf7f;)V

    iput-object v10, v0, Lr9l;->w:Ls9i;

    new-instance v11, Lpde;

    sget-object v5, Leyj;->I:Leyj;

    invoke-direct {v11, v5}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v11, v0, Lr9l;->x:Lpde;

    new-instance v5, Lz9j;

    sget-object v6, Lb3c;->a:Ls16;

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v6, Lb3c;->c:Lr16;

    move-object/from16 v13, p11

    invoke-direct {v5, v13, v6}, Lz9j;-><init>(Lcom/opera/android/settings/SettingsManager;Lr16;)V

    iput-object v5, v0, Lr9l;->y:Lz9j;

    new-instance v13, Lzkk;

    move-object/from16 v6, p4

    invoke-direct {v13, v1, v6, v5}, Lzkk;-><init>(Lpde;Lx5f;Lz9j;)V

    iput-object v13, v0, Lr9l;->z:Lzkk;

    new-instance v0, Lj1k;

    const/4 v6, 0x0

    move-object/from16 v21, v3

    move-object v3, v7

    const/16 v7, 0x14

    move-object/from16 v29, v1

    const/4 v1, 0x0

    move-object/from16 v30, v4

    const-string v4, "getCurrentModeContext"

    move-object/from16 v31, v5

    const-string v5, "getCurrentModeContext()Landroid/content/Context;"

    move-object/from16 p4, v2

    move-object/from16 p11, v13

    move-object/from16 v13, v18

    move-object/from16 v14, v22

    move-object/from16 v2, p0

    invoke-direct/range {v0 .. v7}, Lj1k;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    new-instance v1, Lp9l;

    move-object/from16 v5, p5

    move-object/from16 v7, p9

    move-object/from16 v3, p11

    move-object v4, v0

    move-object v0, v1

    move-object v6, v8

    move-object v1, v12

    move/from16 v15, v16

    move-object/from16 v8, p10

    move-object/from16 v12, p13

    move-object/from16 v16, v11

    move-object/from16 v11, p12

    invoke-direct/range {v0 .. v12}, Lp9l;-><init>(Leme;Lr9l;Lzkk;Lj1k;Lz77;Lk6l;Li53;Lnr8;Lu4l;Ls9i;Lysj;Lmt3;)V

    move-object v12, v0

    move-object v0, v2

    move-object v7, v10

    iput-object v12, v0, Lr9l;->A:Lp9l;

    new-instance v1, Lrgh;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-object v0, v1, Lrgh;->b:Ljava/lang/Object;

    iget-object v2, v0, Lr9l;->A:Lp9l;

    iput-object v2, v1, Lrgh;->a:Ljava/lang/Object;

    new-instance v2, Lq9l;

    invoke-direct {v2, v0}, Lq9l;-><init>(Lr9l;)V

    new-instance v3, Lg3l;

    invoke-direct {v3, v0, v15}, Lg3l;-><init>(Ljava/lang/Object;B)V

    new-instance v4, Ld5o;

    invoke-direct {v4}, Ljava/lang/Object;-><init>()V

    iput-object v14, v4, Ld5o;->a:Ljava/lang/Object;

    iget-object v5, v13, Li03;->d:Lpde;

    iput-object v5, v4, Ld5o;->b:Ljava/lang/Object;

    new-instance v6, Lpde;

    sget-object v8, Lqp3;->d:Lqp3;

    invoke-direct {v6, v8}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v6, v4, Ld5o;->c:Ljava/lang/Object;

    new-instance v6, Lk9;

    const/16 v8, 0xf

    invoke-direct {v6, v4, v8}, Lk9;-><init>(Ljava/lang/Object;B)V

    move-object/from16 v8, v29

    invoke-static {v5, v8, v6}, La26;->T(Lekc;Likc;Lf7f;)V

    new-instance v5, Lsp3;

    const/4 v11, 0x0

    invoke-direct {v5, v4, v11}, Lsp3;-><init>(Ld5o;B)V

    iget-object v6, v14, Lebl;->w:Lcom/opera/android/tabui2/TabUiRootFrameLayout;

    invoke-virtual {v6, v5}, Landroid/view/View;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    new-instance v5, Lsp3;

    invoke-direct {v5, v4, v15}, Lsp3;-><init>(Ld5o;B)V

    iget-object v6, v14, Lebl;->b:Lcom/opera/android/custom_views/EqualWidthLinearLayout;

    invoke-virtual {v6, v5}, Landroid/view/View;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    iget-object v4, v4, Ld5o;->c:Ljava/lang/Object;

    check-cast v4, Lpde;

    new-instance v0, Lz5l;

    new-instance v11, Likc;

    sget-object v6, Lp6l;->a:Lp6l;

    invoke-direct {v11, v6}, Lekc;-><init>(Ljava/lang/Object;)V

    invoke-static/range {p4 .. p4}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v14

    invoke-virtual/range {p14 .. p14}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v15

    move-object/from16 v9, p4

    move-object v10, v1

    iget-object v1, v9, Lgal;->i:Lpde;

    move-object/from16 v13, p18

    move-object/from16 v60, v2

    move-object/from16 v61, v3

    move-object/from16 v62, v4

    move-object/from16 v59, v8

    move-object/from16 v4, v16

    move-object/from16 v5, v20

    move-object/from16 v6, v21

    move-object/from16 v58, v22

    move-object/from16 v9, v26

    move-object/from16 v8, v31

    move-object/from16 v2, p7

    move-object/from16 v3, p8

    move-object/from16 v16, v10

    move-object/from16 v10, v28

    invoke-direct/range {v0 .. v15}, Lz5l;-><init>(Lpde;Lk6l;Lu4l;Lpde;Lpde;Lpde;Ls9i;Lpde;Landroidx/recyclerview/widget/RecyclerView;Landroid/widget/FrameLayout;Likc;La21;Lyqa;Ljava/util/List;Landroid/content/res/Resources;)V

    move-object/from16 v18, v1

    move-object v1, v0

    move-object v0, v9

    iget-object v2, v1, Lz5l;->k:Lr5l;

    move-object/from16 v3, v59

    move-object/from16 v5, v61

    invoke-static {v2, v3, v5}, La26;->V(Lw6f;Likc;Ljava/lang/Object;)V

    new-instance v2, Lo9l;

    move-object/from16 v6, p0

    invoke-direct {v2, v6}, Lo9l;-><init>(Lr9l;)V

    iget-object v8, v1, Lz5l;->j:Lp77;

    invoke-static {v8, v3, v2}, La26;->V(Lw6f;Likc;Ljava/lang/Object;)V

    iget-object v2, v1, Lz5l;->l:Lzyk;

    invoke-virtual {v2}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Likc;

    new-instance v8, Lvoj;

    const/16 v9, 0x15

    invoke-direct {v8, v9}, Lvoj;-><init>(B)V

    move-object/from16 v10, v62

    invoke-static {v2, v10, v8}, Lxf8;->z(Likc;Lpde;Lkotlin/jvm/functions/Function2;)Ltsd;

    move-result-object v2

    new-instance v8, Lg9l;

    const/4 v11, 0x2

    invoke-direct {v8, v0, v11}, Lg9l;-><init>(Ljava/lang/Object;B)V

    invoke-static {v2, v3, v8}, La26;->T(Lekc;Likc;Lf7f;)V

    iput-object v1, v6, Lr9l;->B:Lz5l;

    move-object/from16 v26, v0

    new-instance v0, Lz5l;

    new-instance v11, Likc;

    sget-object v8, Lp6l;->b:Lp6l;

    invoke-direct {v11, v8}, Lekc;-><init>(Ljava/lang/Object;)V

    invoke-static/range {p4 .. p4}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v14

    invoke-virtual/range {p14 .. p14}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v15

    move-object/from16 v8, p4

    move-object v13, v1

    iget-object v1, v8, Lgal;->j:Lpde;

    move-object/from16 v2, p7

    move-object/from16 v64, v3

    move-object/from16 v66, v5

    move-object/from16 v65, v8

    move-object/from16 v67, v10

    move-object/from16 v68, v13

    move-object/from16 v5, v20

    move-object/from16 v6, v21

    move-object/from16 v9, v23

    move-object/from16 v10, v27

    move-object/from16 v8, v31

    move-object/from16 v3, p8

    move-object/from16 v13, p18

    invoke-direct/range {v0 .. v15}, Lz5l;-><init>(Lpde;Lk6l;Lu4l;Lpde;Lpde;Lpde;Ls9i;Lpde;Landroidx/recyclerview/widget/RecyclerView;Landroid/widget/FrameLayout;Likc;La21;Lyqa;Ljava/util/List;Landroid/content/res/Resources;)V

    move-object v14, v0

    move-object/from16 v20, v1

    move-object v13, v4

    move-object v11, v9

    move-object/from16 v19, v12

    move-object v12, v7

    iget-object v0, v14, Lz5l;->k:Lr5l;

    move-object/from16 v2, v64

    move-object/from16 v5, v66

    invoke-static {v0, v2, v5}, La26;->V(Lw6f;Likc;Ljava/lang/Object;)V

    iget-object v0, v14, Lz5l;->l:Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Likc;

    new-instance v1, Lvoj;

    const/16 v3, 0x15

    invoke-direct {v1, v3}, Lvoj;-><init>(B)V

    move-object/from16 v10, v67

    invoke-static {v0, v10, v1}, Lxf8;->z(Likc;Lpde;Lkotlin/jvm/functions/Function2;)Ltsd;

    move-result-object v0

    new-instance v1, Lg9l;

    const/4 v15, 0x2

    invoke-direct {v1, v11, v15}, Lg9l;-><init>(Ljava/lang/Object;B)V

    invoke-static {v0, v2, v1}, La26;->T(Lekc;Likc;Lf7f;)V

    move-object/from16 v0, p0

    iput-object v14, v0, Lr9l;->C:Lz5l;

    new-instance v1, Lg4l;

    new-instance v4, Lc9l;

    invoke-direct {v4, v0, v15}, Lc9l;-><init>(Lr9l;B)V

    new-instance v6, Lc9l;

    const/4 v3, 0x3

    invoke-direct {v6, v0, v3}, Lc9l;-><init>(Lr9l;B)V

    new-instance v10, Lj1k;

    const/4 v5, 0x0

    const/16 v7, 0x17

    const/4 v8, 0x0

    const-class v9, Lr9l;

    const-string v21, "getCurrentModeContext"

    const-string v22, "getCurrentModeContext()Landroid/content/Context;"

    move-object/from16 p11, v0

    move/from16 p15, v5

    move/from16 p16, v7

    move/from16 p10, v8

    move-object/from16 p12, v9

    move-object/from16 p9, v10

    move-object/from16 p13, v21

    move-object/from16 p14, v22

    invoke-direct/range {p9 .. p16}, Lj1k;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    move-object/from16 v0, v65

    iget-object v8, v0, Lgal;->g:Lpde;

    move-object/from16 v7, p2

    move-object/from16 v9, p5

    move-object v0, v1

    move-object/from16 v23, v11

    move-object/from16 v5, v30

    move-object/from16 v1, p1

    move v11, v3

    move-object/from16 v3, p0

    invoke-direct/range {v0 .. v10}, Lg4l;-><init>(Lpde;Lpde;Lr9l;Lc9l;Lpde;Lc9l;Lc4l;Lpde;Lz77;Lj1k;)V

    move-object v1, v0

    move-object v0, v3

    const/4 v3, 0x0

    invoke-static {v1, v3, v11}, Lg4l;->a(Lg4l;Luz3;I)V

    iput-object v1, v0, Lr9l;->D:Lg4l;

    new-instance v0, Lbp3;

    move-object/from16 v4, v68

    iget-object v6, v4, Lz5l;->s:Lpde;

    iget-object v7, v4, Lz5l;->A:Lv8a;

    iget-object v4, v4, Lz5l;->i:Lyhe;

    move-object/from16 v15, p18

    move-object/from16 v69, v2

    move-object/from16 v63, v3

    move-object v11, v4

    move-object/from16 v72, v8

    move-object v8, v12

    move-object v5, v13

    move-object/from16 v71, v14

    move-object/from16 v14, v16

    move-object/from16 v13, v17

    move-object/from16 v12, v25

    move-object/from16 v10, v26

    move-object/from16 v70, v30

    move-object/from16 v2, v31

    move-object/from16 v9, v65

    move-object/from16 v3, p7

    move-object/from16 v4, p8

    move-object/from16 v16, v1

    move-object/from16 v1, v18

    invoke-direct/range {v0 .. v15}, Lbp3;-><init>(Lpde;Lz9j;Lk6l;Lu4l;Lpde;Lpde;Lv8a;Ls9i;Lgal;Lcom/opera/android/tabui2/FadeoutRecyclerView;Lyhe;Landroidx/recyclerview/widget/RecyclerView;Lcom/opera/android/tabui2/TabUiRootFrameLayout;Lrgh;Lyqa;)V

    move-object v1, v0

    move-object v4, v5

    move-object v7, v8

    move-object/from16 v0, p0

    iget-object v2, v0, Lr9l;->c:Lk6l;

    iget-object v3, v0, Lr9l;->d:Lu4l;

    new-instance v5, Lbp3;

    move-object/from16 v6, v71

    iget-object v8, v6, Lz5l;->s:Lpde;

    iget-object v9, v6, Lz5l;->A:Lv8a;

    iget-object v6, v6, Lz5l;->i:Lyhe;

    move-object/from16 p16, p18

    move-object/from16 p4, v2

    move-object/from16 p5, v3

    move-object/from16 p6, v4

    move-object/from16 p1, v5

    move-object/from16 p12, v6

    move-object/from16 p9, v7

    move-object/from16 p7, v8

    move-object/from16 p8, v9

    move-object/from16 p15, v14

    move-object/from16 p14, v17

    move-object/from16 p2, v20

    move-object/from16 p11, v23

    move-object/from16 p13, v24

    move-object/from16 p3, v31

    move-object/from16 p10, v65

    invoke-direct/range {p1 .. p16}, Lbp3;-><init>(Lpde;Lz9j;Lk6l;Lu4l;Lpde;Lpde;Lv8a;Ls9i;Lgal;Lcom/opera/android/tabui2/FadeoutRecyclerView;Lyhe;Landroidx/recyclerview/widget/RecyclerView;Lcom/opera/android/tabui2/TabUiRootFrameLayout;Lrgh;Lyqa;)V

    move-object/from16 v3, p1

    move-object/from16 v4, p2

    move-object/from16 v2, p3

    move-object/from16 v8, p9

    move-object/from16 v9, p10

    move-object/from16 v11, p11

    move-object/from16 v7, p13

    move-object/from16 v13, p14

    new-instance v5, Lnrl;

    iget-object v6, v0, Lr9l;->e:Landroid/view/ViewGroup;

    invoke-virtual {v6}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-static {v6}, Lgwi;->a(Landroid/content/Context;)Lgwi;

    move-result-object v6

    invoke-direct {v5}, Ljava/lang/Object;-><init>()V

    iput-object v6, v5, Lnrl;->b:Ljava/lang/Object;

    new-instance v6, Ltji;

    const/4 v14, 0x6

    invoke-direct {v6, v5, v14}, Ltji;-><init>(Ljava/lang/Object;B)V

    new-instance v5, Lw4i;

    invoke-direct {v5, v6, v14}, Lw4i;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v4, v5}, Lekc;->k(Lf7f;)V

    new-instance v4, Ld9l;

    const/4 v15, 0x2

    invoke-direct {v4, v0, v15}, Ld9l;-><init>(Lr9l;B)V

    move-object/from16 v5, v56

    invoke-static {v4, v5}, Lp37;->r0(Landroid/view/View$OnClickListener;Landroid/view/View;)V

    new-instance v4, Ld9l;

    const/4 v5, 0x3

    invoke-direct {v4, v0, v5}, Ld9l;-><init>(Lr9l;B)V

    move-object/from16 v6, v47

    invoke-virtual {v6, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v4, Ld9l;

    const/4 v6, 0x4

    invoke-direct {v4, v0, v6}, Ld9l;-><init>(Lr9l;B)V

    move-object/from16 v5, v55

    invoke-static {v4, v5}, Lp37;->r0(Landroid/view/View$OnClickListener;Landroid/view/View;)V

    new-instance v4, Ld9l;

    const/4 v5, 0x5

    invoke-direct {v4, v0, v5}, Ld9l;-><init>(Lr9l;B)V

    move-object/from16 v5, v54

    invoke-static {v4, v5}, Lp37;->r0(Landroid/view/View$OnClickListener;Landroid/view/View;)V

    new-instance v4, Ld9l;

    const/4 v5, 0x1

    invoke-direct {v4, v0, v5}, Ld9l;-><init>(Lr9l;B)V

    move-object/from16 v5, v57

    invoke-static {v4, v5}, Lp37;->r0(Landroid/view/View$OnClickListener;Landroid/view/View;)V

    new-instance v4, Lplk;

    iget-object v15, v0, Lr9l;->c:Lk6l;

    move-object/from16 v6, v72

    invoke-direct {v4, v15, v5, v6}, Lplk;-><init>(Lk6l;Lcom/opera/android/custom_views/TabCountButton;Lpde;)V

    new-instance v4, Ld9l;

    invoke-direct {v4, v0, v14}, Ld9l;-><init>(Lr9l;B)V

    move-object/from16 v5, v48

    invoke-static {v4, v5}, Lp37;->r0(Landroid/view/View$OnClickListener;Landroid/view/View;)V

    new-instance v4, Ld9l;

    const/4 v5, 0x7

    invoke-direct {v4, v0, v5}, Ld9l;-><init>(Lr9l;B)V

    move-object/from16 v15, v50

    invoke-static {v4, v15}, Lp37;->r0(Landroid/view/View$OnClickListener;Landroid/view/View;)V

    new-instance v4, Lzp2;

    invoke-direct {v4, v0, v5}, Lzp2;-><init>(Ljava/lang/Object;B)V

    move-object/from16 v5, v51

    invoke-virtual {v5, v4}, Landroid/view/View;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    new-instance v4, Lh63;

    invoke-direct {v4, v0, v14}, Lh63;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v5, v4}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    new-instance v4, Lys7;

    const/4 v15, 0x4

    invoke-direct {v4, v0, v15}, Lys7;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v5, v4}, Landroid/widget/TextView;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    new-instance v4, Lky4;

    const/4 v15, 0x2

    invoke-direct {v4, v0, v15}, Lky4;-><init>(Ljava/lang/Object;B)V

    move-object/from16 v15, v69

    invoke-static {v5, v15, v4}, La26;->V(Lw6f;Likc;Ljava/lang/Object;)V

    new-instance v4, Ld9l;

    const/16 v5, 0x8

    invoke-direct {v4, v0, v5}, Ld9l;-><init>(Lr9l;B)V

    move-object/from16 v5, v49

    invoke-static {v4, v5}, Lp37;->r0(Landroid/view/View$OnClickListener;Landroid/view/View;)V

    new-instance v4, Ld9l;

    const/16 v5, 0x9

    invoke-direct {v4, v0, v5}, Ld9l;-><init>(Lr9l;B)V

    move-object/from16 v5, v52

    invoke-static {v4, v5}, Lp37;->r0(Landroid/view/View$OnClickListener;Landroid/view/View;)V

    new-instance v4, Lem3;

    invoke-direct {v4, v0, v14}, Lem3;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v10, v4}, Landroidx/recyclerview/widget/RecyclerView;->n(Lnph;)V

    invoke-virtual {v12, v4}, Landroidx/recyclerview/widget/RecyclerView;->n(Lnph;)V

    invoke-virtual {v11, v4}, Landroidx/recyclerview/widget/RecyclerView;->n(Lnph;)V

    invoke-virtual {v7, v4}, Landroidx/recyclerview/widget/RecyclerView;->n(Lnph;)V

    new-instance v4, Ld9l;

    const/16 v5, 0xa

    invoke-direct {v4, v0, v5}, Ld9l;-><init>(Lr9l;B)V

    move-object/from16 v14, v58

    iget-object v5, v14, Lebl;->d:Lcom/opera/android/custom_views/StylingImageButton;

    invoke-static {v4, v5}, Lp37;->r0(Landroid/view/View$OnClickListener;Landroid/view/View;)V

    new-instance v4, Ld9l;

    const/16 v5, 0xb

    invoke-direct {v4, v0, v5}, Ld9l;-><init>(Lr9l;B)V

    move-object/from16 v7, v53

    invoke-static {v4, v7}, Lp37;->r0(Landroid/view/View$OnClickListener;Landroid/view/View;)V

    new-instance v4, Ld9l;

    const/4 v11, 0x0

    invoke-direct {v4, v0, v11}, Ld9l;-><init>(Lr9l;B)V

    iget-object v5, v14, Lebl;->e:Lcom/opera/android/custom_views/StylingImageButton;

    invoke-static {v4, v5}, Lp37;->r0(Landroid/view/View$OnClickListener;Landroid/view/View;)V

    new-instance v4, Le9l;

    invoke-direct {v4, v0, v11}, Le9l;-><init>(Lr9l;B)V

    invoke-static {v2, v15, v4}, La26;->T(Lekc;Likc;Lf7f;)V

    iget-object v2, v13, Lcom/opera/android/tabui2/ConfigurationProvidingFrameLayout;->b:Lpde;

    new-instance v4, Le9l;

    const/4 v7, 0x1

    invoke-direct {v4, v0, v7}, Le9l;-><init>(Lr9l;B)V

    invoke-static {v2, v15, v4}, La26;->T(Lekc;Likc;Lf7f;)V

    iget-object v2, v13, Lcom/opera/android/tabui2/ConfigurationProvidingFrameLayout;->d:Lpde;

    new-instance v4, Le9l;

    const/4 v7, 0x2

    invoke-direct {v4, v0, v7}, Le9l;-><init>(Lr9l;B)V

    invoke-static {v2, v15, v4}, La26;->T(Lekc;Likc;Lf7f;)V

    iget-object v2, v13, Lcom/opera/android/tabui2/ConfigurationProvidingFrameLayout;->c:Lpde;

    new-instance v4, Le9l;

    const/4 v7, 0x3

    invoke-direct {v4, v0, v7}, Le9l;-><init>(Lr9l;B)V

    invoke-static {v2, v15, v4}, La26;->T(Lekc;Likc;Lf7f;)V

    iget-object v2, v14, Lebl;->f:Lcom/opera/android/tabui2/ConfigurationProvidingFrameLayout;

    iget-object v2, v2, Lcom/opera/android/tabui2/ConfigurationProvidingFrameLayout;->c:Lpde;

    new-instance v4, Le9l;

    const/4 v7, 0x4

    invoke-direct {v4, v0, v7}, Le9l;-><init>(Lr9l;B)V

    invoke-static {v2, v15, v4}, La26;->T(Lekc;Likc;Lf7f;)V

    iget-object v2, v0, Lr9l;->c:Lk6l;

    move-object/from16 v4, v60

    invoke-static {v2, v15, v4}, La26;->V(Lw6f;Likc;Ljava/lang/Object;)V

    new-instance v2, Le9l;

    const/4 v4, 0x5

    invoke-direct {v2, v0, v4}, Le9l;-><init>(Lr9l;B)V

    move-object/from16 v4, v70

    invoke-static {v4, v15, v2}, La26;->T(Lekc;Likc;Lf7f;)V

    new-instance v2, Lr05;

    iget-object v4, v0, Lr9l;->p:Li03;

    iget-object v4, v4, Li03;->d:Lpde;

    invoke-direct {v2, v15, v14, v4}, Lr05;-><init>(Lpde;Lebl;Lpde;)V

    new-instance v2, Ll45;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    iput-object v14, v2, Ll45;->a:Ljava/lang/Object;

    iput-object v6, v2, Ll45;->b:Ljava/lang/Object;

    iget-object v4, v14, Lebl;->v:Lcom/opera/android/custom_views/StylingImageButton;

    filled-new-array {v4, v5}, [Lcom/opera/android/custom_views/StylingImageButton;

    move-result-object v4

    invoke-static {v4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    iput-object v4, v2, Ll45;->c:Ljava/lang/Object;

    new-instance v4, Lk9;

    const/16 v5, 0x10

    invoke-direct {v4, v2, v5}, Lk9;-><init>(Ljava/lang/Object;B)V

    invoke-static {v6, v15, v4}, La26;->T(Lekc;Likc;Lf7f;)V

    iput-object v2, v0, Lr9l;->E:Ll45;

    new-instance v2, Lxbf;

    iget-object v4, v0, Lr9l;->c:Lk6l;

    iget-object v5, v0, Lr9l;->d:Lu4l;

    new-instance v6, Lj1k;

    const/4 v7, 0x0

    const/16 v10, 0x12

    const/4 v12, 0x0

    const-class v13, Lg4l;

    const-string v17, "onSelectionModeMenuClick"

    const-string v18, "onSelectionModeMenuClick()V"

    move-object/from16 p1, v6

    move/from16 p7, v7

    move/from16 p8, v10

    move/from16 p2, v12

    move-object/from16 p4, v13

    move-object/from16 p3, v16

    move-object/from16 p5, v17

    move-object/from16 p6, v18

    invoke-direct/range {p1 .. p8}, Lj1k;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    iget-object v7, v14, Lebl;->s:Lcom/opera/android/custom_views/StylingImageButton;

    iget-object v10, v14, Lebl;->t:Lcom/opera/android/ui/catalog/widget/OperaTextView;

    move-object/from16 p1, v2

    move-object/from16 p3, v4

    move-object/from16 p4, v5

    move-object/from16 p10, v6

    move-object/from16 p7, v7

    move-object/from16 p5, v8

    move-object/from16 p8, v10

    move-object/from16 p2, v15

    move-object/from16 p6, v19

    move-object/from16 p9, v38

    invoke-direct/range {p1 .. p10}, Lxbf;-><init>(Lpde;Lk6l;Lu4l;Ls9i;Lp9l;Lcom/opera/android/custom_views/StylingImageButton;Lcom/opera/android/ui/catalog/widget/OperaTextView;Lcom/opera/android/custom_views/StylingImageButton;Lj1k;)V

    move-object/from16 v2, p2

    new-instance v4, Ln6k;

    const/16 v5, 0x1c

    invoke-direct {v4, v9, v5}, Ln6k;-><init>(Ljava/lang/Object;B)V

    new-instance v5, Lw4i;

    const/16 v6, 0x1a

    invoke-direct {v5, v4, v6}, Lw4i;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v2, v5}, Lekc;->k(Lf7f;)V

    invoke-virtual {v1}, Lbp3;->g()V

    invoke-virtual {v3}, Lbp3;->g()V

    iget-object v1, v0, Lr9l;->e:Landroid/view/ViewGroup;

    iget-object v2, v0, Lr9l;->p:Li03;

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    iget-object v1, v0, Lr9l;->l:Lzyk;

    invoke-virtual {v1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lm24;

    iget-object v2, v0, Lr9l;->n:Ll9l;

    invoke-interface {v1, v2}, Lm24;->a(Ll24;)V

    iget-object v1, v0, Lr9l;->g:Ljo3;

    iget-object v1, v1, Ljo3;->a:Lcom/opera/android/bar/BottomBar;

    invoke-virtual {v1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/ViewPropertyAnimator;->cancel()V

    iget-boolean v2, v1, Lcom/opera/android/bar/BottomBar;->f:Z

    const/4 v15, 0x1

    if-eq v2, v15, :cond_6c5

    iput-boolean v15, v1, Lcom/opera/android/bar/BottomBar;->f:Z

    const/high16 v2, 0x60000

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->setDescendantFocusability(I)V

    :cond_6c5
    new-instance v1, Ld48;

    iget-object v2, v0, Lr9l;->c:Lk6l;

    invoke-virtual {v2}, Lk6l;->A()Lb2l;

    move-result-object v2

    iget-object v3, v0, Lr9l;->e:Landroid/view/ViewGroup;

    iget-object v4, v0, Lr9l;->p:Li03;

    iget-object v5, v0, Lr9l;->q:Lebl;

    iget-object v5, v5, Lebl;->A:Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    iget-object v6, v9, Lgal;->e:Lp6l;

    invoke-virtual {v6}, Ljava/lang/Enum;->ordinal()I

    move-result v6

    if-eqz v6, :cond_6e9

    const/4 v15, 0x1

    if-ne v6, v15, :cond_6e5

    iget-object v6, v0, Lr9l;->q:Lebl;

    iget-object v6, v6, Lebl;->g:Lcom/opera/android/tabui2/FadeoutRecyclerView;

    goto :goto_6ed

    :cond_6e5
    invoke-static {}, Lh9o;->p()V

    throw v63

    :cond_6e9
    iget-object v6, v0, Lr9l;->q:Lebl;

    iget-object v6, v6, Lebl;->j:Lcom/opera/android/tabui2/FadeoutRecyclerView;

    :goto_6ed
    iget-object v7, v9, Lgal;->e:Lp6l;

    invoke-virtual {v7}, Ljava/lang/Enum;->ordinal()I

    move-result v7

    if-eqz v7, :cond_701

    const/4 v15, 0x1

    if-ne v7, v15, :cond_6fd

    iget-object v7, v0, Lr9l;->q:Lebl;

    iget-object v7, v7, Lebl;->h:Landroidx/recyclerview/widget/RecyclerView;

    goto :goto_705

    :cond_6fd
    invoke-static {}, Lh9o;->p()V

    throw v63

    :cond_701
    iget-object v7, v0, Lr9l;->q:Lebl;

    iget-object v7, v7, Lebl;->i:Landroidx/recyclerview/widget/RecyclerView;

    :goto_705
    invoke-virtual {v0}, Lr9l;->f()Lz5l;

    move-result-object v8

    new-instance v9, Lf9l;

    invoke-direct {v9, v0, v11}, Lf9l;-><init>(Lr9l;B)V

    new-instance v10, Lj1k;

    const/4 v11, 0x0

    const/16 v12, 0x13

    const/4 v13, 0x0

    const-class v14, Lr9l;

    const-string v15, "onShowFadeInCompleted"

    const-string v16, "onShowFadeInCompleted()V"

    move-object/from16 p3, v0

    move-object/from16 p1, v10

    move/from16 p7, v11

    move/from16 p8, v12

    move/from16 p2, v13

    move-object/from16 p4, v14

    move-object/from16 p5, v15

    move-object/from16 p6, v16

    invoke-direct/range {p1 .. p8}, Lj1k;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    move-object/from16 p10, p1

    move-object/from16 p1, v1

    move-object/from16 p2, v2

    move-object/from16 p3, v3

    move-object/from16 p4, v4

    move-object/from16 p5, v5

    move-object/from16 p6, v6

    move-object/from16 p7, v7

    move-object/from16 p8, v8

    move-object/from16 p9, v9

    invoke-direct/range {p1 .. p10}, Ld48;-><init>(Lb2l;Landroid/view/ViewGroup;Landroid/view/ViewGroup;Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView;Lz5l;Lf9l;Lj1k;)V

    iget-object v1, v0, Lr9l;->b:Lp77;

    iget-object v2, v0, Lr9l;->r:Lpde;

    new-instance v3, Lm9l;

    invoke-direct {v3, v0}, Lm9l;-><init>(Lr9l;)V

    invoke-static {v1, v2, v3}, La26;->V(Lw6f;Likc;Ljava/lang/Object;)V

    return-void

    :cond_751
    const/16 v63, 0x0

    move v3, v6

    goto :goto_757

    :cond_755
    const/16 v63, 0x0

    :goto_757
    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    const-string v1, "Missing required view with ID: "

    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    throw v63
.end method


# virtual methods
.method public final a()Lisj;
    .registers 1

    iget-object p0, p0, Lr9l;->k:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lisj;

    return-object p0
.end method

.method public final b()Z
    .registers 5

    iget-object v0, p0, Lr9l;->c:Lk6l;

    invoke-virtual {v0}, Lk6l;->A()Lb2l;

    move-result-object v1

    iget-object v2, p0, Lr9l;->t:Lgal;

    iget-object v3, v2, Lgal;->e:Lp6l;

    invoke-interface {v1}, Lb9l;->T()Lp6l;

    move-result-object v1

    if-eq v3, v1, :cond_1c

    iget-object v1, v2, Lgal;->e:Lp6l;

    invoke-virtual {p0, v1}, Lr9l;->g(Lp6l;)Lb2l;

    move-result-object v1

    if-eqz v1, :cond_1c

    const/4 v2, 0x3

    invoke-virtual {v0, v1, v2}, Lk6l;->C(Lb2l;I)V

    :cond_1c
    invoke-virtual {p0}, Lr9l;->j()Z

    move-result p0

    return p0
.end method

.method public final c()V
    .registers 20

    move-object/from16 v0, p0

    iget-object v1, v0, Lr9l;->y:Lz9j;

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    move-object v3, v1

    check-cast v3, Lb3c;

    sget-object v1, Leyj;->H:Lcyj;

    iget-object v1, v0, Lr9l;->q:Lebl;

    iget-object v2, v1, Lebl;->f:Lcom/opera/android/tabui2/ConfigurationProvidingFrameLayout;

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    iget-object v4, v1, Lebl;->f:Lcom/opera/android/tabui2/ConfigurationProvidingFrameLayout;

    iget-object v4, v4, Lcom/opera/android/tabui2/ConfigurationProvidingFrameLayout;->c:Lpde;

    invoke-virtual {v4}, Lekc;->g()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/util/Size;

    iget-object v5, v0, Lr9l;->f:Lmt3;

    invoke-virtual {v5}, Lmt3;->invoke()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/util/Size;

    iget-object v6, v1, Lebl;->a:Lcom/opera/android/tabui2/TabUiRootFrameLayout;

    iget-object v7, v6, Lcom/opera/android/tabui2/ConfigurationProvidingFrameLayout;->d:Lpde;

    invoke-virtual {v7}, Lekc;->g()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Number;

    invoke-virtual {v7}, Ljava/lang/Number;->intValue()I

    move-result v7

    invoke-virtual {v6}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const v8, 0x7f0709b5

    invoke-virtual {v6, v8}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v6

    move/from16 v18, v7

    move v7, v6

    move/from16 v6, v18

    invoke-static/range {v2 .. v7}, Lm5h;->e(Landroid/content/Context;Lb3c;Landroid/util/Size;Landroid/util/Size;II)Leyj;

    move-result-object v2

    iget-object v3, v0, Lr9l;->x:Lpde;

    invoke-static {v3, v2}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    iget-object v2, v1, Lebl;->c:Lcom/opera/android/custom_views/StylingImageButton;

    invoke-virtual {v0}, Lr9l;->h()Lb3c;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    if-eqz v0, :cond_7f

    const/4 v4, 0x1

    if-eq v0, v4, :cond_76

    const/4 v4, 0x2

    if-eq v0, v4, :cond_6d

    const/4 v1, 0x3

    if-eq v0, v1, :cond_67

    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_67
    const-string v0, "not for display"

    invoke-static {v0}, Lqp2;->n(Ljava/lang/String;)V

    return-void

    :cond_6d
    new-instance v0, Llxh;

    const v4, 0x7f08057c

    invoke-direct {v0, v4}, Llxh;-><init>(I)V

    goto :goto_87

    :cond_76
    new-instance v0, Llxh;

    const v4, 0x7f080567

    invoke-direct {v0, v4}, Llxh;-><init>(I)V

    goto :goto_87

    :cond_7f
    new-instance v0, Llxh;

    const v4, 0x7f080611

    invoke-direct {v0, v4}, Llxh;-><init>(I)V

    :goto_87
    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v0, v4}, Lb8h;->f(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {v2, v0}, Lcom/opera/android/custom_views/StylingImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v3}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Leyj;

    iget-object v0, v0, Leyj;->l:Ltxj;

    if-eqz v0, :cond_d0

    iget v2, v0, Ltxj;->d:I

    iget v3, v0, Ltxj;->c:I

    iget v4, v0, Ltxj;->b:I

    iget-object v5, v1, Lebl;->i:Landroidx/recyclerview/widget/RecyclerView;

    const/4 v11, -0x1

    invoke-static {v5, v11, v4}, Lp37;->s0(Landroid/view/View;II)V

    iget v7, v0, Ltxj;->a:I

    const/4 v9, 0x0

    const/16 v10, 0xd

    const/4 v6, 0x0

    const/4 v8, 0x0

    invoke-static/range {v5 .. v10}, Lp37;->o0(Landroid/view/View;IIIII)V

    invoke-virtual {v5}, Landroid/view/View;->getPaddingBottom()I

    move-result v6

    invoke-virtual {v5, v3, v2, v3, v6}, Landroid/view/View;->setPadding(IIII)V

    iget-object v12, v1, Lebl;->h:Landroidx/recyclerview/widget/RecyclerView;

    invoke-static {v12, v11, v4}, Lp37;->s0(Landroid/view/View;II)V

    iget v14, v0, Ltxj;->a:I

    const/16 v16, 0x0

    const/16 v17, 0xd

    const/4 v13, 0x0

    const/4 v15, 0x0

    invoke-static/range {v12 .. v17}, Lp37;->o0(Landroid/view/View;IIIII)V

    invoke-virtual {v12}, Landroid/view/View;->getPaddingBottom()I

    move-result v0

    invoke-virtual {v12, v3, v2, v3, v0}, Landroid/view/View;->setPadding(IIII)V

    :cond_d0
    return-void
.end method

.method public final d()V
    .registers 12

    iget-object v0, p0, Lr9l;->q:Lebl;

    iget-object v1, v0, Lebl;->q:Landroid/widget/RelativeLayout;

    iget-object v2, v0, Lebl;->b:Lcom/opera/android/custom_views/EqualWidthLinearLayout;

    iget-object v3, v0, Lebl;->o:Lcom/opera/android/custom_views/ObservableEditText;

    iget-object v4, v0, Lebl;->A:Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    iget-object v5, v0, Lebl;->r:Landroid/widget/RelativeLayout;

    iget-object v6, v0, Lebl;->C:Landroid/widget/RelativeLayout;

    iget-object v7, v0, Lebl;->q:Landroid/widget/RelativeLayout;

    invoke-virtual {v1}, Landroid/view/View;->getVisibility()I

    move-result v1

    const/4 v8, 0x0

    if-nez v1, :cond_19

    const/4 v1, 0x1

    goto :goto_1a

    :cond_19
    move v1, v8

    :goto_1a
    iget-object v9, p0, Lr9l;->w:Ls9i;

    invoke-virtual {v9}, Ls9i;->Y()Z

    move-result v9

    const/16 v10, 0x8

    if-eqz v9, :cond_34

    invoke-virtual {v2, v10}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v4, v10}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->setVisibility(I)V

    invoke-virtual {v6, v10}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v7, v10}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v5, v8}, Landroid/view/View;->setVisibility(I)V

    goto :goto_57

    :cond_34
    iget-boolean v9, p0, Lr9l;->u:Z

    if-eqz v9, :cond_48

    invoke-virtual {v2, v10}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v4, v10}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->setVisibility(I)V

    invoke-virtual {v6, v10}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v7, v8}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v5, v10}, Landroid/view/View;->setVisibility(I)V

    goto :goto_57

    :cond_48
    invoke-virtual {v2, v8}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v4, v8}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->setVisibility(I)V

    invoke-virtual {v6, v8}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v7, v10}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v5, v10}, Landroid/view/View;->setVisibility(I)V

    :goto_57
    iget-object v0, v0, Lebl;->f:Lcom/opera/android/tabui2/ConfigurationProvidingFrameLayout;

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup$MarginLayoutParams;

    iget v4, v2, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    invoke-virtual {v6}, Landroid/view/View;->getVisibility()I

    move-result v9

    if-eqz v9, :cond_73

    invoke-virtual {v7}, Landroid/view/View;->getVisibility()I

    move-result v9

    if-eqz v9, :cond_73

    invoke-virtual {v5}, Landroid/view/View;->getVisibility()I

    move-result v5

    if-nez v5, :cond_7a

    :cond_73
    invoke-virtual {v6}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    iget v5, v5, Landroid/view/ViewGroup$LayoutParams;->height:I

    goto :goto_7b

    :cond_7a
    move v5, v8

    :goto_7b
    iget v2, v2, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    invoke-static {v0, v4, v5, v2, v8}, Lp37;->n0(Landroid/view/View;IIII)V

    if-nez v1, :cond_a3

    invoke-virtual {v7}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-nez v0, :cond_a3

    invoke-virtual {p0}, Lr9l;->f()Lz5l;

    move-result-object p0

    iget-object p0, p0, Lz5l;->q:Lilb;

    iget-object p0, p0, Lilb;->l:Lpde;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    if-nez p0, :cond_a3

    invoke-virtual {v3}, Landroid/view/View;->requestFocus()Z

    sget-object p0, Lq9n;->c:Ll5b;

    invoke-virtual {v3}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0, v3}, Lq9n;->G(Landroid/content/Context;Landroid/view/View;)Z

    return-void

    :cond_a3
    if-eqz v1, :cond_ae

    invoke-virtual {v7}, Landroid/view/View;->getVisibility()I

    move-result p0

    if-eqz p0, :cond_ae

    invoke-static {v3}, Lq9n;->u(Landroid/view/View;)Z

    :cond_ae
    return-void
.end method

.method public final e(Luz3;)Landroid/view/View;
    .registers 12

    iget-object v0, p0, Lr9l;->p:Li03;

    invoke-virtual {v0}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_a

    return-object v1

    :cond_a
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    iget-object v0, p0, Lr9l;->q:Lebl;

    if-eqz p1, :cond_104

    const/4 v2, 0x1

    const/4 v3, 0x2

    if-eq p1, v2, :cond_34

    if-eq p1, v3, :cond_31

    const/4 p0, 0x3

    if-eq p1, p0, :cond_25

    const/4 p0, 0x4

    if-ne p1, p0, :cond_21

    iget-object p0, v0, Lebl;->B:Lcom/opera/android/custom_views/TabCountButton;

    return-object p0

    :cond_21
    invoke-static {}, Lh9o;->p()V

    return-object v1

    :cond_25
    iget-object p0, v0, Lebl;->e:Lcom/opera/android/custom_views/StylingImageButton;

    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    move-result p1

    if-nez p1, :cond_2e

    return-object p0

    :cond_2e
    iget-object p0, v0, Lebl;->d:Lcom/opera/android/custom_views/StylingImageButton;

    return-object p0

    :cond_31
    iget-object p0, v0, Lebl;->m:Lcom/opera/android/custom_views/StylingImageButton;

    return-object p0

    :cond_34
    iget-object p0, p0, Lr9l;->B:Lz5l;

    iget-object p1, p0, Lz5l;->v:Lx2l;

    iget-object p0, p0, Lz5l;->f:Landroidx/recyclerview/widget/RecyclerView;

    iget-object p1, p1, Lx2l;->i:Lpde;

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v0

    div-int/2addr v0, v3

    new-instance v2, Lg6n;

    invoke-direct {v2, p0}, Lg6n;-><init>(Landroid/view/ViewGroup;)V

    invoke-virtual {v2}, Lg6n;->iterator()Ljava/util/Iterator;

    move-result-object v2

    const v4, 0x7f7fffff    # Float.MAX_VALUE

    :cond_4d
    :goto_4d
    move-object v5, v2

    check-cast v5, Lh6n;

    invoke-virtual {v5}, Lh6n;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_103

    invoke-virtual {v5}, Lh6n;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/view/View;

    invoke-virtual {p0, v5}, Landroidx/recyclerview/widget/RecyclerView;->T(Landroid/view/View;)Landroidx/recyclerview/widget/i;

    move-result-object v5

    instance-of v6, v5, Ljal;

    if-eqz v6, :cond_4d

    instance-of v6, v5, Lhlb;

    if-eqz v6, :cond_4d

    move-object v6, v5

    check-cast v6, Lhlb;

    invoke-interface {v6}, Lhlb;->o()Z

    move-result v6

    if-eqz v6, :cond_4d

    move-object v6, v5

    check-cast v6, Ljal;

    invoke-virtual {v6}, Ljal;->U()Landroid/view/View;

    move-result-object v7

    new-instance v8, Landroid/graphics/Rect;

    invoke-direct {v8}, Landroid/graphics/Rect;-><init>()V

    if-eqz v7, :cond_4d

    invoke-static {v7}, Lq9n;->x(Landroid/view/View;)Z

    move-result v9

    if-eqz v9, :cond_4d

    invoke-virtual {v7, v8}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    move-result v9

    if-eqz v9, :cond_4d

    invoke-virtual {v8}, Landroid/graphics/Rect;->height()I

    move-result v8

    invoke-virtual {v7}, Landroid/view/View;->getMeasuredHeight()I

    move-result v9

    if-ne v8, v9, :cond_4d

    instance-of v5, v5, Lh85;

    if-nez v5, :cond_bb

    invoke-virtual {v6}, Ljal;->getGroupId()I

    move-result v5

    if-eqz v5, :cond_bb

    invoke-virtual {p1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Leyj;

    iget-object v5, v5, Leyj;->i:Lj7h;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    instance-of v5, v5, Lyxj;

    if-eqz v5, :cond_bb

    invoke-virtual {p1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Leyj;

    iget-object v5, v5, Leyj;->h:Landroid/util/Size;

    invoke-virtual {v5}, Landroid/util/Size;->getHeight()I

    move-result v5

    goto :goto_bc

    :cond_bb
    const/4 v5, 0x0

    :goto_bc
    iget-object v8, v6, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v8}, Landroid/view/View;->getTop()I

    move-result v8

    if-lt v8, v5, :cond_4d

    iget-object v5, v6, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v5}, Landroid/view/View;->getLeft()I

    move-result v5

    iget-object v8, v6, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v8}, Landroid/view/View;->getWidth()I

    move-result v8

    div-int/2addr v8, v3

    add-int/2addr v8, v5

    int-to-float v5, v8

    iget-object v8, v6, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v8}, Landroid/view/View;->getTranslationX()F

    move-result v8

    add-float/2addr v8, v5

    int-to-float v5, v0

    sub-float/2addr v8, v5

    iget-object v5, v6, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v5}, Landroid/view/View;->getTop()I

    move-result v5

    iget-object v9, v6, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v9}, Landroid/view/View;->getHeight()I

    move-result v9

    div-int/2addr v9, v3

    add-int/2addr v9, v5

    int-to-float v5, v9

    iget-object v6, v6, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v6}, Landroid/view/View;->getTranslationY()F

    move-result v6

    add-float/2addr v6, v5

    mul-float/2addr v8, v8

    mul-float/2addr v6, v6

    add-float/2addr v6, v8

    float-to-double v5, v6

    invoke-static {v5, v6}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v5

    double-to-float v5, v5

    cmpg-float v6, v5, v4

    if-gez v6, :cond_4d

    move v4, v5

    move-object v1, v7

    goto/16 :goto_4d

    :cond_103
    return-object v1

    :cond_104
    iget-object p0, v0, Lebl;->c:Lcom/opera/android/custom_views/StylingImageButton;

    return-object p0
.end method

.method public final f()Lz5l;
    .registers 2

    invoke-virtual {p0}, Lr9l;->k()Z

    move-result v0

    if-eqz v0, :cond_9

    iget-object p0, p0, Lr9l;->C:Lz5l;

    return-object p0

    :cond_9
    iget-object p0, p0, Lr9l;->B:Lz5l;

    return-object p0
.end method

.method public final g(Lp6l;)Lb2l;
    .registers 3

    sget-object v0, Lu3l;->a:Ls3l;

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    if-eqz p1, :cond_13

    const/4 v0, 0x1

    if-ne p1, v0, :cond_e

    sget-object p1, Lu3l;->b:Ls3l;

    goto :goto_15

    :cond_e
    invoke-static {}, Lh9o;->p()V

    const/4 p0, 0x0

    return-object p0

    :cond_13
    sget-object p1, Lu3l;->a:Ls3l;

    :goto_15
    iget-object p0, p0, Lr9l;->c:Lk6l;

    iget-object v0, p0, Lk6l;->m:Lz6l;

    invoke-static {p0, p1, v0}, Lexg;->p(Lk6l;Lu3l;Lnxg;)Ljava/util/ArrayList;

    move-result-object p0

    invoke-static {p0}, Lkotlin/collections/CollectionsKt;->firstOrNull(Ljava/util/List;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lb2l;

    return-object p0
.end method

.method public final h()Lb3c;
    .registers 2

    iget-object p0, p0, Lr9l;->y:Lz9j;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lb3c;

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    if-eqz p0, :cond_25

    const/4 v0, 0x1

    if-eq p0, v0, :cond_22

    const/4 v0, 0x2

    if-eq p0, v0, :cond_1f

    const/4 v0, 0x3

    if-ne p0, v0, :cond_1a

    sget-object p0, Lb3c;->f:Lb3c;

    return-object p0

    :cond_1a
    invoke-static {}, Lh9o;->p()V

    const/4 p0, 0x0

    return-object p0

    :cond_1f
    sget-object p0, Lb3c;->e:Lb3c;

    return-object p0

    :cond_22
    sget-object p0, Lb3c;->d:Lb3c;

    return-object p0

    :cond_25
    sget-object p0, Lb3c;->f:Lb3c;

    return-object p0
.end method

.method public final i(Z)Z
    .registers 23

    move-object/from16 v2, p0

    iget-object v0, v2, Lr9l;->g:Ljo3;

    iget-object v0, v0, Ljo3;->a:Lcom/opera/android/bar/BottomBar;

    iget-object v1, v2, Lr9l;->o:Lj9l;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    const/4 v3, 0x0

    const/4 v4, 0x3

    const/4 v8, 0x1

    if-eqz v1, :cond_1c

    if-eq v1, v8, :cond_1c

    const/4 v0, 0x2

    if-eq v1, v0, :cond_1b

    if-eq v1, v4, :cond_1b

    invoke-static {}, Lh9o;->p()V

    :cond_1b
    return v3

    :cond_1c
    sget-object v1, Lj9l;->c:Lj9l;

    iput-object v1, v2, Lr9l;->o:Lj9l;

    iget-object v1, v2, Lr9l;->q:Lebl;

    iget-object v5, v1, Lebl;->a:Lcom/opera/android/tabui2/TabUiRootFrameLayout;

    iput-boolean v8, v5, Lcom/opera/android/tabui2/ConfigurationProvidingFrameLayout;->a:Z

    iget-object v5, v1, Lebl;->o:Lcom/opera/android/custom_views/ObservableEditText;

    invoke-static {v5}, Lq9n;->u(Landroid/view/View;)Z

    iget-object v5, v2, Lr9l;->j:Lj1k;

    invoke-virtual {v5}, Lj1k;->invoke()Ljava/lang/Object;

    iget-object v5, v2, Lr9l;->D:Lg4l;

    const/4 v6, 0x0

    invoke-static {v5, v6, v4}, Lg4l;->a(Lg4l;Luz3;I)V

    iget-object v4, v2, Lr9l;->l:Lzyk;

    invoke-virtual {v4}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lm24;

    iget-object v5, v2, Lr9l;->n:Ll9l;

    invoke-interface {v4, v5}, Lm24;->c(Ll24;)V

    if-eqz p1, :cond_b4

    new-instance v9, Lrh8;

    iget-object v0, v2, Lr9l;->c:Lk6l;

    invoke-virtual {v0}, Lk6l;->A()Lb2l;

    move-result-object v11

    iget-object v14, v1, Lebl;->A:Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    iget-object v0, v2, Lr9l;->t:Lgal;

    iget-object v4, v0, Lgal;->e:Lp6l;

    invoke-virtual {v4}, Ljava/lang/Enum;->ordinal()I

    move-result v4

    if-eqz v4, :cond_63

    if-ne v4, v8, :cond_5f

    iget-object v4, v1, Lebl;->g:Lcom/opera/android/tabui2/FadeoutRecyclerView;

    :goto_5d
    move-object v15, v4

    goto :goto_66

    :cond_5f
    invoke-static {}, Lh9o;->p()V

    return v3

    :cond_63
    iget-object v4, v1, Lebl;->j:Lcom/opera/android/tabui2/FadeoutRecyclerView;

    goto :goto_5d

    :goto_66
    iget-object v0, v0, Lgal;->e:Lp6l;

    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    if-eqz v0, :cond_79

    if-ne v0, v8, :cond_75

    iget-object v0, v1, Lebl;->h:Landroidx/recyclerview/widget/RecyclerView;

    :goto_72
    move-object/from16 v16, v0

    goto :goto_7c

    :cond_75
    invoke-static {}, Lh9o;->p()V

    return v3

    :cond_79
    iget-object v0, v1, Lebl;->i:Landroidx/recyclerview/widget/RecyclerView;

    goto :goto_72

    :goto_7c
    invoke-virtual {v2}, Lr9l;->f()Lz5l;

    move-result-object v17

    iget-object v0, v2, Lr9l;->h:Lyqa;

    iget-object v0, v0, Lyqa;->c:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/BrowserActivity;

    iget-object v0, v0, Lcom/opera/android/BrowserActivity;->y0:Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    move-object/from16 v18, v0

    check-cast v18, Lwv3;

    new-instance v10, Lnqi;

    const/16 v0, 0xc

    invoke-direct {v10, v2, v0}, Lnqi;-><init>(Ljava/lang/Object;B)V

    new-instance v0, Lj1k;

    const/4 v6, 0x0

    const/16 v7, 0x15

    const/4 v1, 0x0

    const-class v3, Lr9l;

    const-string v4, "onHidden"

    const-string v5, "onHidden()V"

    invoke-direct/range {v0 .. v7}, Lj1k;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    move-object/from16 v19, v10

    iget-object v10, v2, Lr9l;->x:Lpde;

    iget-object v12, v2, Lr9l;->e:Landroid/view/ViewGroup;

    iget-object v13, v2, Lr9l;->p:Li03;

    move-object/from16 v20, v0

    invoke-direct/range {v9 .. v20}, Lrh8;-><init>(Lpde;Lb2l;Landroid/view/ViewGroup;Landroid/view/ViewGroup;Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView;Lz5l;Lwv3;Lnqi;Lj1k;)V

    return v8

    :cond_b4
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/ViewPropertyAnimator;->cancel()V

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    iget-boolean v1, v0, Lcom/opera/android/bar/BottomBar;->f:Z

    if-eqz v1, :cond_cb

    iput-boolean v3, v0, Lcom/opera/android/bar/BottomBar;->f:Z

    const/high16 v1, 0x20000

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setDescendantFocusability(I)V

    :cond_cb
    sget-object v0, Lj9l;->d:Lj9l;

    iput-object v0, v2, Lr9l;->o:Lj9l;

    iget-object v0, v2, Lr9l;->e:Landroid/view/ViewGroup;

    iget-object v1, v2, Lr9l;->p:Li03;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    return v8
.end method

.method public final j()Z
    .registers 4

    iget-object v0, p0, Lr9l;->o:Lj9l;

    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_16

    const/4 p0, 0x0

    if-eq v0, v1, :cond_15

    const/4 v1, 0x2

    if-eq v0, v1, :cond_15

    const/4 v1, 0x3

    if-eq v0, v1, :cond_15

    invoke-static {}, Lh9o;->p()V

    :cond_15
    return p0

    :cond_16
    sget-object v0, Lj9l;->b:Lj9l;

    iput-object v0, p0, Lr9l;->o:Lj9l;

    iget-object v0, p0, Lr9l;->q:Lebl;

    iget-object v2, v0, Lebl;->a:Lcom/opera/android/tabui2/TabUiRootFrameLayout;

    iput-boolean v1, v2, Lcom/opera/android/tabui2/ConfigurationProvidingFrameLayout;->a:Z

    iget-object v0, v0, Lebl;->o:Lcom/opera/android/custom_views/ObservableEditText;

    invoke-static {v0}, Lq9n;->u(Landroid/view/View;)Z

    new-instance v0, Lc9l;

    const/4 v2, 0x4

    invoke-direct {v0, p0, v2}, Lc9l;-><init>(Lr9l;B)V

    invoke-virtual {p0, v0}, Lr9l;->q(Lkotlin/jvm/functions/Function0;)V

    return v1
.end method

.method public final k()Z
    .registers 2

    iget-object p0, p0, Lr9l;->t:Lgal;

    iget-object p0, p0, Lgal;->e:Lp6l;

    sget-object v0, Lp6l;->b:Lp6l;

    if-ne p0, v0, :cond_a

    const/4 p0, 0x1

    return p0

    :cond_a
    const/4 p0, 0x0

    return p0
.end method

.method public final l()V
    .registers 12

    iget-object v0, p0, Lr9l;->y:Lz9j;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb3c;

    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    const/4 v1, 0x3

    iget-object v2, p0, Lr9l;->t:Lgal;

    iget-object v3, p0, Lr9l;->A:Lp9l;

    if-eqz v0, :cond_174

    const/4 v4, 0x1

    if-eq v0, v4, :cond_20

    const/4 v5, 0x2

    if-eq v0, v5, :cond_20

    if-ne v0, v1, :cond_1c

    return-void

    :cond_1c
    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_20
    iget-object v0, v2, Lgal;->e:Lp6l;

    invoke-virtual {p0, v0}, Lr9l;->g(Lp6l;)Lb2l;

    move-result-object v0

    if-eqz v0, :cond_9c

    invoke-virtual {p0}, Lr9l;->f()Lz5l;

    move-result-object v5

    iget-object v6, v5, Lz5l;->v:Lx2l;

    iget-object v5, v5, Lz5l;->f:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v6, Lg6n;

    invoke-direct {v6, v5}, Lg6n;-><init>(Landroid/view/ViewGroup;)V

    invoke-virtual {v6}, Lg6n;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_3c
    move-object v7, v6

    check-cast v7, Lh6n;

    invoke-virtual {v7}, Lh6n;->hasNext()Z

    move-result v8

    const/4 v9, 0x0

    if-eqz v8, :cond_92

    invoke-virtual {v7}, Lh6n;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/view/View;

    invoke-virtual {v5, v7}, Landroidx/recyclerview/widget/RecyclerView;->T(Landroid/view/View;)Landroidx/recyclerview/widget/i;

    move-result-object v8

    instance-of v10, v8, Lh5l;

    if-eqz v10, :cond_3c

    check-cast v8, Lh5l;

    invoke-virtual {v8}, Lh5l;->X()Ljava/util/List;

    move-result-object v8

    invoke-static {v8}, Lkotlin/collections/CollectionsKt;->firstOrNull(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v8

    invoke-static {v8, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_3c

    invoke-virtual {v7}, Landroid/view/View;->getWidth()I

    move-result v5

    invoke-virtual {v7}, Landroid/view/View;->getHeight()I

    move-result v6

    mul-int/2addr v6, v5

    if-lez v6, :cond_92

    invoke-static {v7}, Lq9n;->x(Landroid/view/View;)Z

    move-result v5

    if-eqz v5, :cond_92

    new-instance v5, Landroid/graphics/Rect;

    invoke-direct {v5}, Landroid/graphics/Rect;-><init>()V

    invoke-virtual {v7, v5}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    move-result v7

    if-eqz v7, :cond_92

    invoke-virtual {v5}, Landroid/graphics/Rect;->width()I

    move-result v7

    invoke-virtual {v5}, Landroid/graphics/Rect;->height()I

    move-result v5

    mul-int/2addr v5, v7

    int-to-float v5, v5

    int-to-float v6, v6

    div-float/2addr v5, v6

    const/high16 v6, 0x3f800000    # 1.0f

    invoke-static {v5, v9, v6}, Ldjh;->b(FFF)F

    move-result v9

    :cond_92
    const/high16 v5, 0x3f000000    # 0.5f

    cmpl-float v5, v9, v5

    if-lez v5, :cond_9c

    invoke-virtual {p0, v0}, Lr9l;->m(Lb2l;)V

    return-void

    :cond_9c
    invoke-virtual {p0}, Lr9l;->k()Z

    move-result v0

    iget-object v5, p0, Lr9l;->q:Lebl;

    if-eqz v0, :cond_a7

    iget-object v0, v5, Lebl;->g:Lcom/opera/android/tabui2/FadeoutRecyclerView;

    goto :goto_a9

    :cond_a7
    iget-object v0, v5, Lebl;->j:Lcom/opera/android/tabui2/FadeoutRecyclerView;

    :goto_a9
    invoke-virtual {v0, v4}, Landroid/view/View;->canScrollVertically(I)Z

    move-result v5

    if-nez v5, :cond_c4

    invoke-virtual {v0}, Landroid/view/View;->getLayoutDirection()I

    move-result v5

    if-nez v5, :cond_b7

    move v5, v4

    goto :goto_b8

    :cond_b7
    const/4 v5, -0x1

    :goto_b8
    invoke-virtual {v0, v5}, Landroid/view/View;->canScrollHorizontally(I)Z

    move-result v0

    if-nez v0, :cond_c4

    iget-object p0, v2, Lgal;->e:Lp6l;

    invoke-virtual {v3, p0}, La21;->k(Lp6l;)Lb2l;

    return-void

    :cond_c4
    invoke-virtual {p0}, Lr9l;->f()Lz5l;

    move-result-object v0

    iget-object v5, v0, Lz5l;->v:Lx2l;

    iget-object v0, v0, Lz5l;->f:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v6, Lbvk;

    invoke-direct {v6, v1}, Lbvk;-><init>(B)V

    invoke-static {v0, v6}, Lnxg;->n(Landroidx/recyclerview/widget/RecyclerView;Lkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb2l;

    if-nez v0, :cond_e6

    iget-object v0, v5, Lx2l;->o:Lo2l;

    iget-object v0, v0, Lo2l;->e:Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb2l;

    :cond_e6
    if-eqz v0, :cond_fe

    iget-object v6, v5, Lx2l;->o:Lo2l;

    iget-object v6, v6, Lo2l;->b:Ljava/util/List;

    invoke-interface {v6, v0}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v0

    if-lez v0, :cond_fe

    iget-object v5, v5, Lx2l;->o:Lo2l;

    iget-object v5, v5, Lo2l;->b:Ljava/util/List;

    sub-int/2addr v0, v4

    invoke-interface {v5, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb2l;

    goto :goto_ff

    :cond_fe
    const/4 v0, 0x0

    :goto_ff
    if-eqz v0, :cond_146

    invoke-virtual {p0}, Lr9l;->f()Lz5l;

    move-result-object v1

    move-object v2, v0

    check-cast v2, Ld7l;

    iget-object v4, v2, Ld7l;->j:Le7l;

    invoke-interface {v4}, Lb9l;->a()Lcom/opera/android/browser/TabInfo;

    move-result-object v4

    iget v4, v4, Lcom/opera/android/browser/TabInfo;->d:I

    iget-object v1, v1, Lz5l;->u:Lypd;

    iget-object v1, v1, Lypd;->a:Ljava/lang/Object;

    check-cast v1, La21;

    iget-object v1, v1, La21;->m:Ljava/lang/Object;

    check-cast v1, Lpde;

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Set;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v1, v4}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_142

    iget-object p0, v2, Ld7l;->j:Le7l;

    invoke-interface {p0}, Lb9l;->a()Lcom/opera/android/browser/TabInfo;

    move-result-object p0

    iget v6, p0, Lcom/opera/android/browser/TabInfo;->d:I

    new-instance v4, Lcom/opera/android/browser/TabInfo;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    const-wide/16 v9, 0x0

    const/4 v5, 0x0

    invoke-direct/range {v4 .. v10}, Lcom/opera/android/browser/TabInfo;-><init>(IIJJ)V

    invoke-virtual {v3, v0, v4}, La21;->h0(Lb2l;Lcom/opera/android/browser/TabInfo;)Lb2l;

    return-void

    :cond_142
    invoke-virtual {p0, v0}, Lr9l;->m(Lb2l;)V

    return-void

    :cond_146
    invoke-virtual {p0}, Lr9l;->f()Lz5l;

    move-result-object v0

    iget-object v4, v0, Lz5l;->v:Lx2l;

    iget-object v0, v0, Lz5l;->f:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v5, Lbvk;

    invoke-direct {v5, v1}, Lbvk;-><init>(B)V

    invoke-static {v0, v5}, Lnxg;->n(Landroidx/recyclerview/widget/RecyclerView;Lkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb2l;

    if-nez v0, :cond_168

    iget-object v0, v4, Lx2l;->o:Lo2l;

    iget-object v0, v0, Lo2l;->e:Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb2l;

    :cond_168
    if-eqz v0, :cond_16e

    invoke-virtual {p0, v0}, Lr9l;->m(Lb2l;)V

    return-void

    :cond_16e
    iget-object p0, v2, Lgal;->e:Lp6l;

    invoke-virtual {v3, p0}, La21;->k(Lp6l;)Lb2l;

    return-void

    :cond_174
    invoke-virtual {p0}, Lr9l;->f()Lz5l;

    move-result-object v0

    iget-object v4, v0, Lz5l;->v:Lx2l;

    iget-object v0, v0, Lz5l;->f:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v5, Lbvk;

    invoke-direct {v5, v1}, Lbvk;-><init>(B)V

    invoke-static {v0, v5}, Lnxg;->n(Landroidx/recyclerview/widget/RecyclerView;Lkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb2l;

    if-nez v0, :cond_196

    iget-object v0, v4, Lx2l;->o:Lo2l;

    iget-object v0, v0, Lo2l;->e:Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb2l;

    :cond_196
    if-eqz v0, :cond_19c

    invoke-virtual {p0, v0}, Lr9l;->m(Lb2l;)V

    return-void

    :cond_19c
    iget-object p0, v2, Lgal;->e:Lp6l;

    invoke-virtual {v3, p0}, La21;->k(Lp6l;)Lb2l;

    return-void
.end method

.method public final m(Lb2l;)V
    .registers 12

    move-object v0, p1

    check-cast v0, Ld7l;

    iget-object v1, v0, Ld7l;->j:Le7l;

    invoke-interface {v1}, Lb9l;->a()Lcom/opera/android/browser/TabInfo;

    move-result-object v1

    iget v1, v1, Lcom/opera/android/browser/TabInfo;->d:I

    iget-object v2, p0, Lr9l;->A:Lp9l;

    if-eqz v1, :cond_5b

    sget-object v0, Lu3l;->a:Ls3l;

    invoke-interface {p1}, Lb9l;->T()Lp6l;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    if-eqz p1, :cond_25

    const/4 v0, 0x1

    if-ne p1, v0, :cond_21

    sget-object p1, Lu3l;->b:Ls3l;

    goto :goto_27

    :cond_21
    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_25
    sget-object p1, Lu3l;->a:Ls3l;

    :goto_27
    new-instance v0, Lr3l;

    invoke-direct {v0, v1}, Lr3l;-><init>(I)V

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Lp3l;

    invoke-direct {v1, p1, v0}, Lp3l;-><init>(Lu3l;Lu3l;)V

    sget-object p1, Ly6l;->a:Ly6l;

    iget-object p0, p0, Lr9l;->c:Lk6l;

    invoke-static {p0, v1, p1}, Lexg;->p(Lk6l;Lu3l;Lnxg;)Ljava/util/ArrayList;

    move-result-object p0

    invoke-static {p0}, Lkotlin/collections/CollectionsKt;->Q(Ljava/util/List;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lb2l;

    move-object p1, p0

    check-cast p1, Ld7l;

    iget-object p1, p1, Ld7l;->j:Le7l;

    invoke-interface {p1}, Lb9l;->a()Lcom/opera/android/browser/TabInfo;

    new-instance v3, Lcom/opera/android/browser/TabInfo;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    const-wide/16 v8, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-direct/range {v3 .. v9}, Lcom/opera/android/browser/TabInfo;-><init>(IIJJ)V

    invoke-virtual {v2, p0, v3}, La21;->h0(Lb2l;Lcom/opera/android/browser/TabInfo;)Lb2l;

    return-void

    :cond_5b
    iget-object p0, v0, Ld7l;->j:Le7l;

    invoke-interface {p0}, Lb9l;->a()Lcom/opera/android/browser/TabInfo;

    new-instance v3, Lcom/opera/android/browser/TabInfo;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    const-wide/16 v8, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-direct/range {v3 .. v9}, Lcom/opera/android/browser/TabInfo;-><init>(IIJJ)V

    invoke-virtual {v2, p1, v3}, La21;->h0(Lb2l;Lcom/opera/android/browser/TabInfo;)Lb2l;

    return-void
.end method

.method public final n()V
    .registers 5

    iget-object v0, p0, Lr9l;->z:Lzkk;

    sget-object v1, Lvr0;->d:Lvr0;

    invoke-virtual {v0, v1}, Lzkk;->b(Lvr0;)V

    sget-object v0, Luz3;->g:Luz3;

    iget-object v1, p0, Lr9l;->D:Lg4l;

    const/4 v2, 0x1

    invoke-static {v1, v0, v2}, Lg4l;->a(Lg4l;Luz3;I)V

    new-instance v0, Ljnh;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    new-instance v1, Lf9l;

    invoke-direct {v1, p0, v2}, Lf9l;-><init>(Lr9l;B)V

    new-instance v2, Lw4i;

    const/16 v3, 0x18

    invoke-direct {v2, v1, v3}, Lw4i;-><init>(Ljava/lang/Object;B)V

    iget-object v1, p0, Lr9l;->a:Lgjm;

    iget-object p0, p0, Lr9l;->s:Lfe5;

    invoke-virtual {v1, v0, p0, v2}, Lgjm;->c(Lr37;Lndc;Lf7f;)V

    return-void
.end method

.method public final o()V
    .registers 11

    iget-object v0, p0, Lr9l;->z:Lzkk;

    sget-object v1, Lvr0;->e:Lvr0;

    invoke-virtual {v0, v1}, Lzkk;->b(Lvr0;)V

    iget-object p0, p0, Lr9l;->e:Landroid/view/ViewGroup;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    new-instance v0, Lvyk;

    invoke-direct {v0}, Lvyk;-><init>()V

    const/4 v1, 0x0

    new-array v1, v1, [Ln6h;

    new-instance v3, Lwzg;

    const-class v2, Lvyk;

    const/4 v4, 0x4

    invoke-direct {v3, v0, v2, v4}, Lwzg;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v2, Lzhj;

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v9

    const/4 v4, 0x0

    const/4 v5, 0x1

    const/4 v6, -0x1

    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-direct/range {v2 .. v9}, Lzhj;-><init>(Lwzg;Landroid/os/Bundle;IILjava/lang/String;ZLjava/util/List;)V

    invoke-virtual {v2, p0}, Lzhj;->c(Landroid/content/Context;)V

    return-void
.end method

.method public final p(Lb2l;)V
    .registers 4

    iget-object v0, p0, Lr9l;->t:Lgal;

    invoke-interface {p1}, Lb9l;->T()Lp6l;

    move-result-object v1

    invoke-virtual {v0, v1}, Lgal;->g(Lp6l;)V

    invoke-virtual {p0}, Lr9l;->f()Lz5l;

    move-result-object p0

    iget-object v0, p0, Lz5l;->u:Lypd;

    move-object v1, p1

    check-cast v1, Ld7l;

    iget-object v1, v1, Ld7l;->j:Le7l;

    invoke-interface {v1}, Lb9l;->a()Lcom/opera/android/browser/TabInfo;

    move-result-object v1

    iget v1, v1, Lcom/opera/android/browser/TabInfo;->d:I

    invoke-virtual {v0, v1}, Lypd;->r(I)V

    new-instance v0, Lv5l;

    const/4 v1, 0x1

    invoke-direct {v0, p0, p1, v1}, Lv5l;-><init>(Lz5l;Lb2l;B)V

    new-instance p1, Lt5l;

    const/4 v1, 0x2

    invoke-direct {p1, p0, v1}, Lt5l;-><init>(Lz5l;B)V

    invoke-virtual {p0, v0, p1}, Lz5l;->e(Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function1;)V

    return-void
.end method

.method public final q(Lkotlin/jvm/functions/Function0;)V
    .registers 4

    invoke-virtual {p0}, Lr9l;->f()Lz5l;

    move-result-object p0

    iget-object p0, p0, Lz5l;->p:Lzg;

    iget-object v0, p0, Lzg;->d:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result p1

    const/4 v0, 0x1

    if-ne p1, v0, :cond_29

    iget-object p1, p0, Lzg;->b:Ljava/lang/Object;

    check-cast p1, Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p1}, Landroid/view/View;->getRootView()Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/View;->requestLayout()V

    new-instance v0, Lbi;

    const/16 v1, 0x10

    invoke-direct {v0, p0, v1}, Lbi;-><init>(Ljava/lang/Object;B)V

    invoke-static {v0, p1}, Lq9n;->d(Lm9n;Landroid/view/View;)V

    :cond_29
    return-void
.end method

.method public final r(Z)Z
    .registers 11

    iget-boolean v0, p0, Lr9l;->u:Z

    const/4 v1, 0x0

    if-ne p1, v0, :cond_6

    return v1

    :cond_6
    iput-boolean p1, p0, Lr9l;->u:Z

    sget-object v0, Lr9l;->F:Ljava/util/LinkedHashMap;

    iget-object v2, p0, Lr9l;->c:Lk6l;

    iget-object v3, p0, Lr9l;->t:Lgal;

    iget-object v4, p0, Lr9l;->D:Lg4l;

    const/4 v5, 0x1

    iget-object v6, p0, Lr9l;->q:Lebl;

    const/4 v7, 0x0

    if-eqz p1, :cond_49

    iget-object p1, p0, Lr9l;->z:Lzkk;

    sget-object v8, Lvr0;->w:Lvr0;

    invoke-virtual {p1, v8}, Lzkk;->b(Lvr0;)V

    sget-object p1, Luz3;->f:Luz3;

    invoke-static {v4, p1, v5}, Lg4l;->a(Lg4l;Luz3;I)V

    iget-object p1, v3, Lgal;->e:Lp6l;

    invoke-virtual {v0, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lk9l;

    if-eqz v0, :cond_38

    sget-object v3, Lp6l;->b:Lp6l;

    if-ne p1, v3, :cond_36

    iget p1, v0, Lk9l;->b:I

    iget v2, v2, Lk6l;->y:I

    if-ne p1, v2, :cond_38

    :cond_36
    iget-object v7, v0, Lk9l;->a:Ljava/lang/String;

    :cond_38
    iget-object p1, v6, Lebl;->o:Lcom/opera/android/custom_views/ObservableEditText;

    invoke-virtual {p1, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, v6, Lebl;->o:Lcom/opera/android/custom_views/ObservableEditText;

    if-eqz v7, :cond_45

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v1

    :cond_45
    invoke-virtual {p1, v1}, Landroid/widget/EditText;->setSelection(I)V

    goto :goto_6b

    :cond_49
    invoke-static {v4}, Lg4l;->e(Lg4l;)V

    iget-object p1, v3, Lgal;->e:Lp6l;

    iget-object v1, v6, Lebl;->o:Lcom/opera/android/custom_views/ObservableEditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    if-eqz v1, :cond_5b

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_5c

    :cond_5b
    move-object v1, v7

    :goto_5c
    new-instance v3, Lk9l;

    iget v2, v2, Lk6l;->y:I

    invoke-direct {v3, v1, v2}, Lk9l;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, p1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p1, v6, Lebl;->o:Lcom/opera/android/custom_views/ObservableEditText;

    invoke-virtual {p1, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :goto_6b
    invoke-virtual {p0}, Lr9l;->d()V

    return v5
.end method

.method public final s(ZZ)Z
    .registers 7

    iget-object v0, p0, Lr9l;->w:Ls9i;

    invoke-virtual {v0}, Ls9i;->Y()Z

    move-result v1

    if-ne p1, v1, :cond_a

    const/4 p0, 0x0

    return p0

    :cond_a
    if-eqz p1, :cond_4f

    invoke-virtual {p0}, Lr9l;->f()Lz5l;

    move-result-object p0

    iget-object p0, p0, Lz5l;->s:Lpde;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lu3l;

    invoke-virtual {v0}, Ls9i;->Y()Z

    move-result p1

    if-nez p1, :cond_52

    iput-object p0, v0, Ls9i;->e:Ljava/lang/Object;

    iget-object p0, v0, Ls9i;->c:Ljava/lang/Object;

    check-cast p0, Lpde;

    new-instance p1, Ljava/util/LinkedHashSet;

    invoke-direct {p1}, Ljava/util/LinkedHashSet;-><init>()V

    invoke-virtual {p0, p1}, Lekc;->r(Ljava/lang/Object;)V

    iget-object p0, v0, Ls9i;->d:Ljava/lang/Object;

    check-cast p0, Lpde;

    new-instance p1, Lpyi;

    iget-object v1, v0, Ls9i;->b:Ljava/lang/Object;

    check-cast v1, Lk6l;

    iget-object v2, v0, Ls9i;->e:Ljava/lang/Object;

    check-cast v2, Lu3l;

    sget-object v3, Ly6l;->a:Ly6l;

    invoke-static {v1, v2, v3}, Lexg;->p(Lk6l;Lu3l;Lnxg;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    iget-object v0, v0, Ls9i;->e:Ljava/lang/Object;

    check-cast v0, Lu3l;

    invoke-direct {p1, v1, v0, p2}, Lpyi;-><init>(ILu3l;Z)V

    invoke-virtual {p0, p1}, Lekc;->r(Ljava/lang/Object;)V

    goto :goto_52

    :cond_4f
    invoke-virtual {v0}, Ls9i;->h0()V

    :cond_52
    :goto_52
    const/4 p0, 0x1

    return p0
.end method

.method public final t()V
    .registers 10

    sget-object v0, Luz3;->g:Luz3;

    invoke-virtual {p0, v0}, Lr9l;->e(Luz3;)Landroid/view/View;

    move-result-object v1

    const/4 v2, 0x0

    iget-object v3, p0, Lr9l;->q:Lebl;

    if-eqz v1, :cond_12

    iget-object v4, v3, Lebl;->d:Lcom/opera/android/custom_views/StylingImageButton;

    invoke-virtual {v1, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    goto :goto_13

    :cond_12
    move v1, v2

    :goto_13
    iget-object v4, p0, Lr9l;->D:Lg4l;

    iget-object v5, v4, Lg4l;->g:Lbp3;

    iget-object v5, v5, Lbp3;->i:Ljava/lang/Object;

    check-cast v5, Lrz3;

    const/4 v6, 0x0

    if-eqz v5, :cond_25

    iget-object v5, v5, Lrz3;->j:Lqz3;

    if-eqz v5, :cond_25

    iget-object v5, v5, Lqz3;->p:Luz3;

    goto :goto_26

    :cond_25
    move-object v5, v6

    :goto_26
    const/4 v7, 0x1

    if-ne v5, v0, :cond_2a

    move v2, v7

    :cond_2a
    sget-object v5, Lf4l;->b:Lf4l;

    if-nez v1, :cond_2f

    move-object v0, v6

    :cond_2f
    iget-object v8, v4, Lg4l;->j:Ljava/util/ArrayList;

    invoke-virtual {v8, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v5, Leek;

    const/4 v8, 0x7

    invoke-direct {v5, v4, v0, v8}, Leek;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v4, v5}, Lg4l;->d(Lkotlin/jvm/functions/Function0;)V

    new-instance v0, Lh0h;

    new-instance v5, Ln9k;

    invoke-direct {v5, p0}, Ln9k;-><init>(Ljava/lang/Object;)V

    invoke-direct {v0, v5}, Lh0h;-><init>(Ln9k;)V

    if-eqz v2, :cond_53

    if-eqz v1, :cond_53

    const p0, 0x7f0a0b3e

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    goto :goto_70

    :cond_53
    iget-object p0, v4, Lg4l;->g:Lbp3;

    iget-boolean p0, p0, Lbp3;->b:Z

    if-eqz p0, :cond_70

    invoke-virtual {v4, v7}, Lg4l;->b(Z)Z

    move-result p0

    if-eqz p0, :cond_70

    iget-object p0, v4, Lg4l;->i:Lpde;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    sget-object v1, La4l;->c:La4l;

    if-ne p0, v1, :cond_70

    const p0, 0x7f0a0b5c

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    :cond_70
    :goto_70
    if-eqz v6, :cond_78

    invoke-virtual {v6}, Ljava/lang/Number;->intValue()I

    move-result p0

    iput p0, v0, Lo73;->i:I

    :cond_78
    iget-object p0, v3, Lebl;->d:Lcom/opera/android/custom_views/StylingImageButton;

    invoke-virtual {v0, p0}, Lo73;->o(Landroid/view/View;)V

    return-void
.end method

.method public final u()V
    .registers 2

    iget-object p0, p0, Lr9l;->q:Lebl;

    iget-object v0, p0, Lebl;->o:Lcom/opera/android/custom_views/ObservableEditText;

    invoke-virtual {v0}, Landroid/view/View;->isFocused()Z

    move-result v0

    if-eqz v0, :cond_14

    iget-object v0, p0, Lebl;->o:Lcom/opera/android/custom_views/ObservableEditText;

    invoke-static {v0}, Lq9n;->u(Landroid/view/View;)Z

    iget-object p0, p0, Lebl;->o:Lcom/opera/android/custom_views/ObservableEditText;

    invoke-virtual {p0}, Landroid/view/View;->clearFocus()V

    :cond_14
    return-void
.end method
