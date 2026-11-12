.class public Lcom/opera/android/touch/CurveOverlayView;
.super Landroid/view/View;
.source "SourceFile"


# instance fields
.field public final a:Landroid/graphics/Path;

.field public final b:I

.field public final c:Landroid/graphics/Paint;

.field public d:I


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

    invoke-direct {p0, p1, p2, v0}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    new-instance p1, Landroid/graphics/Path;

    invoke-direct {p1}, Landroid/graphics/Path;-><init>()V

    iput-object p1, p0, Lcom/opera/android/touch/CurveOverlayView;->a:Landroid/graphics/Path;

    new-instance p1, Landroid/graphics/Paint;

    const/4 p2, 0x1

    invoke-direct {p1, p2}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p1, p0, Lcom/opera/android/touch/CurveOverlayView;->c:Landroid/graphics/Paint;

    const/4 p1, 0x0

    invoke-virtual {p0, p2, p1}, Landroid/view/View;->setLayerType(ILandroid/graphics/Paint;)V

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const/high16 p2, 0x41300000    # 11.0f

    invoke-static {p2, p1}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result p1

    iput p1, p0, Lcom/opera/android/touch/CurveOverlayView;->b:I

    return-void
.end method


# virtual methods
.method public final onDraw(Landroid/graphics/Canvas;)V
    .registers 5

    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    iget-object v0, p0, Lcom/opera/android/touch/CurveOverlayView;->c:Landroid/graphics/Paint;

    invoke-virtual {v0}, Landroid/graphics/Paint;->getColor()I

    move-result v1

    iget v2, p0, Lcom/opera/android/touch/CurveOverlayView;->d:I

    if-eq v1, v2, :cond_10

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setColor(I)V

    :cond_10
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v1

    iget v2, p0, Lcom/opera/android/touch/CurveOverlayView;->b:I

    sub-int/2addr v1, v2

    int-to-float v1, v1

    const/4 v2, 0x0

    invoke-virtual {p1, v2, v1}, Landroid/graphics/Canvas;->translate(FF)V

    iget-object p0, p0, Lcom/opera/android/touch/CurveOverlayView;->a:Landroid/graphics/Path;

    invoke-virtual {p1, p0, v0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    return-void
.end method

.method public final onSizeChanged(IIII)V
    .registers 8

    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/View;->onSizeChanged(IIII)V

    iget-object p2, p0, Lcom/opera/android/touch/CurveOverlayView;->a:Landroid/graphics/Path;

    invoke-virtual {p2}, Landroid/graphics/Path;->reset()V

    div-int/lit8 p3, p1, 0x4

    int-to-float p4, p3

    iget p0, p0, Lcom/opera/android/touch/CurveOverlayView;->b:I

    int-to-float v0, p0

    div-int/lit8 v1, p1, 0x2

    int-to-float v1, v1

    int-to-float v2, p0

    invoke-virtual {p2, p4, v0, v1, v2}, Landroid/graphics/Path;->quadTo(FFFF)V

    mul-int/lit8 p3, p3, 0x3

    int-to-float p3, p3

    int-to-float p4, p0

    int-to-float p1, p1

    const/4 v0, 0x0

    invoke-virtual {p2, p3, p4, p1, v0}, Landroid/graphics/Path;->quadTo(FFFF)V

    int-to-float p3, p0

    invoke-virtual {p2, p1, p3}, Landroid/graphics/Path;->lineTo(FF)V

    int-to-float p0, p0

    invoke-virtual {p2, v0, p0}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {p2}, Landroid/graphics/Path;->close()V

    return-void
.end method

.method public final setBackground(Landroid/graphics/drawable/Drawable;)V
    .registers 3

    instance-of v0, p1, Landroid/graphics/drawable/ColorDrawable;

    if-eqz v0, :cond_f

    check-cast p1, Landroid/graphics/drawable/ColorDrawable;

    invoke-virtual {p1}, Landroid/graphics/drawable/ColorDrawable;->getColor()I

    move-result p1

    iput p1, p0, Lcom/opera/android/touch/CurveOverlayView;->d:I

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    :cond_f
    return-void
.end method

.method public final setBackgroundColor(I)V
    .registers 2

    iput p1, p0, Lcom/opera/android/touch/CurveOverlayView;->d:I

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return-void
.end method
