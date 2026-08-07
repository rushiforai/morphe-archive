.class public Ll/jeh;
.super Landroid/text/style/ImageSpan;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:I


# direct methods
.method public constructor <init>(Landroid/graphics/drawable/Drawable;II)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/text/style/ImageSpan;-><init>(Landroid/graphics/drawable/Drawable;)V

    .line 2
    .line 3
    .line 4
    iput p2, p0, Ll/jeh;->b:I

    .line 5
    .line 6
    iput p3, p0, Ll/jeh;->a:I

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;Ljava/lang/CharSequence;IIFIIILandroid/graphics/Paint;)V
    .locals 0
    .param p1    # Landroid/graphics/Canvas;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p9    # Landroid/graphics/Paint;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0}, Landroid/text/style/DynamicDrawableSpan;->getDrawable()Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p9}, Landroid/graphics/Paint;->getFontMetricsInt()Landroid/graphics/Paint$FontMetricsInt;

    .line 6
    .line 7
    .line 8
    move-result-object p3

    .line 9
    iget p0, p0, Ll/jeh;->b:I

    .line 10
    .line 11
    int-to-float p0, p0

    .line 12
    add-float/2addr p0, p5

    .line 13
    iget p4, p3, Landroid/graphics/Paint$FontMetricsInt;->descent:I

    .line 14
    .line 15
    add-int/2addr p4, p7

    .line 16
    add-int/2addr p4, p7

    .line 17
    iget p3, p3, Landroid/graphics/Paint$FontMetricsInt;->ascent:I

    .line 18
    .line 19
    add-int/2addr p4, p3

    .line 20
    div-int/lit8 p4, p4, 0x2

    .line 21
    .line 22
    invoke-virtual {p2}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 23
    .line 24
    .line 25
    move-result-object p3

    .line 26
    iget p3, p3, Landroid/graphics/Rect;->bottom:I

    .line 27
    .line 28
    div-int/lit8 p3, p3, 0x2

    .line 29
    .line 30
    sub-int/2addr p4, p3

    .line 31
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 32
    .line 33
    .line 34
    int-to-float p3, p4

    .line 35
    invoke-virtual {p1, p0, p3}, Landroid/graphics/Canvas;->translate(FF)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p2, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public getSize(Landroid/graphics/Paint;Ljava/lang/CharSequence;IILandroid/graphics/Paint$FontMetricsInt;)I
    .locals 0

    .line 1
    invoke-super/range {p0 .. p5}, Landroid/text/style/ReplacementSpan;->getSize(Landroid/graphics/Paint;Ljava/lang/CharSequence;IILandroid/graphics/Paint$FontMetricsInt;)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget p2, p0, Ll/jeh;->a:I

    .line 6
    .line 7
    if-lez p2, :cond_0

    .line 8
    .line 9
    iget p0, p0, Ll/jeh;->b:I

    .line 10
    .line 11
    if-lez p0, :cond_0

    .line 12
    .line 13
    add-int/2addr p2, p1

    .line 14
    add-int/2addr p2, p0

    .line 15
    return p2

    .line 16
    :cond_0
    return p1
.end method
