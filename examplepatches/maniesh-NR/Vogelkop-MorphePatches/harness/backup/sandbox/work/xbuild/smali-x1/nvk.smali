.class public final Lnvk;
.super Lblb;
.source "SourceFile"


# instance fields
.field public final e:I

.field public final f:I

.field public final g:I

.field public final h:Landroid/graphics/Path;

.field public i:Landroid/graphics/drawable/Drawable;

.field public final j:Landroid/graphics/Rect;

.field public final k:Landroid/graphics/Rect;

.field public final l:Landroid/graphics/Rect;

.field public final m:Landroid/graphics/Rect;

.field public final n:Landroid/graphics/Paint;

.field public final o:Landroid/graphics/Paint;

.field public final p:Landroid/text/TextPaint;

.field public final q:Ljvk;

.field public final r:Ljava/util/HashMap;

.field public final s:[Lhvk;

.field public t:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljvk;)V
    .registers 6

    invoke-direct {p0}, Lblb;-><init>()V

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lnvk;->j:Landroid/graphics/Rect;

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lnvk;->k:Landroid/graphics/Rect;

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lnvk;->l:Landroid/graphics/Rect;

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lnvk;->m:Landroid/graphics/Rect;

    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lnvk;->n:Landroid/graphics/Paint;

    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lnvk;->o:Landroid/graphics/Paint;

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Lnvk;->r:Ljava/util/HashMap;

    const/4 v1, 0x2

    new-array v1, v1, [Lhvk;

    iput-object v1, p0, Lnvk;->s:[Lhvk;

    const/high16 v1, 0x41400000    # 12.0f

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-static {v1, v2}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v1

    iput v1, p0, Lnvk;->e:I

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-static {v1, v2}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v1

    iput v1, p0, Lnvk;->f:I

    const/high16 v1, 0x40800000    # 4.0f

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-static {v1, v2}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v1

    iput v1, p0, Lnvk;->g:I

    new-instance v1, Landroid/graphics/Path;

    invoke-direct {v1}, Landroid/graphics/Path;-><init>()V

    iput-object v1, p0, Lnvk;->h:Landroid/graphics/Path;

    iput-object p2, p0, Lnvk;->q:Ljvk;

    const p2, 0x7f0600a8

    invoke-virtual {p1, p2}, Landroid/content/Context;->getColor(I)I

    move-result p2

    invoke-virtual {v0, p2}, Landroid/graphics/Paint;->setColor(I)V

    new-instance p2, Landroid/text/TextPaint;

    const/4 v0, 0x1

    invoke-direct {p2, v0}, Landroid/text/TextPaint;-><init>(I)V

    iput-object p2, p0, Lnvk;->p:Landroid/text/TextPaint;

    const p0, 0x7f0409b0

    const v0, 0x7f150280

    invoke-static {p0, p1, v0}, Lf03;->E(ILandroid/content/Context;I)I

    move-result p0

    invoke-virtual {p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v0

    sget-object v1, Lzhh;->y:[I

    invoke-virtual {v0, p0, v1}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes(I[I)Landroid/content/res/TypedArray;

    move-result-object p0

    :try_start_8c
    invoke-virtual {p2}, Landroid/graphics/Paint;->getTextSize()F

    move-result v0

    float-to-int v0, v0

    const/4 v1, 0x0

    invoke-virtual {p0, v1, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p2, v0}, Landroid/graphics/Paint;->setTextSize(F)V

    const/16 v0, 0xc

    invoke-virtual {p0, v0}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v2

    if-eqz v2, :cond_b9

    const/4 v2, -0x1

    invoke-virtual {p0, v0, v2}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v0

    if-eq v0, v2, :cond_ae

    invoke-static {v0, p1}, Landroidx/core/content/res/ResourcesCompat;->b(ILandroid/content/Context;)Landroid/graphics/Typeface;

    move-result-object p1

    goto :goto_ba

    :cond_ae
    const/16 p1, 0xa

    invoke-virtual {p0, p1}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1, v1}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object p1

    goto :goto_ba

    :cond_b9
    const/4 p1, 0x0

    :goto_ba
    if-nez p1, :cond_c0

    invoke-virtual {p2}, Landroid/graphics/Paint;->getTypeface()Landroid/graphics/Typeface;

    move-result-object p1

    :cond_c0
    invoke-virtual {p2, p1}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;
    :try_end_c3
    .catchall {:try_start_8c .. :try_end_c3} :catchall_c7

    invoke-virtual {p0}, Landroid/content/res/TypedArray;->recycle()V

    return-void

    :catchall_c7
    move-exception p1

    invoke-virtual {p0}, Landroid/content/res/TypedArray;->recycle()V

    throw p1
.end method

.method public static v(I)Lmvk;
    .registers 7

    new-instance v0, Lmvk;

    new-instance v1, Li3d;

    const-string v2, "states/on error"

    const v3, 0x7f0402b2

    invoke-direct {v1, v2, v3}, Li3d;-><init>(Ljava/lang/String;I)V

    filled-new-array {v1}, [Li3d;

    move-result-object v5

    const v1, 0x7f040922

    const v3, 0x7f040923

    const v4, 0x7f13003d

    move v2, p0

    invoke-direct/range {v0 .. v5}, Lmvk;-><init>(IIII[Li3d;)V

    return-object v0
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .registers 3

    iget-object p0, p0, Lnvk;->r:Ljava/util/HashMap;

    invoke-virtual {p0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_a
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1a

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Livk;

    invoke-virtual {v0, p1}, Livk;->a(Landroid/view/View;)V

    goto :goto_a

    :cond_1a
    return-void
.end method

.method public final d(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/i;)V
    .registers 8

    invoke-super {p0, p1, p2}, Lblb;->d(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/i;)V

    iget-object p1, p0, Lnvk;->r:Ljava/util/HashMap;

    invoke-virtual {p1}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_d
    :goto_d
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3f

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Livk;

    iget-object v1, v0, Livk;->e:Landroid/graphics/drawable/Drawable;

    instance-of v2, v1, Lf3d;

    if-eqz v2, :cond_d

    check-cast v1, Lf3d;

    iget-object v2, v1, Lf3d;->e:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    iget-object v2, v1, Lf3d;->b:Lp3d;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Lp3d;->j(Z)V

    invoke-virtual {v2}, Lp3d;->f()Z

    move-result v4

    invoke-virtual {v2, v4}, Lp3d;->g(Z)V

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->isVisible()Z

    move-result v2

    if-nez v2, :cond_3b

    iput v3, v1, Lf3d;->E:I

    :cond_3b
    const/4 v1, 0x0

    iput-boolean v1, v0, Livk;->j:Z

    goto :goto_d

    :cond_3f
    iget-object p1, p2, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/ViewPropertyAnimator;->translationZ(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/ViewPropertyAnimator;->start()V

    iget-object p0, p0, Lnvk;->q:Ljvk;

    invoke-interface {p0}, Ljvk;->C()Z

    move-result p0

    if-eqz p0, :cond_5b

    iget-object p0, p2, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Landroid/view/View;->setClipBounds(Landroid/graphics/Rect;)V

    :cond_5b
    return-void
.end method

.method public final h(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/i;)I
    .registers 3

    iget-boolean p1, p0, Lnvk;->t:Z

    if-eqz p1, :cond_8

    const p0, 0x30003

    return p0

    :cond_8
    iget-object p0, p0, Lnvk;->q:Ljvk;

    invoke-interface {p0, p2}, Ljvk;->n(Landroidx/recyclerview/widget/i;)Z

    move-result p0

    if-nez p0, :cond_12

    const/4 p0, 0x0

    return p0

    :cond_12
    const/16 p0, 0xc0c

    return p0
.end method

.method public final i(Landroidx/recyclerview/widget/i;)F
    .registers 2

    iget-object p0, p1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result p0

    int-to-float p0, p0

    iget-object p1, p1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result p1

    int-to-float p1, p1

    div-float/2addr p0, p1

    const p1, 0x3e4ccccd    # 0.2f

    mul-float/2addr p0, p1

    return p0
.end method

.method public final j(Landroidx/recyclerview/widget/i;)F
    .registers 2

    iget-object p0, p1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result p0

    int-to-float p0, p0

    iget-object p1, p1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result p1

    int-to-float p1, p1

    div-float/2addr p0, p1

    const/high16 p1, 0x3f000000    # 0.5f

    mul-float/2addr p0, p1

    return p0
.end method

.method public final n(I)Z
    .registers 2

    invoke-virtual {p0, p1}, Lnvk;->x(I)Lhvk;

    move-result-object p0

    if-nez p0, :cond_8

    const/4 p0, 0x1

    return p0

    :cond_8
    const/4 p0, 0x0

    return p0
.end method

.method public final o(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/i;FFIZ)V
    .registers 12

    invoke-super/range {p0 .. p7}, Lblb;->o(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/i;FFIZ)V

    move p5, p7

    float-to-int p6, p4

    if-eqz p6, :cond_24

    iget-object p7, p0, Lnvk;->q:Ljvk;

    invoke-interface {p7}, Ljvk;->C()Z

    move-result p7

    if-eqz p7, :cond_24

    iget-object p7, p3, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    new-instance v0, Landroid/graphics/Rect;

    neg-int v1, p6

    invoke-virtual {p7}, Landroid/view/View;->getWidth()I

    move-result v2

    sub-int/2addr v2, p6

    invoke-virtual {p7}, Landroid/view/View;->getHeight()I

    move-result p6

    const/4 v3, 0x0

    invoke-direct {v0, v1, v3, v2, p6}, Landroid/graphics/Rect;-><init>(IIII)V

    invoke-virtual {p7, v0}, Landroid/view/View;->setClipBounds(Landroid/graphics/Rect;)V

    :cond_24
    iget-object p6, p0, Lnvk;->i:Landroid/graphics/drawable/Drawable;

    if-eqz p6, :cond_2b

    invoke-virtual/range {p0 .. p5}, Lnvk;->w(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/i;FZ)V

    :cond_2b
    return-void
.end method

.method public final p(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/i;FFIZ)V
    .registers 14

    iget-object p5, p0, Lnvk;->i:Landroid/graphics/drawable/Drawable;

    if-nez p5, :cond_d

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    move v5, p7

    invoke-virtual/range {v0 .. v5}, Lnvk;->w(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/i;FZ)V

    :cond_d
    return-void
.end method

.method public final r(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/i;Landroidx/recyclerview/widget/i;)Z
    .registers 4

    iget-object p0, p0, Lnvk;->q:Ljvk;

    invoke-interface {p0, p2, p3}, Ljvk;->F(Landroidx/recyclerview/widget/i;Landroidx/recyclerview/widget/i;)V

    const/4 p0, 0x0

    return p0
.end method

.method public final t(Landroidx/recyclerview/widget/i;I)V
    .registers 6

    const/4 v0, 0x1

    if-eqz p1, :cond_2c

    const/4 v1, 0x2

    if-ne p2, v1, :cond_2c

    iget-object p2, p1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p2}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p2

    iget-object v1, p1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    const/high16 v2, 0x40800000    # 4.0f

    invoke-static {v0, v2, v1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v1

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {p2, v1}, Landroid/view/ViewPropertyAnimator;->translationZ(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p2

    invoke-virtual {p2}, Landroid/view/ViewPropertyAnimator;->start()V

    :cond_2c
    const/4 p2, 0x0

    if-eqz p1, :cond_58

    iget-object v1, p0, Lnvk;->s:[Lhvk;

    const/4 v2, 0x0

    aput-object v2, v1, v0

    aput-object v2, v1, p2

    iget-object p2, p0, Lnvk;->q:Ljvk;

    invoke-interface {p2, p1, v1}, Ljvk;->h(Landroidx/recyclerview/widget/i;[Lhvk;)V

    invoke-interface {p2}, Ljvk;->a0()Z

    move-result p2

    if-eqz p2, :cond_55

    iget-object p1, p1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;

    move-result-object p1

    if-eqz p1, :cond_55

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable$ConstantState;->newDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    :cond_55
    iput-object v2, p0, Lnvk;->i:Landroid/graphics/drawable/Drawable;

    return-void

    :cond_58
    iput-boolean p2, p0, Lnvk;->t:Z

    return-void
.end method

.method public final u(Landroidx/recyclerview/widget/i;I)V
    .registers 3

    invoke-virtual {p0, p2}, Lnvk;->x(I)Lhvk;

    move-result-object p2

    iget-object p0, p0, Lnvk;->q:Ljvk;

    invoke-interface {p0, p1, p2}, Ljvk;->k(Landroidx/recyclerview/widget/i;Lhvk;)V

    return-void
.end method

.method public final w(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/i;FZ)V
    .registers 34

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p3

    move/from16 v3, p4

    iget-boolean v4, v0, Lnvk;->t:Z

    if-nez v4, :cond_299

    const/4 v4, 0x0

    cmpl-float v5, v3, v4

    if-eqz v5, :cond_248

    iget-object v6, v2, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    if-lez v5, :cond_18

    const/16 v8, 0x8

    goto :goto_19

    :cond_18
    const/4 v8, 0x4

    :goto_19
    invoke-virtual {v0, v8}, Lnvk;->x(I)Lhvk;

    move-result-object v9

    if-nez v9, :cond_23

    const/4 v9, 0x0

    move-object/from16 v12, p2

    goto :goto_3c

    :cond_23
    iget-object v10, v0, Lnvk;->r:Ljava/util/HashMap;

    invoke-virtual {v10, v9}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Livk;

    if-nez v11, :cond_39

    new-instance v11, Livk;

    move-object/from16 v12, p2

    invoke-direct {v11, v0, v12, v9}, Livk;-><init>(Lnvk;Landroidx/recyclerview/widget/RecyclerView;Lhvk;)V

    invoke-virtual {v10, v9, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_37
    move-object v9, v11

    goto :goto_3c

    :cond_39
    move-object/from16 v12, p2

    goto :goto_37

    :goto_3c
    iget-object v10, v0, Lblb;->b:Ljava/lang/Float;

    if-eqz v10, :cond_45

    invoke-virtual {v10}, Ljava/lang/Float;->floatValue()F

    move-result v10

    goto :goto_4b

    :cond_45
    iget-object v10, v2, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v10}, Landroid/view/View;->getAlpha()F

    move-result v10

    :goto_4b
    invoke-virtual {v6}, Landroid/view/View;->getLeft()I

    move-result v11

    invoke-virtual {v6}, Landroid/view/View;->getTop()I

    move-result v13

    invoke-virtual {v6}, Landroid/view/View;->getRight()I

    move-result v14

    invoke-virtual {v6}, Landroid/view/View;->getBottom()I

    move-result v15

    iget-object v4, v0, Lnvk;->j:Landroid/graphics/Rect;

    invoke-virtual {v4, v11, v13, v14, v15}, Landroid/graphics/Rect;->set(IIII)V

    invoke-virtual {v6}, Landroid/view/View;->getTranslationY()F

    move-result v11

    float-to-int v11, v11

    const/4 v13, 0x0

    invoke-virtual {v4, v13, v11}, Landroid/graphics/Rect;->offset(II)V

    iget-object v14, v0, Lnvk;->p:Landroid/text/TextPaint;

    if-nez v9, :cond_81

    invoke-virtual {v12}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v5

    const v12, 0x7f0600a8

    invoke-virtual {v5, v12}, Landroid/content/Context;->getColor(I)I

    move-result v5

    move-object/from16 v26, v6

    move v12, v13

    const/high16 v16, 0x437f0000    # 255.0f

    const/16 v17, 0x1

    goto/16 :goto_11b

    :cond_81
    iget-object v12, v9, Livk;->e:Landroid/graphics/drawable/Drawable;

    const/high16 v16, 0x437f0000    # 255.0f

    iget-object v11, v9, Livk;->c:Landroid/graphics/Rect;

    const/16 v17, 0x1

    iget v15, v9, Livk;->f:I

    invoke-static {v10, v15}, Lp37;->a0(FI)I

    move-result v15

    if-lez v5, :cond_97

    const v5, 0x800003

    :goto_94
    move/from16 v18, v5

    goto :goto_9b

    :cond_97
    const v5, 0x800005

    goto :goto_94

    :goto_9b
    invoke-virtual {v12}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v19

    invoke-virtual {v12}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v20

    iget-object v5, v0, Lnvk;->m:Landroid/graphics/Rect;

    const/16 v25, 0x0

    iget-object v7, v0, Lnvk;->j:Landroid/graphics/Rect;

    iget v13, v0, Lnvk;->e:I

    const/16 v23, 0x0

    move-object/from16 v24, v5

    move-object/from16 v21, v7

    move/from16 v22, v13

    invoke-static/range {v18 .. v25}, Landroid/view/Gravity;->apply(IIILandroid/graphics/Rect;IILandroid/graphics/Rect;I)V

    iget-object v5, v0, Lnvk;->m:Landroid/graphics/Rect;

    invoke-virtual {v12, v5}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    iget v7, v0, Lnvk;->e:I

    shl-int/lit8 v7, v7, 0x1

    invoke-virtual {v5}, Landroid/graphics/Rect;->width()I

    move-result v5

    add-int v22, v5, v7

    invoke-virtual {v4}, Landroid/graphics/Rect;->width()I

    move-result v5

    sub-int v5, v5, v22

    iget-object v7, v9, Livk;->k:Lnvk;

    iget v12, v9, Livk;->i:I

    if-ne v12, v5, :cond_d5

    move-object/from16 v26, v6

    const/4 v12, 0x0

    goto :goto_f4

    :cond_d5
    iput v5, v9, Livk;->i:I

    iget-object v12, v9, Livk;->b:Ljava/lang/String;

    iget-object v13, v7, Lnvk;->p:Landroid/text/TextPaint;

    int-to-float v5, v5

    move-object/from16 v26, v6

    sget-object v6, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-static {v12, v13, v5, v6}, Landroid/text/TextUtils;->ellipsize(Ljava/lang/CharSequence;Landroid/text/TextPaint;FLandroid/text/TextUtils$TruncateAt;)Ljava/lang/CharSequence;

    move-result-object v5

    invoke-interface {v5}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v5

    iput-object v5, v9, Livk;->h:Ljava/lang/String;

    iget-object v6, v7, Lnvk;->p:Landroid/text/TextPaint;

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v7

    const/4 v12, 0x0

    invoke-virtual {v6, v5, v12, v7, v11}, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    :goto_f4
    invoke-virtual {v11}, Landroid/graphics/Rect;->width()I

    move-result v19

    invoke-virtual {v11}, Landroid/graphics/Rect;->height()I

    move-result v20

    invoke-virtual {v11}, Landroid/graphics/Rect;->height()I

    move-result v5

    div-int/lit8 v23, v5, 0x2

    iget-object v5, v0, Lnvk;->l:Landroid/graphics/Rect;

    const/16 v25, 0x0

    iget-object v6, v0, Lnvk;->j:Landroid/graphics/Rect;

    move-object/from16 v24, v5

    move-object/from16 v21, v6

    invoke-static/range {v18 .. v25}, Landroid/view/Gravity;->apply(IIILandroid/graphics/Rect;IILandroid/graphics/Rect;I)V

    iget v5, v9, Livk;->g:I

    invoke-virtual {v14, v5}, Landroid/graphics/Paint;->setColor(I)V

    mul-float v11, v10, v16

    float-to-int v5, v11

    invoke-virtual {v14, v5}, Landroid/graphics/Paint;->setAlpha(I)V

    move v5, v15

    :goto_11b
    iget-object v6, v0, Lnvk;->k:Landroid/graphics/Rect;

    invoke-virtual {v6, v4}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    const/16 v7, 0x8

    if-ne v8, v7, :cond_133

    iget v7, v4, Landroid/graphics/Rect;->left:I

    float-to-int v11, v3

    add-int/2addr v7, v11

    invoke-virtual/range {v26 .. v26}, Landroid/view/View;->getRight()I

    move-result v11

    invoke-static {v7, v11}, Ljava/lang/Math;->min(II)I

    move-result v7

    iput v7, v4, Landroid/graphics/Rect;->right:I

    goto :goto_141

    :cond_133
    iget v7, v4, Landroid/graphics/Rect;->right:I

    float-to-int v11, v3

    add-int/2addr v7, v11

    invoke-virtual/range {v26 .. v26}, Landroid/view/View;->getLeft()I

    move-result v11

    invoke-static {v7, v11}, Ljava/lang/Math;->max(II)I

    move-result v7

    iput v7, v4, Landroid/graphics/Rect;->left:I

    :goto_141
    invoke-virtual {v1}, Landroid/graphics/Canvas;->save()I

    iget-object v7, v0, Lnvk;->i:Landroid/graphics/drawable/Drawable;

    if-eqz v7, :cond_15e

    new-instance v3, Landroid/graphics/PorterDuffColorFilter;

    sget-object v4, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {v3, v5, v4}, Landroid/graphics/PorterDuffColorFilter;-><init>(ILandroid/graphics/PorterDuff$Mode;)V

    invoke-virtual {v7, v3}, Landroid/graphics/drawable/Drawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    iget-object v3, v0, Lnvk;->i:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v3, v6}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    iget-object v3, v0, Lnvk;->i:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v3, v1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    goto/16 :goto_216

    :cond_15e
    const/16 v7, 0x8

    if-ne v8, v7, :cond_165

    move/from16 v13, v17

    goto :goto_166

    :cond_165
    move v13, v12

    :goto_166
    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v3

    iget v6, v0, Lnvk;->g:I

    int-to-float v6, v6

    div-float/2addr v3, v6

    const/high16 v7, 0x3f800000    # 1.0f

    const/4 v8, 0x0

    invoke-static {v3, v8, v7}, Lcs5;->s(FFF)F

    move-result v3

    mul-float/2addr v3, v6

    iget v6, v4, Landroid/graphics/Rect;->left:I

    int-to-float v6, v6

    iget v7, v4, Landroid/graphics/Rect;->right:I

    int-to-float v7, v7

    if-eqz v13, :cond_180

    add-float/2addr v7, v3

    goto :goto_181

    :cond_180
    sub-float/2addr v6, v3

    :goto_181
    iget-object v8, v0, Lnvk;->h:Landroid/graphics/Path;

    invoke-virtual {v8}, Landroid/graphics/Path;->rewind()V

    iget v11, v4, Landroid/graphics/Rect;->top:I

    int-to-float v11, v11

    invoke-virtual {v8, v6, v11}, Landroid/graphics/Path;->moveTo(FF)V

    iget v11, v4, Landroid/graphics/Rect;->top:I

    int-to-float v11, v11

    invoke-virtual {v8, v7, v11}, Landroid/graphics/Path;->lineTo(FF)V

    const/high16 v11, 0x40000000    # 2.0f

    if-eqz v13, :cond_1c6

    sub-float v19, v7, v3

    iget v12, v4, Landroid/graphics/Rect;->top:I

    int-to-float v12, v12

    add-float v21, v7, v3

    mul-float v7, v3, v11

    add-float v22, v12, v7

    const/high16 v24, -0x3d4c0000    # -90.0f

    const/16 v25, 0x0

    const/high16 v23, 0x43870000    # 270.0f

    move-object/from16 v18, v8

    move/from16 v20, v12

    invoke-virtual/range {v18 .. v25}, Landroid/graphics/Path;->arcTo(FFFFFFZ)V

    move-object/from16 v12, v18

    move/from16 v8, v19

    iget v15, v4, Landroid/graphics/Rect;->bottom:I

    int-to-float v15, v15

    sub-float/2addr v15, v3

    invoke-virtual {v12, v8, v15}, Landroid/graphics/Path;->lineTo(FF)V

    iget v15, v4, Landroid/graphics/Rect;->bottom:I

    int-to-float v15, v15

    sub-float v20, v15, v7

    const/high16 v23, 0x43340000    # 180.0f

    move/from16 v22, v15

    invoke-virtual/range {v18 .. v25}, Landroid/graphics/Path;->arcTo(FFFFFFZ)V

    goto :goto_1cd

    :cond_1c6
    move-object v12, v8

    iget v8, v4, Landroid/graphics/Rect;->bottom:I

    int-to-float v8, v8

    invoke-virtual {v12, v7, v8}, Landroid/graphics/Path;->lineTo(FF)V

    :goto_1cd
    iget v7, v4, Landroid/graphics/Rect;->bottom:I

    int-to-float v7, v7

    invoke-virtual {v12, v6, v7}, Landroid/graphics/Path;->lineTo(FF)V

    if-eqz v13, :cond_1dc

    iget v3, v4, Landroid/graphics/Rect;->top:I

    int-to-float v3, v3

    invoke-virtual {v12, v6, v3}, Landroid/graphics/Path;->lineTo(FF)V

    goto :goto_208

    :cond_1dc
    sub-float v19, v6, v3

    iget v7, v4, Landroid/graphics/Rect;->bottom:I

    int-to-float v7, v7

    mul-float/2addr v11, v3

    sub-float v20, v7, v11

    add-float v21, v6, v3

    const/high16 v24, -0x3d4c0000    # -90.0f

    const/16 v25, 0x0

    const/high16 v23, 0x42b40000    # 90.0f

    move/from16 v22, v7

    move-object/from16 v18, v12

    invoke-virtual/range {v18 .. v25}, Landroid/graphics/Path;->arcTo(FFFFFFZ)V

    move/from16 v6, v21

    iget v7, v4, Landroid/graphics/Rect;->top:I

    int-to-float v7, v7

    add-float/2addr v7, v3

    invoke-virtual {v12, v6, v7}, Landroid/graphics/Path;->lineTo(FF)V

    iget v3, v4, Landroid/graphics/Rect;->top:I

    int-to-float v3, v3

    add-float v22, v3, v11

    const/16 v23, 0x0

    move/from16 v20, v3

    invoke-virtual/range {v18 .. v25}, Landroid/graphics/Path;->arcTo(FFFFFFZ)V

    :goto_208
    invoke-virtual {v12}, Landroid/graphics/Path;->close()V

    invoke-virtual {v1, v12}, Landroid/graphics/Canvas;->clipPath(Landroid/graphics/Path;)Z

    iget-object v3, v0, Lnvk;->n:Landroid/graphics/Paint;

    invoke-virtual {v3, v5}, Landroid/graphics/Paint;->setColor(I)V

    invoke-virtual {v1, v12, v3}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    :goto_216
    if-eqz v9, :cond_245

    iget-object v3, v9, Livk;->e:Landroid/graphics/drawable/Drawable;

    instance-of v4, v3, Lf3d;

    if-eqz v4, :cond_22e

    move-object v4, v3

    check-cast v4, Lf3d;

    iget-boolean v5, v9, Livk;->j:Z

    if-nez v5, :cond_22e

    if-eqz p5, :cond_22e

    invoke-virtual {v4}, Lf3d;->k()V

    move/from16 v4, v17

    iput-boolean v4, v9, Livk;->j:Z

    :cond_22e
    mul-float v10, v10, v16

    float-to-int v4, v10

    invoke-virtual {v3, v4}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    invoke-virtual {v3, v1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    iget-object v3, v9, Livk;->h:Ljava/lang/String;

    iget-object v4, v0, Lnvk;->l:Landroid/graphics/Rect;

    iget v5, v4, Landroid/graphics/Rect;->left:I

    int-to-float v5, v5

    invoke-virtual {v4}, Landroid/graphics/Rect;->exactCenterY()F

    move-result v4

    invoke-virtual {v1, v3, v5, v4, v14}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    :cond_245
    invoke-virtual {v1}, Landroid/graphics/Canvas;->restore()V

    :cond_248
    iget-object v6, v2, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    if-eqz p5, :cond_299

    iget-object v2, v0, Lnvk;->q:Ljvk;

    invoke-interface {v2}, Ljvk;->f()Z

    move-result v2

    if-eqz v2, :cond_299

    invoke-virtual {v1}, Landroid/graphics/Canvas;->save()I

    invoke-virtual {v6}, Landroid/view/View;->getLeft()I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {v6}, Landroid/view/View;->getTop()I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {v6}, Landroid/view/View;->getRight()I

    move-result v4

    int-to-float v4, v4

    invoke-virtual {v6}, Landroid/view/View;->getTop()I

    move-result v5

    iget v7, v0, Lnvk;->f:I

    add-int/2addr v5, v7

    int-to-float v5, v5

    iget-object v0, v0, Lnvk;->o:Landroid/graphics/Paint;

    move/from16 v27, v5

    move-object v5, v0

    move-object v0, v1

    move v1, v2

    move v2, v3

    move v3, v4

    move/from16 v4, v27

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    invoke-virtual {v6}, Landroid/view/View;->getLeft()I

    move-result v0

    int-to-float v1, v0

    invoke-virtual {v6}, Landroid/view/View;->getBottom()I

    move-result v0

    sub-int/2addr v0, v7

    int-to-float v2, v0

    invoke-virtual {v6}, Landroid/view/View;->getRight()I

    move-result v0

    int-to-float v3, v0

    invoke-virtual {v6}, Landroid/view/View;->getBottom()I

    move-result v0

    int-to-float v4, v0

    move-object/from16 v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->restore()V

    :cond_299
    return-void
.end method

.method public final x(I)Lhvk;
    .registers 3

    const/4 v0, 0x4

    iget-object p0, p0, Lnvk;->s:[Lhvk;

    if-eq p1, v0, :cond_f

    const/16 v0, 0x8

    if-eq p1, v0, :cond_b

    const/4 p0, 0x0

    return-object p0

    :cond_b
    const/4 p1, 0x1

    aget-object p0, p0, p1

    return-object p0

    :cond_f
    const/4 p1, 0x0

    aget-object p0, p0, p1

    return-object p0
.end method
