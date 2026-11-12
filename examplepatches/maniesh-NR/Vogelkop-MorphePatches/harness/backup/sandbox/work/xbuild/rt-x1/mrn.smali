.class public final Lmrn;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final A:J


# instance fields
.field public final a:Lcom/opera/android/Lazy;

.field public final b:Landroid/view/View;

.field public final c:Landroid/view/View;

.field public final d:Lcom/opera/android/widget/ThemeableLottieAnimationView;

.field public final e:Lcom/opera/android/custom_views/StylingImageButton;

.field public final f:Landroid/view/View;

.field public final g:Landroidx/constraintlayout/widget/Barrier;

.field public final h:Landroidx/constraintlayout/widget/Barrier;

.field public final i:Landroid/view/View;

.field public final j:Lcom/opera/android/custom_views/OperaEditText;

.field public final k:Landroid/view/View;

.field public final l:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public final m:Landroid/view/View;

.field public final n:Landroidx/recyclerview/widget/RecyclerView;

.field public final o:Lcrn;

.field public final p:Lkrn;

.field public final q:Landroid/view/View;

.field public final r:Lcom/opera/android/custom_views/StylingImageCheckableWithText;

.field public final s:Lbrn;

.field public final t:Lyqn;

.field public final u:Lxbf;

.field public final v:Lyw;

.field public final w:Lmj2;

.field public x:Ljava/lang/Boolean;

.field public y:Ljava/lang/Boolean;

.field public z:Lndc;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    sget-object v0, Lpn7;->b:Lon7;

    const/16 v0, 0x96

    sget-object v1, Lun7;->d:Lun7;

    invoke-static {v0, v1}, Lcs5;->x0(ILun7;)J

    move-result-wide v0

    sput-wide v0, Lmrn;->A:J

    return-void
.end method

