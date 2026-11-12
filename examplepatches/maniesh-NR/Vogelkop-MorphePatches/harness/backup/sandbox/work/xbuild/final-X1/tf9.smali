.class public abstract Ltf9;
.super Landroid/graphics/drawable/LayerDrawable;
.source "SourceFile"


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:I

.field public final c:Landroid/graphics/Paint$Style;

.field public final d:I

.field public final e:Landroid/graphics/Paint;

.field public f:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Lsll;Landroid/graphics/Paint$Style;I)V
    .registers 8

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-eqz p2, :cond_9

    new-array v2, v1, [Landroid/graphics/drawable/Drawable;

    aput-object p2, v2, v0

    goto :goto_b

    :cond_9
    new-array v2, v0, [Landroid/graphics/drawable/Drawable;

    :goto_b
    invoke-direct {p0, v2}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    new-instance p2, Landroid/graphics/Paint;

    invoke-direct {p2, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p2, p0, Ltf9;->e:Landroid/graphics/Paint;

    iput-object p1, p0, Ltf9;->a:Landroid/content/Context;

    iput p4, p0, Ltf9;->b:I

    iput-object p3, p0, Ltf9;->c:Landroid/graphics/Paint$Style;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p3, 0x7f070235

    invoke-virtual {p1, p3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Ltf9;->d:I

    int-to-float p0, p1

    invoke-virtual {p2, p0}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    return-void
.end method


# virtual methods
.method public a(Landroid/graphics/Canvas;Landroid/graphics/Rect;)V
    .registers 11

    iget v0, p0, Ltf9;->d:I

    int-to-float v0, v0

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    iget v1, p2, Landroid/graphics/Rect;->left:I

    int-to-float v1, v1

    sub-float v3, v1, v0

    iget v1, p2, Landroid/graphics/Rect;->top:I

    int-to-float v1, v1

    sub-float v4, v1, v0

    iget v1, p2, Landroid/graphics/Rect;->right:I

    int-to-float v1, v1

    add-float v5, v1, v0

    iget p2, p2, Landroid/graphics/Rect;->bottom:I

    int-to-float p2, p2

    add-float v6, p2, v0

    iget-object v7, p0, Ltf9;->e:Landroid/graphics/Paint;

    move-object v2, p1

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawOval(FFFFLandroid/graphics/Paint;)V

    return-void
.end method

.method public final draw(Landroid/graphics/Canvas;)V
    .registers 7

    invoke-super {p0, p1}, Landroid/graphics/drawable/LayerDrawable;->draw(Landroid/graphics/Canvas;)V

    iget-boolean v0, p0, Ltf9;->f:Z

    if-eqz v0, :cond_33

    iget v0, p0, Ltf9;->b:I

    const v1, 0x7f06063b

    iget-object v2, p0, Ltf9;->a:Landroid/content/Context;

    invoke-static {v0, v2, v1}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v0

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    iget-object v2, p0, Ltf9;->c:Landroid/graphics/Paint$Style;

    iget-object v3, p0, Ltf9;->e:Landroid/graphics/Paint;

    if-eq v2, v1, :cond_1e

    sget-object v4, Landroid/graphics/Paint$Style;->FILL_AND_STROKE:Landroid/graphics/Paint$Style;

    if-ne v2, v4, :cond_2b

    :cond_1e
    invoke-virtual {v3, v0}, Landroid/graphics/Paint;->setColor(I)V

    invoke-virtual {v3, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v1

    invoke-virtual {p0, p1, v1}, Ltf9;->a(Landroid/graphics/Canvas;Landroid/graphics/Rect;)V

    :cond_2b
    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    if-eq v2, v1, :cond_34

    sget-object v4, Landroid/graphics/Paint$Style;->FILL_AND_STROKE:Landroid/graphics/Paint$Style;

    if-eq v2, v4, :cond_34

    :cond_33
    return-void

    :cond_34
    invoke-virtual {v3, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    const v1, 0x3df5c28f    # 0.12f

    invoke-static {v1, v0}, Lp37;->a0(FI)I

    move-result v0

    invoke-virtual {v3, v0}, Landroid/graphics/Paint;->setColor(I)V

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Ltf9;->a(Landroid/graphics/Canvas;Landroid/graphics/Rect;)V

    return-void
.end method

.method public final getOpacity()I
    .registers 1

    const/4 p0, -0x3

    return p0
.end method

.method public final isStateful()Z
    .registers 1

    const/4 p0, 0x1

    return p0
.end method

.method public final onStateChange([I)Z
    .registers 8

    invoke-super {p0, p1}, Landroid/graphics/drawable/LayerDrawable;->onStateChange([I)Z

    array-length v0, p1

    const/4 v1, 0x0

    move v2, v1

    :goto_6
    const/4 v3, 0x1

    if-ge v2, v0, :cond_15

    aget v4, p1, v2

    const v5, 0x101009c

    if-ne v4, v5, :cond_12

    move p1, v3

    goto :goto_16

    :cond_12
    add-int/lit8 v2, v2, 0x1

    goto :goto_6

    :cond_15
    move p1, v1

    :goto_16
    iget-boolean v0, p0, Ltf9;->f:Z

    if-eq p1, v0, :cond_1b

    move v1, v3

    :cond_1b
    iput-boolean p1, p0, Ltf9;->f:Z

    return v1
.end method

.method public final setAlpha(I)V
    .registers 2

    invoke-super {p0, p1}, Landroid/graphics/drawable/LayerDrawable;->setAlpha(I)V

    iget-object p0, p0, Ltf9;->e:Landroid/graphics/Paint;

    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    return-void
.end method
