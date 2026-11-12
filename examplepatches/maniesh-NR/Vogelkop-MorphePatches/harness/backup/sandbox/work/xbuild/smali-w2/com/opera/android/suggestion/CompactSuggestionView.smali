.class public Lcom/opera/android/suggestion/CompactSuggestionView;
.super Landroid/view/ViewGroup;
.source "SourceFile"


# static fields
.field public static final synthetic n:I


# instance fields
.field public a:I

.field public final b:Ld5o;

.field public c:Lhqk;

.field public d:Lnv6;

.field public final e:Ljava/util/ArrayList;

.field public final f:Loc5;

.field public g:I

.field public h:Z

.field public i:Z

.field public final j:Landroid/graphics/Point;

.field public k:B

.field public final l:Z

.field public m:Ljl4;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 5
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    new-instance p2, Ld5o;

    invoke-direct {p2}, Ljava/lang/Object;-><init>()V

    iput-object p0, p2, Ld5o;->c:Ljava/lang/Object;

    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    iput-object v0, p2, Ld5o;->a:Ljava/lang/Object;

    iput-object p2, p0, Lcom/opera/android/suggestion/CompactSuggestionView;->b:Ld5o;

    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    iput-object p2, p0, Lcom/opera/android/suggestion/CompactSuggestionView;->e:Ljava/util/ArrayList;

    const/4 p2, 0x1

    iput-boolean p2, p0, Lcom/opera/android/suggestion/CompactSuggestionView;->i:Z

    new-instance v0, Landroid/graphics/Point;

    invoke-direct {v0}, Landroid/graphics/Point;-><init>()V

    iput-object v0, p0, Lcom/opera/android/suggestion/CompactSuggestionView;->j:Landroid/graphics/Point;

    const/4 v1, 0x2

    iput-byte v1, p0, Lcom/opera/android/suggestion/CompactSuggestionView;->k:B

    iput-boolean p2, p0, Lcom/opera/android/suggestion/CompactSuggestionView;->l:Z

    new-instance p2, Loc5;

    invoke-direct {p2, p1}, Loc5;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Lcom/opera/android/suggestion/CompactSuggestionView;->f:Loc5;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const p1, 0x7f07011b

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, v0, Landroid/graphics/Point;->x:I

    const p1, 0x7f07011c

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p0

    iput p0, v0, Landroid/graphics/Point;->y:I

    return-void
.end method