.method public constructor <init>(Lcom/opera/android/Lazy;Lrvg;Lcrn;Lkrn;Lesk;)V
    .registers 24

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    iget-object v3, v1, Lrvg;->o:Landroid/view/View;

    check-cast v3, Lcom/opera/android/custom_views/StylingImageButton;

    iget-object v4, v1, Lrvg;->m:Landroid/view/View;

    check-cast v4, Lcom/opera/android/custom_views/StylingImageButton;

    iget-object v5, v1, Lrvg;->l:Landroid/view/View;

    check-cast v5, Lcom/opera/android/widget/ThemeableLottieAnimationView;

    iget-object v6, v1, Lrvg;->j:Landroid/view/View;

    check-cast v6, Lcom/opera/android/custom_views/StylingImageButton;

    iget-object v7, v1, Lrvg;->f:Landroid/view/View;

    check-cast v7, Lcom/opera/android/custom_views/StylingImageButton;

    iget-object v8, v1, Lrvg;->n:Landroid/view/View;

    check-cast v8, Landroidx/constraintlayout/widget/Barrier;

    iget-object v9, v1, Lrvg;->g:Ljava/lang/Object;

    check-cast v9, Landroidx/constraintlayout/widget/Barrier;

    iget-object v10, v1, Lrvg;->p:Landroid/view/View;

    check-cast v10, Landroid/widget/LinearLayout;

    iget-object v11, v1, Lrvg;->i:Ljava/lang/Object;

    check-cast v11, Lcom/opera/android/custom_views/StylingEditText;

    iget-object v12, v1, Lrvg;->c:Landroid/view/View;

    iget-object v13, v1, Lrvg;->k:Landroid/view/View;

    check-cast v13, Landroidx/constraintlayout/widget/ConstraintLayout;

    iget-object v14, v1, Lrvg;->b:Landroid/view/ViewGroup;

    check-cast v14, Landroid/widget/FrameLayout;

    iget-object v15, v1, Lrvg;->h:Landroid/view/View;

    check-cast v15, Landroidx/recyclerview/widget/RecyclerView;

    iget-object v2, v1, Lrvg;->e:Ljava/lang/Object;

    check-cast v2, Landroid/widget/LinearLayout;

    iget-object v1, v1, Lrvg;->d:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/custom_views/StylingImageCheckableWithText;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    move-object/from16 p2, v1

    move-object/from16 v1, p1

    iput-object v1, v0, Lmrn;->a:Lcom/opera/android/Lazy;

    iput-object v3, v0, Lmrn;->b:Landroid/view/View;

    iput-object v4, v0, Lmrn;->c:Landroid/view/View;

    iput-object v5, v0, Lmrn;->d:Lcom/opera/android/widget/ThemeableLottieAnimationView;

    iput-object v6, v0, Lmrn;->e:Lcom/opera/android/custom_views/StylingImageButton;

    iput-object v7, v0, Lmrn;->f:Landroid/view/View;

    iput-object v8, v0, Lmrn;->g:Landroidx/constraintlayout/widget/Barrier;

    iput-object v9, v0, Lmrn;->h:Landroidx/constraintlayout/widget/Barrier;

    iput-object v10, v0, Lmrn;->i:Landroid/view/View;

    iput-object v11, v0, Lmrn;->j:Lcom/opera/android/custom_views/OperaEditText;

    iput-object v12, v0, Lmrn;->k:Landroid/view/View;

    iput-object v13, v0, Lmrn;->l:Landroidx/constraintlayout/widget/ConstraintLayout;

    iput-object v14, v0, Lmrn;->m:Landroid/view/View;

    iput-object v15, v0, Lmrn;->n:Landroidx/recyclerview/widget/RecyclerView;

    move-object/from16 v1, p3

    iput-object v1, v0, Lmrn;->o:Lcrn;

    move-object/from16 v1, p4

    iput-object v1, v0, Lmrn;->p:Lkrn;

    iput-object v2, v0, Lmrn;->q:Landroid/view/View;

    move-object/from16 v2, p2

    iput-object v2, v0, Lmrn;->r:Lcom/opera/android/custom_views/StylingImageCheckableWithText;

    new-instance v8, Lbrn;

    const/4 v9, 0x4

    new-array v10, v9, [Landroid/view/View;

    const/4 v9, 0x0

    aput-object v6, v10, v9

    const/4 v9, 0x1

    aput-object v4, v10, v9

    const/4 v9, 0x2

    aput-object v5, v10, v9

    const/4 v9, 0x3

    aput-object v3, v10, v9

    invoke-static {v10}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v10

    invoke-direct {v8, v10}, Lbrn;-><init>(Ljava/util/List;)V

    iput-object v8, v0, Lmrn;->s:Lbrn;

    new-instance v8, Lyqn;

    const/4 v10, 0x0

    invoke-direct {v8, v0, v10}, Lyqn;-><init>(Lmrn;B)V

    iput-object v8, v0, Lmrn;->t:Lyqn;

    new-instance v10, Lxbf;

    invoke-direct {v10, v5}, Lxbf;-><init>(Lcom/opera/android/widget/ThemeableLottieAnimationView;)V

    iput-object v10, v0, Lmrn;->u:Lxbf;

    new-instance v10, Lyw;

    new-instance v9, Lz4k;

    move-object/from16 v16, v14

    const/16 v14, 0xf

    invoke-direct {v9, v0, v14}, Lz4k;-><init>(Ljava/lang/Object;B)V

    move-object/from16 v14, p5

    invoke-direct {v10, v9, v14}, Lyw;-><init>(Lz4k;Lesk;)V

    iput-object v10, v0, Lmrn;->v:Lyw;

    new-instance v9, Lmj2;

    const/16 v14, 0xd

    invoke-direct {v9, v0, v14}, Lmj2;-><init>(Ljava/lang/Object;B)V

    iput-object v9, v0, Lmrn;->w:Lmj2;

    move-object/from16 v17, v13

    const-wide/16 v13, 0x1f4

    invoke-virtual {v4, v8, v13, v14}, Landroid/view/View;->postOnAnimationDelayed(Ljava/lang/Runnable;J)V

    new-instance v8, Lzqn;

    const/4 v13, 0x2

    invoke-direct {v8, v0, v13}, Lzqn;-><init>(Lmrn;B)V

    new-instance v13, Lic;

    const/4 v14, 0x6

    invoke-direct {v13, v8, v14}, Lic;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v4, v13}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v8, Lzqn;

    const/4 v13, 0x3

    invoke-direct {v8, v0, v13}, Lzqn;-><init>(Lmrn;B)V

    new-instance v13, Lic;

    invoke-direct {v13, v8, v14}, Lic;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v5, v13}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v5, Larn;

    const/4 v8, 0x0

    invoke-direct {v5, v0, v8}, Larn;-><init>(Lmrn;B)V

    invoke-virtual {v4, v5}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    invoke-virtual {v11, v8}, Landroid/widget/TextView;->setHorizontallyScrolling(Z)V

    new-instance v4, Lup2;

    const/4 v13, 0x3

    invoke-direct {v4, v11, v0, v13}, Lup2;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v11, v4}, Landroid/view/View;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    new-instance v4, Lyqn;

    const/4 v13, 0x2

    invoke-direct {v4, v0, v13}, Lyqn;-><init>(Lmrn;B)V

    new-instance v5, Lys7;

    const/4 v8, 0x1

    invoke-direct {v5, v4, v8}, Lys7;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v11, v5}, Landroid/widget/TextView;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    new-instance v4, Larn;

    invoke-direct {v4, v0, v8}, Larn;-><init>(Lmrn;B)V

    invoke-virtual {v11, v4}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    invoke-virtual {v11, v9}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    new-instance v4, Lz61;

    const/16 v5, 0x1c

    invoke-direct {v4, v0, v5}, Lz61;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v11, v4}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    new-instance v4, Lh5k;

    invoke-direct {v4, v11, v12}, Lh5k;-><init>(Landroid/widget/TextView;Landroid/view/View;)V

    new-instance v4, Ljrn;

    invoke-virtual {v11}, Landroid/widget/TextView;->getEditableText()Landroid/text/Editable;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v4, v8}, Ljrn;-><init>(Ljava/lang/String;)V

    invoke-interface {v1, v4}, Lkrn;->f(Ltc2;)V

    new-instance v1, Lzqn;

    const/4 v4, 0x4

    invoke-direct {v1, v0, v4}, Lzqn;-><init>(Lmrn;B)V

    new-instance v4, Lic;

    invoke-direct {v4, v1, v14}, Lic;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v6, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v1, Lzqn;

    const/4 v8, 0x0

    invoke-direct {v1, v0, v8}, Lzqn;-><init>(Lmrn;B)V

    new-instance v4, Lic;

    invoke-direct {v4, v1, v14}, Lic;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v3, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v1, Lzqn;

    const/4 v8, 0x1

    invoke-direct {v1, v0, v8}, Lzqn;-><init>(Lmrn;B)V

    invoke-virtual {v7, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v1, Lro9;

    invoke-direct {v1, v5}, Lro9;-><init>(B)V

    invoke-virtual {v15, v1}, Landroidx/recyclerview/widget/RecyclerView;->D0(Lro9;)V

    new-instance v1, Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-virtual/range {v16 .. v16}, Landroid/view/View;->getContext()Landroid/content/Context;

    const/4 v8, 0x0

    invoke-direct {v1, v8, v8}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(IZ)V

    invoke-virtual {v15, v1}, Landroidx/recyclerview/widget/RecyclerView;->C0(Landroidx/recyclerview/widget/f;)V

    invoke-virtual {v15, v10}, Landroidx/recyclerview/widget/RecyclerView;->y0(Landroidx/recyclerview/widget/d;)V

    new-instance v1, Lou1;

    const/4 v13, 0x2

    invoke-direct {v1, v13, v8}, Lou1;-><init>(BI)V

    invoke-virtual {v15}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    const/high16 v4, 0x41000000    # 8.0f

    invoke-static {v3, v4}, Lz7h;->h(Landroid/content/Context;F)I

    move-result v3

    iget v4, v1, Lou1;->b:I

    if-eq v3, v4, :cond_177

    iput v3, v1, Lou1;->b:I

    :cond_177
    invoke-virtual {v15, v1}, Landroidx/recyclerview/widget/RecyclerView;->m(Liph;)V

    new-instance v1, Lr2n;

    const/16 v3, 0x12

    invoke-direct {v1, v0, v3}, Lr2n;-><init>(Ljava/lang/Object;B)V

    iput-object v1, v2, Lcom/opera/android/custom_views/StylingImageCheckableWithText;->w:Lpjk;

    new-instance v1, Loon;

    const/4 v13, 0x2

    invoke-direct {v1, v0, v13}, Loon;-><init>(Ljava/lang/Object;B)V

    move-object/from16 v13, v17

    invoke-static {v13, v1}, Lq9n;->e(Landroid/view/View;Lr8n;)V

    invoke-virtual {v1, v13}, Loon;->a(Landroid/view/View;)V

    return-void
.end method

.method public static final b(Landroid/view/View;Lso5;ILmrn;)V
    .registers 15

    invoke-virtual {p0}, Landroid/view/View;->getId()I

    move-result v1

    const/4 v3, 0x0

    const/4 v4, 0x7

    const/4 v2, 0x7

    move-object v0, p1

    move v5, p2

    invoke-virtual/range {v0 .. v5}, Lso5;->f(IIIII)V

    move p1, v5

    move-object v5, v0

    invoke-virtual {p0}, Landroid/view/View;->getId()I

    move-result v6

    iget-object p2, p3, Lmrn;->j:Lcom/opera/android/custom_views/OperaEditText;

    invoke-virtual {p2}, Landroid/view/View;->getId()I

    move-result v8

    const/4 v9, 0x4

    const/4 v10, 0x0

    const/4 v7, 0x3

    invoke-virtual/range {v5 .. v10}, Lso5;->f(IIIII)V

    invoke-virtual {p0}, Landroid/view/View;->getId()I

    move-result v6

    const/4 v8, 0x0

    const/4 v7, 0x4

    move v10, p1

    invoke-virtual/range {v5 .. v10}, Lso5;->f(IIIII)V

    return-void
.end method

.method public static final c(Landroid/view/View;Lso5;I)V
    .registers 9

    invoke-virtual {p0}, Landroid/view/View;->getId()I

    move-result v1

    const/4 v3, 0x0

    const/4 v4, 0x7

    const/4 v2, 0x7

    move-object v0, p1

    move v5, p2

    invoke-virtual/range {v0 .. v5}, Lso5;->f(IIIII)V

    invoke-virtual {p0}, Landroid/view/View;->getId()I

    move-result p1

    const/4 p2, 0x3

    const/4 v1, 0x0

    invoke-virtual {v0, p1, p2, v1, p2}, Lso5;->e(IIII)V

    invoke-virtual {p0}, Landroid/view/View;->getId()I

    move-result p0

    const/4 p1, 0x4

    invoke-virtual {v0, p0, p1, v1, p1}, Lso5;->e(IIII)V

    return-void
.end method

.method public static final d(Lso5;I)V
    .registers 3

    const/4 v0, 0x6

    invoke-virtual {p0, p1, v0}, Lso5;->c(II)V

    const/4 v0, 0x7

    invoke-virtual {p0, p1, v0}, Lso5;->c(II)V

    const/4 v0, 0x3

    invoke-virtual {p0, p1, v0}, Lso5;->c(II)V

    const/4 v0, 0x4

    invoke-virtual {p0, p1, v0}, Lso5;->c(II)V

    return-void
.end method

.method public static f(Landroid/view/View;)Z
    .registers 2

    invoke-virtual {p0}, Landroid/view/View;->isEnabled()Z

    move-result v0

    if-eqz v0, :cond_19

    invoke-virtual {p0}, Landroid/view/View;->isShown()Z

    move-result v0

    if-eqz v0, :cond_19

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    invoke-virtual {p0, v0}, Landroid/view/View;->getLocalVisibleRect(Landroid/graphics/Rect;)Z

    move-result p0

    if-eqz p0, :cond_19

    const/4 p0, 0x1

    return p0

    :cond_19
    const/4 p0, 0x0

    return p0
.end method


# virtual methods
.method public final a(Z)V
    .registers 6

    iget-object v0, p0, Lmrn;->y:Ljava/lang/Boolean;

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_d

    return-void

    :cond_d
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lmrn;->y:Ljava/lang/Boolean;

    iget-object v0, p0, Lmrn;->m:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/ViewPropertyAnimator;->cancel()V

    const/4 v1, 0x0

    if-eqz p1, :cond_31

    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    const/4 p1, 0x0

    invoke-virtual {v0, p1}, Landroid/view/View;->setVisibility(I)V

    new-instance p1, Lwr9;

    const/16 v1, 0x17

    invoke-direct {p1, v0, p0, v1}, Lwr9;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v0, p1}, Lkff;->a(Landroid/view/View;Ljava/lang/Runnable;)Lkff;

    return-void

    :cond_31
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    sget-wide v2, Lmrn;->A:J

    invoke-static {v2, v3}, Lpn7;->f(J)J

    move-result-wide v2

    invoke-virtual {p1, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    sget-object v2, Llf1;->d:Landroid/view/animation/DecelerateInterpolator;

    invoke-virtual {p1, v2}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p1, v0}, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-virtual {p1, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    new-instance v0, Lyqn;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Lyqn;-><init>(Lmrn;B)V

    invoke-virtual {p1, v0}, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/ViewPropertyAnimator;->start()V

    return-void
.end method

.method public final e()Z
    .registers 4

    iget-object v0, p0, Lmrn;->o:Lcrn;

    invoke-interface {v0}, Lcrn;->g()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_33

    iget-object p0, p0, Lmrn;->a:Lcom/opera/android/Lazy;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljbn;

    iget-object p0, p0, Ljbn;->d:Lumk;

    iget-object p0, p0, Lumk;->a:Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    const-string v2, "hintShown"

    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_33

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    const-string v0, "usageCount"

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p0

    if-lez p0, :cond_33

    const/4 p0, 0x1

    return p0

    :cond_33
    return v1
.end method

.method public final g()V
    .registers 3

    iget-object p0, p0, Lmrn;->j:Lcom/opera/android/custom_views/OperaEditText;

    invoke-static {p0}, Lmrn;->f(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_22

    invoke-virtual {p0}, Landroid/view/View;->requestFocus()Z

    move-result v0

    if-eqz v0, :cond_22

    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {p0}, Landroid/widget/TextView;->length()I

    move-result v1

    invoke-static {v0, v1}, Landroid/text/Selection;->setSelection(Landroid/text/Spannable;I)V

    sget-object v0, Lq9n;->c:Ll5b;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p0}, Lq9n;->G(Landroid/content/Context;Landroid/view/View;)Z

    :cond_22
    return-void
.end method

.method public final h(Llsn;)V
    .registers 21

    move-object/from16 v0, p0

    iget-object v1, v0, Lmrn;->c:Landroid/view/View;

    iget-object v2, v0, Lmrn;->t:Lyqn;

    invoke-virtual {v1, v2}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    invoke-interface/range {p1 .. p1}, Llsn;->isVisible()Z

    move-result v3

    const/4 v4, 0x0

    if-nez v3, :cond_14

    invoke-virtual {v0, v4}, Lmrn;->a(Z)V

    return-void

    :cond_14
    invoke-interface/range {p1 .. p1}, Llsn;->g()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_22

    sget-object v3, Ll08;->a:Ll08;

    goto/16 :goto_a1

    :cond_22
    check-cast v3, Ljava/lang/Iterable;

    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_2d
    :goto_2d
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_a0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljx1;

    if-eqz v6, :cond_9c

    instance-of v7, v6, Lsx1;

    if-eqz v7, :cond_49

    new-instance v7, Lsqn;

    check-cast v6, Lsx1;

    iget-object v6, v6, Lvx1;->a:Ljava/lang/String;

    invoke-direct {v7, v6}, Lsqn;-><init>(Ljava/lang/String;)V

    goto :goto_96

    :cond_49
    instance-of v7, v6, Lrx1;

    if-eqz v7, :cond_83

    check-cast v6, Lrx1;

    iget-object v7, v6, Lvx1;->a:Ljava/lang/String;

    iget-object v6, v6, Lvx1;->b:Lwxe;

    if-eqz v6, :cond_7f

    instance-of v8, v6, Lqx1;

    if-eqz v8, :cond_6f

    new-instance v8, Lrqn;

    check-cast v6, Lqx1;

    iget-object v9, v6, Lqx1;->m:Ljava/io/File;

    invoke-static {v9}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v9

    new-instance v10, Ltqn;

    iget-object v6, v6, Lqx1;->o:Lo29;

    invoke-direct {v10, v6}, Ltqn;-><init>(Lo29;)V

    invoke-direct {v8, v7, v9, v10}, Lrqn;-><init>(Ljava/lang/String;Landroid/net/Uri;Lioh;)V

    :goto_6d
    move-object v7, v8

    goto :goto_96

    :cond_6f
    instance-of v8, v6, Ltx1;

    if-eqz v8, :cond_7f

    new-instance v8, Lrqn;

    check-cast v6, Ltx1;

    iget-object v6, v6, Ltx1;->m:Landroid/net/Uri;

    sget-object v9, Luqn;->a:Luqn;

    invoke-direct {v8, v7, v6, v9}, Lrqn;-><init>(Ljava/lang/String;Landroid/net/Uri;Lioh;)V

    goto :goto_6d

    :cond_7f
    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_83
    instance-of v7, v6, Lpx1;

    if-eqz v7, :cond_91

    new-instance v7, Lqqn;

    check-cast v6, Lpx1;

    iget-object v6, v6, Lvx1;->a:Ljava/lang/String;

    invoke-direct {v7, v6}, Lqqn;-><init>(Ljava/lang/String;)V

    goto :goto_96

    :cond_91
    instance-of v6, v6, Lfz1;

    if-eqz v6, :cond_9c

    const/4 v7, 0x0

    :goto_96
    if-eqz v7, :cond_2d

    invoke-virtual {v5, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2d

    :cond_9c
    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_a0
    move-object v3, v5

    :goto_a1
    iget-object v5, v0, Lmrn;->v:Lyw;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v6, Leme;

    invoke-direct {v6, v5}, Leme;-><init>(Ljava/lang/Object;)V

    iget-object v5, v5, Ldt1;->d:Ljava/lang/Object;

    check-cast v5, Ljava/util/ArrayList;

    new-instance v7, Lik;

    const/4 v8, 0x1

    invoke-direct {v7, v5, v3, v8}, Lik;-><init>(Ljava/util/ArrayList;Ljava/util/List;B)V

    invoke-static {v7, v4}, Luup;->k(Lk1g;Z)Lj87;

    move-result-object v7

    invoke-virtual {v5}, Ljava/util/ArrayList;->clear()V

    check-cast v3, Ljava/util/Collection;

    invoke-virtual {v5, v3}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    invoke-virtual {v7, v6}, Lj87;->a(Lsic;)V

    invoke-interface/range {p1 .. p1}, Llsn;->d()Z

    move-result v3

    const/16 v5, 0x8

    if-eqz v3, :cond_ce

    move v3, v4

    goto :goto_cf

    :cond_ce
    move v3, v5

    :goto_cf
    iget-object v6, v0, Lmrn;->n:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v6, v3}, Landroid/view/View;->setVisibility(I)V

    invoke-interface/range {p1 .. p1}, Llsn;->f()Ljava/lang/Boolean;

    move-result-object v3

    if-eqz v3, :cond_e3

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    iget-object v6, v0, Lmrn;->r:Lcom/opera/android/custom_views/StylingImageCheckableWithText;

    invoke-virtual {v6, v3}, Lcom/opera/android/custom_views/StylingImageCheckableWithText;->u(Z)V

    :cond_e3
    iget-object v3, v0, Lmrn;->i:Landroid/view/View;

    invoke-interface/range {p1 .. p1}, Llsn;->isEnabled()Z

    move-result v6

    invoke-virtual {v3, v6}, Landroid/view/View;->setEnabled(Z)V

    invoke-interface/range {p1 .. p1}, Llsn;->isEnabled()Z

    move-result v3

    iget-object v6, v0, Lmrn;->j:Lcom/opera/android/custom_views/OperaEditText;

    invoke-virtual {v6, v3}, Landroid/view/View;->setEnabled(Z)V

    invoke-interface/range {p1 .. p1}, Llsn;->e()Lpxh;

    move-result-object v3

    invoke-virtual {v6}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    invoke-virtual {v3, v7}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v6, v3}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    invoke-interface/range {p1 .. p1}, Llsn;->getText()Lpxh;

    move-result-object v3

    if-eqz v3, :cond_11d

    iget-object v7, v0, Lmrn;->w:Lmj2;

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->removeTextChangedListener(Landroid/text/TextWatcher;)V

    invoke-virtual {v6}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    invoke-virtual {v3, v9}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v6, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    :cond_11d
    invoke-interface/range {p1 .. p1}, Llsn;->b()Lmsn;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Enum;->ordinal()I

    move-result v3

    iget-object v7, v0, Lmrn;->b:Landroid/view/View;

    const/4 v9, 0x4

    const/4 v10, 0x3

    iget-object v11, v0, Lmrn;->e:Lcom/opera/android/custom_views/StylingImageButton;

    iget-object v12, v0, Lmrn;->d:Lcom/opera/android/widget/ThemeableLottieAnimationView;

    iget-object v13, v0, Lmrn;->s:Lbrn;

    if-eqz v3, :cond_172

    if-eq v3, v8, :cond_16b

    const/4 v14, 0x2

    if-eq v3, v14, :cond_164

    const-wide/16 v14, 0x1f4

    if-eq v3, v10, :cond_154

    if-eq v3, v9, :cond_147

    const/4 v2, 0x5

    if-ne v3, v2, :cond_143

    invoke-virtual {v13, v7}, Lbrn;->a(Landroid/view/View;)V

    goto :goto_178

    :cond_143
    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_147
    invoke-virtual {v13, v12}, Lbrn;->a(Landroid/view/View;)V

    invoke-virtual {v0}, Lmrn;->e()Z

    move-result v3

    if-eqz v3, :cond_178

    invoke-virtual {v12, v2, v14, v15}, Landroid/view/View;->postOnAnimationDelayed(Ljava/lang/Runnable;J)V

    goto :goto_178

    :cond_154
    invoke-virtual {v13, v1}, Lbrn;->a(Landroid/view/View;)V

    invoke-virtual {v1, v8}, Landroid/view/View;->setEnabled(Z)V

    invoke-virtual {v0}, Lmrn;->e()Z

    move-result v3

    if-eqz v3, :cond_178

    invoke-virtual {v1, v2, v14, v15}, Landroid/view/View;->postOnAnimationDelayed(Ljava/lang/Runnable;J)V

    goto :goto_178

    :cond_164
    invoke-virtual {v13, v1}, Lbrn;->a(Landroid/view/View;)V

    invoke-virtual {v1, v4}, Landroid/view/View;->setEnabled(Z)V

    goto :goto_178

    :cond_16b
    invoke-virtual {v13, v11}, Lbrn;->a(Landroid/view/View;)V

    invoke-virtual {v11, v8}, Landroid/view/View;->setEnabled(Z)V

    goto :goto_178

    :cond_172
    invoke-virtual {v13, v11}, Lbrn;->a(Landroid/view/View;)V

    invoke-virtual {v11, v4}, Landroid/view/View;->setEnabled(Z)V

    :cond_178
    :goto_178
    invoke-interface/range {p1 .. p1}, Llsn;->h()Z

    move-result v2

    if-nez v2, :cond_180

    move v2, v4

    goto :goto_181

    :cond_180
    move v2, v5

    :goto_181
    iget-object v3, v0, Lmrn;->q:Landroid/view/View;

    invoke-virtual {v3, v2}, Landroid/view/View;->setVisibility(I)V

    invoke-interface/range {p1 .. p1}, Llsn;->a()Z

    move-result v2

    if-eqz v2, :cond_18d

    move v5, v4

    :cond_18d
    iget-object v2, v0, Lmrn;->f:Landroid/view/View;

    invoke-virtual {v2, v5}, Landroid/view/View;->setVisibility(I)V

    invoke-interface/range {p1 .. p1}, Llsn;->c()Z

    move-result v3

    invoke-virtual {v2, v3}, Landroid/view/View;->setEnabled(Z)V

    invoke-interface/range {p1 .. p1}, Llsn;->h()Z

    move-result v3

    iget-object v5, v0, Lmrn;->x:Ljava/lang/Boolean;

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v13

    invoke-static {v5, v13}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1ac

    move v1, v8

    goto/16 :goto_2c9

    :cond_1ac
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    iput-object v5, v0, Lmrn;->x:Ljava/lang/Boolean;

    new-instance v13, Lso5;

    invoke-direct {v13}, Lso5;-><init>()V

    iget-object v5, v0, Lmrn;->l:Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-virtual {v13, v5}, Lso5;->d(Landroidx/constraintlayout/widget/ConstraintLayout;)V

    invoke-virtual {v2}, Landroid/view/View;->getId()I

    move-result v14

    invoke-static {v13, v14}, Lmrn;->d(Lso5;I)V

    invoke-virtual {v1}, Landroid/view/View;->getId()I

    move-result v14

    invoke-static {v13, v14}, Lmrn;->d(Lso5;I)V

    invoke-virtual {v12}, Landroid/view/View;->getId()I

    move-result v14

    invoke-static {v13, v14}, Lmrn;->d(Lso5;I)V

    invoke-virtual {v11}, Landroid/view/View;->getId()I

    move-result v14

    invoke-static {v13, v14}, Lmrn;->d(Lso5;I)V

    invoke-virtual {v7}, Landroid/view/View;->getId()I

    move-result v14

    invoke-static {v13, v14}, Lmrn;->d(Lso5;I)V

    invoke-virtual {v6}, Landroid/view/View;->getId()I

    move-result v14

    invoke-static {v13, v14}, Lmrn;->d(Lso5;I)V

    const/4 v15, 0x6

    if-eqz v3, :cond_24c

    new-instance v3, Lixh;

    const/high16 v14, 0x40800000    # 4.0f

    invoke-direct {v3, v14}, Lixh;-><init>(F)V

    invoke-virtual {v5}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v14

    invoke-virtual {v3, v14}, Ly7h;->k(Landroid/content/Context;)I

    move-result v18

    invoke-virtual {v2}, Landroid/view/View;->getId()I

    move-result v14

    const/16 v16, 0x0

    const/16 v17, 0x6

    move v3, v15

    const/4 v15, 0x6

    move v8, v3

    const/4 v3, 0x7

    invoke-virtual/range {v13 .. v18}, Lso5;->f(IIIII)V

    move/from16 v14, v18

    invoke-virtual {v2}, Landroid/view/View;->getId()I

    move-result v15

    invoke-virtual {v13, v15, v10, v4, v10}, Lso5;->e(IIII)V

    invoke-virtual {v2}, Landroid/view/View;->getId()I

    move-result v2

    invoke-virtual {v13, v2, v9, v4, v9}, Lso5;->e(IIII)V

    invoke-static {v1, v13, v14}, Lmrn;->c(Landroid/view/View;Lso5;I)V

    invoke-static {v12, v13, v14}, Lmrn;->c(Landroid/view/View;Lso5;I)V

    invoke-static {v11, v13, v14}, Lmrn;->c(Landroid/view/View;Lso5;I)V

    invoke-static {v7, v13, v14}, Lmrn;->c(Landroid/view/View;Lso5;I)V

    invoke-virtual {v6}, Landroid/view/View;->getId()I

    move-result v1

    iget-object v2, v0, Lmrn;->g:Landroidx/constraintlayout/widget/Barrier;

    invoke-virtual {v2}, Landroid/view/View;->getId()I

    move-result v2

    invoke-virtual {v13, v1, v8, v2, v3}, Lso5;->e(IIII)V

    invoke-virtual {v6}, Landroid/view/View;->getId()I

    move-result v1

    iget-object v2, v0, Lmrn;->h:Landroidx/constraintlayout/widget/Barrier;

    invoke-virtual {v2}, Landroid/view/View;->getId()I

    move-result v2

    invoke-virtual {v13, v1, v3, v2, v8}, Lso5;->e(IIII)V

    invoke-virtual {v6}, Landroid/view/View;->getId()I

    move-result v1

    invoke-virtual {v13, v1, v10, v4, v10}, Lso5;->e(IIII)V

    invoke-virtual {v6}, Landroid/view/View;->getId()I

    move-result v1

    invoke-virtual {v13, v1, v9, v4, v9}, Lso5;->e(IIII)V

    goto :goto_2b7

    :cond_24c
    move v8, v15

    const/4 v3, 0x7

    new-instance v9, Lixh;

    const/high16 v14, 0x41400000    # 12.0f

    invoke-direct {v9, v14}, Lixh;-><init>(F)V

    invoke-virtual {v5}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v14

    invoke-virtual {v9, v14}, Ly7h;->k(Landroid/content/Context;)I

    move-result v18

    invoke-virtual {v2}, Landroid/view/View;->getId()I

    move-result v14

    const/16 v16, 0x0

    const/16 v17, 0x6

    const/4 v15, 0x6

    invoke-virtual/range {v13 .. v18}, Lso5;->f(IIIII)V

    move/from16 v9, v18

    invoke-virtual {v2}, Landroid/view/View;->getId()I

    move-result v14

    invoke-virtual {v6}, Landroid/view/View;->getId()I

    move-result v16

    const/16 v17, 0x4

    const/16 v18, 0x0

    const/4 v15, 0x3

    invoke-virtual/range {v13 .. v18}, Lso5;->f(IIIII)V

    invoke-virtual {v2}, Landroid/view/View;->getId()I

    move-result v14

    const/16 v16, 0x0

    const/4 v15, 0x4

    move/from16 v18, v9

    invoke-virtual/range {v13 .. v18}, Lso5;->f(IIIII)V

    invoke-static {v1, v13, v9, v0}, Lmrn;->b(Landroid/view/View;Lso5;ILmrn;)V

    invoke-static {v12, v13, v9, v0}, Lmrn;->b(Landroid/view/View;Lso5;ILmrn;)V

    invoke-static {v11, v13, v9, v0}, Lmrn;->b(Landroid/view/View;Lso5;ILmrn;)V

    invoke-static {v7, v13, v9, v0}, Lmrn;->b(Landroid/view/View;Lso5;ILmrn;)V

    invoke-virtual {v6}, Landroid/view/View;->getId()I

    move-result v1

    invoke-virtual {v13, v1, v8, v4, v8}, Lso5;->e(IIII)V

    invoke-virtual {v6}, Landroid/view/View;->getId()I

    move-result v1

    invoke-virtual {v13, v1, v3, v4, v3}, Lso5;->e(IIII)V

    invoke-virtual {v6}, Landroid/view/View;->getId()I

    move-result v1

    invoke-virtual {v13, v1, v10, v4, v10}, Lso5;->e(IIII)V

    new-instance v1, Lixh;

    const/high16 v2, 0x41a00000    # 20.0f

    invoke-direct {v1, v2}, Lixh;-><init>(F)V

    invoke-virtual {v6}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v1, v2}, Ly7h;->k(Landroid/content/Context;)I

    move-result v4

    :goto_2b7
    invoke-virtual {v6}, Landroid/view/View;->getPaddingTop()I

    move-result v1

    invoke-virtual {v6}, Landroid/view/View;->getPaddingBottom()I

    move-result v2

    invoke-virtual {v6, v4, v1, v4, v2}, Landroid/view/View;->setPaddingRelative(IIII)V

    invoke-virtual {v0}, Lmrn;->j()V

    invoke-virtual {v13, v5}, Lso5;->a(Landroidx/constraintlayout/widget/ConstraintLayout;)V

    const/4 v1, 0x1

    :goto_2c9
    invoke-virtual {v0, v1}, Lmrn;->a(Z)V

    return-void
