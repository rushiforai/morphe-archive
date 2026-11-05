.class public final Le/e/a/PopupReturnIcon223;
.super Landroid/graphics/drawable/Drawable;
.source "PopupReturnIcon223.java"


# instance fields
.field private alpha:I

.field private final paint:Landroid/graphics/Paint;

.field private final path:Landroid/graphics/Path;


# direct methods
.method public constructor <init>()V
    .registers 3

    .line 4
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 5
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Le/e/a/PopupReturnIcon223;->paint:Landroid/graphics/Paint;

    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Le/e/a/PopupReturnIcon223;->path:Landroid/graphics/Path;

    const/16 v0, 0xff

    iput v0, p0, Le/e/a/PopupReturnIcon223;->alpha:I

    return-void
.end method

.method public static apply(Landroid/widget/Button;)V
    .registers 5

    .line 6
    const-string v0, ""

    invoke-virtual {p0, v0}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/widget/Button;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setShape(I)V

    invoke-virtual {p0}, Landroid/widget/Button;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result v1

    new-instance v2, Landroid/graphics/drawable/RippleDrawable;

    const v3, 0xffffff

    and-int/2addr v1, v3

    const/high16 v3, 0x55000000

    or-int/2addr v1, v3

    invoke-static {v1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v1

    new-instance v3, Le/e/a/PopupReturnIcon223;

    invoke-direct {v3}, Le/e/a/PopupReturnIcon223;-><init>()V

    invoke-direct {v2, v1, v3, v0}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p0, v2}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .registers 11

    .line 7
    invoke-virtual {p0}, Le/e/a/PopupReturnIcon223;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v1

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    int-to-float v1, v1

    const v2, 0x3f51eb85    # 0.82f

    mul-float v1, v1, v2

    const-string v2, "fullscreen"

    invoke-static {v1, v2}, Le/e/a/ControlSizing193;->glyph(FLjava/lang/String;)F

    move-result v1

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result v2

    invoke-virtual {v0}, Landroid/graphics/Rect;->exactCenterX()F

    move-result v3

    const/high16 v4, 0x40000000    # 2.0f

    div-float v4, v1, v4

    sub-float/2addr v3, v4

    invoke-virtual {v0}, Landroid/graphics/Rect;->exactCenterY()F

    move-result v0

    sub-float/2addr v0, v4

    invoke-virtual {p1, v3, v0}, Landroid/graphics/Canvas;->translate(FF)V

    const/high16 v0, 0x41c00000    # 24.0f

    div-float/2addr v1, v0

    invoke-virtual {p1, v1, v1}, Landroid/graphics/Canvas;->scale(FF)V

    iget-object v0, p0, Le/e/a/PopupReturnIcon223;->paint:Landroid/graphics/Paint;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v0, p0, Le/e/a/PopupReturnIcon223;->paint:Landroid/graphics/Paint;

    iget v1, p0, Le/e/a/PopupReturnIcon223;->alpha:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    iget-object v0, p0, Le/e/a/PopupReturnIcon223;->paint:Landroid/graphics/Paint;

    const v1, 0x3fe66666    # 1.8f

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget-object v0, p0, Le/e/a/PopupReturnIcon223;->paint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    iget-object v0, p0, Le/e/a/PopupReturnIcon223;->paint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Join;->ROUND:Landroid/graphics/Paint$Join;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeJoin(Landroid/graphics/Paint$Join;)V

    iget-object v0, p0, Le/e/a/PopupReturnIcon223;->paint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v0, p0, Le/e/a/PopupReturnIcon223;->path:Landroid/graphics/Path;

    invoke-virtual {v0}, Landroid/graphics/Path;->rewind()V

    iget-object v0, p0, Le/e/a/PopupReturnIcon223;->path:Landroid/graphics/Path;

    const/high16 v1, 0x41200000    # 10.0f

    const/high16 v3, 0x40a00000    # 5.0f

    invoke-virtual {v0, v1, v3}, Landroid/graphics/Path;->moveTo(FF)V

    iget-object v0, p0, Le/e/a/PopupReturnIcon223;->path:Landroid/graphics/Path;

    const/high16 v1, 0x40800000    # 4.0f

    invoke-virtual {v0, v1, v3}, Landroid/graphics/Path;->lineTo(FF)V

    iget-object v0, p0, Le/e/a/PopupReturnIcon223;->path:Landroid/graphics/Path;

    const/high16 v3, 0x41a00000    # 20.0f

    invoke-virtual {v0, v1, v3}, Landroid/graphics/Path;->lineTo(FF)V

    iget-object v0, p0, Le/e/a/PopupReturnIcon223;->path:Landroid/graphics/Path;

    const/high16 v1, 0x41980000    # 19.0f

    invoke-virtual {v0, v1, v3}, Landroid/graphics/Path;->lineTo(FF)V

    iget-object v0, p0, Le/e/a/PopupReturnIcon223;->path:Landroid/graphics/Path;

    const/high16 v3, 0x41600000    # 14.0f

    invoke-virtual {v0, v1, v3}, Landroid/graphics/Path;->lineTo(FF)V

    iget-object v0, p0, Le/e/a/PopupReturnIcon223;->path:Landroid/graphics/Path;

    iget-object v1, p0, Le/e/a/PopupReturnIcon223;->paint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    iget-object v0, p0, Le/e/a/PopupReturnIcon223;->path:Landroid/graphics/Path;

    invoke-virtual {v0}, Landroid/graphics/Path;->rewind()V

    iget-object v0, p0, Le/e/a/PopupReturnIcon223;->path:Landroid/graphics/Path;

    const/high16 v1, 0x41400000    # 12.0f

    const/high16 v3, 0x40400000    # 3.0f

    invoke-virtual {v0, v1, v3}, Landroid/graphics/Path;->moveTo(FF)V

    iget-object v0, p0, Le/e/a/PopupReturnIcon223;->path:Landroid/graphics/Path;

    const/high16 v4, 0x41a80000    # 21.0f

    invoke-virtual {v0, v4, v3}, Landroid/graphics/Path;->lineTo(FF)V

    iget-object v0, p0, Le/e/a/PopupReturnIcon223;->path:Landroid/graphics/Path;

    invoke-virtual {v0, v4, v1}, Landroid/graphics/Path;->lineTo(FF)V

    iget-object v0, p0, Le/e/a/PopupReturnIcon223;->path:Landroid/graphics/Path;

    iget-object v1, p0, Le/e/a/PopupReturnIcon223;->paint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    const/high16 v7, 0x40400000    # 3.0f

    iget-object v8, p0, Le/e/a/PopupReturnIcon223;->paint:Landroid/graphics/Paint;

    const/high16 v4, 0x41200000    # 10.0f

    const/high16 v5, 0x41600000    # 14.0f

    const/high16 v6, 0x41a80000    # 21.0f

    move-object v3, p1

    invoke-virtual/range {v3 .. v8}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    invoke-virtual {p1, v2}, Landroid/graphics/Canvas;->restoreToCount(I)V

    return-void
.end method

.method public getOpacity()I
    .registers 2

    const/4 v0, -0x3

    return v0
.end method

.method public setAlpha(I)V
    .registers 2

    .line 8
    iput p1, p0, Le/e/a/PopupReturnIcon223;->alpha:I

    invoke-virtual {p0}, Le/e/a/PopupReturnIcon223;->invalidateSelf()V

    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 3

    .line 8
    iget-object v0, p0, Le/e/a/PopupReturnIcon223;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    invoke-virtual {p0}, Le/e/a/PopupReturnIcon223;->invalidateSelf()V

    return-void
.end method
