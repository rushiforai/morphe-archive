.class public abstract Ll/sce;
.super Landroid/text/style/ImageSpan;
.source "SourceFile"

# interfaces
.implements Ll/zql;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Landroid/text/style/ImageSpan;",
        "Ll/zql;"
    }
.end annotation


# instance fields
.field public a:Landroid/graphics/drawable/Drawable;

.field public b:I

.field public c:I

.field public final d:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field public final e:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/Object;I)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "TT;I)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    const/16 v1, 0x21

    .line 3
    .line 4
    invoke-direct {p0, p1, v0, v1}, Landroid/text/style/ImageSpan;-><init>(Landroid/content/Context;Landroid/graphics/Bitmap;I)V

    .line 5
    .line 6
    .line 7
    iput-object p2, p0, Ll/sce;->d:Ljava/lang/Object;

    .line 8
    .line 9
    int-to-float p1, p3

    .line 10
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    iput p1, p0, Ll/sce;->e:I

    .line 15
    .line 16
    return-void
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
    iput p1, p0, Ll/sce;->c:I

    .line 7
    .line 8
    return-void
.end method

.method public b()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ll/sce;->a:Landroid/graphics/drawable/Drawable;

    .line 3
    .line 4
    return-void
.end method

.method public c()Landroid/graphics/drawable/Drawable;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sce;->a:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    return-object p0
.end method

.method public d()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/sce;->d:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public draw(Landroid/graphics/Canvas;Ljava/lang/CharSequence;IIFIIILandroid/graphics/Paint;)V
    .locals 0

    .line 1
    iget-object p2, p0, Ll/sce;->a:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    if-nez p2, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p9}, Landroid/graphics/Paint;->getFontMetricsInt()Landroid/graphics/Paint$FontMetricsInt;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    iget p2, p2, Landroid/graphics/Paint$FontMetricsInt;->bottom:I

    .line 11
    .line 12
    invoke-virtual {p9}, Landroid/graphics/Paint;->getFontMetricsInt()Landroid/graphics/Paint$FontMetricsInt;

    .line 13
    .line 14
    .line 15
    move-result-object p3

    .line 16
    iget p3, p3, Landroid/graphics/Paint$FontMetricsInt;->top:I

    .line 17
    .line 18
    sub-int/2addr p2, p3

    .line 19
    iget-object p4, p0, Ll/sce;->a:Landroid/graphics/drawable/Drawable;

    .line 20
    .line 21
    invoke-virtual {p4}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 22
    .line 23
    .line 24
    move-result-object p4

    .line 25
    iget p4, p4, Landroid/graphics/Rect;->bottom:I

    .line 26
    .line 27
    sub-int/2addr p2, p4

    .line 28
    div-int/lit8 p2, p2, 0x2

    .line 29
    .line 30
    add-int/2addr p2, p7

    .line 31
    add-int/2addr p2, p3

    .line 32
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 33
    .line 34
    .line 35
    iget p3, p0, Ll/sce;->b:I

    .line 36
    .line 37
    int-to-float p3, p3

    .line 38
    add-float/2addr p5, p3

    .line 39
    int-to-float p2, p2

    .line 40
    invoke-virtual {p1, p5, p2}, Landroid/graphics/Canvas;->translate(FF)V

    .line 41
    .line 42
    .line 43
    iget-object p0, p0, Ll/sce;->a:Landroid/graphics/drawable/Drawable;

    .line 44
    .line 45
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public e()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sce;->a:Landroid/graphics/drawable/Drawable;

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

.method public f(Ll/ruf0;)V
    .locals 3

    .line 1
    iput-object p1, p0, Ll/sce;->a:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p1}, Ll/ruf0;->a()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v1, 0x0

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iget v0, p0, Ll/sce;->e:I

    .line 14
    .line 15
    int-to-float v0, v0

    .line 16
    invoke-interface {p1}, Ll/a6m;->getRatio()F

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    mul-float/2addr v0, v2

    .line 21
    float-to-int v0, v0

    .line 22
    iget p0, p0, Ll/sce;->e:I

    .line 23
    .line 24
    invoke-virtual {p1, v1, v1, v0, p0}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_1
    invoke-virtual {p1}, Ll/ruf0;->a()I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    iget p0, p0, Ll/sce;->e:I

    .line 33
    .line 34
    invoke-virtual {p1, v1, v1, v0, p0}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public g(I)V
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
    iput p1, p0, Ll/sce;->b:I

    .line 7
    .line 8
    return-void
.end method

.method public getSize(Landroid/graphics/Paint;Ljava/lang/CharSequence;IILandroid/graphics/Paint$FontMetricsInt;)I
    .locals 1

    .line 1
    iget-object v0, p0, Ll/sce;->a:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-super/range {p0 .. p5}, Landroid/text/style/ReplacementSpan;->getSize(Landroid/graphics/Paint;Ljava/lang/CharSequence;IILandroid/graphics/Paint$FontMetricsInt;)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    invoke-virtual {p1}, Landroid/graphics/Paint;->getFontMetricsInt()Landroid/graphics/Paint$FontMetricsInt;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    if-eqz p5, :cond_1

    .line 15
    .line 16
    iget p2, p1, Landroid/graphics/Paint$FontMetricsInt;->top:I

    .line 17
    .line 18
    iput p2, p5, Landroid/graphics/Paint$FontMetricsInt;->top:I

    .line 19
    .line 20
    iget p2, p1, Landroid/graphics/Paint$FontMetricsInt;->ascent:I

    .line 21
    .line 22
    iput p2, p5, Landroid/graphics/Paint$FontMetricsInt;->ascent:I

    .line 23
    .line 24
    iget p2, p1, Landroid/graphics/Paint$FontMetricsInt;->descent:I

    .line 25
    .line 26
    iput p2, p5, Landroid/graphics/Paint$FontMetricsInt;->descent:I

    .line 27
    .line 28
    iget p1, p1, Landroid/graphics/Paint$FontMetricsInt;->bottom:I

    .line 29
    .line 30
    iput p1, p5, Landroid/graphics/Paint$FontMetricsInt;->bottom:I

    .line 31
    .line 32
    :cond_1
    iget-object p1, p0, Ll/sce;->a:Landroid/graphics/drawable/Drawable;

    .line 33
    .line 34
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    iget p1, p1, Landroid/graphics/Rect;->right:I

    .line 39
    .line 40
    iget p2, p0, Ll/sce;->b:I

    .line 41
    .line 42
    add-int/2addr p1, p2

    .line 43
    iget p0, p0, Ll/sce;->c:I

    .line 44
    .line 45
    add-int/2addr p1, p0

    .line 46
    return p1
.end method