.end method

.method public final i(Ljava/lang/String;)V
    .registers 2

    iget-object p0, p0, Lmrn;->j:Lcom/opera/android/custom_views/OperaEditText;

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public final j()V
    .registers 4

    new-instance v0, Lm2n;

    const/16 v1, 0x8

    invoke-direct {v0, p0, v1}, Lm2n;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0}, Lm2n;->invoke()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/graphics/drawable/Drawable;

    iget-object v2, p0, Lmrn;->f:Landroid/view/View;

    invoke-virtual {v2, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v0}, Lm2n;->invoke()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/graphics/drawable/Drawable;

    iget-object v2, p0, Lmrn;->c:Landroid/view/View;

    invoke-virtual {v2, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v0}, Lm2n;->invoke()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/drawable/Drawable;

    iget-object v1, p0, Lmrn;->e:Lcom/opera/android/custom_views/StylingImageButton;

    invoke-virtual {v1, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    iget-object v0, p0, Lmrn;->x:Ljava/lang/Boolean;

    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3b

    new-instance v0, Lfxh;

    const v2, 0x7f060044

    invoke-direct {v0, v2}, Lfxh;-><init>(I)V

    goto :goto_43

    :cond_3b
    new-instance v0, Ldxh;

    const v2, 0x7f04052c

    invoke-direct {v0, v2}, Ldxh;-><init>(I)V

    :goto_43
    iget-object p0, p0, Lmrn;->l:Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcxh;->b(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setImageTintList(Landroid/content/res/ColorStateList;)V

    new-instance v0, Lfxh;

    const v2, 0x7f060043

    invoke-direct {v0, v2}, Lfxh;-><init>(I)V

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {v0, p0}, Lcxh;->b(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object p0

    invoke-virtual {v1, p0}, Landroid/view/View;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    return-void
.end method
