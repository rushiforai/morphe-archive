.class public final Lgj8;
.super Liph;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:I

.field public final c:I

.field public final d:Landroid/graphics/Paint;

.field public final e:Landroid/graphics/Rect;

.field public final f:Landroid/graphics/Rect;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lgj8;->d:Landroid/graphics/Paint;

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lgj8;->e:Landroid/graphics/Rect;

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lgj8;->f:Landroid/graphics/Rect;

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-static {v0, v1}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v0

    iput v0, p0, Lgj8;->a:I

    const/high16 v0, 0x41800000    # 16.0f

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-static {v0, v1}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v0

    iput v0, p0, Lgj8;->b:I

    const/high16 v0, 0x40800000    # 4.0f

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-static {v0, p1}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result p1

    iput p1, p0, Lgj8;->c:I

    return-void
.end method


# virtual methods
.method public final e(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;Landroid/view/View;Landroid/graphics/Rect;I)V
    .registers 14

    iget-object p2, p0, Lgj8;->e:Landroid/graphics/Rect;

    invoke-static {p2, p3}, Landroidx/recyclerview/widget/RecyclerView;->V(Landroid/graphics/Rect;Landroid/view/View;)V

    invoke-virtual {p3}, Landroid/view/View;->getTranslationX()F

    move-result v0

    float-to-int v0, v0

    invoke-virtual {p3}, Landroid/view/View;->getTranslationY()F

    move-result p3

    float-to-int p3, p3

    invoke-virtual {p2, v0, p3}, Landroid/graphics/Rect;->offset(II)V

    iget p3, p2, Landroid/graphics/Rect;->left:I

    iget-object v0, p0, Lgj8;->f:Landroid/graphics/Rect;

    iget v1, v0, Landroid/graphics/Rect;->left:I

    add-int/2addr p3, v1

    int-to-float p3, p3

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v0

    iget v1, p0, Lgj8;->a:I

    sub-int/2addr v0, v1

    int-to-float v0, v0

    const/high16 v2, 0x40000000    # 2.0f

    div-float/2addr v0, v2

    add-float v3, v0, p3

    int-to-float p3, v1

    add-float v5, v3, p3

    and-int/lit8 p3, p5, 0x1

    iget-object v7, p0, Lgj8;->d:Landroid/graphics/Paint;

    iget p0, p0, Lgj8;->c:I

    const/4 v0, 0x1

    if-ne p3, v0, :cond_42

    iget p3, p2, Landroid/graphics/Rect;->top:I

    int-to-float v4, p3

    iget p3, p4, Landroid/graphics/Rect;->top:I

    int-to-float p3, p3

    add-float/2addr p3, v4

    int-to-float v0, p0

    sub-float v6, p3, v0

    move-object v2, p1

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    goto :goto_43

    :cond_42
    move-object v2, p1

    :goto_43
    const/4 p1, 0x2

    and-int/2addr p5, p1

    if-ne p5, p1, :cond_54

    iget p1, p2, Landroid/graphics/Rect;->top:I

    iget p3, p4, Landroid/graphics/Rect;->bottom:I

    add-int/2addr p1, p3

    add-int/2addr p1, p0

    int-to-float v4, p1

    iget p0, p2, Landroid/graphics/Rect;->bottom:I

    int-to-float v6, p0

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    :cond_54
    return-void
.end method

