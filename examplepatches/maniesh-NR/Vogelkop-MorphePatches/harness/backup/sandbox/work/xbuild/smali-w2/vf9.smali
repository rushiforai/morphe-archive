.class public final Lvf9;
.super Ltf9;
.source "SourceFile"


# instance fields
.field public g:Landroid/graphics/Path;


# virtual methods
.method public final a(Landroid/graphics/Canvas;Landroid/graphics/Rect;)V
    .registers 4

    iget-object p2, p0, Lvf9;->g:Landroid/graphics/Path;

    if-nez p2, :cond_5

    return-void

    :cond_5
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    iget p2, p0, Ltf9;->d:I

    int-to-float p2, p2

    const/high16 v0, 0x40000000    # 2.0f

    div-float/2addr p2, v0

    neg-float p2, p2

    invoke-virtual {p1, p2, p2}, Landroid/graphics/Canvas;->translate(FF)V

    iget-object p2, p0, Lvf9;->g:Landroid/graphics/Path;

    iget-object p0, p0, Ltf9;->e:Landroid/graphics/Paint;

    invoke-virtual {p1, p2, p0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    return-void
.end method

.method public final onBoundsChange(Landroid/graphics/Rect;)V
    .registers 4

    invoke-super {p0, p1}, Landroid/graphics/drawable/Drawable;->onBoundsChange(Landroid/graphics/Rect;)V

    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    move-result p1

    int-to-float p1, p1

    iget v0, p0, Ltf9;->d:I

    int-to-float v0, v0

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    add-float/2addr v0, p1

    invoke-static {v0}, Li41;->H(F)Landroid/graphics/Path;

    move-result-object p1

    iput-object p1, p0, Lvf9;->g:Landroid/graphics/Path;

    return-void
.end method
