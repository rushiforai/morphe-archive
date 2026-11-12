.class public abstract Lvmj;
.super Landroid/graphics/drawable/Drawable;
.source "SourceFile"


# static fields
.field public static final synthetic g:I


# instance fields
.field public final a:I

.field public final b:I

.field public final c:Loa5;

.field public final d:Lnrl;

.field public final e:Lzyk;

.field public f:Landroid/graphics/Bitmap;


# direct methods
.method public constructor <init>(Landroid/content/Context;IILumj;Loa5;)V
    .registers 9

    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    iput p2, p0, Lvmj;->a:I

    iput p3, p0, Lvmj;->b:I

    iput-object p5, p0, Lvmj;->c:Loa5;

    new-instance p3, Lnrl;

    sget-object p5, Lumj;->a:Lumj;

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-eq p4, p5, :cond_13

    move p5, v1

    goto :goto_14

    :cond_13
    move p5, v0

    :goto_14
    invoke-virtual {p4}, Ljava/lang/Enum;->ordinal()I

    move-result p4

    const/4 v2, 0x2

    if-eq p4, v2, :cond_38

    const/4 v2, 0x3

    if-eq p4, v2, :cond_36

    const p4, 0x7f04067b

    filled-new-array {p4}, [I

    move-result-object p4

    invoke-virtual {p1, p4}, Landroid/content/Context;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    move-result-object p4

    :try_start_29
    invoke-virtual {p4, v0, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v2
    :try_end_2d
    .catchall {:try_start_29 .. :try_end_2d} :catchall_31

    invoke-virtual {p4}, Landroid/content/res/TypedArray;->recycle()V

    goto :goto_39

    :catchall_31
    move-exception p0

    invoke-virtual {p4}, Landroid/content/res/TypedArray;->recycle()V

    throw p0

    :cond_36
    move v2, v0

    goto :goto_39

    :cond_38
    move v2, v1

    :goto_39
    invoke-direct {p3}, Ljava/lang/Object;-><init>()V

    if-eqz p5, :cond_47

    invoke-static {p1}, Lgjf;->a(Landroid/content/Context;)Lgjf;

    move-result-object p1

    invoke-virtual {p1, p2, v2}, Lgjf;->b(II)Lbcd;

    move-result-object p1

    goto :goto_48

    :cond_47
    const/4 p1, 0x0

    :goto_48
    iput-object p1, p3, Lnrl;->b:Ljava/lang/Object;

    if-ne v2, v1, :cond_4d

    move v0, v1

    :cond_4d
    iput-boolean v0, p3, Lnrl;->a:Z

    iput-object p3, p0, Lvmj;->d:Lnrl;

    new-instance p1, Lj3i;

    const/16 p2, 0x1d

    invoke-direct {p1, p0, p2}, Lj3i;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lvmj;->e:Lzyk;

    return-void
.end method


# virtual methods
.method public final a(Landroid/graphics/Canvas;)V
    .registers 9

    iget-object v0, p0, Lvmj;->d:Lnrl;

    iget-object v0, v0, Lnrl;->b:Ljava/lang/Object;

    check-cast v0, Lbcd;

    if-eqz v0, :cond_12

    iget-object v1, p0, Lvmj;->c:Loa5;

    iget v1, v1, Loa5;->b:I

    const/4 v2, 0x0

    invoke-virtual {v0, p1, v2, v2, v1}, Lbcd;->b(Landroid/graphics/Canvas;FFI)V

    move-object v1, p1

    goto :goto_27

    :cond_12
    iget v0, p0, Lvmj;->a:I

    int-to-float v4, v0

    iget v0, p0, Lvmj;->b:I

    int-to-float v5, v0

    iget-object v0, p0, Lvmj;->e:Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    move-object v6, v0

    check-cast v6, Landroid/graphics/Paint;

    const/4 v2, 0x0

    const/4 v3, 0x0

    move-object v1, p1

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    :goto_27
    invoke-virtual {p0, v1}, Lvmj;->b(Landroid/graphics/Canvas;)V

    return-void
.end method

.method public abstract b(Landroid/graphics/Canvas;)V
.end method

.method public final draw(Landroid/graphics/Canvas;)V
    .registers 7

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

    iget v1, p0, Lvmj;->a:I

    int-to-float v2, v1

    div-float/2addr v0, v2

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v2

    invoke-virtual {v2}, Landroid/graphics/Rect;->height()I

    move-result v2

    int-to-float v2, v2

    iget v3, p0, Lvmj;->b:I

    int-to-float v4, v3

    div-float/2addr v2, v4

    invoke-virtual {p1, v0, v2}, Landroid/graphics/Canvas;->scale(FF)V

    iget-object v0, p0, Lvmj;->f:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_3b

    const/4 p0, 0x0

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1, v1, p0}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    goto :goto_49

    :cond_3b
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result v0

    const/4 v2, 0x0

    invoke-virtual {p1, v2, v2, v1, v3}, Landroid/graphics/Canvas;->clipRect(IIII)Z

    :try_start_43
    invoke-virtual {p0, p1}, Lvmj;->a(Landroid/graphics/Canvas;)V
    :try_end_46
    .catchall {:try_start_43 .. :try_end_46} :catchall_4d

    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->restoreToCount(I)V

    :goto_49
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    return-void

    :catchall_4d
    move-exception p0

    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->restoreToCount(I)V

    throw p0
.end method

.method public final getIntrinsicHeight()I
    .registers 1

    iget p0, p0, Lvmj;->b:I

    return p0
.end method

.method public final getIntrinsicWidth()I
    .registers 1

    iget p0, p0, Lvmj;->a:I

    return p0
.end method

.method public final getOpacity()I
    .registers 1

    const/4 p0, -0x3

    return p0
.end method

.method public setAlpha(I)V
    .registers 2

    iget-object p0, p0, Lvmj;->e:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/graphics/Paint;

    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    return-void
.end method

.method public final setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 2

    return-void
.end method
