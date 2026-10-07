.class final Le/e/a/ReactionIcons$Face;
.super Landroid/graphics/drawable/Drawable;
.source "ReactionIcons.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/ReactionIcons;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Face"
.end annotation


# instance fields
.field final color:I

.field final p:Landroid/graphics/Paint;

.field final size:I


# direct methods
.method constructor <init>(Landroid/view/View;Z)V
    .registers 5

    .line 7
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Le/e/a/ReactionIcons$Face;->p:Landroid/graphics/Paint;

    if-eqz p2, :cond_13

    const/4 p2, 0x1

    invoke-static {p1, p2}, Le/e/a/ReactionIcons;->selected(Landroid/view/View;Z)I

    move-result p2

    goto :goto_17

    :cond_13
    invoke-static {p1}, Le/e/a/ReactionIcons;->neutral(Landroid/view/View;)I

    move-result p2

    :goto_17
    iput p2, p0, Le/e/a/ReactionIcons$Face;->color:I

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    const/16 p2, 0x14

    invoke-static {p1, p2}, Le/e/a/FeedbackFixes;->dp(Landroid/content/Context;I)I

    move-result p1

    iput p1, p0, Le/e/a/ReactionIcons$Face;->size:I

    iget p1, p0, Le/e/a/ReactionIcons$Face;->size:I

    iget p2, p0, Le/e/a/ReactionIcons$Face;->size:I

    const/4 v0, 0x0

    invoke-virtual {p0, v0, v0, p1, p2}, Le/e/a/ReactionIcons$Face;->setBounds(IIII)V

    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .registers 11

    .line 7
    invoke-virtual {p0}, Le/e/a/ReactionIcons$Face;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    iget v1, v0, Landroid/graphics/Rect;->left:I

    int-to-float v1, v1

    iget v2, v0, Landroid/graphics/Rect;->top:I

    int-to-float v2, v2

    invoke-virtual {p1, v1, v2}, Landroid/graphics/Canvas;->translate(FF)V

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v1

    int-to-float v1, v1

    const/high16 v2, 0x41c00000    # 24.0f

    div-float/2addr v1, v2

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v0

    int-to-float v0, v0

    div-float/2addr v0, v2

    invoke-virtual {p1, v1, v0}, Landroid/graphics/Canvas;->scale(FF)V

    iget-object v0, p0, Le/e/a/ReactionIcons$Face;->p:Landroid/graphics/Paint;

    iget v1, p0, Le/e/a/ReactionIcons$Face;->color:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v0, p0, Le/e/a/ReactionIcons$Face;->p:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v0, p0, Le/e/a/ReactionIcons$Face;->p:Landroid/graphics/Paint;

    const v1, 0x3fd9999a    # 1.7f

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget-object v0, p0, Le/e/a/ReactionIcons$Face;->p:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    const/high16 v0, 0x41180000    # 9.5f

    iget-object v1, p0, Le/e/a/ReactionIcons$Face;->p:Landroid/graphics/Paint;

    const/high16 v2, 0x41400000    # 12.0f

    invoke-virtual {p1, v2, v2, v0, v1}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    const/high16 v4, 0x41200000    # 10.0f

    iget-object v5, p0, Le/e/a/ReactionIcons$Face;->p:Landroid/graphics/Paint;

    const/high16 v1, 0x41000000    # 8.0f

    const/high16 v2, 0x41080000    # 8.5f

    const/high16 v3, 0x41000000    # 8.0f

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    iget-object v5, p0, Le/e/a/ReactionIcons$Face;->p:Landroid/graphics/Paint;

    const/high16 v1, 0x41800000    # 16.0f

    const/high16 v3, 0x41800000    # 16.0f

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    const/4 v7, 0x0

    iget-object v8, p0, Le/e/a/ReactionIcons$Face;->p:Landroid/graphics/Paint;

    const/high16 v1, 0x40d00000    # 6.5f

    const/high16 v2, 0x41000000    # 8.0f

    const/high16 v3, 0x418c0000    # 17.5f

    const/high16 v4, 0x41880000    # 17.0f

    const/high16 v5, 0x41700000    # 15.0f

    const/high16 v6, 0x43160000    # 150.0f

    invoke-virtual/range {v0 .. v8}, Landroid/graphics/Canvas;->drawArc(FFFFFFZLandroid/graphics/Paint;)V

    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    return-void
.end method

.method public getIntrinsicHeight()I
    .registers 2

    .line 7
    iget v0, p0, Le/e/a/ReactionIcons$Face;->size:I

    return v0
.end method

.method public getIntrinsicWidth()I
    .registers 2

    .line 7
    iget v0, p0, Le/e/a/ReactionIcons$Face;->size:I

    return v0
.end method

.method public getOpacity()I
    .registers 2

    .line 7
    const/4 v0, -0x3

    return v0
.end method

.method public setAlpha(I)V
    .registers 3

    .line 7
    iget-object v0, p0, Le/e/a/ReactionIcons$Face;->p:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 3

    .line 7
    iget-object v0, p0, Le/e/a/ReactionIcons$Face;->p:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    return-void
.end method
