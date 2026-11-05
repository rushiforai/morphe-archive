.class final Le/e/a/DurationRangeBar;
.super Landroid/view/View;
.source "DurationRangeBar.java"


# instance fields
.field changed:Ljava/util/function/BiConsumer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/function/BiConsumer<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field handle:I

.field high:I

.field low:I

.field max:I

.field final paint:Landroid/graphics/Paint;

.field unlimited:Z


# direct methods
.method constructor <init>(Landroid/content/Context;I)V
    .registers 4

    .line 5
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 4
    new-instance p1, Landroid/graphics/Paint;

    const/4 v0, 0x3

    invoke-direct {p1, v0}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p1, p0, Le/e/a/DurationRangeBar;->paint:Landroid/graphics/Paint;

    .line 5
    iput p2, p0, Le/e/a/DurationRangeBar;->max:I

    const-string p1, "\u52d5\u753b\u6642\u9593\u306e\u4e0b\u9650\u30fb\u4e0a\u9650\u3002\u5165\u529b\u6b04\u304b\u3089\u79d2\u5358\u4f4d\u3067\u3082\u6307\u5b9a\u3067\u304d\u307e\u3059"

    invoke-virtual {p0, p1}, Le/e/a/DurationRangeBar;->setContentDescription(Ljava/lang/CharSequence;)V

    return-void
.end method