.method public final onDrawOver(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;Lvph;)V
    .registers 18

    move-object/from16 v2, p2

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f04084a

    const v3, 0x7f0600a8

    invoke-static {v1, v0, v3}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v6

    iget-object v7, p0, Lgj8;->d:Landroid/graphics/Paint;

    invoke-virtual {v7, v6}, Landroid/graphics/Paint;->setColor(I)V

    const/4 v8, 0x0

    move v9, v8

    :goto_17
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    if-ge v9, v0, :cond_c6

    invoke-virtual {v2, v9}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    move-object v10, v0

    check-cast v10, Llph;

    invoke-virtual {v2, v3}, Landroidx/recyclerview/widget/RecyclerView;->T(Landroid/view/View;)Landroidx/recyclerview/widget/i;

    move-result-object v0

    instance-of v1, v0, Lhxn;

    if-eqz v1, :cond_c0

    check-cast v0, Lhxn;

    iget-object v0, v0, Ljxn;->f:Lvtn;

    check-cast v0, Lcom/opera/android/history/g;

    if-eqz v0, :cond_c0

    iget-object v1, v0, Lcom/opera/android/history/g;->f:Lwtn;

    if-eqz v1, :cond_c0

    iget-boolean v4, v1, Lwtn;->e:Z

    if-eqz v4, :cond_c0

    invoke-virtual {v3}, Landroid/view/View;->getAlpha()F

    move-result v4

    invoke-static {v6}, Landroid/graphics/Color;->alpha(I)I

    move-result v5

    int-to-float v5, v5

    mul-float/2addr v4, v5

    float-to-int v4, v4

    invoke-virtual {v7, v4}, Landroid/graphics/Paint;->setAlpha(I)V

    iget-object v1, v1, Lwtn;->f:Ljava/util/ArrayList;

    invoke-virtual {v1, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lvtn;

    invoke-virtual {v4, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v11

    const/4 v12, 0x1

    invoke-static {v12, v1}, Lam2;->k(ILjava/util/ArrayList;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lvtn;

    invoke-virtual {v1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    const v1, 0x7f0a0539

    invoke-virtual {v3, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getVisibility()I

    move-result v4

    const v13, 0x7f0a05b8

    if-eqz v4, :cond_79

    invoke-virtual {v3, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    :cond_79
    iget-object v4, p0, Lgj8;->f:Landroid/graphics/Rect;

    invoke-virtual {v1, v4}, Landroid/view/View;->getDrawingRect(Landroid/graphics/Rect;)V

    move-object v5, v3

    check-cast v5, Landroid/view/ViewGroup;

    invoke-virtual {v5, v1, v4}, Landroid/view/ViewGroup;->offsetDescendantRectToMyCoords(Landroid/view/View;Landroid/graphics/Rect;)V

    if-eqz v0, :cond_88

    move v0, v8

    goto :goto_89

    :cond_88
    const/4 v0, 0x2

    :goto_89
    or-int/lit8 v5, v0, 0x1

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lgj8;->e(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;Landroid/view/View;Landroid/graphics/Rect;I)V

    if-eqz v11, :cond_c0

    iget-object v1, v10, Llph;->a:Landroidx/recyclerview/widget/i;

    invoke-virtual {v1}, Landroidx/recyclerview/widget/i;->getBindingAdapterPosition()I

    move-result v1

    sub-int/2addr v1, v12

    invoke-virtual {v2, v1}, Landroidx/recyclerview/widget/RecyclerView;->M(I)Landroidx/recyclerview/widget/i;

    move-result-object v1

    if-eqz v1, :cond_c0

    instance-of v3, v1, Lfxn;

    if-eqz v3, :cond_c0

    iget-object v3, v1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v3, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3, v4}, Landroid/view/View;->getDrawingRect(Landroid/graphics/Rect;)V

    iget-object v5, v1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    check-cast v5, Landroid/view/ViewGroup;

    invoke-virtual {v5, v3, v4}, Landroid/view/ViewGroup;->offsetDescendantRectToMyCoords(Landroid/view/View;Landroid/graphics/Rect;)V

    iget v3, p0, Lgj8;->b:I

    invoke-virtual {v4, v8, v3}, Landroid/graphics/Rect;->inset(II)V

    iget-object v3, v1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    const/4 v5, 0x2

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lgj8;->e(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;Landroid/view/View;Landroid/graphics/Rect;I)V

    :cond_c0
    add-int/lit8 v9, v9, 0x1

    move-object/from16 v2, p2

    goto/16 :goto_17

    :cond_c6
    return-void
.end method
