.class public Ll/otg;
.super Landroid/text/style/ImageSpan;
.source "SourceFile"


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/graphics/Bitmap;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/graphics/Bitmap;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2}, Landroid/text/style/ImageSpan;-><init>(Landroid/content/Context;Landroid/graphics/Bitmap;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;Ljava/lang/CharSequence;IIFIIILandroid/graphics/Paint;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/text/style/DynamicDrawableSpan;->getDrawable()Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    if-eqz p2, :cond_0

    .line 10
    .line 11
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 12
    .line 13
    .line 14
    sub-int/2addr p8, p6

    .line 15
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    iget p2, p2, Landroid/graphics/Rect;->bottom:I

    .line 20
    .line 21
    sub-int/2addr p8, p2

    .line 22
    div-int/lit8 p8, p8, 0x2

    .line 23
    .line 24
    add-int/2addr p8, p6

    .line 25
    int-to-float p2, p8

    .line 26
    invoke-virtual {p1, p5, p2}, Landroid/graphics/Canvas;->translate(FF)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method public getSize(Landroid/graphics/Paint;Ljava/lang/CharSequence;IILandroid/graphics/Paint$FontMetricsInt;)I
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/text/style/DynamicDrawableSpan;->getDrawable()Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 p2, 0x0

    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    return p2

    .line 9
    :cond_0
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    if-nez p0, :cond_1

    .line 14
    .line 15
    return p2

    .line 16
    :cond_1
    invoke-static {p5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result p2

    .line 20
    if-eqz p2, :cond_2

    .line 21
    .line 22
    invoke-virtual {p1}, Landroid/graphics/Paint;->getFontMetricsInt()Landroid/graphics/Paint$FontMetricsInt;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    iget p2, p1, Landroid/graphics/Paint$FontMetricsInt;->bottom:I

    .line 27
    .line 28
    iget p1, p1, Landroid/graphics/Paint$FontMetricsInt;->top:I

    .line 29
    .line 30
    sub-int/2addr p2, p1

    .line 31
    iget p1, p0, Landroid/graphics/Rect;->bottom:I

    .line 32
    .line 33
    iget p3, p0, Landroid/graphics/Rect;->top:I

    .line 34
    .line 35
    sub-int/2addr p1, p3

    .line 36
    div-int/lit8 p1, p1, 0x2

    .line 37
    .line 38
    div-int/lit8 p2, p2, 0x4

    .line 39
    .line 40
    sub-int p3, p1, p2

    .line 41
    .line 42
    add-int/2addr p1, p2

    .line 43
    neg-int p1, p1

    .line 44
    iput p1, p5, Landroid/graphics/Paint$FontMetricsInt;->ascent:I

    .line 45
    .line 46
    iput p1, p5, Landroid/graphics/Paint$FontMetricsInt;->top:I

    .line 47
    .line 48
    iput p3, p5, Landroid/graphics/Paint$FontMetricsInt;->bottom:I

    .line 49
    .line 50
    iput p3, p5, Landroid/graphics/Paint$FontMetricsInt;->descent:I

    .line 51
    .line 52
    :cond_2
    iget p0, p0, Landroid/graphics/Rect;->right:I

    .line 53
    .line 54
    return p0
.end method