# virtual methods
.method protected onDraw(Landroid/graphics/Canvas;)V
    .registers 10

    .line 7
    invoke-virtual {p0}, Le/e/a/DurationRangeBar;->getHeight()I

    move-result v0

    int-to-float v0, v0

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    iget-object v1, p0, Le/e/a/DurationRangeBar;->paint:Landroid/graphics/Paint;

    invoke-virtual {p0}, Le/e/a/DurationRangeBar;->getContext()Landroid/content/Context;

    move-result-object v2

    const/4 v3, 0x4

    invoke-static {v2, v3}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget-object v1, p0, Le/e/a/DurationRangeBar;->paint:Landroid/graphics/Paint;

    invoke-virtual {p0}, Le/e/a/DurationRangeBar;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v1, p0, Le/e/a/DurationRangeBar;->paint:Landroid/graphics/Paint;

    const/16 v2, 0x46

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setAlpha(I)V

    invoke-virtual {p0}, Le/e/a/DurationRangeBar;->pad()F

    move-result v3

    invoke-virtual {p0}, Le/e/a/DurationRangeBar;->getWidth()I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {p0}, Le/e/a/DurationRangeBar;->pad()F

    move-result v2

    sub-float v5, v1, v2

    iget-object v7, p0, Le/e/a/DurationRangeBar;->paint:Landroid/graphics/Paint;

    move-object v2, p1

    move v4, v0

    move v6, v0

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    iget-object v1, p0, Le/e/a/DurationRangeBar;->paint:Landroid/graphics/Paint;

    const/16 v2, 0xff

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setAlpha(I)V

    iget v1, p0, Le/e/a/DurationRangeBar;->low:I

    invoke-virtual {p0, v1}, Le/e/a/DurationRangeBar;->x(I)F

    move-result v3

    iget-boolean v1, p0, Le/e/a/DurationRangeBar;->unlimited:Z

    if-eqz v1, :cond_5e

    invoke-virtual {p0}, Le/e/a/DurationRangeBar;->getWidth()I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {p0}, Le/e/a/DurationRangeBar;->pad()F

    move-result v2

    sub-float/2addr v1, v2

    goto :goto_64

    :cond_5e
    iget v1, p0, Le/e/a/DurationRangeBar;->high:I

    invoke-virtual {p0, v1}, Le/e/a/DurationRangeBar;->x(I)F

    move-result v1

    :goto_64
    move v5, v1

    iget-object v7, p0, Le/e/a/DurationRangeBar;->paint:Landroid/graphics/Paint;

    move-object v2, p1

    move v4, v0

    move v6, v0

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    iget v1, p0, Le/e/a/DurationRangeBar;->low:I

    invoke-virtual {p0, v1}, Le/e/a/DurationRangeBar;->x(I)F

    move-result v1

    invoke-virtual {p0}, Le/e/a/DurationRangeBar;->getContext()Landroid/content/Context;

    move-result-object v2

    const/16 v3, 0xa

    invoke-static {v2, v3}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v2

    int-to-float v2, v2

    iget-object v4, p0, Le/e/a/DurationRangeBar;->paint:Landroid/graphics/Paint;

    invoke-virtual {p1, v1, v0, v2, v4}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    iget-boolean v1, p0, Le/e/a/DurationRangeBar;->unlimited:Z

    if-nez v1, :cond_9b

    iget v1, p0, Le/e/a/DurationRangeBar;->high:I

    invoke-virtual {p0, v1}, Le/e/a/DurationRangeBar;->x(I)F

    move-result v1

    invoke-virtual {p0}, Le/e/a/DurationRangeBar;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2, v3}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v2

    int-to-float v2, v2

    iget-object v3, p0, Le/e/a/DurationRangeBar;->paint:Landroid/graphics/Paint;

    invoke-virtual {p1, v1, v0, v2, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    :cond_9b
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 8

    .line 8
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez v0, :cond_42

    invoke-virtual {p0}, Le/e/a/DurationRangeBar;->isEnabled()Z

    move-result v0

    if-nez v0, :cond_f

    return v1

    :cond_f
    iget-boolean v0, p0, Le/e/a/DurationRangeBar;->unlimited:Z

    if-nez v0, :cond_38

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    iget v3, p0, Le/e/a/DurationRangeBar;->low:I

    invoke-virtual {p0, v3}, Le/e/a/DurationRangeBar;->x(I)F

    move-result v3

    sub-float/2addr v0, v3

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    iget v4, p0, Le/e/a/DurationRangeBar;->high:I

    invoke-virtual {p0, v4}, Le/e/a/DurationRangeBar;->x(I)F

    move-result v4

    sub-float/2addr v3, v4

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v3

    cmpg-float v0, v0, v3

    if-gez v0, :cond_36

    goto :goto_38

    :cond_36
    const/4 v0, 0x1

    goto :goto_39

    :cond_38
    :goto_38
    const/4 v0, 0x0

    :goto_39
    iput v0, p0, Le/e/a/DurationRangeBar;->handle:I

    invoke-virtual {p0}, Le/e/a/DurationRangeBar;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    invoke-interface {v0, v2}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    :cond_42
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    if-eqz v0, :cond_70

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    const/4 v3, 0x2

    if-ne v0, v3, :cond_50

    goto :goto_70

    :cond_50
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    if-eq v0, v2, :cond_5f

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    const/4 v3, 0x3

    if-ne v0, v3, :cond_5e

    goto :goto_5f

    :cond_5e
    return v2

    :cond_5f
    :goto_5f
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result p1

    if-ne p1, v2, :cond_68

    invoke-virtual {p0}, Le/e/a/DurationRangeBar;->performClick()Z

    :cond_68
    invoke-virtual {p0}, Le/e/a/DurationRangeBar;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    invoke-interface {p1, v1}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    return v2

    :cond_70
    :goto_70
    iget v0, p0, Le/e/a/DurationRangeBar;->max:I

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result p1

    invoke-virtual {p0}, Le/e/a/DurationRangeBar;->pad()F

    move-result v3

    sub-float/2addr p1, v3

    invoke-virtual {p0}, Le/e/a/DurationRangeBar;->getWidth()I

    move-result v3

    int-to-float v3, v3

    const/high16 v4, 0x40000000    # 2.0f

    invoke-virtual {p0}, Le/e/a/DurationRangeBar;->pad()F

    move-result v5

    mul-float v5, v5, v4

    sub-float/2addr v3, v5

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-static {v4, v3}, Ljava/lang/Math;->max(FF)F

    move-result v3

    div-float/2addr p1, v3

    iget v3, p0, Le/e/a/DurationRangeBar;->max:I

    int-to-float v3, v3

    mul-float p1, p1, v3

    const/high16 v3, 0x41700000    # 15.0f

    div-float/2addr p1, v3

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p1

    mul-int/lit8 p1, p1, 0xf

    invoke-static {v0, p1}, Ljava/lang/Math;->min(II)I

    move-result p1

    invoke-static {v1, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    iget v0, p0, Le/e/a/DurationRangeBar;->handle:I

    if-nez v0, :cond_bd

    iget-boolean v0, p0, Le/e/a/DurationRangeBar;->unlimited:Z

    if-eqz v0, :cond_af

    goto :goto_b5

    :cond_af
    iget v0, p0, Le/e/a/DurationRangeBar;->high:I

    invoke-static {p1, v0}, Ljava/lang/Math;->min(II)I

    move-result p1

    :goto_b5
    iput p1, p0, Le/e/a/DurationRangeBar;->low:I

    iget-boolean p1, p0, Le/e/a/DurationRangeBar;->unlimited:Z

    if-eqz p1, :cond_c5

    iget p1, p0, Le/e/a/DurationRangeBar;->high:I

    :cond_bd
    iget v0, p0, Le/e/a/DurationRangeBar;->low:I

    invoke-static {p1, v0}, Ljava/lang/Math;->max(II)I

    move-result p1

    iput p1, p0, Le/e/a/DurationRangeBar;->high:I

    :cond_c5
    iget-object p1, p0, Le/e/a/DurationRangeBar;->changed:Ljava/util/function/BiConsumer;

    if-eqz p1, :cond_da

    iget-object p1, p0, Le/e/a/DurationRangeBar;->changed:Ljava/util/function/BiConsumer;

    iget v0, p0, Le/e/a/DurationRangeBar;->low:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iget v1, p0, Le/e/a/DurationRangeBar;->high:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {p1, v0, v1}, Ljava/util/function/BiConsumer;->accept(Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_da
    invoke-virtual {p0}, Le/e/a/DurationRangeBar;->invalidate()V

    return v2
.end method

.method pad()F
    .registers 3

    .line 6
    invoke-virtual {p0}, Le/e/a/DurationRangeBar;->getContext()Landroid/content/Context;

    move-result-object v0

    const/16 v1, 0x14

    invoke-static {v0, v1}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v0

    int-to-float v0, v0

    return v0
.end method

.method public performClick()Z
    .registers 2

    .line 9
    invoke-super {p0}, Landroid/view/View;->performClick()Z

    const/4 v0, 0x1

    return v0
.end method

.method x(I)F
    .registers 6

    .line 6
    invoke-virtual {p0}, Le/e/a/DurationRangeBar;->pad()F

    move-result v0

    invoke-virtual {p0}, Le/e/a/DurationRangeBar;->getWidth()I

    move-result v1

    int-to-float v1, v1

    const/high16 v2, 0x40000000    # 2.0f

    invoke-virtual {p0}, Le/e/a/DurationRangeBar;->pad()F

    move-result v3

    mul-float v3, v3, v2

    sub-float/2addr v1, v3

    int-to-float p1, p1

    mul-float v1, v1, p1

    iget p1, p0, Le/e/a/DurationRangeBar;->max:I

    int-to-float p1, p1

    div-float/2addr v1, p1

    add-float/2addr v0, v1

    return v0
.end method
