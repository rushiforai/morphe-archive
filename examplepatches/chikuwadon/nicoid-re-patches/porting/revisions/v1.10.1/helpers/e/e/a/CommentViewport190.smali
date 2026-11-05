.class public final Le/e/a/CommentViewport190;
.super Ljava/lang/Object;
.source "CommentViewport190.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static begin(Ljava/lang/Object;Landroid/graphics/Canvas;)V
    .registers 3

    .line 5
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    instance-of v0, p0, Landroid/view/View;

    if-eqz v0, :cond_1b

    check-cast p0, Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->getClipBounds()Landroid/graphics/Rect;

    move-result-object p0

    if-eqz p0, :cond_1b

    invoke-virtual {p1, p0}, Landroid/graphics/Canvas;->clipRect(Landroid/graphics/Rect;)Z

    iget v0, p0, Landroid/graphics/Rect;->left:I

    int-to-float v0, v0

    iget p0, p0, Landroid/graphics/Rect;->top:I

    int-to-float p0, p0

    invoke-virtual {p1, v0, p0}, Landroid/graphics/Canvas;->translate(FF)V

    :cond_1b
    return-void
.end method

.method public static end(Landroid/graphics/Canvas;)V
    .registers 1

    .line 6
    invoke-virtual {p0}, Landroid/graphics/Canvas;->restore()V

    return-void
.end method

.method public static height(Ljava/lang/Object;Landroid/graphics/Canvas;)I
    .registers 3

    .line 8
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getHeight()I

    move-result p1

    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Le/e/a/CommentViewport190;->size(Ljava/lang/Object;IZ)I

    move-result p0

    return p0
.end method

.method static size(Ljava/lang/Object;IZ)I
    .registers 4

    .line 9
    instance-of v0, p0, Landroid/view/View;

    if-nez v0, :cond_5

    return p1

    :cond_5
    check-cast p0, Landroid/view/View;

    if-eqz p2, :cond_e

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v0

    goto :goto_12

    :cond_e
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v0

    :goto_12
    invoke-virtual {p0}, Landroid/view/View;->getClipBounds()Landroid/graphics/Rect;

    move-result-object p0

    if-eqz p0, :cond_27

    if-eqz p2, :cond_1f

    invoke-virtual {p0}, Landroid/graphics/Rect;->width()I

    move-result p0

    goto :goto_23

    :cond_1f
    invoke-virtual {p0}, Landroid/graphics/Rect;->height()I

    move-result p0

    :goto_23
    invoke-static {v0, p0}, Ljava/lang/Math;->min(II)I

    move-result v0

    :cond_27
    if-lez v0, :cond_2d

    invoke-static {v0, p1}, Ljava/lang/Math;->min(II)I

    move-result p1

    :cond_2d
    return p1
.end method

.method public static width(Ljava/lang/Object;Landroid/graphics/Canvas;)I
    .registers 3

    .line 7
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    move-result p1

    const/4 v0, 0x1

    invoke-static {p0, p1, v0}, Le/e/a/CommentViewport190;->size(Ljava/lang/Object;IZ)I

    move-result p0

    return p0
.end method
