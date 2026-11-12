.class public abstract Liji;
.super Ldej;
.source "SourceFile"


# instance fields
.field public final c:Ldx3;

.field public final d:Leji;

.field public e:Lfji;

.field public f:Lwjh;

.field public g:Lfji;

.field public h:Landroid/widget/FrameLayout;

.field public i:Landroid/view/View;

.field public j:Landroid/view/View;

.field public k:Landroid/view/View;

.field public l:Landroid/view/View;

.field public m:Landroid/view/View;

.field public n:Ljava/lang/String;

.field public o:Lrf2;

.field public p:Landroid/net/Uri;

.field public q:I

.field public r:Z

.field public s:Ljava/lang/String;

.field public t:Landroid/animation/ValueAnimator;

.field public u:Lkg7;

.field public v:Z


# direct methods
.method public constructor <init>(Lmej;Ldx3;)V
    .registers 3

    invoke-direct {p0, p1}, Ldej;-><init>(Lmej;)V

    new-instance p1, Leji;

    invoke-direct {p1, p0}, Leji;-><init>(Liji;)V

    iput-object p1, p0, Liji;->d:Leji;

    iput-object p2, p0, Liji;->c:Ldx3;

    return-void
.end method

.method public static J(Landroid/view/View;Ljava/lang/String;)V
    .registers 4

    const v0, 0x7f0a0b6e

    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    check-cast p0, Lcom/opera/android/downloads/SaveSheet$OptionTextAreaLayout;

    iget-object v0, p0, Lcom/opera/android/downloads/SaveSheet$OptionTextAreaLayout;->e:Landroid/widget/TextView;

    const/4 v1, 0x0

    invoke-virtual {p0, v0, p1, v1}, Lcom/opera/android/downloads/SaveSheet$OptionTextAreaLayout;->d(Landroid/widget/TextView;Ljava/lang/String;Landroid/content/res/ColorStateList;)V

    return-void
.end method


# virtual methods
.method public A()V
    .registers 1

    return-void
.end method

.method public B()V
    .registers 1

    return-void
.end method

.method public C()V
    .registers 1

    return-void
.end method

.method public D()V
    .registers 1

    return-void
.end method

.method public E()V
    .registers 1

    return-void
.end method

.method public F()V
    .registers 1

    return-void
.end method

.method public G()V
    .registers 1

    return-void
.end method

.method public H()V
    .registers 1

    return-void
.end method

.method public I()V
    .registers 1

    return-void
.end method

.method public K()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public L(Lkg7;)Z
    .registers 2

    const/4 p0, 0x0

    return p0
.end method

