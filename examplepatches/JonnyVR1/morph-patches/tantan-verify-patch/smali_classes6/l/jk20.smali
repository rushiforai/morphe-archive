.class public Ll/jk20;
.super Landroid/text/style/ImageSpan;
.source "SourceFile"

# interfaces
.implements Ll/zql;


# instance fields
.field public final a:I

.field public b:Landroid/graphics/Bitmap;

.field public c:Ljava/lang/String;

.field public d:F

.field public e:Landroid/graphics/drawable/Drawable;

.field public f:I

.field public g:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;I)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    const/16 v1, 0x22

    .line 3
    .line 4
    invoke-direct {p0, p1, v0, v1}, Landroid/text/style/ImageSpan;-><init>(Landroid/content/Context;Landroid/graphics/Bitmap;I)V

    .line 5
    .line 6
    .line 7
    iput-object p2, p0, Ll/jk20;->c:Ljava/lang/String;

    .line 8
    .line 9
    iput p3, p0, Ll/jk20;->a:I

    .line 10
    .line 11
    return-void
.end method

.method private b()Landroid/graphics/drawable/Drawable;
    .locals 4

    .line 1
    iget-object v0, p0, Ll/jk20;->b:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return-object p0

    .line 7
    :cond_0
    iget-object v0, p0, Ll/jk20;->e:Landroid/graphics/drawable/Drawable;

    .line 8
    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    return-object v0

    .line 12
    :cond_1
    new-instance v0, Landroid/graphics/drawable/BitmapDrawable;

    .line 13
    .line 14
    iget-object v1, p0, Ll/jk20;->b:Landroid/graphics/Bitmap;

    .line 15
    .line 16
    invoke-direct {v0, v1}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/graphics/Bitmap;)V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Ll/jk20;->e:Landroid/graphics/drawable/Drawable;

    .line 20
    .line 21
    iget v0, p0, Ll/jk20;->a:I

    .line 22
    .line 23
    int-to-float v0, v0

    .line 24
    iget-object v1, p0, Ll/jk20;->b:Landroid/graphics/Bitmap;

    .line 25
    .line 26
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    int-to-float v1, v1

    .line 31
    div-float/2addr v0, v1

    .line 32
    iput v0, p0, Ll/jk20;->d:F

    .line 33
    .line 34
    iget-object v1, p0, Ll/jk20;->e:Landroid/graphics/drawable/Drawable;

    .line 35
    .line 36
    iget-object v2, p0, Ll/jk20;->b:Landroid/graphics/Bitmap;

    .line 37
    .line 38
    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    int-to-float v2, v2

    .line 43
    mul-float/2addr v0, v2

    .line 44
    float-to-int v0, v0

    .line 45
    iget v2, p0, Ll/jk20;->a:I

    .line 46
    .line 47
    const/4 v3, 0x0

    .line 48
    invoke-virtual {v1, v3, v3, v0, v2}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 49
    .line 50
    .line 51
    iget-object p0, p0, Ll/jk20;->e:Landroid/graphics/drawable/Drawable;

    .line 52
    .line 53
    return-object p0
.end method


# virtual methods
.method public a(I)V
    .locals 0

    .line 1
    int-to-float p1, p1

    .line 2
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 3
    .line 4
    .line 5
    move-result p1

    .line 6
    iput p1, p0, Ll/jk20;->g:I

    .line 7
    .line 8
    return-void
.end method