# virtual methods
.method public final a(I)V
    .registers 21

    move-object/from16 v0, p0

    if-lez p1, :cond_1ae

    iget-boolean v1, v0, Lcom/opera/android/suggestion/CompactSuggestionView;->h:Z

    if-eqz v1, :cond_1ae

    invoke-virtual {v0}, Landroid/view/View;->getPaddingLeft()I

    move-result v1

    sub-int v1, p1, v1

    invoke-virtual {v0}, Landroid/view/View;->getPaddingRight()I

    move-result v2

    sub-int/2addr v1, v2

    iget-object v2, v0, Lcom/opera/android/suggestion/CompactSuggestionView;->j:Landroid/graphics/Point;

    iget v2, v2, Landroid/graphics/Point;->x:I

    add-int/2addr v1, v2

    iget v2, v0, Lcom/opera/android/suggestion/CompactSuggestionView;->g:I

    if-eq v2, v1, :cond_1ae

    iget-object v2, v0, Lcom/opera/android/suggestion/CompactSuggestionView;->e:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v3

    const/4 v4, 0x0

    move v5, v4

    :cond_24
    :goto_24
    if-ge v5, v3, :cond_46

    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    add-int/lit8 v5, v5, 0x1

    check-cast v6, Lqc5;

    iget-object v7, v6, Lqc5;->d:Lcom/opera/android/suggestion/Suggestion;

    if-eqz v7, :cond_24

    iget-object v7, v6, Lqc5;->b:Lcom/opera/android/suggestion/CompactSuggestionChip;

    invoke-virtual {v7, v4}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v0}, Landroid/view/View;->getPaddingLeft()I

    move-result v7

    sub-int v7, p1, v7

    invoke-virtual {v0}, Landroid/view/View;->getPaddingRight()I

    move-result v8

    sub-int/2addr v7, v8

    invoke-virtual {v6, v7}, Lqc5;->b(I)V

    goto :goto_24

    :cond_46
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lcom/opera/android/utilities/DisplayUtil;->c(Landroid/content/Context;)I

    move-result v5

    invoke-static {v3}, Lcom/opera/android/utilities/DisplayUtil;->b(Landroid/content/Context;)I

    move-result v3

    if-ge v5, v3, :cond_57

    iget-byte v3, v0, Lcom/opera/android/suggestion/CompactSuggestionView;->k:B

    goto :goto_59

    :cond_57
    iget-boolean v3, v0, Lcom/opera/android/suggestion/CompactSuggestionView;->l:Z

    :goto_59
    iget-object v5, v0, Lcom/opera/android/suggestion/CompactSuggestionView;->f:Loc5;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-le v6, v3, :cond_1ac

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    iget-object v6, v5, Loc5;->a:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    int-to-float v7, v1

    sget-object v8, Lfan;->a:Landroid/graphics/Rect;

    invoke-virtual {v6}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v6

    iget v6, v6, Landroid/util/DisplayMetrics;->density:F

    div-float/2addr v7, v6

    float-to-int v6, v7

    add-int/lit8 v6, v6, 0x3

    div-int/lit8 v6, v6, 0x4

    iget-object v7, v5, Loc5;->b:Lro9;

    if-eqz v7, :cond_87

    iget v8, v7, Lro9;->b:I

    if-eq v8, v6, :cond_87

    const/4 v7, 0x0

    iput-object v7, v5, Loc5;->b:Lro9;

    :cond_87
    if-nez v7, :cond_92

    new-instance v7, Lro9;

    const/16 v8, 0x11

    invoke-direct {v7, v8, v6}, Lro9;-><init>(BI)V

    iput-object v7, v5, Loc5;->b:Lro9;

    :cond_92
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5, v3}, Ljava/util/ArrayList;-><init>(I)V

    move v6, v4

    :goto_98
    if-ge v6, v3, :cond_182

    sget-object v9, Loc5;->c:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v10

    move v11, v4

    :goto_a1
    if-ge v11, v10, :cond_b1

    invoke-virtual {v2, v11}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v12

    add-int/lit8 v11, v11, 0x1

    check-cast v12, Lqc5;

    iget-object v12, v12, Lqc5;->c:Ljxb;

    invoke-virtual {v9, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_a1

    :cond_b1
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v10

    :goto_b5
    const/16 v11, 0x14

    if-ge v10, v11, :cond_c1

    sget-object v11, Ljxb;->d:Ljxb;

    invoke-virtual {v9, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v10, v10, 0x1

    goto :goto_b5

    :cond_c1
    iget v10, v7, Lro9;->b:I

    iget-object v11, v7, Lro9;->d:Ljava/lang/Object;

    check-cast v11, [[Z

    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v12

    iget-object v13, v7, Lro9;->c:Ljava/lang/Object;

    check-cast v13, [[F

    array-length v14, v13

    move v15, v4

    :goto_d1
    if-ge v15, v14, :cond_dc

    aget-object v8, v13, v15

    const/4 v4, 0x0

    invoke-static {v8, v4}, Ljava/util/Arrays;->fill([FF)V

    add-int/lit8 v15, v15, 0x1

    goto :goto_d1

    :cond_dc
    array-length v4, v11

    const/4 v8, 0x0

    :goto_de
    if-ge v8, v4, :cond_e9

    aget-object v14, v11, v8

    const/4 v15, 0x0

    invoke-static {v14, v15}, Ljava/util/Arrays;->fill([ZZ)V

    add-int/lit8 v8, v8, 0x1

    goto :goto_de

    :cond_e9
    const/4 v4, 0x1

    :goto_ea
    if-gt v4, v12, :cond_132

    const/4 v8, 0x1

    :goto_ed
    if-gt v8, v10, :cond_12f

    add-int/lit8 v14, v4, -0x1

    invoke-interface {v9, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ljxb;

    move/from16 v17, v3

    iget v3, v15, Ljxb;->a:I

    if-gt v3, v8, :cond_11c

    iget v15, v15, Ljxb;->b:F

    aget-object v14, v13, v14

    sub-int v3, v8, v3

    aget v3, v14, v3

    add-float/2addr v15, v3

    aget v3, v14, v8

    aget-object v14, v13, v4

    invoke-static {v15, v3}, Ljava/lang/Math;->max(FF)F

    move-result v18

    aput v18, v14, v8

    aget-object v14, v11, v4

    cmpl-float v3, v15, v3

    if-lez v3, :cond_118

    const/4 v3, 0x1

    goto :goto_119

    :cond_118
    const/4 v3, 0x0

    :goto_119
    aput-boolean v3, v14, v8

    goto :goto_12a

    :cond_11c
    aget-object v3, v13, v4

    aget-object v14, v13, v14

    aget v14, v14, v8

    aput v14, v3, v8

    aget-object v3, v11, v4

    const/16 v16, 0x0

    aput-boolean v16, v3, v8

    :goto_12a
    add-int/lit8 v8, v8, 0x1

    move/from16 v3, v17

    goto :goto_ed

    :cond_12f
    add-int/lit8 v4, v4, 0x1

    goto :goto_ea

    :cond_132
    move/from16 v17, v3

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    :goto_139
    const/4 v4, 0x1

    if-lt v12, v4, :cond_154

    aget-object v4, v11, v12

    aget-boolean v4, v4, v10

    if-eqz v4, :cond_151

    add-int/lit8 v4, v12, -0x1

    invoke-interface {v9, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljxb;

    iget v8, v4, Ljxb;->a:I

    sub-int/2addr v10, v8

    const/4 v15, 0x0

    invoke-virtual {v3, v15, v4}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    :cond_151
    add-int/lit8 v12, v12, -0x1

    goto :goto_139

    :cond_154
    invoke-virtual {v9}, Ljava/util/ArrayList;->clear()V

    invoke-virtual {v3}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_182

    invoke-virtual {v5, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v4

    const/4 v15, 0x0

    :goto_165
    if-ge v15, v4, :cond_175

    invoke-virtual {v3, v15}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    add-int/lit8 v15, v15, 0x1

    check-cast v8, Ljxb;

    iget-object v8, v8, Ljxb;->c:Lqc5;

    invoke-interface {v2, v8}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    goto :goto_165

    :cond_175
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_182

    add-int/lit8 v6, v6, 0x1

    move/from16 v3, v17

    const/4 v4, 0x0

    goto/16 :goto_98

    :cond_182
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v3

    const/4 v4, 0x1

    sub-int/2addr v3, v4

    :goto_188
    if-ltz v3, :cond_1a9

    invoke-virtual {v5, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v7

    sub-int/2addr v7, v4

    :goto_195
    if-ltz v7, :cond_1a6

    invoke-interface {v6, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljxb;

    iget-object v8, v8, Ljxb;->c:Lqc5;

    const/4 v15, 0x0

    invoke-interface {v2, v15, v8}, Ljava/util/List;->add(ILjava/lang/Object;)V

    add-int/lit8 v7, v7, -0x1

    goto :goto_195

    :cond_1a6
    add-int/lit8 v3, v3, -0x1

    goto :goto_188

    :cond_1a9
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    :cond_1ac
    iput v1, v0, Lcom/opera/android/suggestion/CompactSuggestionView;->g:I

    :cond_1ae
    return-void
.end method

.method public final onLayout(ZIIII)V
    .registers 13

    sub-int/2addr p4, p2

    invoke-static {p0}, Lcs5;->W(Landroid/view/View;)Z

    move-result p1

    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    move-result p2

    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result p3

    iget-object p5, p0, Lcom/opera/android/suggestion/CompactSuggestionView;->e:Ljava/util/ArrayList;

    invoke-virtual {p5}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_14
    if-ge v1, v0, :cond_56

    invoke-virtual {p5, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lqc5;

    iget-object v2, v2, Lqc5;->b:Lcom/opera/android/suggestion/CompactSuggestionChip;

    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    move-result v3

    const/16 v4, 0x8

    if-eq v3, v4, :cond_53

    invoke-virtual {v2}, Landroid/view/View;->getMeasuredWidth()I

    move-result v3

    invoke-virtual {v2}, Landroid/view/View;->getMeasuredHeight()I

    move-result v4

    add-int v5, p2, v3

    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    move-result v6

    sub-int v6, p4, v6

    if-le v5, v6, :cond_3f

    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    move-result p2

    iget v5, p0, Lcom/opera/android/suggestion/CompactSuggestionView;->a:I

    add-int/2addr p3, v5

    :cond_3f
    if-nez p1, :cond_43

    move v5, p2

    goto :goto_46

    :cond_43
    sub-int v5, p4, p2

    sub-int/2addr v5, v3

    :goto_46
    add-int v6, v5, v3

    add-int/2addr v4, p3

    invoke-virtual {v2, v5, p3, v6, v4}, Landroid/view/View;->layout(IIII)V

    iget-object v2, p0, Lcom/opera/android/suggestion/CompactSuggestionView;->j:Landroid/graphics/Point;

    iget v2, v2, Landroid/graphics/Point;->x:I

    add-int/2addr v3, v2

    add-int/2addr v3, p2

    move p2, v3

    :cond_53
    add-int/lit8 v1, v1, 0x1

    goto :goto_14

    :cond_56
    return-void
.end method

.method public final onMeasure(II)V
    .registers 19

    move-object/from16 v0, p0

    invoke-static/range {p1 .. p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v1

    invoke-virtual {v0}, Landroid/view/View;->getPaddingLeft()I

    move-result v2

    sub-int v2, v1, v2

    invoke-virtual {v0}, Landroid/view/View;->getPaddingRight()I

    move-result v3

    sub-int/2addr v2, v3

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lcom/opera/android/utilities/DisplayUtil;->c(Landroid/content/Context;)I

    move-result v4

    invoke-static {v3}, Lcom/opera/android/utilities/DisplayUtil;->b(Landroid/content/Context;)I

    move-result v3

    if-ge v4, v3, :cond_22

    iget-byte v3, v0, Lcom/opera/android/suggestion/CompactSuggestionView;->k:B

    goto :goto_24

    :cond_22
    iget-boolean v3, v0, Lcom/opera/android/suggestion/CompactSuggestionView;->l:Z

    :goto_24
    invoke-virtual {v0, v1}, Lcom/opera/android/suggestion/CompactSuggestionView;->a(I)V

    iget-object v4, v0, Lcom/opera/android/suggestion/CompactSuggestionView;->e:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v5

    const/4 v6, 0x0

    iput v6, v0, Lcom/opera/android/suggestion/CompactSuggestionView;->a:I

    invoke-virtual {v0}, Landroid/view/View;->getPaddingLeft()I

    move-result v7

    const/4 v8, 0x1

    :goto_35
    iget-object v9, v0, Lcom/opera/android/suggestion/CompactSuggestionView;->j:Landroid/graphics/Point;

    if-ge v6, v5, :cond_84

    invoke-virtual {v4, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lqc5;

    iget-object v11, v10, Lqc5;->b:Lcom/opera/android/suggestion/CompactSuggestionChip;

    invoke-virtual {v11}, Landroid/view/View;->getVisibility()I

    move-result v12

    const/16 v13, 0x8

    if-eq v12, v13, :cond_81

    invoke-virtual {v10, v2}, Lqc5;->b(I)V

    invoke-virtual {v11}, Landroid/view/View;->getMeasuredWidth()I

    move-result v10

    invoke-virtual {v0}, Landroid/view/View;->getPaddingRight()I

    move-result v12

    sub-int v12, v1, v12

    sub-int/2addr v12, v7

    sub-int/2addr v12, v10

    iget v14, v0, Lcom/opera/android/suggestion/CompactSuggestionView;->a:I

    invoke-virtual {v11}, Landroid/view/View;->getMeasuredHeight()I

    move-result v15

    iget v13, v9, Landroid/graphics/Point;->y:I

    add-int/2addr v15, v13

    invoke-static {v14, v15}, Ljava/lang/Math;->max(II)I

    move-result v13

    iput v13, v0, Lcom/opera/android/suggestion/CompactSuggestionView;->a:I

    if-ltz v12, :cond_6f

    iget v9, v9, Landroid/graphics/Point;->x:I

    add-int/2addr v10, v9

    add-int/2addr v10, v7

    move v7, v10

    goto :goto_81

    :cond_6f
    if-ne v8, v3, :cond_77

    const/16 v12, 0x8

    invoke-virtual {v11, v12}, Landroid/view/View;->setVisibility(I)V

    goto :goto_81

    :cond_77
    add-int/lit8 v8, v8, 0x1

    invoke-virtual {v0}, Landroid/view/View;->getPaddingLeft()I

    move-result v7

    add-int/2addr v7, v10

    iget v9, v9, Landroid/graphics/Point;->x:I

    add-int/2addr v7, v9

    :cond_81
    :goto_81
    add-int/lit8 v6, v6, 0x1

    goto :goto_35

    :cond_84
    invoke-virtual {v0}, Landroid/view/View;->getPaddingTop()I

    move-result v2

    iget v3, v0, Lcom/opera/android/suggestion/CompactSuggestionView;->a:I

    mul-int/2addr v8, v3

    add-int/2addr v8, v2

    iget v2, v9, Landroid/graphics/Point;->y:I

    sub-int/2addr v8, v2

    invoke-virtual {v0}, Landroid/view/View;->getPaddingBottom()I

    move-result v2

    add-int/2addr v2, v8

    move/from16 v3, p2

    invoke-static {v2, v3}, Landroid/view/View;->resolveSize(II)I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/view/View;->setMeasuredDimension(II)V

    return-void
.end method