.method public M()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final N(Z)V
    .registers 5

    iget-object v0, p0, Liji;->h:Landroid/widget/FrameLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/view/View;->setVisibility(I)V

    const/4 v2, 0x1

    if-eqz p1, :cond_1c

    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    const/4 v2, 0x2

    goto :goto_25

    :cond_1c
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object p1

    const/16 v1, 0x8

    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    :goto_25
    iget-object p1, p0, Ldej;->b:Lmej;

    invoke-interface {p1}, Lmej;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v1, 0x7f0701af

    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    mul-int/2addr p1, v2

    iput p1, p0, Liji;->q:I

    iget-object p1, p0, Liji;->h:Landroid/widget/FrameLayout;

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    iget v1, p0, Liji;->q:I

    iput v1, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    iget-object v1, p0, Liji;->h:Landroid/widget/FrameLayout;

    invoke-virtual {v1, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    iget p0, p0, Liji;->q:I

    iput p0, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-virtual {v0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method public final O(Ljava/lang/String;)V
    .registers 9

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-eqz p1, :cond_6

    move v2, v0

    goto :goto_7

    :cond_6
    move v2, v1

    :goto_7
    iget-object v3, p0, Liji;->s:Ljava/lang/String;

    if-nez v3, :cond_c

    move v0, v1

    :cond_c
    if-nez v3, :cond_10

    if-eqz p1, :cond_4a

    :cond_10
    iput-object p1, p0, Liji;->s:Ljava/lang/String;

    iget-object v3, p0, Ldej;->b:Lmej;

    if-eqz v2, :cond_1f

    invoke-interface {v3}, Lmej;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lf03;->y(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object v3

    goto :goto_27

    :cond_1f
    invoke-interface {v3}, Lmej;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lf03;->F(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object v3

    :goto_27
    iget-object v4, p0, Liji;->i:Landroid/view/View;

    const v5, 0x7f0a0b6e

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/opera/android/downloads/SaveSheet$OptionTextAreaLayout;

    iget-object v6, v4, Lcom/opera/android/downloads/SaveSheet$OptionTextAreaLayout;->f:Landroid/widget/TextView;

    invoke-virtual {v4, v6, p1, v3}, Lcom/opera/android/downloads/SaveSheet$OptionTextAreaLayout;->d(Landroid/widget/TextView;Ljava/lang/String;Landroid/content/res/ColorStateList;)V

    iget-object v4, p0, Liji;->l:Landroid/view/View;

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/opera/android/downloads/SaveSheet$OptionTextAreaLayout;

    iget-object v5, v4, Lcom/opera/android/downloads/SaveSheet$OptionTextAreaLayout;->f:Landroid/widget/TextView;

    invoke-virtual {v4, v5, p1, v3}, Lcom/opera/android/downloads/SaveSheet$OptionTextAreaLayout;->d(Landroid/widget/TextView;Ljava/lang/String;Landroid/content/res/ColorStateList;)V

    if-eqz v0, :cond_4b

    iget-object p1, p0, Liji;->s:Ljava/lang/String;

    if-eqz p1, :cond_4b

    :cond_4a
    return-void

    :cond_4b
    invoke-virtual {p0}, Liji;->S()V

    iget p1, p0, Liji;->q:I

    if-eqz v2, :cond_54

    move v0, v1

    goto :goto_56

    :cond_54
    move v0, p1

    move p1, v1

    :goto_56
    filled-new-array {v0, p1}, [I

    move-result-object p1

    invoke-static {p1}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    move-result-object p1

    iput-object p1, p0, Liji;->t:Landroid/animation/ValueAnimator;

    const-wide/16 v3, 0x12c

    invoke-virtual {p1, v3, v4}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    iget-object p1, p0, Liji;->t:Landroid/animation/ValueAnimator;

    new-instance v0, Lcji;

    invoke-direct {v0, p0, v2}, Lcji;-><init>(Liji;Z)V

    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    iget-object p1, p0, Liji;->t:Landroid/animation/ValueAnimator;

    new-instance v0, Lin8;

    const/4 v3, 0x6

    invoke-direct {v0, v3, p0, v2}, Lin8;-><init>(BLjava/lang/Object;Z)V

    invoke-virtual {p1, v0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    iget-object p1, p0, Liji;->h:Landroid/widget/FrameLayout;

    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object p0, p0, Liji;->t:Landroid/animation/ValueAnimator;

    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    return-void
.end method

.method public final P()V
    .registers 6

    iget-object v0, p0, Liji;->c:Ldx3;

    const v1, 0x7f1405d4

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_12

    new-instance v2, Lqxh;

    invoke-direct {v2, v0}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    goto :goto_13

    :cond_12
    move-object v2, v1

    :goto_13
    new-instance v0, Lwii;

    const/4 v3, 0x2

    invoke-direct {v0, p0, v3}, Lwii;-><init>(Liji;B)V

    new-instance v3, Lgkj;

    const/4 v4, 0x0

    invoke-direct {v3, v4, v4}, Lnz0;-><init>(ZZ)V

    iput-object v1, v3, Lgkj;->a:Ljava/lang/String;

    iput-object v1, v3, Lgkj;->b:Ljava/lang/String;

    iput-object v1, v3, Lgkj;->c:Ljava/lang/String;

    iput-object v1, v3, Lgkj;->d:Ljava/lang/CharSequence;

    iput-object v1, v3, Lgkj;->e:Lekj;

    iput-object v1, v3, Lgkj;->f:Lfkj;

    iput-object v1, v3, Lgkj;->g:Lqp2;

    iput-object v0, v3, Lgkj;->h:Ldkj;

    iput-object v1, v3, Lgkj;->i:Ldkj;

    iput-object v1, v3, Lgkj;->j:Lql;

    const v0, 0x7f140bbb

    iput v0, v3, Lgkj;->k:I

    const v0, 0x7f1403bf

    iput v0, v3, Lgkj;->l:I

    const v0, 0x7f1405d5

    iput v0, v3, Lgkj;->m:I

    const/4 v0, 0x1

    iput-boolean v0, v3, Lgkj;->n:Z

    iput-object v2, v3, Lgkj;->o:Lpxh;

    iget-object p0, p0, Ldej;->b:Lmej;

    invoke-interface {p0}, Lmej;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lsfe;->U(Landroid/content/Context;)Lz77;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, Lijm;->b:Lijm;

    invoke-virtual {p0, v3, v0}, Lr22;->b(Ljjm;Lijm;)V

    return-void
.end method

.method public R(Lo93;)V
    .registers 3

    iget-object p0, p0, Liji;->c:Ldx3;

    iget-object p0, p0, Ldx3;->o:Lqim;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p0, p0, Lqim;->e:Lysj;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, Lijm;->b:Lijm;

    invoke-virtual {p0, p1, v0}, Lr22;->b(Ljjm;Lijm;)V

    return-void
.end method

.method public final S()V
    .registers 3

    iget-object v0, p0, Liji;->s:Ljava/lang/String;

    if-nez v0, :cond_1a

    iget-boolean v0, p0, Liji;->v:Z

    if-eqz v0, :cond_18

    iget-object v0, p0, Liji;->o:Lrf2;

    iget-object v0, v0, Lrf2;->f:Landroid/view/View;

    check-cast v0, Lcom/opera/android/downloads/SaveSheet$FilenameEditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    if-lez v0, :cond_1a

    :cond_18
    const/4 v0, 0x1

    goto :goto_1b

    :cond_1a
    const/4 v0, 0x0

    :goto_1b
    iget-object v1, p0, Liji;->i:Landroid/view/View;

    invoke-virtual {v1, v0}, Landroid/view/View;->setEnabled(Z)V

    iget-object v1, p0, Liji;->m:Landroid/view/View;

    invoke-virtual {v1, v0}, Landroid/view/View;->setEnabled(Z)V

    iget-object p0, p0, Liji;->l:Landroid/view/View;

    invoke-virtual {p0, v0}, Landroid/view/View;->setEnabled(Z)V

    return-void
.end method

.method public final T(Z)V
    .registers 5

    const v0, 0x7f0402c8

    iget-object v1, p0, Ldej;->b:Lmej;

    if-eqz p1, :cond_1e

    const p1, 0x7f080527

    invoke-interface {v1}, Lmej;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {p1, v2}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-interface {v1}, Lmej;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v0, v1}, Lf03;->W(ILandroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object v0

    invoke-static {p1, v0}, Lj14;->o0(Landroid/graphics/drawable/Drawable;Landroid/content/res/ColorStateList;)V

    goto :goto_34

    :cond_1e
    const p1, 0x7f080548

    invoke-interface {v1}, Lmej;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {p1, v2}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-interface {v1}, Lmej;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v0, v1}, Lf03;->W(ILandroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object v0

    invoke-static {p1, v0}, Lj14;->o0(Landroid/graphics/drawable/Drawable;Landroid/content/res/ColorStateList;)V

    :goto_34
    iget-object p0, p0, Liji;->o:Lrf2;

    iget-object p0, p0, Lrf2;->f:Landroid/view/View;

    check-cast p0, Lcom/opera/android/downloads/SaveSheet$FilenameEditText;

    iget-object p0, p0, Lcom/opera/android/custom_views/OperaEditText;->i:Lzg;

    const/4 v0, 0x0

    iput-object v0, p0, Lzg;->c:Ljava/lang/Object;

    iput-object p1, p0, Lzg;->d:Ljava/lang/Object;

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v0

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v1

    const/4 v2, 0x0

    invoke-virtual {p1, v2, v2, v0, v1}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    iget-object p1, p0, Lzg;->b:Ljava/lang/Object;

    check-cast p1, Landroid/widget/TextView;

    invoke-static {p1}, Lcs5;->L(Landroid/view/View;)I

    move-result p1

    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lzg;->L(IZ)V

    return-void
.end method

.method public final V()V
    .registers 10

    iget-object v0, p0, Ldej;->b:Lmej;

    invoke-interface {v0}, Lmej;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f0402f0

    const v3, 0x7f06063b

    invoke-static {v2, v1, v3}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v1

    iget-object v2, p0, Liji;->o:Lrf2;

    iget-object v2, v2, Lrf2;->g:Landroid/view/View;

    check-cast v2, Lcom/opera/android/widget/SideActionsLayout;

    invoke-virtual {v2, v1}, Landroid/view/View;->setBackgroundColor(I)V

    invoke-interface {v0}, Lmej;->getContext()Landroid/content/Context;

    move-result-object v2

    const v4, 0x7f0402c4

    invoke-static {v4, v2}, Lf03;->W(ILandroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object v2

    invoke-interface {v0}, Lmej;->getContext()Landroid/content/Context;

    move-result-object v4

    const v5, 0x7f0402c8

    invoke-static {v5, v4}, Lf03;->W(ILandroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object v4

    invoke-interface {v0}, Lmej;->getContext()Landroid/content/Context;

    move-result-object v5

    const v6, 0x7f0402d3

    invoke-static {v6, v5}, Lf03;->W(ILandroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object v5

    iget-object v6, p0, Liji;->o:Lrf2;

    iget-object v6, v6, Lrf2;->f:Landroid/view/View;

    check-cast v6, Lcom/opera/android/downloads/SaveSheet$FilenameEditText;

    invoke-virtual {v6, v2}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    iget-object v6, p0, Liji;->o:Lrf2;

    iget-object v6, v6, Lrf2;->f:Landroid/view/View;

    check-cast v6, Lcom/opera/android/downloads/SaveSheet$FilenameEditText;

    invoke-virtual {v6, v2}, Landroid/widget/TextView;->setHintTextColor(Landroid/content/res/ColorStateList;)V

    iget-object v6, p0, Liji;->o:Lrf2;

    iget-object v6, v6, Lrf2;->f:Landroid/view/View;

    check-cast v6, Lcom/opera/android/downloads/SaveSheet$FilenameEditText;

    invoke-interface {v0}, Lmej;->getContext()Landroid/content/Context;

    move-result-object v7

    const v8, 0x7f060f8e

    invoke-static {v8, v7}, Lnb6;->v(ILandroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/view/View;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    iget-object v6, p0, Liji;->o:Lrf2;

    iget-object v6, v6, Lrf2;->f:Landroid/view/View;

    check-cast v6, Lcom/opera/android/downloads/SaveSheet$FilenameEditText;

    invoke-virtual {v2}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v7

    const v8, 0x3e8f5c29    # 0.28f

    invoke-static {v8, v7}, Lp37;->j0(FI)I

    move-result v7

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setHighlightColor(I)V

    iget-object v6, p0, Liji;->o:Lrf2;

    iget-object v6, v6, Lrf2;->h:Landroid/view/View;

    check-cast v6, Lcom/opera/android/ui/catalog/widget/OperaChip;

    iget-object v7, v6, Lcom/google/android/material/chip/Chip;->e:Ltx4;

    if-eqz v7, :cond_8e

    iget-object v8, v7, Ltx4;->N:Landroid/content/res/ColorStateList;

    if-eq v8, v5, :cond_8e

    iput-object v5, v7, Ltx4;->N:Landroid/content/res/ColorStateList;

    const/4 v8, 0x0

    iput-object v8, v7, Ltx4;->G0:Landroid/content/res/ColorStateList;

    invoke-virtual {v7}, Landroid/graphics/drawable/Drawable;->getState()[I

    move-result-object v8

    invoke-virtual {v7, v8}, Ltx4;->onStateChange([I)Z

    :cond_8e
    iget-object v7, v6, Lcom/google/android/material/chip/Chip;->e:Ltx4;

    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v6}, Lcom/google/android/material/chip/Chip;->l()V

    iget-object v6, p0, Liji;->o:Lrf2;

    iget-object v6, v6, Lrf2;->h:Landroid/view/View;

    check-cast v6, Lcom/opera/android/ui/catalog/widget/OperaChip;

    iget-object v6, v6, Lcom/google/android/material/chip/Chip;->e:Ltx4;

    if-eqz v6, :cond_bb

    const/4 v7, 0x1

    iput-boolean v7, v6, Ltx4;->T:Z

    iget-object v7, v6, Ltx4;->R:Landroid/content/res/ColorStateList;

    if-eq v7, v4, :cond_bb

    iput-object v4, v6, Ltx4;->R:Landroid/content/res/ColorStateList;

    invoke-virtual {v6}, Ltx4;->V()Z

    move-result v7

    if-eqz v7, :cond_b4

    iget-object v7, v6, Ltx4;->Q:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v7, v4}, Landroid/graphics/drawable/Drawable;->setTintList(Landroid/content/res/ColorStateList;)V

    :cond_b4
    invoke-virtual {v6}, Landroid/graphics/drawable/Drawable;->getState()[I

    move-result-object v7

    invoke-virtual {v6, v7}, Ltx4;->onStateChange([I)Z

    :cond_bb
    iget-object v6, p0, Liji;->o:Lrf2;

    iget-object v6, v6, Lrf2;->h:Landroid/view/View;

    check-cast v6, Lcom/opera/android/ui/catalog/widget/OperaChip;

    iget-object v6, v6, Lcom/google/android/material/chip/Chip;->e:Ltx4;

    if-eqz v6, :cond_dd

    iget-object v7, v6, Ltx4;->X:Landroid/content/res/ColorStateList;

    if-eq v7, v4, :cond_dd

    iput-object v4, v6, Ltx4;->X:Landroid/content/res/ColorStateList;

    invoke-virtual {v6}, Ltx4;->W()Z

    move-result v7

    if-eqz v7, :cond_d6

    iget-object v7, v6, Ltx4;->V:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v7, v4}, Landroid/graphics/drawable/Drawable;->setTintList(Landroid/content/res/ColorStateList;)V

    :cond_d6
    invoke-virtual {v6}, Landroid/graphics/drawable/Drawable;->getState()[I

    move-result-object v7

    invoke-virtual {v6, v7}, Ltx4;->onStateChange([I)Z

    :cond_dd
    iget-object v6, p0, Liji;->o:Lrf2;

    iget-object v6, v6, Lrf2;->h:Landroid/view/View;

    check-cast v6, Lcom/opera/android/ui/catalog/widget/OperaChip;

    invoke-virtual {v6, v4}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    iget-object v4, p0, Liji;->o:Lrf2;

    iget-object v4, v4, Lrf2;->h:Landroid/view/View;

    check-cast v4, Lcom/opera/android/ui/catalog/widget/OperaChip;

    iget-object v4, v4, Lcom/google/android/material/chip/Chip;->e:Ltx4;

    if-eqz v4, :cond_104

    iget-object v6, v4, Ltx4;->L:Landroid/content/res/ColorStateList;

    if-eq v6, v5, :cond_104

    iput-object v5, v4, Ltx4;->L:Landroid/content/res/ColorStateList;

    iget-boolean v6, v4, Ltx4;->L0:Z

    if-eqz v6, :cond_fd

    invoke-virtual {v4, v5}, Lzdd;->y(Landroid/content/res/ColorStateList;)V

    :cond_fd
    invoke-virtual {v4}, Landroid/graphics/drawable/Drawable;->getState()[I

    move-result-object v5

    invoke-virtual {v4, v5}, Ltx4;->onStateChange([I)Z

    :cond_104
    iget-object v4, p0, Liji;->o:Lrf2;

    iget-object v4, v4, Lrf2;->h:Landroid/view/View;

    check-cast v4, Lcom/opera/android/ui/catalog/widget/OperaChip;

    invoke-static {v1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v1

    iget-object v4, v4, Lcom/google/android/material/chip/Chip;->e:Ltx4;

    if-eqz v4, :cond_11f

    iget-object v5, v4, Ltx4;->I:Landroid/content/res/ColorStateList;

    if-eq v5, v1, :cond_11f

    iput-object v1, v4, Ltx4;->I:Landroid/content/res/ColorStateList;

    invoke-virtual {v4}, Landroid/graphics/drawable/Drawable;->getState()[I

    move-result-object v1

    invoke-virtual {v4, v1}, Ltx4;->onStateChange([I)Z

    :cond_11f
    iget-object v1, p0, Liji;->o:Lrf2;

    iget-object v1, v1, Lrf2;->i:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    iget-object v1, p0, Liji;->o:Lrf2;

    iget-object v1, v1, Lrf2;->k:Landroid/view/View;

    check-cast v1, Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {v2}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v4

    invoke-interface {v0}, Lmej;->getContext()Landroid/content/Context;

    move-result-object v5

    const v6, 0x7f0402af

    invoke-static {v6, v5, v3}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v3

    sget-object v5, Lf03;->i:[I

    sget-object v6, Lf03;->j:[I

    filled-new-array {v5, v6}, [[I

    move-result-object v5

    filled-new-array {v3, v4}, [I

    move-result-object v3

    new-instance v4, Landroid/content/res/ColorStateList;

    invoke-direct {v4, v5, v3}, Landroid/content/res/ColorStateList;-><init>([[I[I)V

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    iget-object v1, p0, Liji;->o:Lrf2;

    iget-object v1, v1, Lrf2;->k:Landroid/view/View;

    check-cast v1, Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {v1, v2}, Lcom/google/android/material/button/MaterialButton;->F(Landroid/content/res/ColorStateList;)V

    iget-object v1, p0, Liji;->o:Lrf2;

    iget-object v1, v1, Lrf2;->c:Landroid/view/View;

    check-cast v1, Lcom/opera/android/custom_views/StylingImageView;

    invoke-interface {v0}, Lmej;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-interface {v0}, Lmej;->getContext()Landroid/content/Context;

    move-result-object v3

    iget-object v4, p0, Liji;->u:Lkg7;

    invoke-virtual {v4, v3}, Lkg7;->i(Landroid/content/Context;)I

    move-result v3

    sget-object v4, Llg7;->a:[[I

    const v4, 0x7f080241

    invoke-static {v4, v2}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v4

    new-instance v5, Landroid/graphics/PorterDuffColorFilter;

    sget-object v6, Landroid/graphics/PorterDuff$Mode;->MULTIPLY:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {v5, v3, v6}, Landroid/graphics/PorterDuffColorFilter;-><init>(ILandroid/graphics/PorterDuff$Mode;)V

    invoke-virtual {v4, v5}, Landroid/graphics/drawable/Drawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    iget-object v2, p0, Liji;->u:Lkg7;

    invoke-interface {v0}, Lmej;->getContext()Landroid/content/Context;

    move-result-object v0

    const/4 v3, 0x2

    invoke-virtual {v2, v3, v0}, Lkg7;->h(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/opera/android/custom_views/StylingImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object v0, p0, Liji;->o:Lrf2;

    iget-object v0, v0, Lrf2;->f:Landroid/view/View;

    check-cast v0, Lcom/opera/android/downloads/SaveSheet$FilenameEditText;

    invoke-virtual {v0}, Landroid/view/View;->isFocused()Z

    move-result v0

    invoke-virtual {p0, v0}, Liji;->T(Z)V

    return-void
.end method

.method public final W()V
    .registers 5

    iget-object v0, p0, Liji;->e:Lfji;

    invoke-interface {v0}, Lfji;->b()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-lez v2, :cond_17

    iget-object v2, p0, Ldej;->b:Lmej;

    invoke-interface {v2}, Lmej;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v0, v1, v2}, Laik;->h(JLandroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    goto :goto_18

    :cond_17
    const/4 v0, 0x0

    :goto_18
    iget-object v1, p0, Liji;->i:Landroid/view/View;

    invoke-static {v1, v0}, Liji;->J(Landroid/view/View;Ljava/lang/String;)V

    iget-object v1, p0, Liji;->k:Landroid/view/View;

    invoke-static {v1, v0}, Liji;->J(Landroid/view/View;Ljava/lang/String;)V

    iget-object v1, p0, Liji;->m:Landroid/view/View;

    invoke-static {v1, v0}, Liji;->J(Landroid/view/View;Ljava/lang/String;)V

    iget-object p0, p0, Liji;->l:Landroid/view/View;

    invoke-static {p0, v0}, Liji;->J(Landroid/view/View;Ljava/lang/String;)V

    return-void
.end method

.method public final X()V
    .registers 5

    iget-object v0, p0, Liji;->g:Lfji;

    iget-object v1, p0, Liji;->i:Landroid/view/View;

    const/4 v2, 0x0

    const/16 v3, 0x8

    if-nez v0, :cond_26

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Liji;->k:Landroid/view/View;

    iget-boolean v1, p0, Liji;->r:Z

    if-nez v1, :cond_13

    move v2, v3

    :cond_13
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Liji;->j:Landroid/view/View;

    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Liji;->l:Landroid/view/View;

    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    iget-object p0, p0, Liji;->m:Landroid/view/View;

    invoke-virtual {p0, v3}, Landroid/view/View;->setVisibility(I)V

    return-void

    :cond_26
    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Liji;->k:Landroid/view/View;

    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Liji;->j:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Liji;->l:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    iget-object p0, p0, Liji;->m:Landroid/view/View;

    invoke-virtual {p0, v2}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method public final Z()Z
    .registers 12

    iget-object v0, p0, Liji;->c:Ldx3;

    invoke-static {v0}, Lr9n;->X(Landroid/content/Context;)Z

    move-result v1

    const/4 v2, 0x1

    if-nez v1, :cond_12

    const-string v1, "android.permission.WRITE_EXTERNAL_STORAGE"

    invoke-static {v0, v1}, Lfr3;->Q(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_12

    return v2

    :cond_12
    iget-object v1, p0, Liji;->p:Landroid/net/Uri;

    invoke-static {v0, v1}, Llg7;->e(Landroid/content/Context;Landroid/net/Uri;)Z

    move-result v1

    const/4 v3, 0x0

    if-nez v1, :cond_2f

    invoke-virtual {p0, v3}, Liji;->N(Z)V

    iget-object v0, p0, Ldej;->b:Lmej;

    invoke-interface {v0}, Lmej;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f1407b6

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Liji;->O(Ljava/lang/String;)V

    return v3

    :cond_2f
    iget-object v1, p0, Liji;->p:Landroid/net/Uri;

    const-string v4, "content"

    invoke-virtual {v1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v4, 0x0

    if-eqz v1, :cond_42

    invoke-virtual {p0, v4}, Liji;->O(Ljava/lang/String;)V

    return v2

    :cond_42
    iget-object v1, p0, Liji;->e:Lfji;

    invoke-interface {v1}, Lfji;->i()Z

    move-result v1

    const-wide/16 v5, 0x0

    if-eqz v1, :cond_53

    iget-object v1, p0, Liji;->e:Lfji;

    invoke-interface {v1}, Lfji;->b()J

    move-result-wide v7

    goto :goto_54

    :cond_53
    move-wide v7, v5

    :goto_54
    iget-object v1, p0, Liji;->p:Landroid/net/Uri;

    invoke-virtual {v1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Liji;->n(Ljava/lang/String;)J

    move-result-wide v9

    cmp-long v1, v9, v5

    if-gez v1, :cond_70

    invoke-virtual {p0, v2}, Liji;->N(Z)V

    const v1, 0x7f1405a3

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Liji;->O(Ljava/lang/String;)V

    return v3

    :cond_70
    cmp-long v1, v7, v9

    if-lez v1, :cond_82

    invoke-virtual {p0, v2}, Liji;->N(Z)V

    const v1, 0x7f140b49

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Liji;->O(Ljava/lang/String;)V

    return v3

    :cond_82
    invoke-virtual {p0, v4}, Liji;->O(Ljava/lang/String;)V

    return v2
.end method

.method public a(Landroid/content/Context;)Landroid/view/View;
    .registers 19

    move-object/from16 v0, p0

    invoke-static/range {p1 .. p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    const v2, 0x7f0d0111

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-virtual {v1, v2, v3, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    const v2, 0x7f0a026e

    invoke-static {v2, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    check-cast v5, Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;

    if-eqz v5, :cond_106

    const v2, 0x7f0a0309

    invoke-static {v2, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    move-object v8, v5

    check-cast v8, Lcom/opera/android/downloads/SaveSheet$FilenameEditText;

    if-eqz v8, :cond_106

    const v2, 0x7f0a030c

    invoke-static {v2, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    move-object v9, v5

    check-cast v9, Lcom/opera/android/widget/SideActionsLayout;

    if-eqz v9, :cond_106

    const v2, 0x7f0a030d

    invoke-static {v2, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    move-object v10, v5

    check-cast v10, Lcom/opera/android/custom_views/StylingImageView;

    if-eqz v10, :cond_106

    const v2, 0x7f0a0310

    invoke-static {v2, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    move-object v11, v5

    check-cast v11, Lcom/opera/android/ui/catalog/widget/OperaChip;

    if-eqz v11, :cond_106

    const v2, 0x7f0a0488

    invoke-static {v2, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    move-object v12, v5

    check-cast v12, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v12, :cond_106

    const v2, 0x7f0a051c

    invoke-static {v2, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v13

    if-eqz v13, :cond_106

    const v2, 0x7f0a0591

    invoke-static {v2, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    check-cast v5, Lcom/opera/android/ui/catalog/widget/OperaIconedMessage;

    if-eqz v5, :cond_106

    const v2, 0x7f0a07c6

    invoke-static {v2, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    move-object v14, v5

    check-cast v14, Landroid/widget/LinearLayout;

    if-eqz v14, :cond_106

    const v2, 0x7f0a08d2

    invoke-static {v2, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    move-object v15, v5

    check-cast v15, Lcom/google/android/material/button/MaterialButton;

    if-eqz v15, :cond_106

    const v2, 0x7f0a090b

    invoke-static {v2, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/LinearLayout;

    if-eqz v5, :cond_106

    move-object v7, v1

    check-cast v7, Landroid/widget/FrameLayout;

    new-instance v6, Lrf2;

    move-object/from16 v16, v7

    invoke-direct/range {v6 .. v16}, Lrf2;-><init>(Landroid/widget/FrameLayout;Lcom/opera/android/downloads/SaveSheet$FilenameEditText;Lcom/opera/android/widget/SideActionsLayout;Lcom/opera/android/custom_views/StylingImageView;Lcom/opera/android/ui/catalog/widget/OperaChip;Lcom/opera/android/custom_views/StylingTextView;Landroid/view/View;Landroid/widget/LinearLayout;Lcom/google/android/material/button/MaterialButton;Landroid/widget/FrameLayout;)V

    iput-object v6, v0, Liji;->o:Lrf2;

    const/4 v1, 0x1

    invoke-virtual {v9, v1, v4}, Lcom/opera/android/widget/SideActionsLayout;->h(ZZ)V

    iget-object v2, v0, Liji;->o:Lrf2;

    iget-object v2, v2, Lrf2;->f:Landroid/view/View;

    check-cast v2, Lcom/opera/android/downloads/SaveSheet$FilenameEditText;

    invoke-virtual {v2, v4}, Landroid/view/View;->setFocusable(Z)V

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setCursorVisible(Z)V

    new-instance v3, Lbji;

    invoke-direct {v3, v0, v4}, Lbji;-><init>(Liji;B)V

    invoke-virtual {v2, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v3, Lky4;

    invoke-direct {v3, v0, v1}, Lky4;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v2, v3}, Lcom/opera/android/custom_views/ObservableEditText;->m(Lz6f;)V

    new-instance v3, Lx39;

    invoke-direct {v3, v0, v1}, Lx39;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    new-instance v3, Lgji;

    invoke-direct {v3}, Ljava/lang/Object;-><init>()V

    new-array v5, v1, [Landroid/text/InputFilter;

    aput-object v3, v5, v4

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setFilters([Landroid/text/InputFilter;)V

    iput-object v9, v2, Lcom/opera/android/downloads/SaveSheet$FilenameEditText;->v:Lcom/opera/android/widget/SideActionsLayout;

    new-instance v3, Lmgf;

    const/16 v5, 0x17

    invoke-direct {v3, v0, v2, v5}, Lmgf;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object v5, v2, Lcom/opera/android/custom_views/OperaEditText;->q:Luk7;

    if-nez v5, :cond_e1

    new-instance v5, Luk7;

    invoke-direct {v5, v2}, Luk7;-><init>(Landroid/widget/TextView;)V

    iput-object v5, v2, Lcom/opera/android/custom_views/OperaEditText;->q:Luk7;

    :cond_e1
    iput-object v3, v5, Luk7;->b:Lmgf;

    iget-object v2, v0, Liji;->o:Lrf2;

    iget-object v2, v2, Lrf2;->k:Landroid/view/View;

    check-cast v2, Lcom/google/android/material/button/MaterialButton;

    new-instance v3, Ldji;

    invoke-direct {v3, v0, v4}, Ldji;-><init>(Liji;B)V

    invoke-virtual {v2, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v2, v0, Liji;->o:Lrf2;

    iget-object v2, v2, Lrf2;->h:Landroid/view/View;

    check-cast v2, Lcom/opera/android/ui/catalog/widget/OperaChip;

    new-instance v3, Lbji;

    invoke-direct {v3, v0, v1}, Lbji;-><init>(Liji;B)V

    invoke-virtual {v2, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, v0, Liji;->o:Lrf2;

    iget-object v0, v0, Lrf2;->b:Ljava/lang/Object;

    check-cast v0, Landroid/widget/FrameLayout;

    return-object v0

    :cond_106
    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    const-string v1, "Missing required view with ID: "

    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    return-object v3
.end method

.method public c(Lhjm;)V
    .registers 4

    iget-object v0, p0, Liji;->c:Ldx3;

    invoke-virtual {v0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    iget-object v1, p0, Liji;->d:Leji;

    invoke-virtual {v0, v1}, Landroid/app/Application;->unregisterActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    invoke-virtual {p0}, Liji;->g()V

    invoke-super {p0, p1}, Ldej;->c(Lhjm;)V

    return-void
.end method

.method public final d(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;II)Landroid/view/View;
    .registers 7

    const v0, 0x7f0d0113

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    const p2, 0x7f0a0322

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/ImageView;

    invoke-virtual {p2, p3}, Landroid/widget/ImageView;->setImageResource(I)V

    const p2, 0x7f0a0b6e

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/opera/android/downloads/SaveSheet$OptionTextAreaLayout;

    iget-object p0, p0, Ldej;->b:Lmej;

    invoke-interface {p0}, Lmej;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, p4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    iget-object p2, p2, Lcom/opera/android/downloads/SaveSheet$OptionTextAreaLayout;->d:Landroid/widget/TextView;

    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-object p1
.end method

.method public e(Z)V
    .registers 21

    move-object/from16 v0, p0

    iget-object v1, v0, Liji;->f:Lwjh;

    if-nez v1, :cond_17

    new-instance v1, Lglj;

    const v2, 0x7f1405dc

    const/16 v3, 0x9c4

    invoke-direct {v1, v2, v3}, Lglj;-><init>(II)V

    invoke-virtual {v0, v1}, Liji;->R(Lo93;)V

    invoke-virtual {v0}, Ldej;->b()V

    return-void

    :cond_17
    iget-object v1, v0, Liji;->o:Lrf2;

    iget-object v1, v1, Lrf2;->e:Landroid/view/View;

    check-cast v1, Landroid/widget/FrameLayout;

    new-instance v2, Lhai;

    const/16 v3, 0x11

    invoke-direct {v2, v3}, Lhai;-><init>(B)V

    invoke-static {v1, v2}, Lq9n;->I(Landroid/view/View;Lp9n;)V

    iget-object v1, v0, Liji;->o:Lrf2;

    iget-object v1, v1, Lrf2;->c:Landroid/view/View;

    check-cast v1, Lcom/opera/android/custom_views/StylingImageView;

    if-eqz p1, :cond_3a

    new-instance v2, Laji;

    invoke-direct {v2, v0}, Laji;-><init>(Liji;)V

    const-wide/16 v3, 0xc8

    invoke-virtual {v1, v2, v3, v4}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void

    :cond_3a
    iget-object v2, v0, Liji;->f:Lwjh;

    invoke-virtual {v0, v2}, Liji;->v(Lwjh;)V

    iget-object v3, v0, Liji;->f:Lwjh;

    iget-object v4, v0, Liji;->e:Lfji;

    iget-object v5, v0, Liji;->c:Ldx3;

    iget-object v6, v0, Liji;->u:Lkg7;

    invoke-virtual {v6, v5}, Lkg7;->i(Landroid/content/Context;)I

    move-result v15

    invoke-virtual {v1}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v9

    invoke-static {v1}, Lq9n;->r(Landroid/view/View;)Landroid/graphics/Rect;

    move-result-object v5

    new-instance v6, Laji;

    invoke-direct {v6, v0, v2}, Laji;-><init>(Liji;Lwjh;)V

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v2, v3, Lwjh;->f:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/BrowserActivity;

    new-instance v10, Landroid/graphics/PointF;

    invoke-virtual {v5}, Landroid/graphics/Rect;->exactCenterX()F

    move-result v7

    invoke-virtual {v5}, Landroid/graphics/Rect;->exactCenterY()F

    move-result v8

    invoke-direct {v10, v7, v8}, Landroid/graphics/PointF;-><init>(FF)V

    new-instance v11, Landroid/graphics/PointF;

    invoke-direct {v11}, Landroid/graphics/PointF;-><init>()V

    invoke-virtual {v5}, Landroid/graphics/Rect;->width()I

    move-result v5

    int-to-float v5, v5

    const/high16 v7, 0x40000000    # 2.0f

    div-float v14, v5, v7

    sget v5, Lcom/opera/android/BrowserActivity;->E1:I

    const v5, 0x7f0a0189

    invoke-virtual {v2, v5}, Lfp1;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/ImageView;

    if-nez v7, :cond_8b

    invoke-virtual {v2}, Lcom/opera/android/BrowserActivity;->u0()Landroid/widget/ImageView;

    move-result-object v7

    :cond_8b
    invoke-static {v7}, Lq9n;->r(Landroid/view/View;)Landroid/graphics/Rect;

    move-result-object v8

    invoke-virtual {v7}, Landroid/view/View;->getRootView()Landroid/view/View;

    move-result-object v7

    invoke-static {v7}, Lq9n;->r(Landroid/view/View;)Landroid/graphics/Rect;

    move-result-object v7

    iget-object v12, v2, Lcom/opera/android/BrowserActivity;->z:Lz43;

    if-nez v12, :cond_9c

    const/4 v12, 0x0

    :cond_9c
    invoke-virtual {v12}, Lz43;->f()Landroid/widget/ImageView;

    move-result-object v12

    if-eqz v12, :cond_aa

    const v12, 0x7f0a0109

    invoke-virtual {v2, v12}, Lfp1;->findViewById(I)Landroid/view/View;

    move-result-object v12

    goto :goto_b1

    :cond_aa
    const v12, 0x7f0a073e

    invoke-virtual {v2, v12}, Lfp1;->findViewById(I)Landroid/view/View;

    move-result-object v12

    :goto_b1
    invoke-static {v12}, Lq9n;->r(Landroid/view/View;)Landroid/graphics/Rect;

    move-result-object v12

    invoke-virtual {v2}, Lfp1;->getResources()Landroid/content/res/Resources;

    move-result-object v13

    const v5, 0x7f0705c6

    invoke-virtual {v13, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v5

    invoke-virtual {v12}, Landroid/graphics/Rect;->height()I

    move-result v13

    move/from16 v16, v5

    invoke-virtual {v12}, Landroid/graphics/Rect;->width()I

    move-result v5

    if-le v13, v5, :cond_ec

    invoke-virtual {v8}, Landroid/graphics/Rect;->centerX()I

    move-result v5

    invoke-virtual {v7}, Landroid/graphics/Rect;->centerX()I

    move-result v7

    if-ge v5, v7, :cond_dd

    iget v5, v12, Landroid/graphics/Rect;->right:I

    add-int v5, v5, v16

    int-to-float v5, v5

    add-float/2addr v5, v14

    goto :goto_e3

    :cond_dd
    iget v5, v12, Landroid/graphics/Rect;->left:I

    sub-int v5, v5, v16

    int-to-float v5, v5

    sub-float/2addr v5, v14

    :goto_e3
    iput v5, v11, Landroid/graphics/PointF;->x:F

    invoke-virtual {v8}, Landroid/graphics/Rect;->exactCenterY()F

    move-result v5

    iput v5, v11, Landroid/graphics/PointF;->y:F

    goto :goto_110

    :cond_ec
    invoke-virtual {v8}, Landroid/graphics/Rect;->centerY()I

    move-result v5

    invoke-virtual {v7}, Landroid/graphics/Rect;->centerY()I

    move-result v7

    if-ge v5, v7, :cond_f8

    const/4 v5, 0x1

    goto :goto_f9

    :cond_f8
    const/4 v5, 0x0

    :goto_f9
    invoke-virtual {v8}, Landroid/graphics/Rect;->exactCenterX()F

    move-result v7

    iput v7, v11, Landroid/graphics/PointF;->x:F

    if-eqz v5, :cond_108

    iget v5, v12, Landroid/graphics/Rect;->bottom:I

    add-int v5, v5, v16

    int-to-float v5, v5

    add-float/2addr v5, v14

    goto :goto_10e

    :cond_108
    iget v5, v12, Landroid/graphics/Rect;->top:I

    sub-int v5, v5, v16

    int-to-float v5, v5

    sub-float/2addr v5, v14

    :goto_10e
    iput v5, v11, Landroid/graphics/PointF;->y:F

    :goto_110
    iget-object v5, v3, Lwjh;->b:Ljava/lang/Object;

    move-object v8, v5

    check-cast v8, Lcom/opera/android/BrowserActivity;

    const v5, 0x7f0a0189

    invoke-virtual {v2, v5}, Lfp1;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/ImageView;

    if-eqz v5, :cond_122

    :goto_120
    move-object v13, v5

    goto :goto_127

    :cond_122
    invoke-virtual {v2}, Lcom/opera/android/BrowserActivity;->u0()Landroid/widget/ImageView;

    move-result-object v5

    goto :goto_120

    :goto_127
    iget-object v2, v3, Lwjh;->c:Ljava/lang/Object;

    move-object/from16 v16, v2

    check-cast v16, Lqim;

    iget-object v2, v3, Lwjh;->d:Ljava/lang/Object;

    move-object/from16 v17, v2

    check-cast v17, Lb7f;

    new-instance v2, Lghf;

    invoke-direct {v2, v3, v4, v6}, Lghf;-><init>(Lwjh;Lfji;Laji;)V

    sget v5, Lota;->A:I

    invoke-static {v13}, Lq9n;->r(Landroid/view/View;)Landroid/graphics/Rect;

    move-result-object v5

    new-instance v12, Landroid/graphics/PointF;

    invoke-virtual {v5}, Landroid/graphics/Rect;->exactCenterX()F

    move-result v6

    invoke-virtual {v5}, Landroid/graphics/Rect;->exactCenterY()F

    move-result v5

    invoke-direct {v12, v6, v5}, Landroid/graphics/PointF;-><init>(FF)V

    new-instance v7, Lota;

    move-object/from16 v18, v2

    invoke-direct/range {v7 .. v18}, Lota;-><init>(Lcom/opera/android/BrowserActivity;Landroid/graphics/drawable/Drawable;Landroid/graphics/PointF;Landroid/graphics/PointF;Landroid/graphics/PointF;Landroid/widget/ImageView;FILqim;Lb7f;Lghf;)V

    :try_start_152
    iget-object v2, v7, Lota;->v:Landroid/view/WindowManager;

    iget-object v5, v7, Lota;->w:Landroid/view/WindowManager$LayoutParams;

    invoke-interface {v2, v7, v5}, Landroid/view/ViewManager;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    :try_end_159
    .catch Ljava/lang/Exception; {:try_start_152 .. :try_end_159} :catch_159

    :catch_159
    iget-object v2, v3, Lwjh;->e:Ljava/lang/Object;

    check-cast v2, Ljava/util/HashMap;

    iget-object v3, v7, Lota;->c:Lmta;

    invoke-virtual {v2, v4, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v2, Lvl9;

    const/16 v3, 0x1c

    invoke-direct {v2, v0, v1, v3}, Lvl9;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v1, v2}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    new-instance v2, Lvl9;

    const/16 v3, 0x1d

    invoke-direct {v2, v0, v3}, Lvl9;-><init>(Ljava/lang/Object;B)V

    const-wide/16 v3, 0x12c

    invoke-virtual {v1, v2, v3, v4}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method public final f()V
    .registers 9

    iget-boolean v0, p0, Liji;->v:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    invoke-virtual {p0}, Liji;->B()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Liji;->v:Z

    iget-object v1, p0, Liji;->o:Lrf2;

    iget-object v1, v1, Lrf2;->f:Landroid/view/View;

    check-cast v1, Lcom/opera/android/downloads/SaveSheet$FilenameEditText;

    invoke-virtual {v1, v0}, Landroid/view/View;->setFocusableInTouchMode(Z)V

    invoke-virtual {v1}, Landroid/view/View;->requestFocus()Z

    iget-object v2, p0, Liji;->o:Lrf2;

    iget-object v2, v2, Lrf2;->g:Landroid/view/View;

    check-cast v2, Lcom/opera/android/widget/SideActionsLayout;

    const/4 v3, 0x0

    invoke-virtual {v2, v3, v0}, Lcom/opera/android/widget/SideActionsLayout;->h(ZZ)V

    invoke-virtual {p0, v0}, Liji;->T(Z)V

    iget-object v2, p0, Liji;->o:Lrf2;

    iget-object v2, v2, Lrf2;->h:Landroid/view/View;

    check-cast v2, Lcom/opera/android/ui/catalog/widget/OperaChip;

    const/4 v4, 0x4

    invoke-virtual {v2, v4}, Landroid/view/View;->setVisibility(I)V

    iget-object v2, p0, Liji;->o:Lrf2;

    iget-object v2, v2, Lrf2;->k:Landroid/view/View;

    check-cast v2, Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    iget-object v2, p0, Liji;->o:Lrf2;

    iget-object v2, v2, Lrf2;->i:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setCursorVisible(Z)V

    invoke-virtual {p0}, Liji;->p()Ljava/lang/String;

    move-result-object v2

    sget-object v4, Laik;->a:[Ljava/lang/String;

    invoke-static {v2}, Lehi;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/opera/android/custom_views/OperaEditText;->g(Ljava/lang/String;)V

    invoke-virtual {p0}, Liji;->p()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ls29;->d(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Liji;->o:Lrf2;

    iget-object v5, v5, Lrf2;->f:Landroid/view/View;

    check-cast v5, Lcom/opera/android/downloads/SaveSheet$FilenameEditText;

    invoke-virtual {v5}, Landroid/widget/TextView;->length()I

    move-result v6

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_72

    move v4, v3

    goto :goto_77

    :cond_72
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    add-int/2addr v4, v0

    :goto_77
    sub-int/2addr v2, v4

    invoke-static {v6, v2}, Ljava/lang/Math;->min(II)I

    move-result v0

    invoke-virtual {v5, v3, v0}, Landroid/widget/EditText;->setSelection(II)V

    new-instance v0, Lq2g;

    const/16 v2, 0x1c

    invoke-direct {v0, p0, v1, v2}, Lq2g;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object p0, p0, Ldej;->b:Lmej;

    invoke-interface {p0}, Lmej;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const v1, 0x7f0c0087

    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result p0

    int-to-long v1, p0

    invoke-static {v0, v1, v2}, Lvml;->d(Ljava/lang/Runnable;J)V

    return-void
.end method

.method public g()V
    .registers 1

    return-void
.end method

.method public abstract h(Landroid/net/Uri;Ljava/lang/String;)V
.end method

.method public j(Lwii;)V
    .registers 2

    return-void
.end method

.method public k(Lfji;Lvwh;)V
    .registers 3

    return-void
.end method

.method public final l(Z)V
    .registers 5

    iget-boolean v0, p0, Liji;->v:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x0

    iput-boolean v0, p0, Liji;->v:Z

    invoke-virtual {p0, v0}, Liji;->T(Z)V

    iget-object v1, p0, Liji;->o:Lrf2;

    iget-object v1, v1, Lrf2;->h:Landroid/view/View;

    check-cast v1, Lcom/opera/android/ui/catalog/widget/OperaChip;

    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    iget-object v1, p0, Liji;->o:Lrf2;

    iget-object v1, v1, Lrf2;->k:Landroid/view/View;

    check-cast v1, Lcom/google/android/material/button/MaterialButton;

    const/4 v2, 0x4

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    iget-object v1, p0, Liji;->o:Lrf2;

    iget-object v1, v1, Lrf2;->i:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    iget-object v1, p0, Liji;->o:Lrf2;

    iget-object v1, v1, Lrf2;->g:Landroid/view/View;

    check-cast v1, Lcom/opera/android/widget/SideActionsLayout;

    const/4 v2, 0x1

    invoke-virtual {v1, v2, v0}, Lcom/opera/android/widget/SideActionsLayout;->h(ZZ)V

    iget-object v1, p0, Liji;->o:Lrf2;

    iget-object v1, v1, Lrf2;->f:Landroid/view/View;

    check-cast v1, Lcom/opera/android/downloads/SaveSheet$FilenameEditText;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setCursorVisible(Z)V

    invoke-virtual {v1, v0}, Landroid/view/View;->setFocusable(Z)V

    invoke-virtual {v1}, Landroid/view/View;->clearFocus()V

    invoke-static {v1}, Lq9n;->u(Landroid/view/View;)Z

    if-eqz p1, :cond_52

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Liji;->n:Ljava/lang/String;

    invoke-virtual {p0, v2}, Liji;->m(Z)V

    :cond_52
    const/4 p1, 0x0

    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p0}, Liji;->t()V

    return-void
.end method

.method public final m(Z)V
    .registers 4

    iget-object v0, p0, Liji;->n:Ljava/lang/String;

    if-nez v0, :cond_17

    iget-object v0, p0, Liji;->e:Lfji;

    invoke-interface {v0}, Lfji;->d()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Liji;->e:Lfji;

    if-eqz v0, :cond_13

    invoke-interface {v1}, Lfji;->d()Ljava/lang/String;

    move-result-object v0

    goto :goto_17

    :cond_13
    invoke-interface {v1}, Lfji;->getFileName()Ljava/lang/String;

    move-result-object v0

    :cond_17
    :goto_17
    iget-object v1, p0, Liji;->p:Landroid/net/Uri;

    invoke-virtual {p0, v1, v0}, Liji;->o(Landroid/net/Uri;Ljava/lang/String;)Lfji;

    move-result-object v0

    iput-object v0, p0, Liji;->g:Lfji;

    if-eqz p1, :cond_24

    invoke-virtual {p0}, Liji;->X()V

    :cond_24
    return-void
.end method

.method public abstract n(Ljava/lang/String;)J
.end method

.method public o(Landroid/net/Uri;Ljava/lang/String;)Lfji;
    .registers 3

    const/4 p0, 0x0

    return-object p0
.end method

.method public final p()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Liji;->n:Ljava/lang/String;

    if-eqz v0, :cond_5

    return-object v0

    :cond_5
    iget-object p0, p0, Liji;->e:Lfji;

    invoke-interface {p0}, Lfji;->getFileName()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public q(Landroid/net/Uri;)Lfji;
    .registers 2

    const/4 p0, 0x0

    return-object p0
.end method

.method public final r(Lfji;Lwjh;)V
    .registers 12

    iget-object v0, p0, Ldej;->b:Lmej;

    invoke-interface {v0}, Lmej;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    iput-object p1, p0, Liji;->e:Lfji;

    iput-object p2, p0, Liji;->f:Lwjh;

    iget-object p1, p0, Liji;->o:Lrf2;

    iget-object p1, p1, Lrf2;->d:Landroid/view/View;

    check-cast p1, Landroid/widget/LinearLayout;

    invoke-virtual {p0}, Liji;->M()Z

    move-result p2

    const/4 v2, 0x1

    if-eqz p2, :cond_2d

    const p2, 0x7f0805b8

    const v3, 0x7f140d27

    invoke-virtual {p0, v1, p1, p2, v3}, Liji;->d(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object p2

    new-instance v3, Ldji;

    invoke-direct {v3, p0, v2}, Ldji;-><init>(Liji;B)V

    invoke-virtual {p2, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_2d
    const p2, 0x7f0805a7

    const v3, 0x7f14061c

    invoke-virtual {p0, v1, p1, p2, v3}, Liji;->d(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object v4

    iput-object v4, p0, Liji;->k:Landroid/view/View;

    new-instance v5, Ldji;

    const/4 v6, 0x4

    invoke-direct {v5, p0, v6}, Ldji;-><init>(Liji;B)V

    invoke-virtual {v4, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v4, 0x7f14059f

    const v5, 0x7f080543

    invoke-virtual {p0, v1, p1, v5, v4}, Liji;->d(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object v4

    new-instance v6, Llte;

    const/4 v7, 0x0

    invoke-direct {v6, p0, v7, v2}, Llte;-><init>(Lndc;Ljava/lang/Object;B)V

    invoke-virtual {v4, v6}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iput-object v4, p0, Liji;->i:Landroid/view/View;

    invoke-virtual {p0, v1, p1, p2, v3}, Liji;->d(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object p2

    iput-object p2, p0, Liji;->j:Landroid/view/View;

    new-instance v3, Ldji;

    const/4 v4, 0x5

    invoke-direct {v3, p0, v4}, Ldji;-><init>(Liji;B)V

    invoke-virtual {p2, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Liji;->K()Z

    move-result p2

    const/4 v3, 0x2

    if-eqz p2, :cond_7f

    const p2, 0x7f0803ec

    const v4, 0x7f1401dc

    invoke-virtual {p0, v1, p1, p2, v4}, Liji;->d(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object p2

    new-instance v4, Ldji;

    invoke-direct {v4, p0, v3}, Ldji;-><init>(Liji;B)V

    invoke-virtual {p2, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_7f
    new-instance p2, Lwii;

    const/4 v4, 0x3

    invoke-direct {p2, p0, v4}, Lwii;-><init>(Liji;B)V

    const v6, 0x7f0805d4

    const v8, 0x7f1405af

    invoke-virtual {p0, v1, p1, v6, v8}, Liji;->d(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object v6

    new-instance v8, Llte;

    invoke-direct {v8, p0, p2, v2}, Llte;-><init>(Lndc;Ljava/lang/Object;B)V

    invoke-virtual {v6, v8}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iput-object v6, p0, Liji;->m:Landroid/view/View;

    new-instance p2, Lwii;

    const/4 v6, 0x0

    invoke-direct {p2, p0, v6}, Lwii;-><init>(Liji;B)V

    const v8, 0x7f1405b6

    invoke-virtual {p0, v1, p1, v5, v8}, Liji;->d(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object v5

    new-instance v8, Llte;

    invoke-direct {v8, p0, p2, v2}, Llte;-><init>(Lndc;Ljava/lang/Object;B)V

    invoke-virtual {v5, v8}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iput-object v5, p0, Liji;->l:Landroid/view/View;

    new-instance p2, Landroid/widget/LinearLayout;

    invoke-interface {v0}, Lmej;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-direct {p2, v5}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {p2, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const v2, 0x7f080591

    const v5, 0x7f14041e

    invoke-virtual {p0, v1, p2, v2, v5}, Liji;->d(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object v2

    new-instance v5, Ldji;

    const/4 v8, 0x6

    invoke-direct {v5, p0, v8}, Ldji;-><init>(Liji;B)V

    invoke-virtual {v2, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-interface {v0}, Lmej;->getContext()Landroid/content/Context;

    move-result-object v2

    sget-object v5, Llg7;->a:[[I

    new-instance v5, Landroid/content/Intent;

    const-string v8, "android.settings.INTERNAL_STORAGE_SETTINGS"

    invoke-direct {v5, v8}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    invoke-virtual {v2, v5, v6}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-lez v2, :cond_f4

    const/high16 v2, 0x10000000

    invoke-virtual {v5, v2}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    move-object v7, v5

    :cond_f4
    if-eqz v7, :cond_108

    const v2, 0x7f080540

    const v5, 0x7f140ea2

    invoke-virtual {p0, v1, p2, v2, v5}, Liji;->d(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object v2

    new-instance v5, Llte;

    invoke-direct {v5, p0, v7, v3}, Llte;-><init>(Lndc;Ljava/lang/Object;B)V

    invoke-virtual {v2, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_108
    new-instance v2, Landroid/widget/FrameLayout;

    invoke-interface {v0}, Lmej;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Liji;->h:Landroid/widget/FrameLayout;

    const/16 v3, 0x8

    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    iget-object v2, p0, Liji;->h:Landroid/widget/FrameLayout;

    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;

    const/16 v5, 0x30

    const/4 v7, -0x1

    invoke-direct {v3, v7, v6, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {v2, p2, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object p2, p0, Liji;->h:Landroid/widget/FrameLayout;

    new-instance v2, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v2, v7, v6}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {p1, p2, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    const p2, 0x7f080522

    const v2, 0x7f1403bf

    invoke-virtual {p0, v1, p1, p2, v2}, Liji;->d(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object p1

    new-instance p2, Ldji;

    invoke-direct {p2, p0, v4}, Ldji;-><init>(Liji;B)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    sget-object p1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object p1, p0, Liji;->c:Ldx3;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p2

    check-cast p2, Lcom/opera/android/OperaApplication;

    invoke-virtual {p2}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object p2

    invoke-virtual {p2}, Lcom/opera/android/settings/SettingsManager;->m()Landroid/net/Uri;

    move-result-object p2

    invoke-static {p1, p2}, Llg7;->e(Landroid/content/Context;Landroid/net/Uri;)Z

    move-result v1

    if-nez v1, :cond_161

    invoke-static {}, Ls29;->c()Ljava/io/File;

    move-result-object p2

    invoke-static {p2}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object p2

    :cond_161
    iput-object p2, p0, Liji;->p:Landroid/net/Uri;

    invoke-virtual {p0}, Liji;->W()V

    invoke-virtual {p0, v6}, Liji;->m(Z)V

    iget-object p2, p0, Liji;->g:Lfji;

    if-eqz p2, :cond_175

    iget-object p2, p0, Liji;->e:Lfji;

    invoke-interface {p2}, Lfji;->d()Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Liji;->n:Ljava/lang/String;

    :cond_175
    invoke-virtual {p0}, Liji;->t()V

    iget-object p2, p0, Liji;->o:Lrf2;

    iget-object p2, p2, Lrf2;->h:Landroid/view/View;

    check-cast p2, Lcom/opera/android/ui/catalog/widget/OperaChip;

    invoke-interface {v0}, Lmej;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Liji;->p:Landroid/net/Uri;

    invoke-static {v0, v1}, Lv61;->b(Landroid/content/Context;Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p2, p0, Liji;->u:Lkg7;

    invoke-virtual {p0, p2}, Liji;->L(Lkg7;)Z

    move-result p2

    iput-boolean p2, p0, Liji;->r:Z

    invoke-virtual {p0}, Liji;->X()V

    invoke-virtual {p1}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object p1

    iget-object p2, p0, Liji;->d:Leji;

    invoke-virtual {p1, p2}, Landroid/app/Application;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    iget-object p1, p0, Liji;->o:Lrf2;

    iget-object p1, p1, Lrf2;->g:Landroid/view/View;

    check-cast p1, Lcom/opera/android/widget/SideActionsLayout;

    new-instance p2, Lkkf;

    const/16 v0, 0xc

    invoke-direct {p2, p0, v0}, Lkkf;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object p0

    if-nez p0, :cond_1b3

    return-void

    :cond_1b3
    invoke-static {p0, p1, p2}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    return-void
.end method

.method public s(Lgg7;)V
    .registers 2

    invoke-virtual {p1}, Lgg7;->run()V

    return-void
.end method

.method public final t()V
    .registers 4

    iget-object v0, p0, Liji;->o:Lrf2;

    iget-object v0, v0, Lrf2;->f:Landroid/view/View;

    check-cast v0, Lcom/opera/android/downloads/SaveSheet$FilenameEditText;

    invoke-virtual {p0}, Liji;->p()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Laik;->a:[Ljava/lang/String;

    invoke-static {v1}, Lehi;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/opera/android/custom_views/OperaEditText;->g(Ljava/lang/String;)V

    invoke-virtual {p0}, Liji;->p()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Liji;->e:Lfji;

    invoke-interface {v1}, Lfji;->c()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Llg7;->a:[[I

    invoke-static {}, Lc5o;->m()Lc5o;

    move-result-object v2

    invoke-virtual {v2, v0, v1}, Lc5o;->o(Ljava/lang/String;Ljava/lang/String;)Lo29;

    move-result-object v0

    invoke-static {v0}, Llg7;->g(Lo29;)Lkg7;

    move-result-object v0

    iput-object v0, p0, Liji;->u:Lkg7;

    invoke-virtual {p0}, Liji;->V()V

    return-void
.end method

.method public u()V
    .registers 1

    return-void
.end method

.method public v(Lwjh;)V
    .registers 2

    return-void
.end method

.method public w(Landroid/content/Context;Lwii;)V
    .registers 3

    return-void
.end method

.method public y()V
    .registers 1

    return-void
.end method

.method public z()V
    .registers 1

    return-void
.end method