.method public c()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jk20;->c:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public d()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jk20;->b:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public draw(Landroid/graphics/Canvas;Ljava/lang/CharSequence;IIFIIILandroid/graphics/Paint;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/jk20;->b()Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    if-eqz p2, :cond_1

    .line 6
    .line 7
    iget-object p3, p0, Ll/jk20;->b:Landroid/graphics/Bitmap;

    .line 8
    .line 9
    if-eqz p3, :cond_1

    .line 10
    .line 11
    invoke-virtual {p3}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 12
    .line 13
    .line 14
    move-result p3

    .line 15
    if-eqz p3, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    invoke-virtual {p9}, Landroid/graphics/Paint;->getFontMetricsInt()Landroid/graphics/Paint$FontMetricsInt;

    .line 19
    .line 20
    .line 21
    move-result-object p3

    .line 22
    iget p3, p3, Landroid/graphics/Paint$FontMetricsInt;->bottom:I

    .line 23
    .line 24
    invoke-virtual {p9}, Landroid/graphics/Paint;->getFontMetricsInt()Landroid/graphics/Paint$FontMetricsInt;

    .line 25
    .line 26
    .line 27
    move-result-object p4

    .line 28
    iget p4, p4, Landroid/graphics/Paint$FontMetricsInt;->top:I

    .line 29
    .line 30
    sub-int/2addr p3, p4

    .line 31
    invoke-virtual {p2}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 32
    .line 33
    .line 34
    move-result-object p6

    .line 35
    iget p6, p6, Landroid/graphics/Rect;->bottom:I

    .line 36
    .line 37
    sub-int/2addr p3, p6

    .line 38
    div-int/lit8 p3, p3, 0x2

    .line 39
    .line 40
    add-int/2addr p3, p7

    .line 41
    add-int/2addr p3, p4

    .line 42
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 43
    .line 44
    .line 45
    iget p0, p0, Ll/jk20;->f:I

    .line 46
    .line 47
    int-to-float p0, p0

    .line 48
    add-float/2addr p5, p0

    .line 49
    int-to-float p0, p3

    .line 50
    invoke-virtual {p1, p5, p0}, Landroid/graphics/Canvas;->translate(FF)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p2, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 57
    .line 58
    .line 59
    :cond_1
    :goto_0
    return-void
.end method

.method public e(Landroid/graphics/Bitmap;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/jk20;->b:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    return-void
.end method

.method public getSize(Landroid/graphics/Paint;Ljava/lang/CharSequence;IILandroid/graphics/Paint$FontMetricsInt;)I
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/jk20;->b()Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-super/range {p0 .. p5}, Landroid/text/style/ReplacementSpan;->getSize(Landroid/graphics/Paint;Ljava/lang/CharSequence;IILandroid/graphics/Paint$FontMetricsInt;)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0

    .line 12
    :cond_0
    invoke-virtual {p1}, Landroid/graphics/Paint;->getFontMetricsInt()Landroid/graphics/Paint$FontMetricsInt;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    if-eqz p5, :cond_1

    .line 17
    .line 18
    iget p2, p1, Landroid/graphics/Paint$FontMetricsInt;->top:I

    .line 19
    .line 20
    iput p2, p5, Landroid/graphics/Paint$FontMetricsInt;->top:I

    .line 21
    .line 22
    iget p2, p1, Landroid/graphics/Paint$FontMetricsInt;->ascent:I

    .line 23
    .line 24
    iput p2, p5, Landroid/graphics/Paint$FontMetricsInt;->ascent:I

    .line 25
    .line 26
    iget p2, p1, Landroid/graphics/Paint$FontMetricsInt;->descent:I

    .line 27
    .line 28
    iput p2, p5, Landroid/graphics/Paint$FontMetricsInt;->descent:I

    .line 29
    .line 30
    iget p1, p1, Landroid/graphics/Paint$FontMetricsInt;->bottom:I

    .line 31
    .line 32
    iput p1, p5, Landroid/graphics/Paint$FontMetricsInt;->bottom:I

    .line 33
    .line 34
    :cond_1
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    iget p1, p1, Landroid/graphics/Rect;->right:I

    .line 39
    .line 40
    iget p2, p0, Ll/jk20;->f:I

    .line 41
    .line 42
    add-int/2addr p1, p2

    .line 43
    iget p0, p0, Ll/jk20;->g:I

    .line 44
    .line 45
    add-int/2addr p1, p0

    .line 46
    return p1
.end method
