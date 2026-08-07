.class public Ll/svb;
.super Lcom/p1/mobile/android/ui/cropiwa/shape/CropIwaRectShape;
.source "SourceFile"


# instance fields
.field public f:Landroid/graphics/RectF;


# direct methods
.method public constructor <init>(Ll/bwb;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/android/ui/cropiwa/shape/CropIwaRectShape;-><init>(Ll/bwb;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-object p1, p0, Ll/svb;->f:Landroid/graphics/RectF;

    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public b(Landroid/graphics/Canvas;Landroid/graphics/RectF;Landroid/graphics/Paint;)V
    .locals 1

    .line 1
    invoke-virtual {p0, p2}, Ll/svb;->i(Landroid/graphics/RectF;)Landroid/graphics/RectF;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget p2, Ll/qa00;->h:I

    .line 6
    .line 7
    int-to-float v0, p2

    .line 8
    int-to-float p2, p2

    .line 9
    invoke-virtual {p1, p0, v0, p2, p3}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public d(Landroid/graphics/Canvas;Landroid/graphics/RectF;Landroid/graphics/Paint;)V
    .locals 1

    .line 1
    invoke-virtual {p0, p2}, Ll/svb;->i(Landroid/graphics/RectF;)Landroid/graphics/RectF;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget p2, Ll/qa00;->h:I

    .line 6
    .line 7
    int-to-float v0, p2

    .line 8
    int-to-float p2, p2

    .line 9
    invoke-virtual {p1, p0, v0, p2, p3}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public f(Landroid/graphics/Canvas;Landroid/graphics/RectF;Landroid/graphics/Paint;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p2}, Ll/svb;->i(Landroid/graphics/RectF;)Landroid/graphics/RectF;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-super {p0, p1, p2, p3}, Ll/fwb;->f(Landroid/graphics/Canvas;Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final i(Landroid/graphics/RectF;)Landroid/graphics/RectF;
    .locals 5

    .line 1
    iget-object v0, p0, Ll/svb;->f:Landroid/graphics/RectF;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Landroid/graphics/RectF;

    .line 6
    .line 7
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/svb;->f:Landroid/graphics/RectF;

    .line 11
    .line 12
    :cond_0
    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    iget-object v1, p0, Ll/svb;->f:Landroid/graphics/RectF;

    .line 17
    .line 18
    invoke-virtual {p1}, Landroid/graphics/RectF;->centerX()F

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    const/high16 v3, 0x40000000    # 2.0f

    .line 23
    .line 24
    div-float/2addr v0, v3

    .line 25
    sub-float/2addr v2, v0

    .line 26
    iget v3, p1, Landroid/graphics/RectF;->top:F

    .line 27
    .line 28
    invoke-virtual {p1}, Landroid/graphics/RectF;->centerX()F

    .line 29
    .line 30
    .line 31
    move-result v4

    .line 32
    add-float/2addr v4, v0

    .line 33
    iget p1, p1, Landroid/graphics/RectF;->bottom:F

    .line 34
    .line 35
    invoke-virtual {v1, v2, v3, v4, p1}, Landroid/graphics/RectF;->set(FFFF)V

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Ll/svb;->f:Landroid/graphics/RectF;

    .line 39
    .line 40
    return-object p0
.end method
