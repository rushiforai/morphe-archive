.class public final Lzjn;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:F

.field public b:F

.field public c:F


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lzjn;->a:F

    const/high16 v0, 0x3f000000    # 0.5f

    iput v0, p0, Lzjn;->b:F

    iput v0, p0, Lzjn;->c:F

    return-void
.end method


# virtual methods
.method public final a(Landroid/graphics/Rect;II)F
    .registers 5

    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    move-result v0

    int-to-float v0, v0

    int-to-float p2, p2

    div-float/2addr v0, p2

    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    move-result p1

    int-to-float p1, p1

    int-to-float p2, p3

    div-float/2addr p1, p2

    invoke-static {v0, p1}, Ljava/lang/Math;->max(FF)F

    move-result p1

    iget p0, p0, Lzjn;->a:F

    const/4 p2, 0x0

    cmpl-float p2, p0, p2

    if-nez p2, :cond_1a

    return p1

    :cond_1a
    mul-float/2addr p0, p1

    invoke-static {p1, p0}, Ljava/lang/Math;->max(FF)F

    move-result p0

    return p0
.end method

.method public final b(Landroid/graphics/Rect;II)Landroid/graphics/RectF;
    .registers 6

    invoke-virtual {p0, p1, p2, p3}, Lzjn;->a(Landroid/graphics/Rect;II)F

    move-result v0

    int-to-float p2, p2

    mul-float/2addr p2, v0

    invoke-static {p2}, Ljava/lang/Math;->round(F)I

    move-result p2

    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    move-result v1

    sub-int/2addr p2, v1

    int-to-float p3, p3

    mul-float/2addr p3, v0

    invoke-static {p3}, Ljava/lang/Math;->round(F)I

    move-result p3

    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    move-result v0

    sub-int/2addr p3, v0

    iget v0, p0, Lzjn;->b:F

    int-to-float p2, p2

    mul-float/2addr v0, p2

    iget p0, p0, Lzjn;->c:F

    int-to-float p2, p3

    mul-float/2addr p0, p2

    new-instance p2, Landroid/graphics/RectF;

    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    move-result p3

    int-to-float p3, p3

    add-float/2addr p3, v0

    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    move-result p1

    int-to-float p1, p1

    add-float/2addr p1, p0

    invoke-direct {p2, v0, p0, p3, p1}, Landroid/graphics/RectF;-><init>(FFFF)V

    return-object p2
.end method

.method public final c(Landroid/graphics/Rect;IIFF)V
    .registers 10

    invoke-virtual {p0, p1, p2, p3}, Lzjn;->a(Landroid/graphics/Rect;II)F

    move-result v0

    int-to-float p2, p2

    mul-float v1, p2, v0

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    move-result v2

    sub-int/2addr v1, v2

    int-to-float p3, p3

    mul-float v2, p3, v0

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    move-result v3

    sub-int/2addr v2, v3

    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    move-result v3

    int-to-float v3, v3

    div-float/2addr v3, p2

    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    move-result p1

    int-to-float p1, p1

    div-float/2addr p1, p3

    invoke-static {v3, p1}, Ljava/lang/Math;->max(FF)F

    move-result p1

    div-float/2addr v0, p1

    const/high16 p1, 0x3f800000    # 1.0f

    invoke-static {p1, v0}, Ljava/lang/Math;->max(FF)F

    move-result p2

    iput p2, p0, Lzjn;->a:F

    const/4 p2, 0x0

    if-nez v1, :cond_3a

    move p3, p2

    goto :goto_40

    :cond_3a
    int-to-float p3, v1

    div-float/2addr p4, p3

    invoke-static {p4, p2, p1}, Lnb6;->i(FFF)F

    move-result p3

    :goto_40
    iput p3, p0, Lzjn;->b:F

    if-eqz v2, :cond_4a

    int-to-float p3, v2

    div-float/2addr p5, p3

    invoke-static {p5, p2, p1}, Lnb6;->i(FFF)F

    move-result p2

    :cond_4a
    iput p2, p0, Lzjn;->c:F

    return-void
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    const/4 v1, 0x0

    if-eqz p1, :cond_30

    const-class v2, Lzjn;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-ne v2, v3, :cond_30

    check-cast p1, Lzjn;

    iget v2, p1, Lzjn;->a:F

    iget v3, p0, Lzjn;->a:F

    invoke-static {v2, v3}, Ljava/lang/Float;->compare(FF)I

    move-result v2

    if-nez v2, :cond_30

    iget v2, p1, Lzjn;->b:F

    iget v3, p0, Lzjn;->b:F

    invoke-static {v2, v3}, Ljava/lang/Float;->compare(FF)I

    move-result v2

    if-nez v2, :cond_30

    iget p1, p1, Lzjn;->c:F

    iget p0, p0, Lzjn;->c:F

    invoke-static {p1, p0}, Ljava/lang/Float;->compare(FF)I

    move-result p0

    if-nez p0, :cond_30

    return v0

    :cond_30
    return v1
.end method

.method public final hashCode()I
    .registers 3

    iget v0, p0, Lzjn;->a:F

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    iget v1, p0, Lzjn;->b:F

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    iget p0, p0, Lzjn;->c:F

    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p0

    filled-new-array {v0, v1, p0}, [Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Ljava/util/Objects;->hash([Ljava/lang/Object;)I

    move-result p0

    return p0
.end method
