.class public Lcom/opera/android/StatusBarDrawingFrameLayout;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# static fields
.field public static final synthetic l:I


# instance fields
.field public final a:Lh03;

.field public final b:Landroid/graphics/Paint;

.field public c:Lc1f;

.field public d:Z

.field public e:Z

.field public f:Z

.field public final g:Z

.field public h:I

.field public final i:Lkze;

.field public j:I

.field public k:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 85
    invoke-direct {p0, p1, p2, v0}, Lcom/opera/android/StatusBarDrawingFrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 8

    const/4 p3, 0x0

    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    new-instance v0, Lh03;

    const/4 v1, 0x2

    invoke-direct {v0, p0, v1}, Lh03;-><init>(Landroid/widget/FrameLayout;B)V

    iput-object v0, p0, Lcom/opera/android/StatusBarDrawingFrameLayout;->a:Lh03;

    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/opera/android/StatusBarDrawingFrameLayout;->b:Landroid/graphics/Paint;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/opera/android/StatusBarDrawingFrameLayout;->e:Z

    iput-boolean v0, p0, Lcom/opera/android/StatusBarDrawingFrameLayout;->g:Z

    new-instance v2, Lkze;

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-direct {v2, v3}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v2, p0, Lcom/opera/android/StatusBarDrawingFrameLayout;->i:Lkze;

    iput p3, p0, Lcom/opera/android/StatusBarDrawingFrameLayout;->j:I

    iput p3, p0, Lcom/opera/android/StatusBarDrawingFrameLayout;->k:I

    invoke-virtual {p0, p3}, Landroid/view/View;->setWillNotDraw(Z)V

    sget-object v2, Lkhh;->J:[I

    invoke-virtual {p1, p2, v2, p3, p3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object p1

    const/4 p2, 0x3

    iget v2, p0, Lcom/opera/android/StatusBarDrawingFrameLayout;->j:I

    invoke-virtual {p1, p2, v2}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result p2

    iput p2, p0, Lcom/opera/android/StatusBarDrawingFrameLayout;->j:I

    iget p2, p0, Lcom/opera/android/StatusBarDrawingFrameLayout;->k:I

    invoke-virtual {p1, v1, p2}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result p2

    iput p2, p0, Lcom/opera/android/StatusBarDrawingFrameLayout;->k:I

    iget-boolean p2, p0, Lcom/opera/android/StatusBarDrawingFrameLayout;->e:Z

    invoke-virtual {p1, v0, p2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p2

    iput-boolean p2, p0, Lcom/opera/android/StatusBarDrawingFrameLayout;->e:Z

    iget-boolean p2, p0, Lcom/opera/android/StatusBarDrawingFrameLayout;->f:Z

    invoke-virtual {p1, p3, p2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p2

    iput-boolean p2, p0, Lcom/opera/android/StatusBarDrawingFrameLayout;->f:Z

    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 4

    invoke-virtual {p0}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v0

    iget-object v1, p0, Lcom/opera/android/StatusBarDrawingFrameLayout;->a:Lh03;

    if-eqz v0, :cond_1d

    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-nez v0, :cond_1d

    iget-boolean v0, p0, Lcom/opera/android/StatusBarDrawingFrameLayout;->d:Z

    if-nez v0, :cond_2b

    iget-object v0, p0, Lcom/opera/android/StatusBarDrawingFrameLayout;->c:Lc1f;

    if-eqz v0, :cond_2b

    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/opera/android/StatusBarDrawingFrameLayout;->d:Z

    invoke-virtual {v0, v1}, Lc1f;->d(Lfck;)V

    return-void

    :cond_1d
    iget-boolean v0, p0, Lcom/opera/android/StatusBarDrawingFrameLayout;->d:Z

    if-eqz v0, :cond_2b

    iget-object v0, p0, Lcom/opera/android/StatusBarDrawingFrameLayout;->c:Lc1f;

    if-eqz v0, :cond_2b

    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/opera/android/StatusBarDrawingFrameLayout;->d:Z

    invoke-virtual {v0, v1}, Lc1f;->g(Lfck;)V

    :cond_2b
    return-void
.end method

.method public final b()V
    .registers 1

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    iget-object p0, p0, Lcom/opera/android/StatusBarDrawingFrameLayout;->c:Lc1f;

    if-eqz p0, :cond_a

    invoke-virtual {p0}, Lc1f;->e()V

    :cond_a
    return-void
.end method

.method public final c(Z)V
    .registers 3

    iget-boolean v0, p0, Lcom/opera/android/StatusBarDrawingFrameLayout;->e:Z

    if-ne p1, v0, :cond_5

    return-void

    :cond_5
    iput-boolean p1, p0, Lcom/opera/android/StatusBarDrawingFrameLayout;->e:Z

    invoke-virtual {p0}, Landroid/view/View;->requestApplyInsets()V

    invoke-virtual {p0}, Lcom/opera/android/StatusBarDrawingFrameLayout;->b()V

    return-void
.end method

.method public final d(Z)V
    .registers 3

    iget-boolean v0, p0, Lcom/opera/android/StatusBarDrawingFrameLayout;->f:Z

    if-ne p1, v0, :cond_5

    return-void

    :cond_5
    iput-boolean p1, p0, Lcom/opera/android/StatusBarDrawingFrameLayout;->f:Z

    invoke-virtual {p0}, Landroid/view/View;->requestApplyInsets()V

    invoke-virtual {p0}, Lcom/opera/android/StatusBarDrawingFrameLayout;->b()V

    return-void
.end method

.method public final draw(Landroid/graphics/Canvas;)V
    .registers 9

    invoke-super {p0, p1}, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V

    iget-object v0, p0, Lcom/opera/android/StatusBarDrawingFrameLayout;->c:Lc1f;

    if-eqz v0, :cond_15

    iget-boolean v0, v0, Lc1f;->b:Z

    if-nez v0, :cond_16

    iget v0, p0, Lcom/opera/android/StatusBarDrawingFrameLayout;->k:I

    invoke-static {v0}, Landroid/graphics/Color;->alpha(I)I

    move-result v0

    const/16 v1, 0xff

    if-ge v0, v1, :cond_16

    :cond_15
    return-void

    :cond_16
    iget v0, p0, Lcom/opera/android/StatusBarDrawingFrameLayout;->k:I

    iget-object v6, p0, Lcom/opera/android/StatusBarDrawingFrameLayout;->b:Landroid/graphics/Paint;

    invoke-virtual {v6, v0}, Landroid/graphics/Paint;->setColor(I)V

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v0

    iget-object v1, p0, Lcom/opera/android/StatusBarDrawingFrameLayout;->i:Lkze;

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    sub-int/2addr v0, v1

    int-to-float v3, v0

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v0

    int-to-float v4, v0

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result p0

    int-to-float v5, p0

    const/4 v2, 0x0

    move-object v1, p1

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    return-void
.end method

.method public final e(I)V
    .registers 3

    iget v0, p0, Lcom/opera/android/StatusBarDrawingFrameLayout;->j:I

    if-ne p1, v0, :cond_5

    return-void

    :cond_5
    iput p1, p0, Lcom/opera/android/StatusBarDrawingFrameLayout;->j:I

    invoke-virtual {p0}, Lcom/opera/android/StatusBarDrawingFrameLayout;->b()V

    return-void
.end method

.method public final onApplyWindowInsets(Landroid/view/WindowInsets;)Landroid/view/WindowInsets;
    .registers 8

    invoke-static {p0, p1}, Lg3o;->g(Landroid/view/View;Landroid/view/WindowInsets;)Lg3o;

    move-result-object v0

    iget-object v0, v0, Lg3o;->a:Ld3o;

    const/16 v1, 0x207

    invoke-virtual {v0, v1}, Ld3o;->i(I)Lr9b;

    move-result-object v1

    iget-boolean v2, p0, Lcom/opera/android/StatusBarDrawingFrameLayout;->e:Z

    const/4 v3, 0x0

    if-eqz v2, :cond_18

    iget-object v2, p0, Lcom/opera/android/StatusBarDrawingFrameLayout;->c:Lc1f;

    if-eqz v2, :cond_18

    iget v2, v1, Lr9b;->b:I

    goto :goto_19

    :cond_18
    move v2, v3

    :goto_19
    iget-object v4, p0, Lcom/opera/android/StatusBarDrawingFrameLayout;->c:Lc1f;

    if-eqz v4, :cond_20

    iget v1, v1, Lr9b;->d:I

    goto :goto_21

    :cond_20
    move v1, v3

    :goto_21
    iget-object v4, p0, Lcom/opera/android/StatusBarDrawingFrameLayout;->i:Lkze;

    invoke-virtual {v4}, Lekc;->g()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    if-eq v1, v5, :cond_39

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v4, v1}, Lekc;->r(Ljava/lang/Object;)V

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    :cond_39
    iget-boolean v1, p0, Lcom/opera/android/StatusBarDrawingFrameLayout;->f:Z

    if-eqz v1, :cond_48

    invoke-virtual {v4}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    goto :goto_49

    :cond_48
    move v1, v3

    :goto_49
    iget-boolean v4, p0, Lcom/opera/android/StatusBarDrawingFrameLayout;->g:Z

    if-eqz v4, :cond_59

    const/16 v4, 0x8

    invoke-virtual {v0, v4}, Ld3o;->i(I)Lr9b;

    move-result-object v0

    iget v0, v0, Lr9b;->d:I

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v1

    :cond_59
    invoke-virtual {p0, v3, v2, v3, v1}, Landroid/view/View;->setPadding(IIII)V

    iget v0, p0, Lcom/opera/android/StatusBarDrawingFrameLayout;->h:I

    if-eq v2, v0, :cond_65

    iput v2, p0, Lcom/opera/android/StatusBarDrawingFrameLayout;->h:I

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    :cond_65
    invoke-super {p0, p1}, Landroid/view/View;->onApplyWindowInsets(Landroid/view/WindowInsets;)Landroid/view/WindowInsets;

    move-result-object p0

    return-object p0
.end method

.method public final onAttachedToWindow()V
    .registers 2

    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    invoke-static {p0}, Lc1f;->c(Landroid/view/View;)Lc1f;

    move-result-object v0

    iput-object v0, p0, Lcom/opera/android/StatusBarDrawingFrameLayout;->c:Lc1f;

    invoke-virtual {p0}, Lcom/opera/android/StatusBarDrawingFrameLayout;->a()V

    invoke-virtual {p0}, Landroid/view/View;->requestApplyInsets()V

    return-void
.end method

.method public final onDetachedFromWindow()V
    .registers 3

    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    iget-boolean v0, p0, Lcom/opera/android/StatusBarDrawingFrameLayout;->d:Z

    if-eqz v0, :cond_13

    iget-object v0, p0, Lcom/opera/android/StatusBarDrawingFrameLayout;->c:Lc1f;

    if-eqz v0, :cond_13

    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/opera/android/StatusBarDrawingFrameLayout;->d:Z

    iget-object v1, p0, Lcom/opera/android/StatusBarDrawingFrameLayout;->a:Lh03;

    invoke-virtual {v0, v1}, Lc1f;->g(Lfck;)V

    :cond_13
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/opera/android/StatusBarDrawingFrameLayout;->c:Lc1f;

    return-void
.end method

.method public final onDraw(Landroid/graphics/Canvas;)V
    .registers 9

    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    iget-boolean v0, p0, Lcom/opera/android/StatusBarDrawingFrameLayout;->e:Z

    if-eqz v0, :cond_a

    iget v0, p0, Lcom/opera/android/StatusBarDrawingFrameLayout;->j:I

    goto :goto_b

    :cond_a
    const/4 v0, 0x0

    :goto_b
    iget-object v6, p0, Lcom/opera/android/StatusBarDrawingFrameLayout;->b:Landroid/graphics/Paint;

    invoke-virtual {v6, v0}, Landroid/graphics/Paint;->setColor(I)V

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v0

    int-to-float v4, v0

    iget p0, p0, Lcom/opera/android/StatusBarDrawingFrameLayout;->h:I

    int-to-float v5, p0

    const/4 v2, 0x0

    const/4 v3, 0x0

    move-object v1, p1

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    return-void
.end method

.method public final setAlpha(F)V
    .registers 3

    invoke-virtual {p0}, Landroid/view/View;->getAlpha()F

    move-result v0

    cmpl-float v0, p1, v0

    if-nez v0, :cond_9

    return-void

    :cond_9
    invoke-super {p0, p1}, Landroid/view/View;->setAlpha(F)V

    invoke-virtual {p0}, Lcom/opera/android/StatusBarDrawingFrameLayout;->b()V

    return-void
.end method

.method public final setVisibility(I)V
    .registers 2

    invoke-super {p0, p1}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {p0}, Lcom/opera/android/StatusBarDrawingFrameLayout;->a()V

    return-void
.end method
