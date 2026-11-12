.class public final Lbfl;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Lba3;

.field public final c:Lal7;

.field public final d:Lrf2;

.field public final e:Lcom/opera/hype/image/editor/TextBoxFrame;

.field public final f:Lcom/opera/hype/image/editor/TextBoxEditText;

.field public final g:Ljava/util/Set;

.field public final h:Ljava/util/Set;

.field public final i:Ljava/util/LinkedHashSet;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lba3;Ltam;Lal7;)V
    .registers 24

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    move-object/from16 v2, p1

    iput-object v2, v0, Lbfl;->a:Landroid/content/Context;

    move-object/from16 v3, p2

    iput-object v3, v0, Lbfl;->b:Lba3;

    iput-object v1, v0, Lbfl;->c:Lal7;

    invoke-static {v2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v2

    const v3, 0x7f0d020f

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual {v2, v3, v4, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v2

    const v3, 0x7f0a026e

    invoke-static {v3, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v6

    move-object v9, v6

    check-cast v9, Lcom/opera/hype/image/editor/TextBoxEditText;

    if-eqz v9, :cond_19f

    const v3, 0x7f0a0284

    invoke-static {v3, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v10

    if-eqz v10, :cond_19f

    const v3, 0x7f0a0285

    invoke-static {v3, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v11

    if-eqz v11, :cond_19f

    const v3, 0x7f0a0286

    invoke-static {v3, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v12

    if-eqz v12, :cond_19f

    const v3, 0x7f0a0287

    invoke-static {v3, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v13

    if-eqz v13, :cond_19f

    const v3, 0x7f0a0288

    invoke-static {v3, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v14

    if-eqz v14, :cond_19f

    const v3, 0x7f0a0289

    invoke-static {v3, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v15

    if-eqz v15, :cond_19f

    const v3, 0x7f0a028a

    invoke-static {v3, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v16

    if-eqz v16, :cond_19f

    const v3, 0x7f0a028b

    invoke-static {v3, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v6

    move-object/from16 v17, v6

    check-cast v17, Landroid/widget/ImageView;

    if-eqz v17, :cond_19f

    new-instance v7, Lrf2;

    move-object v8, v2

    check-cast v8, Lcom/opera/hype/image/editor/TextBoxFrame;

    const/16 v18, 0x4

    invoke-direct/range {v7 .. v18}, Lrf2;-><init>(Landroid/widget/FrameLayout;Landroid/widget/TextView;Landroid/view/View;Landroid/view/View;Landroid/view/View;Landroid/view/View;Ljava/lang/Object;Landroid/view/View;Landroid/view/View;Landroid/view/View;B)V

    move-object/from16 v2, v16

    invoke-static {}, Landroid/view/View;->generateViewId()I

    move-result v3

    invoke-virtual {v8, v3}, Landroid/view/View;->setId(I)V

    const v3, 0x7f0a0561

    invoke-virtual {v8, v3, v0}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    invoke-virtual {v8}, Landroid/view/ViewGroup;->getLayoutTransition()Landroid/animation/LayoutTransition;

    move-result-object v3

    if-eqz v3, :cond_98

    invoke-virtual {v3, v5}, Landroid/animation/LayoutTransition;->disableTransitionType(I)V

    :cond_98
    invoke-virtual {v8}, Landroid/view/ViewGroup;->getLayoutTransition()Landroid/animation/LayoutTransition;

    move-result-object v3

    const/4 v6, 0x1

    if-eqz v3, :cond_a2

    invoke-virtual {v3, v6}, Landroid/animation/LayoutTransition;->disableTransitionType(I)V

    :cond_a2
    invoke-virtual {v9, v5}, Landroid/view/View;->setSaveEnabled(Z)V

    move-object/from16 v3, p3

    invoke-interface {v3, v9}, Ltam;->k(Lcom/opera/hype/image/editor/TextBoxEditText;)Luam;

    move-result-object v3

    iput-object v3, v9, Lcom/opera/hype/image/editor/TextBoxEditText;->l:Luam;

    iput-object v7, v0, Lbfl;->d:Lrf2;

    iput-object v8, v0, Lbfl;->e:Lcom/opera/hype/image/editor/TextBoxFrame;

    iput-object v9, v0, Lbfl;->f:Lcom/opera/hype/image/editor/TextBoxEditText;

    filled-new-array {v13, v10, v14, v15}, [Landroid/view/View;

    move-result-object v3

    invoke-static {v3}, Le82;->E([Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v3

    filled-new-array {v11, v12, v2}, [Landroid/view/View;

    move-result-object v2

    invoke-static {v2}, Le82;->E([Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v2

    iput-object v2, v0, Lbfl;->g:Ljava/util/Set;

    invoke-static/range {v17 .. v17}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v7

    iput-object v7, v0, Lbfl;->h:Ljava/util/Set;

    check-cast v3, Ljava/lang/Iterable;

    invoke-static {v7, v3}, Lb5j;->e(Ljava/util/Set;Ljava/lang/Iterable;)Ljava/util/LinkedHashSet;

    move-result-object v3

    check-cast v2, Ljava/lang/Iterable;

    invoke-static {v3, v2}, Lb5j;->e(Ljava/util/Set;Ljava/lang/Iterable;)Ljava/util/LinkedHashSet;

    move-result-object v2

    iput-object v2, v0, Lbfl;->i:Ljava/util/LinkedHashSet;

    invoke-virtual {v0}, Lbfl;->b()Z

    move-result v2

    if-eqz v2, :cond_128

    invoke-virtual {v0}, Lbfl;->c()Z

    move-result v2

    xor-int/2addr v2, v6

    invoke-virtual {v9, v2}, Landroid/widget/TextView;->setSelectAllOnFocus(Z)V

    invoke-virtual {v9, v6}, Lyq1;->setAutoSizeTextTypeWithDefaults(I)V

    new-instance v2, Lh63;

    const/4 v3, 0x7

    invoke-direct {v2, v0, v3}, Lh63;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v9, v2}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    iget-object v1, v1, Lal7;->b:Ljava/lang/Object;

    check-cast v1, Lcom/opera/hype/image/editor/EditImage;

    iget-object v1, v1, Lcom/opera/hype/image/editor/EditImage;->d:Ldya;

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    move-object v2, v4

    :cond_fe
    :goto_fe
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_117

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    move-object v7, v3

    check-cast v7, Lfya;

    instance-of v8, v7, Loel;

    if-eqz v8, :cond_fe

    check-cast v7, Loel;

    iget-object v7, v7, Loel;->k:Landroid/graphics/PointF;

    if-eqz v7, :cond_fe

    move-object v2, v3

    goto :goto_fe

    :cond_117
    iget-object v1, v0, Lbfl;->b:Lba3;

    invoke-static {v2, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_121

    const/4 v1, 0x6

    goto :goto_122

    :cond_121
    const/4 v1, 0x5

    :goto_122
    invoke-virtual {v9, v1}, Landroid/widget/TextView;->setImeOptions(I)V

    invoke-virtual {v9, v6}, Landroid/widget/TextView;->setRawInputType(I)V

    :cond_128
    iget-object v1, v0, Lbfl;->b:Lba3;

    iget-object v2, v0, Lbfl;->f:Lcom/opera/hype/image/editor/TextBoxEditText;

    invoke-virtual {v1, v2}, Lba3;->h(Lcom/opera/hype/image/editor/TextBoxEditText;)V

    iget-object v1, v0, Lbfl;->b:Lba3;

    instance-of v1, v1, Lox7;

    if-eqz v1, :cond_15b

    iget-object v1, v0, Lbfl;->d:Lrf2;

    iget-object v2, v1, Lrf2;->b:Ljava/lang/Object;

    check-cast v2, Lcom/opera/hype/image/editor/TextBoxFrame;

    invoke-virtual {v2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f070271

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    const v7, 0x7f070272

    invoke-virtual {v2, v7}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v7

    const v8, 0x7f070270

    invoke-virtual {v2, v8}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iget-object v1, v1, Lrf2;->e:Landroid/view/View;

    check-cast v1, Lcom/opera/hype/image/editor/TextBoxEditText;

    invoke-virtual {v1, v3, v7, v3, v2}, Landroid/view/View;->setPadding(IIII)V

    :cond_15b
    iget-object v1, v0, Lbfl;->f:Lcom/opera/hype/image/editor/TextBoxEditText;

    iget-object v2, v0, Lbfl;->b:Lba3;

    iget-object v2, v2, Lfya;->a:Leya;

    sget-object v3, Leya;->d:Leya;

    if-eq v2, v3, :cond_166

    move v6, v5

    :cond_166
    invoke-virtual {v1, v6}, Landroid/view/View;->setEnabled(Z)V

    iget-object v1, v0, Lbfl;->e:Lcom/opera/hype/image/editor/TextBoxFrame;

    invoke-virtual {v0}, Lbfl;->b()Z

    move-result v2

    if-eqz v2, :cond_183

    const v2, 0x7f080401

    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundResource(I)V

    iget-object v2, v0, Lbfl;->a:Landroid/content/Context;

    const v3, 0x7f0803fc

    invoke-virtual {v2, v3}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/view/View;->setForeground(Landroid/graphics/drawable/Drawable;)V

    :cond_183
    invoke-virtual {v1}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v1}, Landroid/view/View;->getForeground()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    if-eqz v2, :cond_198

    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v4

    :cond_198
    invoke-virtual {v1, v4}, Landroid/view/View;->setForeground(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v0, v5}, Lbfl;->f(Z)V

    return-void

    :cond_19f
    invoke-virtual {v2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    const-string v1, "Missing required view with ID: "

    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    throw v4
.end method


# virtual methods
.method public final a()Z
    .registers 1

    iget-object p0, p0, Lbfl;->b:Lba3;

    invoke-virtual {p0}, Lba3;->f()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lkotlin/text/StringsKt;->N(Ljava/lang/CharSequence;)Z

    move-result p0

    xor-int/lit8 p0, p0, 0x1

    return p0
.end method

.method public final b()Z
    .registers 2

    iget-object p0, p0, Lbfl;->b:Lba3;

    instance-of v0, p0, Loel;

    if-eqz v0, :cond_e

    check-cast p0, Loel;

    iget-object p0, p0, Loel;->k:Landroid/graphics/PointF;

    if-eqz p0, :cond_e

    const/4 p0, 0x1

    return p0

    :cond_e
    const/4 p0, 0x0

    return p0
.end method

.method public final c()Z
    .registers 2

    iget-object p0, p0, Lbfl;->b:Lba3;

    instance-of v0, p0, Loel;

    if-eqz v0, :cond_12

    check-cast p0, Loel;

    iget-object v0, p0, Loel;->k:Landroid/graphics/PointF;

    if-eqz v0, :cond_12

    iget-boolean p0, p0, Loel;->l:Z

    if-eqz p0, :cond_12

    const/4 p0, 0x1

    return p0

    :cond_12
    const/4 p0, 0x0

    return p0
.end method

.method public final d(Li97;)V
    .registers 13

    iget-object v0, p0, Lbfl;->b:Lba3;

    invoke-virtual {v0}, Lba3;->e()F

    move-result v1

    const/high16 v2, 0x3f800000    # 1.0f

    div-float v1, v2, v1

    iget-object v3, p0, Lbfl;->i:Ljava/util/LinkedHashSet;

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_10
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_23

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/view/View;

    invoke-virtual {v4, v1}, Landroid/view/View;->setScaleX(F)V

    invoke-virtual {v4, v1}, Landroid/view/View;->setScaleY(F)V

    goto :goto_10

    :cond_23
    instance-of v1, v0, Loel;

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-eqz v1, :cond_6e

    move-object v1, v0

    check-cast v1, Loel;

    iget-object v1, v1, Loel;->k:Landroid/graphics/PointF;

    if-eqz v1, :cond_6e

    iget v5, p1, Li97;->c:F

    invoke-virtual {v0}, Lba3;->e()F

    move-result v6

    mul-float/2addr v6, v5

    iget v5, v1, Landroid/graphics/PointF;->x:F

    div-float/2addr v5, v6

    iget v1, v1, Landroid/graphics/PointF;->y:F

    div-float/2addr v1, v6

    iget-object v6, p1, Li97;->d:Landroid/graphics/PointF;

    iget-object v7, p1, Li97;->b:Landroid/graphics/PointF;

    iget v8, v7, Landroid/graphics/PointF;->x:F

    mul-float/2addr v5, v8

    iput v5, v6, Landroid/graphics/PointF;->x:F

    iget v7, v7, Landroid/graphics/PointF;->y:F

    mul-float/2addr v1, v7

    iput v1, v6, Landroid/graphics/PointF;->y:F

    float-to-int v5, v5

    float-to-int v1, v1

    iget-object v6, p0, Lbfl;->f:Lcom/opera/hype/image/editor/TextBoxEditText;

    invoke-virtual {v6}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v7

    const/high16 v8, -0x80000000

    if-eq v5, v8, :cond_5f

    iget v9, v7, Landroid/view/ViewGroup$LayoutParams;->width:I

    if-eq v9, v5, :cond_5f

    iput v5, v7, Landroid/view/ViewGroup$LayoutParams;->width:I

    move v5, v3

    goto :goto_60

    :cond_5f
    move v5, v4

    :goto_60
    if-eq v1, v8, :cond_69

    iget v8, v7, Landroid/view/ViewGroup$LayoutParams;->height:I

    if-eq v8, v1, :cond_69

    iput v1, v7, Landroid/view/ViewGroup$LayoutParams;->height:I

    move v5, v3

    :cond_69
    if-eqz v5, :cond_6e

    invoke-virtual {v6, v7}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_6e
    iget-object p0, p0, Lbfl;->e:Lcom/opera/hype/image/editor/TextBoxFrame;

    invoke-virtual {p0}, Landroid/view/View;->isLaidOut()Z

    move-result v1

    if-nez v1, :cond_79

    invoke-virtual {p0, v4, v4}, Landroid/view/View;->measure(II)V

    :cond_79
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    const/4 v6, 0x0

    if-gtz v1, :cond_85

    move-object v5, v6

    :cond_85
    if-eqz v5, :cond_8c

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v1

    goto :goto_90

    :cond_8c
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    move-result v1

    :goto_90
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    if-lez v5, :cond_9b

    move-object v6, v7

    :cond_9b
    if-eqz v6, :cond_a2

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v5

    goto :goto_a6

    :cond_a2
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    move-result v5

    :goto_a6
    iget v6, p1, Li97;->c:F

    invoke-virtual {v0}, Lba3;->e()F

    move-result v7

    mul-float/2addr v7, v6

    invoke-virtual {p0, v7}, Landroid/view/View;->setScaleX(F)V

    iget v6, p1, Li97;->c:F

    invoke-virtual {v0}, Lba3;->e()F

    move-result v7

    mul-float/2addr v7, v6

    invoke-virtual {p0, v7}, Landroid/view/View;->setScaleY(F)V

    iget-object v6, v0, Lba3;->f:Laa3;

    sget-object v7, Lba3;->j:[Lxtb;

    aget-object v3, v7, v3

    iget-object v3, v6, La7f;->b:Ljava/lang/Object;

    move-object v6, v3

    check-cast v6, Landroid/graphics/PointF;

    iget v6, v6, Landroid/graphics/PointF;->x:F

    check-cast v3, Landroid/graphics/PointF;

    iget v3, v3, Landroid/graphics/PointF;->y:F

    iget-object v8, p1, Li97;->d:Landroid/graphics/PointF;

    iget-object v9, p1, Li97;->b:Landroid/graphics/PointF;

    iget v10, v9, Landroid/graphics/PointF;->x:F

    mul-float/2addr v6, v10

    iput v6, v8, Landroid/graphics/PointF;->x:F

    iget v6, v9, Landroid/graphics/PointF;->y:F

    mul-float/2addr v3, v6

    iput v3, v8, Landroid/graphics/PointF;->y:F

    iget-object p1, p1, Li97;->a:Landroid/graphics/PointF;

    iget v3, p1, Landroid/graphics/PointF;->x:F

    iget p1, p1, Landroid/graphics/PointF;->y:F

    invoke-virtual {v8, v3, p1}, Landroid/graphics/PointF;->offset(FF)V

    neg-int p1, v1

    int-to-float p1, p1

    invoke-virtual {p0}, Landroid/view/View;->getScaleX()F

    move-result v3

    mul-float/2addr v3, p1

    const/high16 p1, 0x40000000    # 2.0f

    div-float/2addr v3, p1

    neg-int v6, v5

    int-to-float v6, v6

    invoke-virtual {p0}, Landroid/view/View;->getScaleY()F

    move-result v9

    mul-float/2addr v9, v6

    div-float/2addr v9, p1

    int-to-float v1, v1

    invoke-virtual {p0}, Landroid/view/View;->getScaleX()F

    move-result v6

    sub-float/2addr v6, v2

    mul-float/2addr v6, v1

    div-float/2addr v6, p1

    int-to-float v1, v5

    invoke-virtual {p0}, Landroid/view/View;->getScaleY()F

    move-result v5

    sub-float/2addr v5, v2

    mul-float/2addr v5, v1

    div-float/2addr v5, p1

    iget p1, v8, Landroid/graphics/PointF;->x:F

    add-float/2addr p1, v3

    add-float/2addr p1, v6

    float-to-int p1, p1

    iget v1, v8, Landroid/graphics/PointF;->y:F

    add-float/2addr v1, v9

    add-float/2addr v1, v5

    float-to-int v1, v1

    const/16 v2, 0xc

    invoke-static {p0, p1, v1, v4, v2}, Lybh;->u(Landroid/view/View;IIII)V

    iget-object p1, v0, Lba3;->h:Laa3;

    const/4 v0, 0x3

    aget-object v0, v7, v0

    iget-object p1, p1, La7f;->b:Ljava/lang/Object;

    check-cast p1, Ljava/lang/Number;

    invoke-virtual {p1}, Ljava/lang/Number;->floatValue()F

    move-result p1

    invoke-virtual {p0, p1}, Landroid/view/View;->setRotation(F)V

    return-void
.end method

.method public final e(ZZ)V
    .registers 7

    iget-object v0, p0, Lbfl;->i:Ljava/util/LinkedHashSet;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_46

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    if-eqz p1, :cond_37

    invoke-virtual {p0}, Lbfl;->b()Z

    move-result v2

    const/4 v3, 0x0

    if-nez v2, :cond_31

    iget-object v2, p0, Lbfl;->h:Ljava/util/Set;

    check-cast v2, Ljava/lang/Iterable;

    invoke-static {v2, v1}, Lkotlin/collections/CollectionsKt;->E(Ljava/lang/Iterable;Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2f

    iget-object v2, p0, Lbfl;->g:Ljava/util/Set;

    invoke-interface {v2, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2f

    move v2, v3

    goto :goto_35

    :cond_2f
    const/4 v2, 0x1

    goto :goto_35

    :cond_31
    invoke-virtual {p0}, Lbfl;->c()Z

    move-result v2

    :goto_35
    if-nez v2, :cond_42

    :cond_37
    const/16 v3, 0x8

    if-eqz p2, :cond_42

    invoke-virtual {v1}, Landroid/view/View;->getVisibility()I

    move-result v2

    if-eq v2, v3, :cond_42

    const/4 v3, 0x4

    :cond_42
    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    goto :goto_6

    :cond_46
    return-void
.end method

.method public final f(Z)V
    .registers 6

    const/4 v0, 0x0

    const/16 v1, 0xff

    iget-object v2, p0, Lbfl;->e:Lcom/opera/hype/image/editor/TextBoxFrame;

    if-eqz p1, :cond_18

    invoke-virtual {v2}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object p0

    invoke-virtual {p0, v1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    invoke-virtual {v2}, Landroid/view/View;->getForeground()Landroid/graphics/drawable/Drawable;

    move-result-object p0

    if-eqz p0, :cond_3e

    invoke-virtual {p0, v0}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    return-void

    :cond_18
    invoke-virtual {v2}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {p0}, Lbfl;->b()Z

    move-result v3

    if-eqz v3, :cond_2a

    invoke-virtual {p0}, Lbfl;->a()Z

    move-result v3

    if-nez v3, :cond_2a

    move v3, v1

    goto :goto_2b

    :cond_2a
    move v3, v0

    :goto_2b
    invoke-virtual {p1, v3}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    invoke-virtual {v2}, Landroid/view/View;->getForeground()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    if-eqz p1, :cond_3e

    invoke-virtual {p0}, Lbfl;->a()Z

    move-result p0

    if-nez p0, :cond_3b

    move v0, v1

    :cond_3b
    invoke-virtual {p1, v0}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    :cond_3e
    return-void
.end method

.method public final toString()Ljava/lang/String;
    .registers 3

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "TextBox(obj="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lbfl;->b:Lba3;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", view="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p0, Lbfl;->e:Lcom/opera/hype/image/editor/TextBoxFrame;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p0, ")"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
