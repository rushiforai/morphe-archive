.class public final Lqh8;
.super Landroid/view/View;
.source "SourceFile"


# instance fields
.field public final synthetic a:Lir;

.field public final synthetic b:Landroid/graphics/Rect;

.field public final synthetic c:La3l;


# direct methods
.method public constructor <init>(Lir;Landroid/graphics/Rect;La3l;Landroid/content/Context;)V
    .registers 5

    iput-object p1, p0, Lqh8;->a:Lir;

    iput-object p2, p0, Lqh8;->b:Landroid/graphics/Rect;

    iput-object p3, p0, Lqh8;->c:La3l;

    invoke-direct {p0, p4}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public final onDraw(Landroid/graphics/Canvas;)V
    .registers 6

    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    iget-object v0, p0, Lqh8;->a:Lir;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v1

    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    move-result v1

    int-to-float v1, v1

    iget-object v2, p0, Lqh8;->b:Landroid/graphics/Rect;

    invoke-virtual {v2}, Landroid/graphics/Rect;->width()I

    move-result v3

    int-to-float v3, v3

    div-float/2addr v1, v3

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v3

    invoke-virtual {v3}, Landroid/graphics/Rect;->height()I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {v2}, Landroid/graphics/Rect;->height()I

    move-result v2

    int-to-float v2, v2

    div-float/2addr v3, v2

    invoke-static {v1, v3}, Ljava/lang/Math;->min(FF)F

    move-result v1

    iget v2, v0, Lir;->j:F

    cmpg-float v2, v2, v1

    if-eqz v2, :cond_37

    iput v1, v0, Lir;->j:F

    invoke-virtual {v0}, Lir;->a()V

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    :cond_37
    invoke-virtual {v0, p1}, Lir;->draw(Landroid/graphics/Canvas;)V

    iget-object p0, p0, Lqh8;->c:La3l;

    iget-object p0, p0, La3l;->c:Landroid/view/View;

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    return-void
.end method
