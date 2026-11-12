.class public final Lyz3;
.super Lx6g;
.source "SourceFile"


# instance fields
.field public final e:Landroid/graphics/Point;


# direct methods
.method public constructor <init>(IIIFLandroid/graphics/drawable/Drawable;Landroid/graphics/Point;)V
    .registers 9

    invoke-direct {p0, p5, p1, p2}, Lx6g;-><init>(Landroid/graphics/drawable/Drawable;II)V

    iput-object p6, p0, Lyz3;->e:Landroid/graphics/Point;

    const/high16 p5, 0x40000000    # 2.0f

    const/4 p6, 0x0

    if-eqz p3, :cond_7c

    const/4 v0, 0x1

    if-eq p3, v0, :cond_5a

    const/4 v0, 0x2

    if-eq p3, v0, :cond_37

    const/4 v0, 0x3

    if-eq p3, v0, :cond_14

    return-void

    :cond_14
    iget-object p3, p0, Lx6g;->b:Landroid/graphics/Path;

    invoke-virtual {p3, p6, p6}, Landroid/graphics/Path;->moveTo(FF)V

    iget-object p3, p0, Lx6g;->b:Landroid/graphics/Path;

    int-to-float p1, p1

    div-float p5, p1, p5

    sub-float v0, p5, p4

    int-to-float p2, p2

    sub-float v1, p2, p4

    invoke-virtual {p3, v0, v1}, Landroid/graphics/Path;->lineTo(FF)V

    iget-object p3, p0, Lx6g;->b:Landroid/graphics/Path;

    add-float/2addr p4, p5

    invoke-virtual {p3, p5, p2, p4, v1}, Landroid/graphics/Path;->quadTo(FFFF)V

    iget-object p2, p0, Lx6g;->b:Landroid/graphics/Path;

    invoke-virtual {p2, p1, p6}, Landroid/graphics/Path;->lineTo(FF)V

    iget-object p0, p0, Lx6g;->b:Landroid/graphics/Path;

    invoke-virtual {p0}, Landroid/graphics/Path;->close()V

    return-void

    :cond_37
    iget-object p3, p0, Lx6g;->b:Landroid/graphics/Path;

    invoke-virtual {p3, p6, p6}, Landroid/graphics/Path;->moveTo(FF)V

    iget-object p3, p0, Lx6g;->b:Landroid/graphics/Path;

    int-to-float p1, p1

    sub-float v0, p1, p4

    int-to-float p2, p2

    div-float p5, p2, p5

    sub-float v1, p5, p4

    invoke-virtual {p3, v0, v1}, Landroid/graphics/Path;->lineTo(FF)V

    iget-object p3, p0, Lx6g;->b:Landroid/graphics/Path;

    add-float/2addr p4, p5

    invoke-virtual {p3, p1, p5, v0, p4}, Landroid/graphics/Path;->quadTo(FFFF)V

    iget-object p1, p0, Lx6g;->b:Landroid/graphics/Path;

    invoke-virtual {p1, p6, p2}, Landroid/graphics/Path;->lineTo(FF)V

    iget-object p0, p0, Lx6g;->b:Landroid/graphics/Path;

    invoke-virtual {p0}, Landroid/graphics/Path;->close()V

    return-void

    :cond_5a
    iget-object p3, p0, Lx6g;->b:Landroid/graphics/Path;

    int-to-float p2, p2

    invoke-virtual {p3, p6, p2}, Landroid/graphics/Path;->moveTo(FF)V

    iget-object p3, p0, Lx6g;->b:Landroid/graphics/Path;

    int-to-float p1, p1

    div-float p5, p1, p5

    sub-float v0, p5, p4

    invoke-virtual {p3, v0, p4}, Landroid/graphics/Path;->lineTo(FF)V

    iget-object p3, p0, Lx6g;->b:Landroid/graphics/Path;

    add-float v0, p5, p4

    invoke-virtual {p3, p5, p6, v0, p4}, Landroid/graphics/Path;->quadTo(FFFF)V

    iget-object p3, p0, Lx6g;->b:Landroid/graphics/Path;

    invoke-virtual {p3, p1, p2}, Landroid/graphics/Path;->lineTo(FF)V

    iget-object p0, p0, Lx6g;->b:Landroid/graphics/Path;

    invoke-virtual {p0}, Landroid/graphics/Path;->close()V

    return-void

    :cond_7c
    iget-object p3, p0, Lx6g;->b:Landroid/graphics/Path;

    int-to-float p1, p1

    invoke-virtual {p3, p1, p6}, Landroid/graphics/Path;->moveTo(FF)V

    iget-object p3, p0, Lx6g;->b:Landroid/graphics/Path;

    int-to-float p2, p2

    div-float p5, p2, p5

    sub-float v0, p5, p4

    invoke-virtual {p3, p4, v0}, Landroid/graphics/Path;->lineTo(FF)V

    iget-object p3, p0, Lx6g;->b:Landroid/graphics/Path;

    add-float v0, p5, p4

    invoke-virtual {p3, p6, p5, p4, v0}, Landroid/graphics/Path;->quadTo(FFFF)V

    iget-object p3, p0, Lx6g;->b:Landroid/graphics/Path;

    invoke-virtual {p3, p1, p2}, Landroid/graphics/Path;->lineTo(FF)V

    iget-object p0, p0, Lx6g;->b:Landroid/graphics/Path;

    invoke-virtual {p0}, Landroid/graphics/Path;->close()V

    return-void
.end method


# virtual methods
.method public final draw(Landroid/graphics/Canvas;)V
    .registers 5

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result v0

    iget-object v1, p0, Lx6g;->b:Landroid/graphics/Path;

    invoke-virtual {p1, v1}, Landroid/graphics/Canvas;->clipPath(Landroid/graphics/Path;)Z

    iget-object v1, p0, Lyz3;->e:Landroid/graphics/Point;

    iget v2, v1, Landroid/graphics/Point;->x:I

    int-to-float v2, v2

    iget v1, v1, Landroid/graphics/Point;->y:I

    int-to-float v1, v1

    invoke-virtual {p1, v2, v1}, Landroid/graphics/Canvas;->translate(FF)V

    iget-object p0, p0, Lx6g;->a:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->restoreToCount(I)V

    return-void
.end method
