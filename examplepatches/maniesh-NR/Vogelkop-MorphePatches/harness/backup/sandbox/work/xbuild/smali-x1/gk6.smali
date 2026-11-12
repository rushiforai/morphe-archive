.class public final Lgk6;
.super Landroid/graphics/drawable/Drawable;
.source "SourceFile"


# static fields
.field public static final synthetic j:I


# instance fields
.field public final a:Landroid/graphics/drawable/Drawable;

.field public final b:Ljava/lang/Integer;

.field public final c:I

.field public final d:I

.field public final e:Lfk6;

.field public f:I

.field public g:Ljava/lang/Integer;

.field public final h:Landroid/graphics/Paint;

.field public i:Landroid/graphics/drawable/Drawable;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/graphics/drawable/Drawable;Ljava/lang/Integer;IILfk6;I)V
    .registers 8

    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    iput-object p2, p0, Lgk6;->a:Landroid/graphics/drawable/Drawable;

    iput-object p3, p0, Lgk6;->b:Ljava/lang/Integer;

    iput p4, p0, Lgk6;->c:I

    iput p5, p0, Lgk6;->d:I

    iput-object p6, p0, Lgk6;->e:Lfk6;

    iput p7, p0, Lgk6;->f:I

    invoke-virtual {p3}, Ljava/lang/Number;->intValue()I

    move-result p3

    const p4, 0x7f06063b

    invoke-static {p3, p1, p4}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p3

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    iput-object p3, p0, Lgk6;->g:Ljava/lang/Integer;

    new-instance p3, Landroid/graphics/Paint;

    const/4 p5, 0x1

    invoke-direct {p3, p5}, Landroid/graphics/Paint;-><init>(I)V

    const p5, 0x7f0402f4

    invoke-static {p5, p1, p4}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p1

    invoke-virtual {p3, p1}, Landroid/graphics/Paint;->setColor(I)V

    iput-object p3, p0, Lgk6;->h:Landroid/graphics/Paint;

    if-nez p2, :cond_36

    const/4 p2, 0x0

    goto :goto_41

    :cond_36
    iget-object p1, p0, Lgk6;->g:Ljava/lang/Integer;

    if-eqz p1, :cond_41

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-static {p2, p1}, Lj14;->n0(Landroid/graphics/drawable/Drawable;I)V

    :cond_41
    :goto_41
    iput-object p2, p0, Lgk6;->i:Landroid/graphics/drawable/Drawable;

    return-void
.end method


# virtual methods
.method public final a(ILandroid/content/Context;)V
    .registers 7

    const v0, 0x7f0402f4

    const v1, 0x7f06063b

    invoke-static {v0, p2, v1}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v0

    iget-object v2, p0, Lgk6;->h:Landroid/graphics/Paint;

    invoke-virtual {v2}, Landroid/graphics/Paint;->getColor()I

    move-result v3

    if-eq v3, v0, :cond_15

    invoke-virtual {v2, v0}, Landroid/graphics/Paint;->setColor(I)V

    :cond_15
    const/4 v0, 0x0

    iget-object v2, p0, Lgk6;->b:Ljava/lang/Integer;

    if-eqz v2, :cond_27

    invoke-virtual {v2}, Ljava/lang/Number;->intValue()I

    move-result v2

    invoke-static {v2, p2, v1}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p2

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    goto :goto_28

    :cond_27
    move-object p2, v0

    :goto_28
    iget-object v1, p0, Lgk6;->g:Ljava/lang/Integer;

    invoke-static {v1, p2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_42

    iput-object p2, p0, Lgk6;->g:Ljava/lang/Integer;

    iget-object v1, p0, Lgk6;->a:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_40

    if-eqz p2, :cond_3f

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    invoke-static {v1, p2}, Lj14;->n0(Landroid/graphics/drawable/Drawable;I)V

    :cond_3f
    move-object v0, v1

    :cond_40
    iput-object v0, p0, Lgk6;->i:Landroid/graphics/drawable/Drawable;

    :cond_42
    iput p1, p0, Lgk6;->f:I

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    return-void
.end method

.method public final draw(Landroid/graphics/Canvas;)V
    .registers 8

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    iget v0, v0, Landroid/graphics/Rect;->left:I

    int-to-float v0, v0

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v1

    iget v1, v1, Landroid/graphics/Rect;->top:I

    int-to-float v1, v1

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->translate(FF)V

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v0

    int-to-float v0, v0

    iget v1, p0, Lgk6;->c:I

    int-to-float v1, v1

    div-float/2addr v0, v1

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v2

    invoke-virtual {v2}, Landroid/graphics/Rect;->height()I

    move-result v2

    int-to-float v2, v2

    iget v3, p0, Lgk6;->d:I

    int-to-float v3, v3

    div-float/2addr v2, v3

    invoke-virtual {p1, v0, v2}, Landroid/graphics/Canvas;->scale(FF)V

    iget-object v0, p0, Lgk6;->e:Lfk6;

    invoke-virtual {v0}, Lfk6;->invoke()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lbcd;

    iget-object v2, p0, Lgk6;->h:Landroid/graphics/Paint;

    invoke-virtual {v2}, Landroid/graphics/Paint;->getColor()I

    move-result v2

    const/4 v4, 0x0

    invoke-virtual {v0, p1, v4, v4, v2}, Lbcd;->b(Landroid/graphics/Canvas;FFI)V

    iget-object v2, p0, Lgk6;->i:Landroid/graphics/drawable/Drawable;

    if-eqz v2, :cond_73

    const/high16 v4, 0x40000000    # 2.0f

    div-float/2addr v1, v4

    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v5

    invoke-virtual {v5}, Landroid/graphics/Rect;->width()I

    move-result v5

    int-to-float v5, v5

    div-float/2addr v5, v4

    sub-float/2addr v1, v5

    div-float/2addr v3, v4

    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v5

    invoke-virtual {v5}, Landroid/graphics/Rect;->height()I

    move-result v5

    int-to-float v5, v5

    div-float/2addr v5, v4

    sub-float/2addr v3, v5

    :try_start_61
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    invoke-virtual {p1, v1, v3}, Landroid/graphics/Canvas;->translate(FF)V

    invoke-virtual {v2, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V
    :try_end_6a
    .catchall {:try_start_61 .. :try_end_6a} :catchall_6e

    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    goto :goto_73

    :catchall_6e
    move-exception p0

    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    throw p0

    :cond_73
    :goto_73
    iget p0, p0, Lgk6;->f:I

    if-eqz p0, :cond_7a

    invoke-virtual {v0, p1, p0}, Lbcd;->a(Landroid/graphics/Canvas;I)V

    :cond_7a
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    return-void
.end method

.method public final getIntrinsicHeight()I
    .registers 1

    iget p0, p0, Lgk6;->d:I

    return p0
.end method

.method public final getIntrinsicWidth()I
    .registers 1

    iget p0, p0, Lgk6;->c:I

    return p0
.end method

.method public final getOpacity()I
    .registers 1

    const/4 p0, -0x3

    return p0
.end method

.method public final setAlpha(I)V
    .registers 3

    iget-object v0, p0, Lgk6;->h:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    iget-object v0, p0, Lgk6;->a:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_c

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    :cond_c
    iget-object p0, p0, Lgk6;->i:Landroid/graphics/drawable/Drawable;

    if-eqz p0, :cond_13

    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    :cond_13
    return-void
.end method

.method public final setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 2

    return-void
.end method
